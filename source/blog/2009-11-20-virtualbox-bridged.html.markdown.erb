---
author: pdj
comments: true
date: 2009-11-20
slug: virtualbox-bridged
title: Virtualbox bridged
wordpress_id: 349
categories:
- bridge
- ubuntu
- virtualbox
tags:
- bridge
- bridge-utils
- ubuntu
- uml-utilities
- virtualbox
---

Installed Sun Virtualbox (not the OSE) on my Karmic Ubuntu laptop. Virtualbox >>> VMWare.

[![Vbox](/images/vbox_logo2_gradient.png)](/images/vbox_logo2_gradient.png)

**Little guide:**

Add the software source (System / Administration / Software Sources):

  
    deb http://download.virtualbox.org/virtualbox/debian karmic non-free


Add the key:

    
    wget -q \
        http://download.virtualbox.org/virtualbox/debian/sun_vbox.asc \
        -O- | sudo apt-key add -


Install the Virtualbox package:

    
    sudo apt-get install virtualbox-3.0


You're done, but if you also want to use the bridged mode, do the following:

    
    sudo apt-get install uml-utilities
    sudo apt-get install bridge-utils


Add your user account to the following groups (check /etc/group, change pdj into your own username):

    
    vboxusers:x:<id>:pdj
    uml-net:x:<id>:pdj


First bring down your network:

    
    sudo /etc/init.d/network-manager stop
    sudo /etc/init.d/networking stop


Change your /etc/network/interfaces (change pdj into your own username):

    
    auto lo
    iface lo inet loopback
    
    auto tap0
    iface tap0 inet manual
    tunctl_user pdj 
    uml_proxy_ether eth0
    
    auto br0
    iface br0 inet dhcp
    bridge-ports eth0 tap0
    
    auto eth0
    iface eth0 inet manual


After you bring up your network again, you'll notice that eth0 is no longer managed by Networkmanager because NW ignores all interfaces listed in /etc/network/interfaces.

    
    sudo /etc/init.d/network-manager start
    sudo /etc/init.d/networking start


You'll also notice that br0 is now your normal outgoing interface. Don't use eth0 anymore.
We will use tap0 as the interface for Virtualbox:

[![tap0](/images/tap0.png)](/images/tap0.png)

Note: I stopped using the bridge because of lack of flexibility concerning switching between wire / wireless. Currently i configured 2 network cards within the virtualboxes. One "NAT"-setting networkcard and the other "Host only".  This gives me the required flexibility. U might have to configurate your firewall tho.
