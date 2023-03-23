*** Version 2.0 Changes ***
-Fixed crash error when pinging self on startup.
-Allowed the target to be a URL also(i.e. www.example.com)
-Removed delay when starting an attack, and fixed a memory leak.
-Added Options menu with Always On Top option
-Added option to minimize UDP Unicorn windows to the system tray
-Added ability to change background color
-Added a drop down menu for the port, there is a wide selection of protocols and games to target.
-Added an active connection viewer, to retrieve the TCP and UDP tables.
    -You can also send the remote address to the target IP or the port scanner
    and filter out the connections by port number, set to 0 to disable the filter.
-Added port scanner, multithreaded
    -A basic TCP "connect" scan, not stealthy at all, use with caution
    -You can edit the port range in Options
    -Double click a port that was found open to set it as the target port
-Added network info dialog, shows your hostname, private/public IP address, and MAC address.
-Added link to a list of used ports online, for games and popular programs.
-Added music option, the default song is a snippet of Always by Erasure - from Robot Unicorn Attack, a game that inspired me to create this program.
-Added config.ini file to save common settings (manually parsed)

**Remember, if you have a bad/average connection, use short, controlled bursts.

**To Compile, use Codeblocks and open the .cbp file, link the correct libraries


http://udpunicorn.sourceforge.net/
