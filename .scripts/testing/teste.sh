#!/bin/bash 
#
##!/bin/bash

# sysinfo_page - A script to produce a system information HTML file

### Constants

TITLE="System Information for $HOSTNAME"
RIGHT_NOW="$(date +"%x %r %Z")"
TIME_STAMP="Updated on $RIGHT_NOW by $USER"

##### Functions

system_info()
{
    # Temporary function stub
    # Stubbing is a technique to help whatch the logic of our script develop
    #echo "function system_info"

    echo "<h2>System release info</h2>"
    echo "<p>function not yet implemented</p>"
}


show_uptime()
{
    echo "<h2>System Uptime</h2>"
    echo "<pre>"
    uptime
    echo "</pre>"

}


drive_space()
{
   echo "<h2>Filesystem Space</h2>"
    echo "<pre>"
    df
    echo "</pre>" 

}


home_space()
{
   echo "<h2>Filesystem Space</h2>"
    echo "<pre>"
    echo "Bytes Directory"
    du -s /home/* | sort -nr
    echo "</pre>" 

}

##### Main

cat <<- _EOF_
    <html>
    <head>
        <title>
        $TITLE
        </title>
    </head>

    <body>
    <h1>$TITLE</h1>
    <p> $TIME_STAMP</p>
    $(system_info)
    $(show_uptime)
    $(drive_space)
    $(home_space)
    </body>
    </html>
_EOF_
