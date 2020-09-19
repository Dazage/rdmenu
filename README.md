# rdmenu
I've added some sample hosts to the script, but the idea is that you add in your own hosts in ${options} and their hostname/IP in the case statement.

# Info
The genlogin() function is really useful for me because I don't want to the usernames and passwords stored as plaintext. It uses the [pass](https://passwordstore.org "The standard unix password manager") password manager, but if you don't want to use a password manager then you can just set the $user and $passwd variables inside the case statements and remove/comment out the genlogin() function.

# Dependencies
dmenu           -> Provides the drop down menu of available servers to choose from.
xfreerdp        -> The piece of software I use for connecting to servers via RDP.
(optional) pass -> As stated in the info section this is optional, but I do suggest using it adds a layer of security.
