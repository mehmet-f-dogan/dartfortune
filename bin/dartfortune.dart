import 'dart:io';
import 'dart:math';

int randomInt(int min, int max) {
  final rand = Random();
  return min + rand.nextInt(max - min);
}

void main() {
  List<String> files = [];

  final fortuneResult = Process.runSync('fortune', ['-f']);
  if (fortuneResult.exitCode != 0) {
    throw Exception('Error running fortune command');
  }

  String line = fortuneResult.stderr.toString().split("\n")[0];
  String root = "/${line.substring(line.indexOf("/") + 1)}";

  final directory = Directory(root);
  directory.listSync(recursive: true).forEach((fileEntity) {
    if (fileEntity is File) {
      if (fileEntity.uri.path.contains("/off/") ||
          fileEntity.uri.path.endsWith(".dat")) {
        return;
      }
      files.add(fileEntity.path);
    }
  });

  if (files.isEmpty) {
    throw Exception('No files found.');
  }

  var randomFileIndex = randomInt(0, files.length);
  String randomFile = files[randomFileIndex];

  File file = File(randomFile);
  String quotes = file.readAsStringSync();

  List<String> quotesSlice = quotes.split('%');

  int randomQuoteIndex = randomInt(0, quotesSlice.length);
  print(quotesSlice[randomQuoteIndex]);
}
