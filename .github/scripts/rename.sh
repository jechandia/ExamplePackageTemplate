#!/bin/bash
set -euo pipefail

NEW_NAME="${1:?Usage: rename.sh <NewName>}"

echo "→ Renaming 'ExamplePackageTemplate' → '$NEW_NAME' (leaving 'Example' app intact)"

# 1. Replace text content in all non-binary files that contain "ExamplePackageTemplate"
grep -rlI "ExamplePackageTemplate" --exclude-dir=".git" --exclude-dir=".github" . \
  | while read -r file; do
      sed -i "s/ExamplePackageTemplate/$NEW_NAME/g" "$file"
    done

# 2. Rename files containing "ExamplePackageTemplate" in their name (deepest first)
find . -depth -type f \
  ! -path './.git/*' \
  ! -path './.github/*' \
  -name "*ExamplePackageTemplate*" \
  | while read -r file; do
      dir=$(dirname "$file")
      base=$(basename "$file")
      new_base="${base//ExamplePackageTemplate/$NEW_NAME}"
      [ "$base" != "$new_base" ] && mv "$file" "$dir/$new_base"
    done

# 3. Rename directories containing "ExamplePackageTemplate" in their name (deepest first)
find . -depth -type d \
  ! -path './.git/*' \
  ! -path './.github/*' \
  -name "*ExamplePackageTemplate*" \
  | while read -r dir; do
      parent=$(dirname "$dir")
      base=$(basename "$dir")
      new_base="${base//ExamplePackageTemplate/$NEW_NAME}"
      [ "$base" != "$new_base" ] && mv "$dir" "$parent/$new_base"
    done

echo "✓ Done!"
