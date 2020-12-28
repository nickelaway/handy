## Get filesystem block size
tune2fs -l /dev/sda1 | grep -i "block siz"

## Verify sshd config file is valid
/usr/sbin/sshd -t

## Display offset dates
date --date="12 hours ago"
date --date="12 hours" ## future
date --date='tomorrow'


## Prefix PS1 with time
export PROMPT_COMMAND="echo -n [$(date +%H:%M:%S)]"


## prevent duplicate repeated entries in bash history
export HISTCONTROL=ignoredups


## Crontab format
{minute} {hour} {day-of-month} {month} {day-of-week} {full-path-to-shell-script}


## Check and Enable services on Redhat Based OSs
chkconfig --list sshd
chkconfig --levels 35 sshd on


## display CPU/Disk/Network statistics
sar -u
sar -d
sar -n eth0

## get the route to a particular host
ip route get 138.251.10.18

## Determine redhat version number
cat /etc/redhat-release


## Listen on an interface
nc -l [host] [ip]

## List a processes threads
ps -Lp [pid]

## Run a local SSL server
openssl s_server -accept 443 -www -cert localhost.crt -key localhost.key

## Connect to an SSL server
openssl s_client -connect encrypted.google.com:443

## Stop vi from indenting when you paste
:set paste

## Random Vim
:set nu ## enable line numbers
:syntax on ## enable syntax highlighting


## Remove .svn directories
find . -depth -type d -name .svn -exec rm -rf {} \;

## Tokenise on a given characted with awk
echo Hello.World | awk -F ‘.’ ‘{print $1}

## Get last token with awk
echo Hello World | awk  ‘{print $NF}’

## Get second last token with awk
echo Hello World | awk  ‘{print $(NF-1)}’

## Display the socket SSH uses for agent authentication
echo $SSH_AUTH_SOCK

## Get hardware info
hwinfo

## Get screen resolution
xpdyinfo | grep ‘dimensions:’

## svn rollback changes made in revision 303
svn merge -c -303 http://svn.example.com/repos/calc/trunk

## svn branch
svn copy svn://svn.tspex.local/platform/tags/platform-1.1.22 svn://svn.tspex.local/platform/branches/1.1 -m "creating 1.1 branch"


## Setup an SSH tunnel that allows remote connections to port 5001 and will forward them 
## to port 80 on www.example.com from the remote host
ssh -g -l dshearer -L 5001:www.example.com:80 192.168.40.10

## show SELinux contexts
ls -Z

## Change a files SELinux context
chcon -R -h -t httpd_sys_content_t /var/www

## Change mysql password
update mysq.user set password=PASSWORD(“letmein”) where user=”root”;

## Enable the EPEL repositories
# RHEL6
rpm -Uvh http://download.fedoraproject.org/pub/epel/6/i386/epel-release-6-5.noarch.rpm
# RHEL5
rpm -Uvh http://dl.fedoraproject.org/pub/epel/5/i386/epel-release-5-4.noarch.rpm

## command for directing output to file and stdout
tee

## Send output to a standard out and a compressed file
echo hello world | tee >(gzip --stdout > shearerd.gz)

## file to display before login
/etc/issue

## zip up directory foo
zip -r outname foo

## Show unlinked open files
lsof +L1

## Combine files horizontally (like join, but no common field)
paste foo.txt bar.txt

## List keyboard layouts
ls /usr/share/kbd/keymaps/i386/qwerty

## Redirect port 80 to 8080 on a virtual interfaces
iptables -t nat -A PREROUTING -p tcp -d 192.0.43.10 --dport 80 -j DNAT --to-destination 192.0.43.10:8080 -m comment --comment "Redirect port 80 to 8080 for www.example.com"
## Sort output based on column with particular delimiter
## count errors
grep -c ERROR * | grep -Ev ':0' | sort -n -k 2 -t ':'

## Check RPM/yum installation history
grep "Updated: some-app" /var/log/messages*

## Simulate traffic conditions
tc

## strace child processes
strace -f

## dump memory from a running native process
gdb --batch --pid 5279 -ex "dump memory 5279-7f03fc000000-7f0404000000.dump 0x7f03fc000000 0x7f0404000000"

## Manipulate display settings (resolution, orientation, mirror-displays, etc)
xrandr   ## command line
arandr   ## gui
lxranrd  ## gui
# example
xrandr --output DP2 --off --output DP1 --off --output TV1 --off --output HDMI1 --mode 1920x1200 --pos 1920x0 --rotate normal --output LVDS1 --off --output VGA1 --mode 1920x1080 --pos 0x0 --rotate normal

## Show distribution information
lsb_release -a

## Clear memory cache
echo 3 > /proc/sys/vm/drop_caches

## SSH slow to authenticate? try this
ssh -o GSSAPIAuthentication=no

## Show network bridges
brctl show

## Add static ARP entry
arp -s 172.16.0.1 00:08:ab:23:cd:45

## List installed packages no a debian system
dpkg --get-selections

## Disable/enable wifi/bluetooth
rfkill block wifi
rfkill unblock bluetooth

## list input devices
xinput --list

## Disable touchscreen
xinput set-prop 'ELAN Touchscreen' 'Device Enabled' 0

## List symbols in a .so file
nm -g foo.so
# (for c++ symbols)
nm -gC foo.so 

## Disassemble binary
objdump -D -x -l -g -h foo.so

## List IPC resources
ipcs

## run rdesktop over a slow connection
rdesktop -P -x m -a 8 -z foo.example.com


## Stop a device from being part of a raid array
mdadm --zero-superblock /dev/sdX

## Grow a raid array
mdadm --manage /dev/md0 --add /disks/raid-5
mdadm --grow /dev/md0 --raid-devices=5

## Python Simple Web Server
python -m SimpleHTTPServer

## PUT data with curl
curl -D - -H "Content-Type:application/json" -H "X-CSRF-Token:foo" -b "JSENID=bar" -X PUT -d "{"data":["stuff"]}" http://127.0.0.1:8080/path/to/something


## Decrypt and mount a truecrypt volume
truecrypt -t /home/user/EncryptedFile.tc /home/user/EncryptedFileFolder

## Securely erase afile
shred -n 50 --random-source /dev/random -z -u id_rsa

## Mount a samba share
mount -t cifs //172.16.0.100/Galaxy /mnt/galaxy/ -o user=nickel

## Transfer a directory while displaying the transfer rate over ssh
tar cf - /src | pv -rbt | ssh -p 23 myserver.net "(cd /destDir && tar xf -)"

## Without extracting tar on the other side
tar cf - jenkins/ | pv -rbt | ssh user@somehost "cat > jenkins-backup.tar"

## Generate a contact sheet
montage -page A4 -verbose -label '%f' -font Helvetica -pointsize 10 -background '#000000' -fill 'gray' -define jpeg:size=420x400 -geometry 420x400+2+2  -tile 6x3 *.JPG ../contactsheet.jpg

## Encrypt a file with someones public key
gpg --import example_user.asc
gpg --output hi.txt.gpg --encrypt --recipient user@example.com hi.txt

## Dump jpegs from a video
mplayer vo jpeg foo.avi

## Show network interfaces behind a bond
cat /proc/net/bonding/bond0

## Show network interface speed
ethtool eth0 | grep Speed

## Switch back to UK layout
setxkbmap -layout gb

## Read from multiple processes
diff <(wget -q -O - URL1) <(wget -q -O - URL2)

## Sort and join two files
join <(cat a.txt | sort | uniq) <(cat b.txt | sort | uniq)

## Transparent Screen Lock
xlock -mode blank -geometry 1x1
xtrlock

## Convert video to MP3
ffmpeg -i video.mp4 audio.mp3

## Extract part of an MP3
 mplayer full.mp3 -ss 2:43 -endpos 10 -ao pcm:file=/dev/stdout -really-quiet |  lame --preset extreme -h - shorter.mp3

