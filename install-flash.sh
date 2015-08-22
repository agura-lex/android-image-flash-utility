#!/system/bin/sh
echo "Welcome to flash utility installer by Alexander Agura (agur4ik09@gmail.com)!"
echo "Be sure you run it as root!" 
echo "Select the installation path
(/system/bin is recommended, data/local/bin requires using bash shell and adding line in .bashrc file)
"
PS3="
Installation path: "
select DEST in "/system/bin" "/system/xbin" "/data/local/bin"
do
	echo "Installing 'flash' to $DEST"
	cp -f flash $DEST/ || exit 1
	chmod 755 $DEST/flash
	break
done
echo "Done! Run 'flash' in your terminal to call the utility"
