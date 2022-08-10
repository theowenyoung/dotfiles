#!/bin/sh

cd -- ~/dotfiles/private/clash/files/;

a=$(yq -o=json -I=0 me.yaml); b=$(yq -o=json -I=0 b.yaml);
linux=$(yq -o=json -I=0 me_linux.yaml);
c=$(jq --argjson a "$a" --argjson b "$b" -n '{proxies:[$a.proxies[],$b.proxies[]]}');
d=$(jq  --argjson a "$a" --argjson b "$b" -n '$a["proxy-groups"][:-1] as $arr1 | $a["proxy-groups"][-1].proxies as $proxies1 | $b["proxy-groups"][1].proxies as $proxies2 | {"proxy-groups": [$arr1[],{"name":"Proxy","type":"select","proxies":[$proxies1[],$proxies2[]]}] }');
jq  --argjson a "$a" --argjson c "$c" --argjson d "$d"  -n '$a * $c * $d' | yq -P - > config.yaml

# write linux config

jq  --argjson a "$a" --argjson c "$c" --argjson d "$d" --argjson linux "$linux"  -n '$a * $c * $d * $linux' | yq -P - > config_linux.yaml