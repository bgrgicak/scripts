# Scripts Repository

This repository contains various utility scripts to assist with different tasks. Below is a list of the currently available scripts and their descriptions.

## Available Scripts

### 1. `generate-zip.sh`

- **Description**: This script generates ZIP files of specified sizes filled with random data. It is useful for testing purposes where you need files of a certain size.

- **Usage**:
  ```bash
  ./generate-zip.sh --size <size> --out <output_path>
  ./generate-zip.sh --help
  ```

- **Arguments**:
  - `--size`: Size of the ZIP file (e.g., 1M, 500K, 2G)
  - `--out`: Output path for the ZIP file
  - `--help`: Show help message

- **Examples**:
  - Generate a 1 megabyte ZIP file:
    ```bash
    ./generate-zip.sh --size 1M --out ./output.zip
    ```
  - Generate a 2 gigabyte ZIP file in a specific location:
    ```bash
    ./generate-zip.sh --size 2G --out /path/to/large.zip
    ```

- **Size Units**:
  - `K` - Kilobytes
  - `M` - Megabytes
  - `G` - Gigabytes

- **Note**: The actual ZIP file size might vary slightly due to compression.

---

Feel free to explore and use the scripts as needed. Contributions and suggestions for new scripts are welcome!