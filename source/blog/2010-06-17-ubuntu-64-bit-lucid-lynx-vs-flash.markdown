---
author: pdj
comments: true
date: 2010-06-17
slug: ubuntu-64-bit-lucid-lynx-vs-flash
title: Ubuntu 64 bit Lucid Lynx vs. Flash
wordpress_id: 453
categories:
- 64bit
- ubuntu
tags:
- '10.04'
- 64bit
- lucid lynx
- ubuntu
---

Since an ubuntu update a week ago, my flash went bogus.

If apt fails then we do it the old school manual way:

    
    sudo apt-get remove -y --purge flashplugin-nonfree gnash \
    gnash-common mozilla-plugin-gnash swfdec-mozilla libflashsupport \
    nspluginwrapper
    sudo rm -f /usr/lib/mozilla/plugins/*flash*
    sudo rm -f /usr/lib/firefox/plugins/*flash*
    sudo rm -rfd /usr/lib/nspluginwrapper
    rm -f ~/.mozilla/plugins/*flash*
    sudo apt-get install ia32-libs nspluginwrapper
    cd Downloads/
    tar xvzf install_flash_player_10_linux.tar.gz
    sudo cp libflashplayer.so /usr/lib/mozilla/plugins/.
    sudo nspluginwrapper -i /usr/lib/mozilla/plugins/libflashplayer.so
    sudo ln -sf \
    /usr/lib/nspluginwrapper/plugins/npwrapper.libflashplayer.so \
    /usr/lib/mozilla/plugins/
    sudo ln -sf \
    /usr/lib/nspluginwrapper/plugins/npwrapper.libflashplayer.so \
    /usr/lib/firefox-addons/plugins/
    sudo ln -sf \
    /usr/lib/nspluginwrapper/plugins/npwrapper.libflashplayer.so \
    /usr/lib/xulrunner-addons/plugins/
