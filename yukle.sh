#!/usr/bin/env bash

# İlk hatada dur.
set -e

# Yüklenmemişse Docker'ı yükle.
command -v docker >/dev/null 2>&1 || {
        apt-get update
        apt-get install -y apt-transport-https ca-certificates curl gnupg-agent software-properties-common

        curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
        sudo add-apt-repository -y "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
        apt-get update

        sudo apt-get install -y docker-ce docker-ce-cli containerd.io

        docker run hello-world
}

OVPN_DATA="ovpn-data-halkvpn"
MY_IP=`dig -4 @resolver1.opendns.com ANY myip.opendns.com +short`
MY_CLIENT="halkvpn-client"

echo "Sunucunuzun IP adresi: $MY_IP"
echo "Client: $MY_CLIENT"

# Kur
echo "==== Volume yaratılıyor"
docker volume create --name $OVPN_DATA
echo "==== genconfig"
docker run -v $OVPN_DATA:/etc/openvpn --log-driver=none --rm kylemanna/openvpn ovpn_genconfig -u "udp://$MY_IP"
echo "==== initpki"
docker run -v $OVPN_DATA:/etc/openvpn --log-driver=none --rm kylemanna/openvpn bash -c "echo \"HalkVPN CA\" | ovpn_initpki nopass"

# Çoklu bağlantılara izin ver.
echo "==== duplicate-cn"
docker run -v $OVPN_DATA:/etc/openvpn --log-driver=none --rm kylemanna/openvpn bash -c "printf \"\n# HalkVPN CA\nduplicate-cn\n\" >> /etc/openvpn/openvpn.conf"

# Profil oluştur.
echo "==== Profil Oluşturuluyor"
docker run -v $OVPN_DATA:/etc/openvpn --log-driver=none --rm kylemanna/openvpn easyrsa build-client-full $MY_CLIENT nopass

# Profili indir.
echo "==== Profil dışa aktarılıyor"
docker run -v $OVPN_DATA:/etc/openvpn --log-driver=none --rm kylemanna/openvpn ovpn_getclient $MY_CLIENT > $MY_CLIENT.ovpn

# systemd
echo "==== systemd curl"
curl -L https://raw.githubusercontent.com/kylemanna/docker-openvpn/master/init/docker-openvpn%40.service | sudo tee /etc/systemd/system/docker-openvpn@.service
echo "==== systemd enable"
systemctl enable --now docker-openvpn@halkvpn.service
echo "==== systemd status"
systemctl --no-pager status docker-openvpn@halkvpn.service
