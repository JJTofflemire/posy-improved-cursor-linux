# posy's improved cursors for linux

- this is a fork of [simtrani's Posy's Cursors port to Linux](https://github.com/simtrami/posy-improved-cursor-linux)

- this repo is the exact same with a script to make installing on KDE easier by overwriting the contents of the default icon folder (Adwaita)

  - overwriting the default icons is an imprecise way of installing cursors, but it resolves some pesky bugs where the default cursor will be used in place of the selected cursors

- to install Posy's Cursors using the [installer.sh](installer.sh), run the following:

```
curl -sO https://raw.githubusercontent.com/JJTofflemire/posy-improved-cursor-linux/main/installer.sh && chmod +x installer.sh && ./installer.sh && rm installer.sh
```
