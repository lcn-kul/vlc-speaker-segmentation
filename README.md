# VLC Speaker Segmentation

## 1. Overview

VLC Speaker Segmentation is a VLC extension for speaker segmentation annotations.

https://user-images.githubusercontent.com/32679237/217255077-0f2a96af-8f9f-447a-973b-749a703b6d46.mp4

## 2. Installation

1. Install [VLC](https://www.videolan.org/vlc/).
2. Download the [lua extension](vlc-speaker-segmentation.lua).
3. Locate the VLC extension directory.
   - Common Windows locations:
     - `C:\Users\UserName\AppData\Roaming\vlc\lua\extensions`
   - Common Linux locations:
     - `/home/username/snap/vlc/curent/.local/share/vlc/lua/extensions`
     - `/home/username/.local/share/vlc/lua/extensions`
   - If you are having trouble, it may help to install a random extension from inside the VLC application.
     - On the menu bar "Tools" > "Plugins and extensions".
     - In "Addons Manager" tab, select the "Extensions" pane.
     - Select an extension and install.
     - Go to "Active Extensions" tab and click "Reload extensions" button.
     - Select the installed extension and click "More information..." button.
     - At the bottom, you will see a path to the extension LUA file location. This directory is where extensions should be installed.
4. Move `vlc-speaker-segmentation.lua` to the extension directory.
5. Open VLC.
6. Reload installed extensions.
   - On the menu bar "Tools" > "Plugins and extensions".
   - Go to "Active Extensions" tab and click "Reload extensions" button.
7. Activate VLC Speaker Segmentation window.
   - On the menu bar "View", select "VLC Speaker Segmentation".
