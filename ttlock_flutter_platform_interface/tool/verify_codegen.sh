#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
PKG_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"

"$SCRIPT_DIR/generate_pigeon.sh"

cd "$PKG_DIR"
if ! git diff --quiet -- lib/pigeon/messages.g.dart ../ttlock_flutter_android/android/src/main/kotlin/com/ttlock/ttlock_flutter/Messages.kt ../ttlock_flutter_ios/ios/Classes/Messages.swift; then
  echo "Generated Pigeon files are not up to date."
  git diff -- lib/pigeon/messages.g.dart ../ttlock_flutter_android/android/src/main/kotlin/com/ttlock/ttlock_flutter/Messages.kt ../ttlock_flutter_ios/ios/Classes/Messages.swift
  exit 1
fi

echo "Pigeon generated files are up to date."
