#!/bin/sh
set -e;
cd -- ~/dotfiles/private/clash/files/;

a=$(yq -o=json -I=0 me.yaml); b=$(yq -o=json -I=0 b.yaml);
linux=$(yq -o=json -I=0 me_linux.yaml);
macos=$(yq -o=json -I=0 me_macos.yaml);

premium_only=$(yq -o=json -I=0 premium_only.yaml);

# echo "$premium_only";
c=$(jq --argjson a "$a" --argjson b "$b" -n '{proxies:[$a.proxies[],$b.proxies[]]}');
d=$(jq  --argjson a "$a" --argjson b "$b" -n '$a["proxy-groups"][:-1] as $arr1 | $a["proxy-groups"][-1].proxies as $proxies1 | $b["proxy-groups"][1].proxies as $proxies2 | {"proxy-groups": [$arr1[],{"name":"Proxy","type":"select","proxies":[$proxies1[],$proxies2[]]}] }');
premiumu_rules=$(jq --argjson a "$a" --argjson premium_only "$premium_only" -n '{rules:[$premium_only.rules[],$a.rules[]]}');


jq  --argjson a "$a" --argjson c "$c" --argjson d "$d" --argjson premium_only "$premium_only" --argjson premiumu_rules "$premiumu_rules" --argjson macos "$macos" -n '$a * $c * $d * $premium_only * $premiumu_rules * $macos' | yq -P - > config.yaml

# write linux config

jq  --argjson a "$a" --argjson c "$c" --argjson d "$d"  --argjson premium_only "$premium_only" --argjson premiumu_rules "$premiumu_rules" --argjson linux "$linux"  -n '$a * $c * $d * $premium_only * $premiumu_rules * $linux' | yq -P - > config_linux.yaml


# also generate a simple config
jq  --argjson a "$a" --argjson c "$c" --argjson d "$d" -n '$a * $c * $d' | yq -P - > config_normal.yaml