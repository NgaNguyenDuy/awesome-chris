#!/bin/bash
#This Script is written by Umair - http://www.NoobsLab.com
#To setup conky

echo "
 +-+-+-+-+-+-+-+-+-+-+-+-+
 |N o o b s L a b . c o m|
 +-+-+-+-+-+-+-+-+-+-+-+-+
"
if [ -d "$HOME/.conky" ]; then
	rm -r $HOME/.conky* 2> /dev/null
elif [ -d "$HOME/.start-conky" ]; then
	rm $HOME/.start-conky 2> /dev/null
elif [ -f "$HOME/.config/autostart/start-conky.desktop" ]; then
	rm $HOME/.config/autostart/start-conky.desktop 2> /dev/null
elif [ -f "$HOME/.config/autostart/conky*" ]; then
	rm $HOME/.config/autostart/conky* 2> /dev/null
fi

echo "Gold and Grey Conky available for Unity, Gnome Shell, Gnome Classic, Cinnamon, Mate and others."
echo ""
echo "Select conky for your desktop"
sleep 2
echo ""
echo "For Unity, Gnome Classic, Mate, XFCE and Others environment you have to type: 1"
echo "For Gnome Shell and Cinnamon environments you have to type: 2"
echo ""
sleep 1
echo "Type (1 or 2): "
read InputConky

if [ $InputConky = "1" ]; then
	{
	  echo "Downloading and installing selected conky..."
	  sleep 2
	  cd && wget -O gold-grey-ugmx.zip http://drive.noobslab.com/data/conky/gold-grey/Gold_Grey-ugmx.zip
	  unzip -o gold-grey-ugmx.zip -d $HOME/
	  rm gold-grey-ugmx.zip
	}
elif [ $InputConky = "2" ]; then
	{
	  echo "Downloading and installing selected conky..."
	  sleep 2
	  cd && wget -O gold-grey-gc.zip http://drive.noobslab.com/data/conky/gold-grey/Gold-Grey-GC.zip
	  unzip -o gold-grey-gc.zip -d $HOME/
	  rm gold-grey-gc.zip
	}
else
	echo "Input is invalid!!!"
fi

echo "Installation Finished..."
sleep 3
clear



echo "Adding conky to start up"
sleep 3
if [ -d "$HOME/.config/autostart" ]; then
	cd && wget -O .start-conky http://drive.noobslab.com/data/conky/gold-grey/start-conky
	chmod +x $HOME/.start-conky
	wget -O start-conky.desktop http://drive.noobslab.com/data/conky/gold-grey/start-conky.desktop
	mv -f $HOME/start-conky.desktop $HOME/.config/autostart/
else
	mkdir $HOME/.config 2> /dev/null
	mkdir $HOME/.config/autostart
	cd && wget -O .start-conky http://drive.noobslab.com/data/conky/gold-grey/start-conky
	chmod +x $HOME/.start-conky
	wget -O start-conky.desktop http://drive.noobslab.com/data/conky/gold-grey/start-conky.desktop
	mv -f $HOME/start-conky.desktop $HOME/.config/autostart/
fi
ACC_NAME=$(whoami)
sed -i -e "s/NoobsLab/$ACC_NAME/g" "$HOME/.config/autostart/start-conky.desktop"
echo "Successfully added to startup"
sleep 3
clear

echo "System is Updating fonts ..."
echo "System needs permissions to update fonts cache."
sleep 1
sudo fc-cache -fv

echo ""
clear
echo ""
DPATH="$HOME/.conkyrc/net"
TFILE="/tmp/out.tmp.$$"

echo "Which Network Interface you are using?"
echo "wlan <- for Wifi!"
echo "eth <- for Ethernet!"
echo ""
echo "Type: "
read INTERFACE
Ethernet="eth0"
Wifi="wlan0"
for File in $DPATH
do
	if [ $INTERFACE = "eth" ]; then
	{
		if [ -f $File -a -r $File ]; then
		sed "s/$Wifi/$Ethernet/g" "$File" > $TFILE && mv $TFILE "$File"
		else
   		echo "Error: Conkyrc file is not installed $File"
  		fi
	}
	elif [ $INTERFACE = "wlan" ]; then
	{
		if [ -f $File -a -r $File ]; then
		sed "s/$Ethernet/$Wifi/g" "$File" > $TFILE && mv $TFILE "$File"
		else
		echo "Error: Conkyrc file is not installed $File"
  		fi
	}
	else
		echo "Invalid input!!!"
	fi
done


echo ".........................................."
echo ""
echo "If you made any mistake then repeat process, if not then just move on"
sleep 3
clear
echo "For more visit on site - http://www.NoobsLab.com"
echo "Conky Credits: http://sunjack94.deviantart.com/art/Gold-And-Grey-Conky-151006149"
rm $HOME/gold_grey.sh 2> /dev/null
