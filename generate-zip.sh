#!/bin/bash

# Help text
read -r -d '' HELP_TEXT << EOM
Generate ZIP Files of Specific Sizes
==================================

This script generates ZIP files of specified sizes filled with random data.

Usage:
    ./generate-zip.sh --size <size> --out <output_path>
    ./generate-zip.sh --help

Arguments:
    --size      Size of the ZIP file (e.g., 1M, 500K, 2G)
    --out       Output path for the ZIP file
    --help      Show this help message

Examples:
    # Generate a 1 megabyte ZIP file
    ./generate-zip.sh --size 1M --out ./output.zip

    # Generate a 2 gigabyte ZIP file in a specific location
    ./generate-zip.sh --size 2G --out /path/to/large.zip

Size Units:
    K - Kilobytes
    M - Megabytes
    G - Gigabytes

Note: The actual ZIP file size might vary slightly due to compression.
EOM

# Initialize variables
size=""
output_path=""

# Parse command line arguments
while [[ $# -gt 0 ]]; do
    case $1 in
        --help)
            echo "$HELP_TEXT"
            exit 0
            ;;
        --size)
            size="$2"
            shift 2
            ;;
        --out)
            output_path="$2"
            shift 2
            ;;
        *)
            echo "Unknown parameter: $1"
            echo "Use --help for usage information"
            exit 1
            ;;
    esac
done

# Validate required arguments
if [ -z "$size" ] || [ -z "$output_path" ]; then
    echo "Error: Missing required arguments"
    echo "Use --help for usage information"
    exit 1
fi

# Extract the number and unit from the size
size_num=$(echo $size | sed 's/[^0-9]*//g')
unit=$(echo $size | sed 's/[0-9]*//g' | tr '[:lower:]' '[:upper:]')

# Convert size to bytes based on unit
case $unit in
    "K")
        bytes=$((size_num * 1024))
        ;;
    "M")
        bytes=$((size_num * 1024 * 1024))
        ;;
    "G")
        bytes=$((size_num * 1024 * 1024 * 1024))
        ;;
    *)
        echo "Invalid unit. Use K (Kilobytes), M (Megabytes), or G (Gigabytes)"
        exit 1
        ;;
esac

# Create a temporary file with random data
temp_file=$(mktemp)
dd if=/dev/urandom of=$temp_file bs=1M count=$((bytes/1024/1024)) status=progress 2>/dev/null

# Create ZIP file
zip -q "$output_path" $temp_file

# Clean up
rm $temp_file
