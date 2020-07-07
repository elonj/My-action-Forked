#!/bin/bash
# 本脚本工作目录必须是git仓库的主目录

# Add Some Package

mkdir -p package/custom
cd package/custom
# git clone https://github.com/coolsnowwolf/packages
# git clone https://github.com/kenzok8/small
# git clone https://github.com/kenzok8/openwrt-packages
# git clone https://github.com/Lienol/openwrt-package
git clone https://github.com/fw876/helloworld
# git clone https://github.com/openwrt-develop/luci-theme-atmaterial
git clone -b master https://github.com/vernesong/OpenClash
git clone https://github.com/rufengsuixing/luci-app-adguardhome
# git clone -b 18.06  https://github.com/jerrykuku/luci-theme-argon
cd ../../

#1. Modify default IP

sed -i 's/192.168.1.1/192.168.5.1/g' package/base-files/files/bin/config_generate

#2. Set default timezone to Los Angeles. Time zone info can be found in https://oldwiki.archive.openwrt.org/doc/uci/system
#uci set system.@system[0].timezone=PST8PDT,M3.2.0,M11.1.0
#uci set system.@system[0].zonename=America/Los Angeles
sed -i 's/CST-8/PST8PDT,M3.2.0,M11.1.0/g' package/lean/default-settings/files/zzz-default-settings
sed -i 's/Asia/America/g' package/lean/default-settings/files/zzz-default-settings
sed -i 's/Shanghai/Los Angeles/g' package/lean/default-settings/files/zzz-default-settings

# Modify timezone (not sure useful or not)
sed -i 's/UTC/PST8PDT,M3.2.0,M11.1.0/g' package/base-files/files/bin/config_generate

# Add some default settings

#\cp -rf ../lede/zzz-default-settings package/lean/default-settings/files/zzz-default-settings
curl -fsSL https://raw.githubusercontent.com/1orz/My-action/master/lean-lede/zzz-default-settings > package/lean/default-settings/files/zzz-default-settings
