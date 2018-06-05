#!/bin/sh

if [ -f /key/nsupdate.key ]  && [ -f /key/nsupdate.private ] && [ ${DNS_SERVER+set} ] && [ ${HOST+set} ] && [ ${DOMAIN+set} ] && [ ${TTL+set} ] && [ ${IP+set} ] ;then

echo "server ${DNS_SERVER} \
update add ${HOST}.${DOMAIN} ${TTL} IN A ${IP} \
send \
update add ${REVERSE_IP} ${TTL} IN PTR ${HOST}.${DOMAIN} \
send \
quit \
" | nsupdate -k /key/nsupdate.key
else
  echo "no valid params"
  
fi

