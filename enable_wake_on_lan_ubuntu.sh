ip a | grep "2: " && echo "If you have trouble make shure the previous line displayed after '2: enp1s0 [...]', if you have something different change 'enp1s0' for what you have in this script" &&
echo "This is your IP adress to target:\n" &&
ifconfig | grep "inet " &&
echo "\n\n" &&
echo "This is your MAC adress to target:\n" &&
ifconfig | grep "ether " &&
echo "\n\n" &&
sudo apt-get install ethtool &&
sudo ethtool -s enp1s0 wol g &&
sudo touch /etc/systemd/system/wol.service &&
sudo echo "[Unit]\nDescription=Configure Wake On Lan\n\n[Service]\nType=oneshot\nExecStart=/sbin/ethtool -s enp1s0 wol g\n\n[Install]\nWantedBy=basic.target" > /etc/systemd/system/wol.service && sudo systemctl daemon-reload && sudo systemctl enable wol.service && sudo reboot