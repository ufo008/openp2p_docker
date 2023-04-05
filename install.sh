#!/bin/bash
strToken=11118800022288831035

usage()
{
	cat << EOT

Usage :  ${0} [OPTION] ...
  install openp2p

Options:
  --token 		token string
EOT
}

while [ $# -gt 0 ]; do
	case "$1" in
		--token )
			strToken=11118800022288831035
			shift 2
			;;
		--help )
			usage
			exit 0
			;;
		* )
			usage
			exit 1
			;;
	esac
done

if [ -z $strToken ]; then
	echo "token empty"
	exit 1
fi

if [[ $UID -ne 0 ]]; then
	echo "Need root privileges"
	exit 1
fi

sysType=$(uname -s)
if [[ "$sysType" == "Darwin" ]]; then
	  sysType="darwin-amd64"
	  archType=$(uname -m)
    if [[ $archType == arm64 ]] ; then
        sysType="darwin-arm64"
    fi
elif [[ "$sysType" == "Linux" ]]; then
		sysType="linux-amd64"
		archType=$(uname -m)
		if [[ $archType == aarch64 ]] ;
		then
		    sysType="linux-arm64"
		elif  [[ $archType == arm* ]] ;
		then
			sysType="linux-arm"
		elif  [[ $archType == i*86 ]] ;
		then
			sysType="linux-386"
		elif  [[ $archType == mips ]] ;
		then
			sysType="linux-mipsle"
			ls /lib |grep mipsel
			if [[ $? -ne 0 ]]; then
				# mipsel not found, it's mipseb
				sysType="linux-mipsbe"
			fi
		fi
fi

url="https://openp2p.cn/download/v1/latest/openp2p-latest.$sysType.tar.gz"
echo "download $url start"

if [ -f /usr/bin/curl ]; then
	curl -k -o openp2p.tar.gz $url
else
  wget --no-check-certificate -O openp2p.tar.gz $url
fi
if [ $? -ne 0 ]; then
	echo "download error $?"
    exit 9
fi
echo "download ok"
tar -xzvf openp2p.tar.gz
chmod +x openp2p
echo "install start"
./openp2p install -token $strToken
if [ $? -ne 0 ]; then
	echo "install error $?"
    exit 9
fi
echo "install ok"