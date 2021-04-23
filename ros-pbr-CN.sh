#!/bin/sh

mkdir -p /tmp/pbr

#电信
curl https://bgp.space/china.html > /tmp/pbr/cn.txt && sed -i '1,/BEGIN/d' /tmp/pbr/cn.txt && sed -i '/END/,$d' /tmp/pbr/cn.txt && sed -i 's/<br>//g' /tmp/pbr/cn.txt

{
echo "/ip route rule"

nets=`cat /tmp/pbr/cn.txt`
for net in $nets ; do
  echo "add dst-address=$net action=lookup table=CN"
done


} > ../ros-pbr-CT-UN-CM.rsc

{
echo "/ip firewall address-list"

nets=`cat /tmp/pbr/cn.txt`
for net in $nets ; do
  echo "add list=CN address=$net"
done


} > ../ros-pbr-CT-UN-CM.rsc

rm -rf /tmp/pbr
