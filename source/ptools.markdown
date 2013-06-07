---
author: pdj
comments: true
date: 2009-06-11
slug: ptools
title: PTools
wordpress_id: 103
---

# PTools #

I run a small botnet on quakenet IRC servers. They offer basic channel services. To make the service more easy, and let people run the channel themselves without asking me every time, i made the following TCL script:

[ptools v2.1](http://files.4pdj.nl/pub/TCL/ptools-2.1.tcl)

The header:

    
    ###############################################
    #
    # ptools.tcl - Public command script
    #
    # (c) 2009 - Peter "pDj" de Jong @ Qnet
    #
    # Revision History
    # ---------------------------------------------
    # 1.0  27-may-2009 pDj    Initial creation
    # 1.1  29-may-2009 pDj    Colorized userlist
    #                         Fixed sorting help
    #                         Added pub !resethost
    # 1.2   5-jun-2009 pDj    Added pub !whoami
    #                         Moved notices to array
    #                         Added some logging
    # 1.3   6-jun-2009 pDj    Modified deluser
    #                         Modified adduser
    #                         Added pub !resetrights
    # 2.0   6-jun-2009 pDj    Code restructure
    # 2.1   6-jun-2009 pDj    Renamed some public functions
    #                         Colorized notices
    #
    # Public commands:
    # !help - Shows this help
    # !useradd
    #               - Adds a user to the bot with master/operator
    #                 rights for the given nick
    # !userremove  - Removes a user from the bot
    # !kick  - Kicks the person
    # !ban  - Bans the person
    # !banlist - Shows all the bans on the bot
    # !unban  - Unbans a person based on the given hostmask
    # !op  - Gives operator rights to the person
    # !deop  - Removes the persons operator rights
    # !voice  - Gives the person voice
    # !devoice  - Removes the persons voice
    # !userrename   - Changes the name of a bot user
    # !usersuspend  - Suspends a user on the bot
    # !userunsuspend  - Unsuspends a user on the bot
    # !usersethost
    #                      - Resets host of username with host of nick
    # !whoami - Shows ur username on the bot
    # !usersetrights
    #                       - Gives the user master/operator rights
    # !userlist - Shows all users for the channel
    #
    ###############################################
