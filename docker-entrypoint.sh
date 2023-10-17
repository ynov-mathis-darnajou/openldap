#!/bin/bash

if [ -z "$LDAP_BASE_DN" ]; then
    IFS="." read -ra ADDR <<< "$LDAP_DOMAIN"
    for i in "${ADDR[@]}"; do
        EXT="dc=$i,"$EXT
    done
    LDAP_BASE_DN=${EXT%?}
fi
slapd -h "ldap:/// ldaps:/// ldapi:///" -u openldap -g openldap
sleep 10
ldapmodify -Y EXTERNAL -H ldapi:/// <<EOF
dn: olcDatabase={1}${LDAP_BACKEND},cn=config
changetype: modify
replace: olcRootPW
olcRootPW: $(slappasswd -s $LDAP_ROOTPASS)
EOF

tail -f /dev/null