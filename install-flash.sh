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
	if [[ $DEST = "/system/bin" || $DEST = "/system/xbin" ]]
	then
		echo "Re-mounting system to read-write"
		mount -o rw,remount /system || exit 1
	fi
	echo "Installing 'flash' to $DEST"
	cp -f flash $DEST/ || exit 1
	chmod 755 $DEST/flash
	if [[ $DEST = "/system/bin" || $DEST = "/system/xbin" ]]
	then
		echo "Re-mounting system back to read-only"
		mount -o ro,remount /system
	else
		echo 'Do not forget to add PATH=/data/local/bin:$PATH to your .bashrc file'
	fi
	break
done
echo "Done! Run 'flash' in your terminal to call the utility"
