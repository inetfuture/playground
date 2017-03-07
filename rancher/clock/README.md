- `./build.sh`
- `rancher up -d`
- watch haproxy.cfg in lb container: `while :; do date +'%T.%N============================='; cat /etc/haproxy/haproxy.cfg | grep '^server '; sleep 0.1; done`
- watch dns records: `while :; do date +'%T.%N============================='; dig @169.254.169.250 clock.clock.rancher.internal | grep '600 IN'; sleep 0.1; done`
- tail clock container logs: `docker logs -f r-clock-clock-1`
- `rancher up --force-upgrade --confirm-upgrade -d 1 clock`