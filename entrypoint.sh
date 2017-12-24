#!/usr/bin/env sh

/usr/local/bin/consul-template -config /root/templates/service.hcl &
child=$!

trap "kill -s INT $child" INT TERM
wait "$child"
trap - INT TERM
wait "$child"
