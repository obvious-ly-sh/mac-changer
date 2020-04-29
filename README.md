# MAC changer

### How does it work ?
First, you need to get the net-tools package on your system:
```sh
sudo apt install net-tools -y # On Debian.
```
<br>

Then, [download the script](https://www.github.com/obvious-ly-sh/mac-changer/archive/master.zip) and extract the
``main.sh`` file.

<br>

Next, you need to find the interface which one you want to change the MAC address:
```sh
ifconfig # It will show you all your interfaces. Take the name of the one who will undergo the changes.
```
<br>

Finally, run the script as ``sudo``:
```sh
sudo ./main.sh <INTERFACE> <NEW ADDRESS> # Don't forget about restarting your computer once the execution is done.
```
