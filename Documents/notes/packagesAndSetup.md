# Drivers/Modules

* intel-ucode
* xf86-video-intel
* nvidia
* nvidia-prime
* bbswitch

# Other packages

* nordic-theme-git
* pop-icon-theme-bin
* qogir-icon-theme
* lxsession

# Docker images
* astefanutti/decktape
* hello-world
* asciidoctor/docker-asciidoctor

# Nvidia Switcher

* Install [`optimus-manager`](https://github.com/Askannz/optimus-manager)
* Use the config file from dotfiles dir
* Read the `optimus-manager` wiki for more details

# Make sound over HDMI work

* First, boot into nVidia mode (this is to make the kernel load the appropriate modules on start-up)
    * Set `startup_mode=nvidia` in `/etc/optimus-manager/optimus-manager.conf` and then reboot

* In `pavucontrol`, set the HDMI output device as the fall-back (green check-mark)
