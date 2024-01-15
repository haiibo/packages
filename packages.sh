#!/bin/bash
function git_sparse_clone() {
  branch=$1 repourl=$2 && shift 2
  TMPFILE=$(mktemp -d tmp.XXXX) || exit 1
  git clone -b $branch --depth=1 --filter=blob:none --sparse $repourl $TMPFILE
  cd $TMPFILE
  git sparse-checkout init --cone
  git sparse-checkout set $@
  mv -n $@ ../
  cd ..
  rm -rf $TMPFILE
}

function mvdir() {
  mv -n $(find $1/* -maxdepth 0 -type d) ./
  REPODIR=$(echo $1 | cut -d/ -f1)
  rm -rf $REPODIR
}

git clone --depth=1 -b 18.06 https://github.com/kiddin9/luci-theme-edge
git clone --depth=1 https://github.com/kiddin9/luci-app-dnsfilter
git clone --depth=1 https://github.com/kiddin9/qBittorrent-Enhanced-Edition
git clone --depth=1 https://github.com/yaof2/luci-app-ikoolproxy
git clone --depth=1 -b openwrt-18.06 https://github.com/tty228/luci-app-wechatpush luci-app-serverchan
git clone --depth=1 https://github.com/ntlf9t/luci-app-easymesh
git clone --depth=1 https://github.com/zzsj0928/luci-app-pushbot
git clone --depth=1 -b 18.06 https://github.com/jerrykuku/luci-theme-argon
git clone --depth=1 https://github.com/jerrykuku/luci-app-argon-config
git clone --depth=1 https://github.com/jerrykuku/lua-maxminddb
git clone --depth=1 https://github.com/sirpdboy/luci-app-advanced
git clone --depth=1 https://github.com/hubbylei/luci-app-clash
git clone --depth=1 https://github.com/Jason6111/luci-app-netdata
git clone --depth=1 https://github.com/thinktip/luci-theme-neobird
git clone --depth=1 https://github.com/esirplayground/luci-app-poweroff
git clone --depth=1 -b lede https://github.com/pymumu/luci-app-smartdns
git clone --depth=1 https://github.com/pymumu/openwrt-smartdns smartdns
git clone --depth=1 https://github.com/rufengsuixing/luci-app-adguardhome
git clone --depth=1 https://github.com/peter-tank/luci-app-autorepeater
git clone --depth=1 https://github.com/sensec/luci-app-udp2raw
git clone --depth=1 https://github.com/sensec/openwrt-udp2raw udp2raw
git clone --depth=1 https://github.com/BoringCat/luci-app-mentohust
git clone --depth=1 https://github.com/KyleRicardo/MentoHUST-OpenWrt-ipk mentohust
git clone --depth=1 -b master https://github.com/UnblockNeteaseMusic/luci-app-unblockneteasemusic
git clone --depth=1 https://github.com/sirpdboy/luci-app-eqosplus
git clone --depth=1 https://github.com/sirpdboy/luci-app-netwizard
git clone --depth=1 https://github.com/ximiTech/luci-app-msd_lite
git clone --depth=1 https://github.com/ximiTech/msd_lite
git clone --depth=1 https://github.com/xiaorouji/openwrt-passwall-packages openwrt-passwall
git clone --depth=1 https://github.com/xiaorouji/openwrt-passwall passwall && mvdir passwall
git clone --depth=1 https://github.com/xiaorouji/openwrt-passwall2 && mvdir openwrt-passwall2
git clone --depth=1 -b main https://github.com/fw876/helloworld && mv helloworld/luci-app-ssr-plus ./

git clone --depth=1 https://github.com/destan19/OpenAppFilter && mvdir OpenAppFilter
git clone --depth=1 https://github.com/sbwml/openwrt-alist && mvdir openwrt-alist
git clone --depth=1 https://github.com/ophub/luci-app-amlogic amlogic && mvdir amlogic
git clone --depth=1 https://github.com/sirpdboy/netspeedtest && mvdir netspeedtest
git clone --depth=1 https://github.com/sbwml/luci-app-mosdns openwrt-mosdns && mvdir openwrt-mosdns
git clone --depth=1 https://github.com/sirpdboy/luci-app-ddns-go openwrt-ddns-go && mvdir openwrt-ddns-go
git clone --depth=1 https://github.com/linkease/istore-ui && mvdir istore-ui
git clone --depth=1 https://github.com/linkease/istore && mvdir istore/luci
git clone --depth=1 https://github.com/linkease/nas-packages && mvdir nas-packages/network/services
git clone --depth=1 https://github.com/linkease/nas-packages-luci && mvdir nas-packages-luci/luci
git clone --depth=1 https://github.com/messense/aliyundrive-fuse aliyundrive && mvdir aliyundrive/openwrt
git clone --depth=1 https://github.com/messense/aliyundrive-webdav aliyundrive && mvdir aliyundrive/openwrt

git_sparse_clone master https://github.com/vernesong/OpenClash luci-app-openclash
git_sparse_clone master https://github.com/kiddin9/openwrt-packages luci-app-bypass
git_sparse_clone openwrt-18.06 https://github.com/rosywrt/luci-theme-rosy luci-theme-rosy
git_sparse_clone master https://github.com/coolsnowwolf/packages multimedia/UnblockNeteaseMusic
git_sparse_clone master https://github.com/lisaac/luci-app-dockerman applications/luci-app-dockerman
git_sparse_clone master https://github.com/xiaoqingfengATGH/luci-theme-infinityfreedom luci-theme-infinityfreedom
git_sparse_clone master https://github.com/kenzok8/openwrt-packages luci-app-aliddns
git_sparse_clone master https://github.com/immortalwrt/packages net/adguardhome
git_sparse_clone openwrt-18.06 https://github.com/immortalwrt/packages net/gost net/iptvhelper
git_sparse_clone Lede https://github.com/281677160/openwrt-package luci-app-cpulimit luci-app-oled

git_sparse_clone main https://github.com/Lienol/openwrt-package luci-app-ssr-mudb-server \
luci-app-filebrowser luci-app-pppoe-server
git_sparse_clone master https://github.com/xiangfeidexiaohuo/extra-ipk op-webdav/luci-app-gowebdav \
op-webdav/gowebdav op-homebox/luci-app-homebox
git_sparse_clone openwrt-18.06 https://github.com/immortalwrt/luci applications/luci-app-eqos \
applications/luci-app-gost applications/luci-app-iptvhelper
git_sparse_clone main https://github.com/haiibo/packages luci-app-wrtbwmon wrtbwmon luci-app-onliner \
luci-theme-atmaterial luci-theme-atmaterial_new luci-theme-opentomcat luci-theme-opentomato luci-theme-netgear luci-app-vssr

rm -rf ./*/.git* ./*/LICENSE
find ./*/ -type f -name '*.md' -print -exec rm -rf {} \;
find luci-theme-*/ -type f -name '*luci-theme-*' -print -exec sed -i '/set luci.main.mediaurlbase/d' {} \;

sed -i \
-e 's?\.\./\.\./\(lang\|devel\)?$(TOPDIR)/feeds/packages/\1?' \
-e 's?\.\./\.\./luci.mk?$(TOPDIR)/feeds/luci/luci.mk?' \
-e 's?2. Clash For OpenWRT?3. Applications?' \
*/Makefile

bash $GITHUB_WORKSPACE/.github/diy/create_acl_for_luci.sh -a >/dev/null 2>&1
bash $GITHUB_WORKSPACE/.github/diy/convert_translation.sh -a >/dev/null 2>&1
rm -rf create_acl_for_luci.*

exit 0
