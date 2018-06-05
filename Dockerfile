FROM alpine:3.7

ENV DNS_SERVER=
ENV HOST=
ENV IP=
ENV DOMAIN=
ENV TTL=
ENV REVERSE_IP=`echo $IP | awk -F. '{print $4"."$3"."$2"."$1".in-addr.arpa"}'`

RUN apk update && apk add --no-cache bind-tools

VOLUME /key

COPY entrypoint.sh /
RUN chmod +x entrypoint.sh

ENTRYPOINT entrypoint.sh

