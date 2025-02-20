#!/bin/bash

clear
cd /home/pi
sudo apt update
#sudo apt upgrade -y
#Install subversion (SVN) for the normal functionality of github-downloader script
sudo apt install -y subversion
#Create scripts directory
if [ -d /home/pi/scripts/ ]; then
        echo "Directory scripts was created yet"
        sleep 2
else
        echo "Creating scripts directory"
        sleep 2
        mkdir /home/pi/scripts/
fi
#Install multi_switch script
wget -O- https://raw.githubusercontent.com/julenvitoria/Kelboy/main/multi_switch.sh>/home/pi/scripts/multi_switch.sh
chmod +x /home/pi/scripts/multi_switch.sh

#Install github-downloader script
wget -O- https://raw.githubusercontent.com/julenvitoria/Kelboy/main/github-downloader.sh>/home/pi/scripts/github-downloader.sh
chmod +x /home/pi/scripts/github-downloader.sh

#Install Update-Addons directory
if [ -d /home/pi/RetroPie/retropiemenu/Update-Addons ]; then
        echo "Directory update addons was created yet."
        echo "Updating Addons Menu..."
        sleep 2
        rm -R /home/pi/RetroPie/retropiemenu/Update-Addons
        mkdir /home/pi/RetroPie/retropiemenu/Update-Addons
else
        echo "Creating directory update addons."
        sleep 2
        mkdir /home/pi/RetroPie/retropiemenu/Update-Addons
fi

#Install Addons Menu Updater
wget -O- https://raw.githubusercontent.com/julenvitoria/Kelboy/main/UpdateMenubeta.sh>/home/pi/RetroPie/retropiemenu/Update-Addons/UpdateMenu.sh
chmod +x /home/pi/RetroPie/retropiemenu/Update-Addons/UpdateMenu.sh
if grep -q "UpdateMenu.sh" /opt/retropie/configs/all/emulationstation/gamelists/retropie/gamelist.xml ; then
        echo "UpdateMenu is in the gamelist.xml yet"
else
        sudo sed -i 's|</gameList>|\t<game>\n\t\t<path>./Update-Addons/UpdateMenu.sh</path>\n\t\t<name>Addons Menu Updater Script</name>\n\t\t<desc>ENG: Script to update addons menu.\nESP: Script para actualizar el menu addons.</desc>\n\t\t<image></image>\n\t\t<playcount>0</playcount>\n\t\t<lastplayed>20180514T205700</lastplayed>\n\t</game>\n</gameList>|' /opt/retropie/configs/all/emulationstation/gamelists/retropie/gamelist.xml
fi

#Install Update and Upgrade System
wget -O- https://raw.githubusercontent.com/julenvitoria/FreeplayGBA-UpdateUpgradeSystem/master/UpdateUpgradeSystem.sh>/home/pi/RetroPie/retropiemenu/Update-Addons/UpdateUpgradeSystem.sh
chmod +x /home/pi/RetroPie/retropiemenu/Update-Addons/UpdateUpgradeSystem.sh
if grep -q "UpdateUpgradeSystem.sh" /opt/retropie/configs/all/emulationstation/gamelists/retropie/gamelist.xml ; then
        echo "Update and Upgrade System is in the gamelist.xml yet"
else
        sudo sed -i 's|</gameList>|\t<game>\n\t\t<path>./Update-Addons/UpdateUpgradeSystem.sh</path>\n\t\t<name>Update-Upgrade System packages</name>\n\t\t<desc>ENG: Script to Update and Upgrade System automatically (use at your own risk!!!)\nESP: Script para actualizar los paquetes del sistema de manera automatica (usar bajo tu responsabilidad!!!)</desc>\n\t\t<image></image>\n\t\t<playcount>0</playcount>\n\t\t<lastplayed>20180514T205700</lastplayed>\n\t</game>\n</gameList>|' /opt/retropie/configs/all/emulationstation/gamelists/retropie/gamelist.xml
fi
#Install Update Emulators.cfg
wget -O- https://raw.githubusercontent.com/julenvitoria/Kelboy-emulators.cfg/main/UpdateEmulators.sh>/home/pi/RetroPie/retropiemenu/Update-Addons/UpdateEmulators.sh
chmod +x /home/pi/RetroPie/retropiemenu/Update-Addons/UpdateEmulators.sh
if grep -q "UpdateEmulators.sh" /opt/retropie/configs/all/emulationstation/gamelists/retropie/gamelist.xml ; then
        echo "Update Emulators is in the gamelist.xml yet"
else
        sudo sed -i 's|</gameList>|\t<game>\n\t\t<path>./Update-Addons/UpdateEmulators.sh</path>\n\t\t<name>Update Emulators.cfg file</name>\n\t\t<desc>ENG: Script to Update emulators.cfg file\nESP: Script para actualizar el archivo emulators.cfg</desc>\n\t\t<image></image>\n\t\t<playcount>0</playcount>\n\t\t<lastplayed>20180514T205700</lastplayed>\n\t</game>\n</gameList>|' /opt/retropie/configs/all/emulationstation/gamelists/retropie/gamelist.xml
fi

#Install Super Retroboy theme and launchings
wget -O- https://raw.githubusercontent.com/julenvitoria/FreeplayGBA-SuperRetroBoyTheme/master/SRBtheme.sh>/home/pi/RetroPie/retropiemenu/Update-Addons/SRBtheme.sh
chmod +x /home/pi/RetroPie/retropiemenu/Update-Addons/SRBtheme.sh
if grep -q "SRBtheme.sh" /opt/retropie/configs/all/emulationstation/gamelists/retropie/gamelist.xml ; then
        echo "SRBtheme is in the gamelist.xml yet"
else
        sudo sed -i 's|</gameList>|\t<game>\n\t\t<path>./Update-Addons/SRBtheme.sh</path>\n\t\t<name>SuperRetroBoy theme + Launchings</name>\n\t\t<desc>ENG: Script to install Super Retroboy theme by KALEL1981 and launchings per systems.\nESP: Script para instalar el tema Super Retro Boy de KALEL1981 y launchings de sistemas a juego.</desc>\n\t\t<image></image>\n\t\t<playcount>0</playcount>\n\t\t<lastplayed>20180514T205700</lastplayed>\n\t</game>\n</gameList>|' /opt/retropie/configs/all/emulationstation/gamelists/retropie/gamelist.xml
fi

#Install SuperLopezGB theme and launchings
wget -O- https://raw.githubusercontent.com/julenvitoria/Kelboy-SuperLopezGBTheme/main/SLGBtheme.sh>/home/pi/RetroPie/retropiemenu/Update-Addons/SLGBtheme.sh
chmod +x /home/pi/RetroPie/retropiemenu/Update-Addons/SLGBtheme.sh
if grep -q "SLGBtheme.sh" /opt/retropie/configs/all/emulationstation/gamelists/retropie/gamelist.xml ; then
        echo "SLGBtheme is in the gamelist.xml yet"
else
        sudo sed -i 's|</gameList>|\t<game>\n\t\t<path>./Update-Addons/SLGBtheme.sh</path>\n\t\t<name>SuperLopezGB theme + Launchings</name>\n\t\t<desc>ENG: Script to install SuperLopezGB theme by mlopezmad and launchings per systems.\nESP: Script para instalar el tema SuperLopezGB de mlopezmad y launchings a juego.</desc>\n\t\t<image></image>\n\t\t<playcount>0</playcount>\n\t\t<lastplayed>20180514T205700</lastplayed>\n\t</game>\n</gameList>|' /opt/retropie/configs/all/emulationstation/gamelists/retropie/gamelist.xml
fi

#Install N64HDTextures
wget -O- https://raw.githubusercontent.com/julenvitoria/FreeplayGBA-N64HDTextures/master/N64HDTextures.sh>/home/pi/RetroPie/retropiemenu/Update-Addons/N64HDTextures.sh
chmod +x /home/pi/RetroPie/retropiemenu/Update-Addons/N64HDTextures.sh
if grep -q "N64HDTextures.sh" /opt/retropie/configs/all/emulationstation/gamelists/retropie/gamelist.xml ; then
        echo "N64HDTextures is in the gamelist.xml yet"
else
        sudo sed -i 's|</gameList>|\t<game>\n\t\t<path>./Update-Addons/N64HDTextures.sh</path>\n\t\t<name>Install N64 HD Textures</name>\n\t\t<desc>ENG: Script to install HD textures used with Mupen64Plus emulator.\nESP: Script para instalar texturas HD usadas con el emulador Mupen64Plus.</desc>\n\t\t<image></image>\n\t\t<playcount>0</playcount>\n\t\t<lastplayed>20180514T205700</lastplayed>\n\t</game>\n</gameList>|' /opt/retropie/configs/all/emulationstation/gamelists/retropie/gamelist.xml
fi

#Install Configs and Remaps
wget -O- https://raw.githubusercontent.com/julenvitoria/Kelboy-ConfigsRemaps/main/ConfigsRemaps.sh>/home/pi/RetroPie/retropiemenu/Update-Addons/ConfigRemaps.sh
chmod +x /home/pi/RetroPie/retropiemenu/Update-Addons/ConfigRemaps.sh
if grep -q "ConfigRemaps.sh" /opt/retropie/configs/all/emulationstation/gamelists/retropie/gamelist.xml ; then
        echo "Configs and Remaps is in the gamelist.xml yet"
else
        sudo sed -i 's|</gameList>|\t<game>\n\t\t<path>./Update-Addons/ConfigRemaps.sh</path>\n\t\t<name>Emulator Configs + Games Remaps</name>\n\t\t<desc>ENG: Script to install emulators configs and remaps for various games of various systems.\nESP: Script para instalar configuraciones de emuladores y mapeos de diversos juegos y sistemas.</desc>\n\t\t<image></image>\n\t\t<playcount>0</playcount>\n\t\t<lastplayed>20180514T205700</lastplayed>\n\t</game>\n</gameList>|' /opt/retropie/configs/all/emulationstation/gamelists/retropie/gamelist.xml
fi

#Create Fixes directory
if [ -d /home/pi/RetroPie/retropiemenu/Update-Addons/Fixes ]; then
        echo "Directory fixes was created yet... Downloading fixes"
        sleep 2
        rm -R /home/pi/RetroPie/retropiemenu/Update-Addons/Fixes
        mkdir /home/pi/RetroPie/retropiemenu/Update-Addons/Fixes
else
        echo "Creating directory fixes and Downloading them..."
        sleep 2
        mkdir /home/pi/RetroPie/retropiemenu/Update-Addons/Fixes
fi

#Install fixes!!
#Install gamelist & install fix
wget -O- https://raw.githubusercontent.com/julenvitoria/Kelboy/main/patchs/installgamelist.sh>/home/pi/RetroPie/retropiemenu/Update-Addons/Fixes/installgamelist.sh
chmod +x /home/pi/RetroPie/retropiemenu/Update-Addons/Fixes/installgamelist.sh
if grep -q "installgamelist.sh" /opt/retropie/configs/all/emulationstation/gamelists/retropie/gamelist.xml ; then
        echo "Install with Gamelist fix is in the gamelist.xml yet"
else
        sudo sed -i 's|</gameList>|\t<game>\n\t\t<path>./Update-Addons/Fixes/installgamelist.sh</path>\n\t\t<name>Reinstall addons menu with original retropie gamelist</name>\n\t\t<desc>ENG: Script to reinstall addons menu downloading original retropie gamelist (needed if addons names are changed in gamelist.xml).\nESP: Script para reinstalar el menu de addons descargando el gamelist del menu retropie original (necesario si cambio los nombres de los addons en gamelist.xml).</desc>\n\t\t<image></image>\n\t\t<playcount>0</playcount>\n\t\t<lastplayed>20180514T205700</lastplayed>\n\t</game>\n</gameList>|' /opt/retropie/configs/all/emulationstation/gamelists/retropie/gamelist.xml
fi

#Install Restore systems fix
wget -O- https://raw.githubusercontent.com/julenvitoria/Kelboy/main/patchs/restoresystems.sh>/home/pi/RetroPie/retropiemenu/Update-Addons/Fixes/restoresystems.sh
chmod +x /home/pi/RetroPie/retropiemenu/Update-Addons/Fixes/restoresystems.sh
if grep -q "restoresystems.sh" /opt/retropie/configs/all/emulationstation/gamelists/retropie/gamelist.xml ; then
        echo "Restore Systems is in the gamelist.xml yet"
else
        sudo sed -i 's|</gameList>|\t<game>\n\t\t<path>./Update-Addons/Fixes/restoresystems.sh</path>\n\t\t<name>Restore systems</name>\n\t\t<desc>ENG: Script to restore aditional custom systems in es_systems.cfg after an update of the retropie setup script for example.\nESP: Script para restaurar sistemas personalizados adicionales en es_systems.cfg después de una actualización del script de configuración de retropie, por ejemplo.</desc>\n\t\t<image></image>\n\t\t<playcount>0</playcount>\n\t\t<lastplayed>20180514T205700</lastplayed>\n\t</game>\n</gameList>|' /opt/retropie/configs/all/emulationstation/gamelists/retropie/gamelist.xml
fi

#Install audio fix
wget -O- https://raw.githubusercontent.com/julenvitoria/Kelboy/main/patchs/audiofixbeta.sh>/home/pi/RetroPie/retropiemenu/Update-Addons/Fixes/audiofix.sh
chmod +x /home/pi/RetroPie/retropiemenu/Update-Addons/Fixes/audiofix.sh
if grep -q "audiofix.sh" /opt/retropie/configs/all/emulationstation/gamelists/retropie/gamelist.xml ; then
        echo "Audio fix is in the gamelist.xml yet"
else
        sudo sed -i 's|</gameList>|\t<game>\n\t\t<path>./Update-Addons/Fixes/audiofix.sh</path>\n\t\t<name>Fix Sound Settings</name>\n\t\t<desc>ENG: Script to fix sound settings after an update of retropie.\nESP: Script para arreglar los ajustes de sonido despues de una actualizacion de retropie.</desc>\n\t\t<image></image>\n\t\t<playcount>0</playcount>\n\t\t<lastplayed>20180514T205700</lastplayed>\n\t</game>\n</gameList>|' /opt/retropie/configs/all/emulationstation/gamelists/retropie/gamelist.xml
fi

#Install autostart.sh fix
wget -O- https://raw.githubusercontent.com/julenvitoria/Kelboy/main/patchs/autostartfix.sh>/home/pi/RetroPie/retropiemenu/Update-Addons/Fixes/autostartfix.sh
chmod +x /home/pi/RetroPie/retropiemenu/Update-Addons/Fixes/autostartfix.sh
if grep -q "autostartfix.sh" /opt/retropie/configs/all/emulationstation/gamelists/retropie/gamelist.xml ; then
        echo "Autostart fix is in the gamelist.xml yet"
else
        sudo sed -i 's|</gameList>|\t<game>\n\t\t<path>./Update-Addons/Fixes/autostartfix.sh</path>\n\t\t<name>Fix autostart.sh</name>\n\t\t<desc>ENG: Script to modify the retropie autostart.sh script to have the option to select kelboy launcher at boot and have joystick.py also work with the ES and Kodi options. It could be neccessary to apply this fix after an update.\nESP: Script para modificar el script retropie autostart.sh para tener la opción de seleccionar el launcher de la kelboy para que inicie en el arranque y tambien hacer que joystick.py también funcione con las opciones ES y Kodi (con esto conseguimos por ejemplo tener icono de bateria arrancando en ES sin launcher). Podría ser necesario aplicar esta corrección después de una actualización.</desc>\n\t\t<image></image>\n\t\t<playcount>0</playcount>\n\t\t<lastplayed>20180514T205700</lastplayed>\n\t</game>\n</gameList>|' /opt/retropie/configs/all/emulationstation/gamelists/retropie/gamelist.xml
fi

#.bashrc mod
sed -i '/.\/launcher.sh/ d' /home/pi/.bashrc
sed -i 's|cd kelboy-launcher|#cd kelboy-launcher \&\& ./launcher.sh|' /home/pi/.bashrc
sed -i 's|# RETROPIE PROFILE START|cd ~\n# RETROPIE PROFILE START|' /home/pi/.bashrc

#mod /home/pi/RetroPie-Setup/scriptmodules/supplementary/autostart.sh
#mod module description
sed -i 's/.*rp_module_desc="Auto-start Emulation Station \/ Kodi on boot".*/rp_module_desc="Auto-start ES \/ Kodi \/ Kelboy Launcher on boot"/' /home/pi/RetroPie-Setup/scriptmodules/supplementary/autostart.sh
#mod kodi option and kelboy option add
sed -i 's|echo -e "kodi-standalone #auto\\nemulationstation #auto" >>"$script"|echo -e "cd /home/pi/kelboy-launcher \&\& python3 joystick.py \& #auto\\nkodi-standalone #auto\\nemulationstation #auto" >>"$script"\n            ;;\n        kelboy)\n            echo -e "cd /home/pi/kelboy-launcher \&\& ./launcher.sh #auto" >>"$script"|' /home/pi/RetroPie-Setup/scriptmodules/supplementary/autostart.sh
#mod es option
sed -i 's|echo "emulationstation #auto" >>"$script"|echo -e "cd /home/pi/kelboy-launcher \&\& python3 joystick.py \& #auto\\nemulationstation #auto" >>"$script"|' /home/pi/RetroPie-Setup/scriptmodules/supplementary/autostart.sh
#mod menu adding kelboy
sed -i 's|2 "Start Kodi at boot (exit for Emulation Station)"|2 "Start Kodi at boot (exit for Emulation Station)"\n                3 "Start Kelboy Launcher at boot (Launch ES through PROGRAMS)"|' /home/pi/RetroPie-Setup/scriptmodules/supplementary/autostart.sh
#add kelboy selection dialogue
sed -i 's|printMsgs "dialog" "Kodi is set to launch at boot."|printMsgs "dialog" "Kodi is set to launch at boot."\n                    ;;\n                3)\n                    enable_autostart kelboy\n                    printMsgs "dialog" "Kelboy Launcher is set to launch at boot."|' /home/pi/RetroPie-Setup/scriptmodules/supplementary/autostart.sh

#enable autostart boot and mod /opt/retropie/configs/all/autostart.sh
cd ~/RetroPie-Setup/
sudo ./retropie_packages.sh runcommand install
sudo ./retropie_packages.sh autostart enable
cd ~
rm /opt/retropie/configs/all/autostart.sh
sleep 2
touch /opt/retropie/configs/all/autostart.sh
sed -i '/#auto/d' "/opt/retropie/configs/all/autostart.sh"
sed -i '$a\' "/opt/retropie/configs/all/autostart.sh"
echo -e "cd /home/pi/kelboy-launcher && ./launcher.sh #auto" > /opt/retropie/configs/all/autostart.sh

#Create /home/pi/scripts/kelboy directory and download files
if [ -d /home/pi/scripts/kelboy/ ]; then
        echo "Directory /home/pi/scripts/kelboy/ was created yet. Downloading kelboy system..."
        wget -O- https://raw.githubusercontent.com/julenvitoria/Kelboy/main/patchs/kelboy/kelboy.sh>/home/pi/scripts/kelboy/kelboy.sh
        chmod +x /home/pi/scripts/kelboy/kelboy.sh
        sleep 2
else
        echo "Creating kelboy directory and downloading kelboy system..."
        sleep 2
        mkdir /home/pi/scripts/kelboy/
        wget -O- https://raw.githubusercontent.com/julenvitoria/Kelboy/main/patchs/kelboy/kelboy.sh>/home/pi/scripts/kelboy/kelboy.sh
        chmod +x /home/pi/scripts/kelboy/kelboy.sh
        sleep 2
fi

#mod es_systems.cfg file
if grep -q "<name>kelboy</name>" /etc/emulationstation/es_systems.cfg ; then
        echo "kelboy system already exists, nothing to mod..."
else
        sudo sed -i 's|</systemList>|  <system>\n    <name>kelboy</name>\n    <fullname>kelboy</fullname>\n    <path>/home/pi/scripts/kelboy</path>\n    <extension>.sh</extension>\n    <command>/home/pi/scripts/kelboy/kelboy.sh</command>\n    <platform>kelboy</platform>\n    <theme>kelboy</theme>\n  </system>\n</systemList>|' /etc/emulationstation/es_systems.cfg
fi

#select ES as wifi country
sudo raspi-config nonint do_wifi_country "ES"

#Restart EmulationStation
/home/pi/scripts/multi_switch.sh --ES-RESTART

#updating kelboy launcher
cd /home/pi/kelboy-launcher
killall python3
python3 joystick.py &
bin/updater.sh
sleep 3
killall python3
python3 joystick.py &
bin/updater.sh
sleep 3
killall python3
python3 joystick.py &
bin/updater.sh
sleep 3
sudo reboot