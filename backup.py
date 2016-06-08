#Creator:Kiriakos Naiskes 24/6/15

#Don't forget to change directories,names and usernames
import os
import shutil

#shutil.copy will overwritte files - no need to delete them 

home = "/home/kiriakos/"
filed= "/media/usb0/dotfiles/" #File in which dotfiles will be saved
usb = "/media/usb0/"

#Readme file function
def readme():
    os.chdir(filed)
    readf = open("README.txt","w")
    readf.write("Dotfiles are hidden,press ctrl+h or type ls -a in a terminal to see these files")
    readf.close()
    os.chdir(home)

#Define which files you want to backup

#Dotfiles
vim=".vimrc"
xinitrc=".xinitrc"
xdefaults=".Xdefaults"
tmux = ".tmux.conf"
feh = ".fehbg"
bashrc = ".bashrc"
i3config="/home/kiriakos/.i3/config"
i3statusbar="/home/kiriakos/.i3status.conf"

#Check if file exists

if(os.path.exists(filed)):
    print "File exists !"
else:
    print "File does not exist !"
    print "I will create one !"
    os.mkdir(filed)
    print "File created ! "
    readme()

filelist=[vim,xinitrc,xdefaults,tmux,feh,bashrc,i3config,i3statusbar]

for i in filelist:
    shutil.copy(i,filed)

print "End"

