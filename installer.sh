#!/bin/bash

git clone https://github.com/jtof-dev/posy-cursor-linux.git

cd posy-cursor-linux

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

sudo cp -fr "$selected/cursors" /usr/share/icons/Adwaita

sudo cp "$selected/index.theme" /usr/share/icons/Adwaita

echo "copied 'cursors' folder and 'index.theme' from $selected to '/usr/share/Adwaita'"

cd ..

sudo rm -r posy-cursor-linux