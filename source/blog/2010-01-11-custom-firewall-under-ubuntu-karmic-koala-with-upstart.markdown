---
author: pdj
comments: true
date: 2010-01-11
slug: custom-firewall-under-ubuntu-karmic-koala-with-upstart
title: Custom firewall under Ubuntu Karmic Koala with upstart
wordpress_id: 423
categories:
- firewall
- karmic
- ubuntu
- upstart
- virtualbox
tags:
- firewall
- iptables
- karmic
- ubuntu
- upstart
---

ATTENTION! At the time of this post, I had no v6 IP. So if you do, double the lines with ip6tables.

Was bored tonight, so i made the following firewall for the Ubuntu Karmic laptop. Uses ubuntu's new init replacement called Upstart. Place the file (pfirewall.conf) under /etc/init:

    
    # PFirewall
    
    description	"PFirewall"
    author          "Peter de Jong <p.de.jong@gmail.com>"
    
    start on net-device-added INTERFACE=lo
    stop on runlevel [!023456]
    
    pre-start script
    	# Turn on connection tracking for Virtualbox NAT
    	sysctl net.netfilter.nf_conntrack_acct=1
    
    	# Flush the table
    	iptables -F
    
    	# Set policies (default drop all = dont even send denied)
    	iptables -P FORWARD DROP
    	iptables -P OUTPUT DROP
    	iptables -P INPUT DROP
    
    	# New connections without syn will be dropped
    	iptables -A INPUT -p tcp ! --syn -m state --state NEW -j DROP
    
    	# All existing and related connections are accepted
    	iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
    	iptables -A OUTPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
    
    	# SSH
    	iptables -A INPUT -p tcp -m state --state NEW --dport 22 -j ACCEPT
    
    	# Local
    	iptables -A INPUT -i lo -j ACCEPT
    
    	# Accept new outgoing connections
    	iptables -A OUTPUT -m state --state NEW -j ACCEPT
    
    	# Accept Virtualbox internal network
    	iptables -A INPUT -m state --state NEW -i vboxnet0 -j ACCEPT
    end script
    
    post-stop script
    	# Turn off connection tracking
    	sysctl net.netfilter.nf_conntrack_acct=0
    
    	# Flush the table
    	iptables -F
    
    	# Set policies
    	iptables -P FORWARD ACCEPT
    	iptables -P OUTPUT ACCEPT
    	iptables -P INPUT ACCEPT
    end script


It will be triggered when the event network up will be broadcasted. First u have to do the following tho:

    
    initctl reload-configuration


To manually start/stop the firewall;

    
    initctl start/stop pfirewall
