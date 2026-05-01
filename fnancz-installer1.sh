scriptlocation=$(pwd -L)
scriptdeletion() {
rm -f "$scriptlocation/fnancz-installer1.sh"
}
trap scriptdeletion EXIT
unsupportedzip=$(ls -v -r Five\ Nights\ at\ NCZ\ AE\ v1.3* 2>/dev/null | head -n 1)
if [ -f "$unsupportedzip" ]; then
    echo -e "\e[31mError: Game zip of version later than 1.2.0 is unsupported. Delete the newer zip or move it to another place to be able to use the script.\e[0m"
    exit 1
fi

echo -e "\e[31mP.S: you must give full path of the zip not a shortcut\e[0m"
read -r -p "Where is the path that you have the zip of the game downloaded? Defaulted=Downloads:" path
gamename="Five Nights at NCZ AE"

cd "$HOME/Downloads" 2>/dev/null
cd "$path" 2>/dev/null # kinda stupid way that handles the operation but eh works for now

gamezip2=$(ls -v -r 'Five+Nights+at+NCZ+AE+v'* 2>/dev/null | head -n 1)
if [ -f "$gamezip2" ]; then
    mv "$gamezip2" "${gamezip2//+/ }"
fi
gamezip=$(ls -v -r Five\ Nights\ at\ NCZ\ AE\ v* 2>/dev/null | head -n 1)
if [ ! -f "$gamezip" ]; then
    echo -e "\e[31mError: the game zip file doesn't exist in $(pwd -L)!\e[0m"
    exit 1

fi

if [ -d "$gamename" ]; then
    echo -e "\e[31mError: '$gamename' folder already exists at this location!\e[0m"
    exit 1
fi

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
wget https://raw.githubusercontent.com/AmrThePigeon/FNANCZAE1_Script_Builder/refs/heads/main/Five_Nights_at_NCZ_AE --no-cache
wget https://raw.githubusercontent.com/AmrThePigeon/FNANCZAE1_Script_Builder/refs/heads/main/lib.zip --no-cache
wget https://raw.githubusercontent.com/AmrThePigeon/FNANCZAE1_Script_Builder/refs/heads/main/run.sh --no-cache
wget https://raw.githubusercontent.com/AmrThePigeon/FNANCZAE1_Script_Builder/refs/heads/main/icon.png --no-cache
mv icon.png assets
unzip lib.zip
rm lib.zip
chmod +x Five_Nights_at_NCZ_AE
chmod +x run.sh
