#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "$0")" && pwd)"
BUILD_DIR="$ROOT/build"
BUNDLE_NAME="BrownsLazyShuffleRevival.saver"
BUNDLE="$BUILD_DIR/$BUNDLE_NAME"
INSTALL_DIR="$HOME/Library/Screen Savers"
INSTALLED_BUNDLE="$INSTALL_DIR/$BUNDLE_NAME"

VIDEO="$ROOT/resources/video.mp4"
THUMBNAIL="$ROOT/resources/thumbnail.png"

if [[ ! -f "$VIDEO" ]]; then
  echo "Missing $VIDEO" >&2
  exit 1
fi

rm -rf "$BUNDLE"
mkdir -p "$BUNDLE/Contents/MacOS" "$BUNDLE/Contents/Resources"

cp "$ROOT/Info.plist" "$BUNDLE/Contents/Info.plist"
cp "$VIDEO" "$BUNDLE/Contents/Resources/video.mp4"
if [[ -f "$THUMBNAIL" ]]; then
  cp "$THUMBNAIL" "$BUNDLE/Contents/Resources/thumbnail.png"
fi

clang \
  -fobjc-arc \
  -mmacosx-version-min=11.0 \
  -bundle \
  -framework AppKit \
  -framework ScreenSaver \
  -framework AVFoundation \
  -framework QuartzCore \
  "$ROOT/src/BrownsLazyShuffleView.m" \
  -o "$BUNDLE/Contents/MacOS/BrownsLazyShuffleRevival"

# Ad-hoc sign so modern macOS treats the local bundle consistently.
codesign --force --deep --sign - "$BUNDLE" >/dev/null

mkdir -p "$INSTALL_DIR"
rm -rf "$INSTALLED_BUNDLE"
cp -R "$BUNDLE" "$INSTALLED_BUNDLE"
xattr -dr com.apple.quarantine "$INSTALLED_BUNDLE" 2>/dev/null || true

# Stop stale preview/runtime processes so System Settings reloads the new bundle.
killall legacyScreenSaver 2>/dev/null || true
killall ScreenSaverEngine 2>/dev/null || true

echo "Installed: $INSTALLED_BUNDLE"
echo "Open System Settings → Screen Saver, then select: Brown’s Lazy Shuffle Revival"
