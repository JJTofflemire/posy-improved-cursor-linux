#!/bin/bash

# Create a temporary directory
temp_dir=$(mktemp -d)

# Change to the temporary directory
cd "$temp_dir"

git clone https://github.com/JJTofflemire/posy-improved-cursor-linux.git

cd posy-improved-cursor-linux

# Define a list of options
options=("Posy_Cursor" "Posy_Cursor_125_175" "Posy_Cursor_Black" "Posy_Cursor_Black_125_175" "Posy_Cursor_Mono" "Posy_Cursor_Mono_Black" "Posy_Cursor_Strokeless" "Quit")

# Display the menu
PS3="Select a cursor to install: "
select choice in "${options[@]}"; do
  case $REPLY in
    1|2|3|4|5|6|7)
      selected="$choice"
      echo -e "You selected: $selected"
      break
      ;;
    8)
      echo "Quitting the script."
      exit 0
      ;;
    *)
      echo "Invalid option. Please select a valid option."
      ;;
  esac
done

sudo cp -r "$selected/cursors" /usr/share/icons/Adwaita

sudo cp "$selected/index.theme" /usr/share/icons/Adwaita

echo "Copied 'cursors' folder and 'index.theme' from $selected to '/usr/share/Adwaita'"

cd ../..

rm -rf "$temp_dir"