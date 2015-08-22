#!/system/bin/sh
alias error-1="echo Failed. Are you root?;kill $$"
echo "Welcome to flash utility installer by Alexander Agura (agur4ik09@gmail.com)!"
echo
echo "Select the installation path
(/system/bin is recommended, data/local/bin requires using bash shell and adding line in .bashrc file)"
PS3="Installation path"
select DEST in "system/bin" "system/xbin" "data/local/bin"
do
	echo "Installing 'flash' to $DEST"
	cp flash $DEST/ || error-1
	chmod 755 $DEST/flash
	break
done
echo "Done! Run 'flash' in your terminal to call the utility"
