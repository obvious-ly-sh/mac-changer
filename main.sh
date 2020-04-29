# Script developped by https://github.com/obvious-ly-sh/
# Contact me for any problem on Discord: Obvious#0404
# Required dependence: net-tools
# Liscence: GNU

if test -z "${1}" || test -z "${2}"
then
    echo "Usage: ${0} <INTERFACE> <NEW ADDRESS>"
else
    ifconfig "${1}" down
    ifconfig "${1}" hw ether "${2}"
    ifconfig "${1}" up
    echo `/etc/init.d/networking restart`
    echo "MAC address changed. If you want to get back Internet, you'll have to reboot your computer."
fi
