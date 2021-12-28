#!/bin/sh

  rm -f all.pkgs
  rm -rf ./DEB/tmp

if [[ -e changelog.log ]]; then
   rm changelog.log
fi

  echo "[" > all.pkgs
if [[ -e compatity.txt ]]; then
    compatity=$(cat compatity.txt)
fi

for i in ./DEB/*.deb
do
   debInfo=`dpkg -f $i`
   dep=`echo "$debInfo" | grep "Depiction: " | cut -c 12- | tr -d "\n\r"`
   sileo=`echo "$debInfo" | grep "SileoDepiction: " | cut -c 12- | tr -d "\n\r"`
   home=`echo "$debInfo" | grep "Homepage: " | cut -c 11- | tr -d "\n\r"`
   pkg=`echo "$debInfo" | grep "Package: " | cut -c 10- | tr -d "\n\r"`
   maintainer=`echo "$debInfo" | grep "Maintainer: " | cut -c 13- | tr -d "\n\r"`
   sponsor=`echo "$debInfo" | grep "Sponsor: " | cut -c 10- | tr -d "\n\r"`
   #Maintainer: @ongcenh
   #Author: @ongcenh
   #Sponsor: @ongcenh
   if [[ -z $dep || -z $sileo || -z $home || -z $maintainer || -z $sponsor ]];then
       dpkg-deb -R $i ./DEB/tmp
   fi
       buildDEBIAN=0
   if [[ -z $dep ]]; then
       echo "Depiction: https://ongcenh.github.io/Debinfo/${pkg}/?p=info" >> ./DEB/tmp/DEBIAN/control
       buildDEBIAN=1
   fi
   if [[ -z $sileo ]]; then
       echo "SileoDepiction: https://ongcenh.github.io/Sileoinfo/${pkg}.json" >> ./DEB/tmp/DEBIAN/control
       buildDEBIAN=1
   fi
   if [[ -z $home ]]; then
        echo "Homepage: https://ongcenh.github.io/" >> ./DEB/tmp/DEBIAN/control
       buildDEBIAN=1
   fi
   if [[ -z $maintainer ]]; then
        echo "Maintainer: @ongcenh <anhminh311105@gmail.com>" >> ./DEB/tmp/DEBIAN/control
       buildDEBIAN=1
   fi
   if [[ -z $sponsor ]]; then
        echo "Sponsor: Ông Cễnh <https://ongcenh.github.io>" >> ./DEB/tmp/DEBIAN/control
       buildDEBIAN=1
   fi
   #binary 0 or 1
   if [[ $buildDEBIAN == 1 ]]; then
       bsname=$(basename "$i")
       dpkg -bR ./DEB/tmp "./DEB/$bsname"
       debInfo=`dpkg -f $i`
       echo "$i" >> changelog.log
   fi
#Đang tạo =====================
#Thêm Depiction thành công ==========

   section=`echo "$debInfo" | grep "Section: " | cut -c 10- | tr -d "\n\r"`
   section="${section//'"'/\\\"}"

   name=`echo "$debInfo" | grep "Name: " | cut -c 7- | tr -d "\n\r"`
   name="${name//'"'/\\\"}"

   vers=`echo "$debInfo" | grep "Version: " | cut -c 10- | tr -d "\n\r"`
   vers="${vers//'"'/\\\"}"

   author=`echo "$debInfo" | grep "Author: " | cut -c 9- | tr -d "\n\r"`
   author="${author//'"'/\\\"}"

   depends=`echo "$debInfo" | grep "Depends: " | cut -c 10- | tr -d "\n\r"`
   depends="${depends//'"'/\\\"}"

   description=`echo "$debInfo" | grep "Description: " | cut -c 14- | tr -d "\n\r"`
   description="${description//'"'/\\\"}"

   arch=`echo "$debInfo" | grep "Architecture: " | cut -c 15- | tr -d "\n\r"`
   arch="${arch//'"'/\\\"}"

   size=$(du -b $i | cut -f1)
   time=$(date +%s -r $i)
    
   echo '{"Name": "'$name'", "Version": "'$vers'", "Section": "'$section'", "Package": "'$pkg'", "Author": "'$author'", "Depends": "'$depends'", "Descript": "'$description'", "Arch": "'$arch'", "Size": "'$size'", "Time": "'$time'000"},' >> all.pkgs
#Xây dựng xong json==============
  leng=${#pkg}
  leng=`expr $leng + 1`
  exists=`echo "$compatity" | grep "$pkg" | cut -c "$leng"- | tr -d "\n\r"`
  if [[ -z $exists ]]; then
     echo "$pkg support for iOS..."
     read tmp
     echo "$pkg $tmp" >> compatity.txt;
  fi
  rm -rf ./DEB/tmp
done

echo "{}]" >> all.pkgs

echo "------------------"
echo "Đang tạo Packages...."
apt-ftparchive packages ./DEB > ./Packages;
#sed -i -e '/^SHA/d' ./Packages;
bzip2 -c9k ./Packages > ./Packages.bz2;
echo "------------------"
echo "Đang tạo Release...."
printf "Origin: TQM - Mos ™︵⁹² \nLabel: TQM - Mos ™︵⁹² \nSuite: stable\nVersion: 1.0\nCodename: ios\nArchitecture: iphoneos-arm\nComponents: main\nDescription: Kho Lưu Trữu Tinh Chỉnh Tốt Nhất 🤩\nMD5Sum:\n "$(cat ./Packages | md5sum | cut -d ' ' -f 1)" "$(stat ./Packages --printf="%s")" Packages\n "$(cat ./Packages.bz2 | md5sum | cut -d ' ' -f 1)" "$(stat ./Packages.bz2 --printf="%s")" Packages.bz2\n" >Release;

echo "------------------"
echo "Xong !"
echo "Mod by Trần Quang Minh !"
exit 0;

