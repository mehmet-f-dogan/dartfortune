# Random Quote Picker from Files

This Dart program selects a random quote from files located within a directory structure and outputs it to the console. The program reads the list of files, filters out `.dat` files and directories, and picks a random file to display a quote. The quotes are extracted from the selected file and split by the `%` symbol, with one random quote printed to the console.

## Features

- Runs a system command (`fortune -f`) to retrieve a directory path.
- Recursively traverses the directory structure to find files that are not `.dat` or inside an `/off/` folder.
- Reads the selected file's content and splits it into quotes.
- Randomly selects and prints one of the quotes to the console.

## Requirements

- Dart SDK installed on your machine.
- The `fortune` command-line tool installed and accessible in your system's path.

## Setup

1. **Install Dart**:
   If you don't already have Dart installed, you can install it by following the [official Dart installation guide](https://dart.dev/get-dart).

2. **Install `fortune` command**:
   On Unix-like systems, you can install `fortune` using package managers. For example:
   - On Ubuntu/Debian: `sudo apt install fortune`
   - On macOS: `brew install fortune`

3. **Clone this repository**:
   Clone the repository or download the Dart script to your local machine.

4. **Run the program**:
   After the setup is complete, open your terminal and navigate to the directory containing the Dart project. Run the program with:

   ```bash
   dart run
   ```

## How It Works

1. The program executes the `fortune -f` command to get a directory path.
2. It then recursively walks through the directory to find files that are not `.dat` files or inside any `off/` folder.
3. It selects a random file from the filtered list and reads its contents.
4. The content of the file is split into quotes using `%` as the delimiter.
5. A random quote is picked and printed to the console.

### Example Output:

```
You miss 100% of the shots you don't take. - Wayne Gretzky
```

## Code Breakdown

- **`randomInt(min, max)`**: Generates a random integer between `min` (inclusive) and `max` (exclusive).
- **`Process.runSync('fortune', ['-f'])`**: Runs the `fortune` command synchronously and retrieves the path.
- **`directory.listSync(recursive: true)`**: Lists all files in the directory and subdirectories synchronously.
- **`File.readAsStringSync()`**: Reads the content of the selected file synchronously.
- **`String.split('%')`**: Splits the file content into individual quotes using `%` as a delimiter.

## Notes

- This program assumes that the `fortune` command outputs a valid directory path.
- The script filters out files with the `.dat` extension and skips directories containing the string `/off/`.
- If no suitable files are found, the program will throw an error indicating that no files were found.