#!/bin/bash

[ -n "$VERBOSE" ] && set -x
set -euo pipefail

: "${FORMAT:="qcow2"}"
: "${INPUT_DIR:="/input"}"
: "${OUTPUT_DIR:="/output"}"
: "${OUTPUT_NAME:="disk.qcow2"}"
: "${OUTPUT_IMAGE:="$OUTPUT_DIR/$OUTPUT_NAME"}"
: "${ARGS:="--partition=mbr --type=fat"}"

# Check if input directory is empty
if [ -z "$(ls -A "$INPUT_DIR")" ]; then
    echo "Error: /input directory is empty. Please mount a directory with files."
    exit 1
fi

echo "Creating $FORMAT image from $INPUT_DIR..."
echo "Output: $OUTPUT_IMAGE"

# Create the image from the input directory - ARGS are a list on purpose
# shellcheck disable=SC2086
virt-make-fs --format="$FORMAT" $ARGS "$INPUT_DIR" "$OUTPUT_IMAGE"

echo "Done! $FORMAT image created at $OUTPUT_IMAGE"
