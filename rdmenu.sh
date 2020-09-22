#!/usr/bin/env bash

genlogin() {
    case "$1" in
        myuser)
            user="myuser"
            passwd="$(pass domain/user | sed 1q)"
            ;;
        domain-admin)
            user="domain-admin"
            passwd="$(pass servers/dadmin | sed 1q)"
            ;;
        super-admin)
            user="super-admin"
            passwd="$(pass servers/sadmin | sed 1q)"
            ;;
        *)
            echo "you broke me"
            exit 1
            ;;
    esac
}

declare options=("workstation
dc1
dc2
fs1")

choice="$(echo -e "${options[@]}" | dmenu -i -p 'Open connection: ' -l 15)"

case "$choice" in
    workstation)
        remotehost="192.168.1.7"
        genlogin "myuser";;
    dc1)
        remotehost="domain-controller1.work.com"
        genlogin "domain-admin";;
    dc2)
        remotehost="domain-controller2.work.com"
        genlogin "domain-admin";;
    fs1)
        remotehost="fileserver1.work.com"
        genlogin "super-admin";;
    *)  remotehost="$choice.work.com"; genlogin "super-admin";; # Default to super-admin so I can connect to any server I haven't already declared in ${options}
esac

xfreerdp /dynamic-resolution /cert-ignore /cert-tofu /u:"$user" /p:"$passwd" /v:"$remotehost:3389"
