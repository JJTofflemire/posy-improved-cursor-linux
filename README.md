# posy's improved cursors for linux

- this is a fork of [simtrani's Posy's Cursors port to Linux](https://github.com/simtrami/posy-improved-cursor-linux)

- this repo is the exact same with a script to make installing on KDE easier by overwriting the contents of the default icon folder (Adwaita)

  - overwriting the default icons is an imprecise way of installing cursors, but it resolves some pesky bugs where the default cursor will be used in place of the selected cursors

- to install Posy's Cursors using the [installer.sh](installer.sh), run the following:

```
curl -sO https://raw.githubusercontent.com/jtof-dev/posy-cursor-linux/main/installer.sh && chmod +x installer.sh && ./installer.sh && rm installer.sh
```

- since it is never a good idea to blindly execute a bash script with `sudo`, here is what all it does:

- clone this repo and enter that folder

```
#!/bin/bash

git clone https://github.com/jtof-dev/posy-cursor-linux.git

cd posy-cursor-linux
```

- create a dialogue for which cursor set to install

```
options=("Posy_Cursor" "Posy_Cursor_125_175" "Posy_Cursor_Black" "Posy_Cursor_Black_125_175" "Posy_Cursor_Mono" "Posy_Cursor_Mono_Black" "Posy_Cursor_Strokeless" "Quit")

PS3="Select a cursor to install: "
select choice in "${options[@]}"; do
  case $REPLY in
    1|2|3|4|5|6|7)
      selected="$choice"
      echo -e "you selected: $selected"
      break
      ;;
    8)
      echo "quitting the script."
      exit 0
      ;;
    *)
      echo "invalid option. please select a valid option."
      ;;
  esac
done
```

- copy in the new cursor information into the default cursor folder, and delete the cloned repo

```
sudo cp -fr "$selected/cursors" /usr/share/icons/Adwaita

sudo cp "$selected/index.theme" /usr/share/icons/Adwaita

echo "copied 'cursors' folder and 'index.theme' from $selected to '/usr/share/Adwaita'"

cd ..

sudo rm -r posy-cursor-linux
```