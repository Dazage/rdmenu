# rdmenu
I've added some sample hosts to the script, but the idea is that you add in your own hosts in ${options} and their hostname/IP in the case statement.

The genlogin() function is really just useful for me because I don't want to save the username and password in plaintext. It uses the [pass](https://passwordstore.org "The standard unix password manager") password manager, but if you don't want to use a password manager then you can just set the $user and $passwd variables inside the case statements and remove the genlogin() function.
