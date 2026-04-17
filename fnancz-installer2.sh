echo -e "\e[31mP.S: you must give full path of the zip not a shortcut\e[0m"
read -r -p "Where is the path that you have the zip of the game downloaded? Defaulted=Downloads:" path
cd "$HOME/Downloads"
cd "$path" # kinda stupid way that handles the operation but eh works for now
gamezip=$(ls -v -r 'Five Nights at NCZ AE v'* | head -n 1)
gamename="Five Nights at NCZ AE"
mkdir "$gamename"
cp "$gamezip" "$gamename"
cd "$gamename"
unzip "$gamezip" 
rm "$gamezip"
mkdir "assets"
rm "Five Nights at NCZ AE.exe"
mv "data.win" "assets"
mv "6am_animation.mp4" "assets"
mv "options.ini" "assets"
mv "assets/data.win" "assets/game.unx"
rm NekoPresence_x64.dll
wget https://raw.githubusercontent.com/AmrThePigeon/FNANCZAE1_Script_Builder/refs/heads/main/Five_Nights_at_NCZ_AE
chmod +x Five_Nights_at_NCZ_AE
chmod +x run.sh
