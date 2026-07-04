# Brown’s Lazy Shuffle Revival

![Brown’s Lazy Shuffle Revival preview](resources/thumbnail.png)

A macOS screensaver compatibility revival/fix for newer macOS versions.

Recent macOS releases, such as Sonoma and later, redesigned the wallpaper and screensaver architecture. Some older third-party legacy screensavers may crash, freeze, or show a black screen when running through the `legacyScreenSaver` compatibility layer.

This project repackages the extracted video resource into a modern `.saver` bundle for macOS. It aims to preserve the original animated experience while avoiding the unstable legacy screensaver code path.

## Features

- Uses a locally extracted `video.mp4` as the screensaver content
- Built with native macOS `ScreenSaver.framework` and `AVFoundation`
- Loops the video automatically
- Plays muted by default
- Installs into the current user’s screensaver directory

## Installation

Run the following command in the project directory:

```bash
./build_and_install.sh
```

After installation, open:

```text
System Settings → Screen Saver
```

Then select:

```text
Brown’s Lazy Shuffle Revival
```

If it does not appear immediately, quit and reopen System Settings.

## Resource and Copyright Notice

This project is intended for personal learning, compatibility repair, and local use only.

If any video, image, character, trademark, or other visual asset included in this project originates from the original Brown’s lazy shuffle / LINE-related materials, all copyrights, trademarks, and related rights belong to their respective owners.

This project does not claim ownership of any third-party assets and is not intended for commercial use.

If you are a rights holder and believe that any content in this project infringes your rights, please contact the maintainer. Upon receiving a valid request, the relevant content will be removed or adjusted promptly.

## License

The source code of this project is licensed under the MIT License.

Please note that the MIT License applies only to the code written for this project. It does not automatically apply to third-party videos, images, trademarks, character designs, or other copyrighted materials.

```text
MIT License

Copyright (c) 2026 Brown’s Lazy Shuffle Revival Contributors

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```
