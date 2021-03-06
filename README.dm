Repo for hard links to scripts and configs of mine.

Bellow are notes and blueprints for posts.

ctave in cygwin
qemu
Headphones soldering
Filezilla
Dism
Y-cable for DV8P.
PS Set-NetConnectionProfile
Get rid of br tag: &#13;


#Nvidia on vnc:
Ubuntu-drivers devices
Apt-install <314 (no depens)
Version on site
Nvidia-xxx
Disable nouveau by modprobe and add modeset to grub:Grub -> nvidia.modeset=0
Install build-essential and linux-headers-`uname -r`
Xinit
Startx (custom) + xinit.d
Nvidia-xconfig allowempty virtual=600x800
Mesa-utils : gears
X11vnc --usepwd
I3
termit
Dconf-tools
Sudo addgroup ubintu audio
Xset -dpms
Xprop -root -f PULSE_SERVER 8s -set PULSE_SERVER ipOrName
pax11publish -e -S ipOrName

Nvidia Virtual display xeandr --fb 600x800

#sounds
apt install padevchooser sound-theme-freedesktop
vim /etc/pulse/default.pa //(cache sounds & load modules)
i3 bindsym pactl //(fn sound)

#Firefox about:config
 ui.osk.enabled false
 browser.backspase action 0

#Lvm  boot repair 
Boot livecd
Install lvm2
Modprobe dm-mod
Vgchange -ay
Mkdir /mnt/ubuntu
Mount /dev/mapper/vg-root /mnt/ubuntu
Mount --bind /dev /mnt/ubuntu/dev
Mount --bind /sys /mnt/ubuntu/sys
Mount --bind /proc /mnt/ubuntu/proc
Mound /dev/sda1 /mnt/ubuntu/boot
Chroot /mnt/ubuntu
Apt-get update && upgrade
Dpkg -S image
Apt-get remove (all linux firmware, image, headers)
Update-grub
Update-initramfs -uv
Apt-get install linux-image-generic-pae (if ram > 3Gb)
And all dependencies
Update-grub
Update-initramfs
Unmount
Reboot
jo
Translate posts from habr top hebrew.

#Num
setleds -D  num

#Rus & console font

Dpkg-reconfigure:
Language-pack-ru
Keyboard-configuration
Console-cyrillic
Console-setup
Locale
tput rmm //if needed

vim /etc/defaults/keyboard

apt install xfonts-intl-european culmus 
Xmodmap -pke
xev

#for Hebrew
search web for HebrewLocalizationHowto

#Grub4dos
Console mount /cdrom
#Manual soft:
Moun /media/cdrom
Apt-cdrom -d path add
usr/share/doc/apt/examples/sources.list + universe 
Tasksel
install bash-completion



#wi-fi
Lshw --networking
Lsusb
Ifconfig
iwconfig
Wpa_passphrase > conf
scan_ssid=1 # only needed if your access point uses a hidden ssid
pairwise=CCMP #for AES auth
Vim /etc/network/interfaces
Allow-hotplug wlan0 //No 60 sec sleep on boot
Iface wlan0 inet dhcp
wpa-conf /etc/wpa_supplicant/.conf

Sudo ifup wlan0

#hostname
/etc/hostname
/etc/hosts

#Startx(custom)
Vim `which startx`
$logfile
I3
xinit "$client"  -- "$server" $display $serverargs >$logfile 2>&1 & \
x11vnc "-sleepin" 3 "-usepw" "-forever" >>$logfile 2>&1
Sudo dpkg-reconfigure x11-common Anybody
Cp /etc/init.d/sceleton  startx
Pre-load $all
Chmod 755
Ln startx to sbin
start-stop-daemon --start --quiet -c username -g usergroup
Update-rc startx defaults

Ncurses:
W3m
Alsamixer
Rtorrent
Nvlc
Vifm

#nosleep
@xset s off
@xset -dpms
@xset s noblank

#mouse sensivity
xset m 5 3

#sync
Rsync -avzcP --update -e ssh SOURCE DESTINATION

#camera
Lsmod | grep uvnvideo
Cheese
Adduser -a -G video

#printscreen
Imagemagic
Bindsym import

#time
Tzselect
Dpkg-reconfigure tzdata

#youtube
W3m 3rd browser: sh -c 'printf %s "$0" | youtube-dl -cf worst -o "~/%(title)s-%(id)s.%(ext)s" -a -'

#system monitor 
conky

#xdg-open
xdg-mime query filetype FILE
/etc/mailcap
mimetype


#MySQL fast replace http to https
mysqldump dbname tbname > tbname.sql
cp tbname.sql tbname.sqlBAK
sed -i 's/http:/https:/g' ./tbname.sql
grep -i http: ./tbname.sql
mysql dbname < tbname.sql
rm tbname.sql*

#UI gtk colors
install lxappearance
vim /usr/share/themes/NAME/gtk-*
GtkWidget::link-color
GtkWidget::visited-link-color

for skype: install gtk2-engine:i386
for gtk3: Clearlools-phenix
#Video & Imaging
gimp
inkscape
blender
lives
feh


#QEMU
install virt-* 
kvm-spice
libvirtd
adduser `id -un` kvm+libvirtd 
adduser libvirt-qemu audio
echo -e "\x55\xaa" | dd bs=1 count=2 seek=510 of=... conv=notrunc //for Windows 10 or Android on a clean image
wget OVMF.fd  from tianocore.org  to  /usr/share/qemu/  //UEFI bios and it DOES require the 55aa record in the begining of an image.
video=QXL

#xterm fonts
lsof | grep -i xterm
fc-match mono

#Qt uses GTK theme
export QT_STYLE_OVERRIDE=GTK+
echo "style=GTK+" >> /etc/xdg/TrollTech.conf

#Remove packages installed from deb's
dpkg --get-selections | grep -i SOFTWARENAME >> list.txt
sed -i 's/install/deinstall/g" list.txt
sed -i 's/dedeinstall/deinstall/g' list.txt
sudo cat list.txt | dpkg --set-selections
sudo apt remove 'dpkg --get-selections | grep deinstall | cut -f1'
sudo apt-get update && sudo apt-get upgrade

#Search for rgb colors
grep -nir '\#[[:xdigit:]]\{6\}'

#Trim mediafile 
avconv -i inputFile -ss startTime -t durationTime -codec copy outputFile

#gin volume(256=100%,1024=400%)
avconv -vol 256 

#Android screencast
adb shell >screenrecord

#Android screenshot
adb shell >screencap

#Record desctrop screencast with audio
vlc -> screen:// pulse:// ( cvlc :screen-fps=1.000000 :input-slave=pulse:// :live-caching=300 :sout=#transcode{vcodec=h264,acodec=mpga,ab=128,channels=2,samplerate=44100}:file{dst=fileName.mp4} :sout-keep )

#Extract image from video
avconv -i yourVideo.avi -ss 00:00:00 -t 00:00:01 -frames 1 -f image2 ./output.png

#Sleep & hibernate
install pm-utilits
pm-suspend
