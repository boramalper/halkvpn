# HalkVPN
*10 dakikada kendi VPN sunucunuzu kurun.*

## Neden HalkVPN ile kendi VPN sunucumu kurayım?
1. Çünkü **sansürlenemez**.

   VPN sağlayıcıları her geçen gün engelleniyor ve bunu aşmanın tek yolu kendi
   VPN sunucunuzu kurmak. Sansürün çalışma prensibi VPN hizmeti sağladığı
   bilinen IP adreslerini engellemekten geçer, ancak sizin kendi sunucunuz pek
   tabii bundan etkilenmez.
2. Çünkü **ucuz**.

   VPN sağlayıcıları sizden *kullanıcı başına* aylık 10$ isterken, kendi VPN
   sunucunuzu kurmak ayda 5$ tutar, ve daha da önemlisi *arkadaşlarınızla
   ortaklaşa kullanabilirsiniz* (bu da örneğin 5 kişi için ayda adam başı 6 lira
   eder!)
3. Çünkü **rahattır**.

   VPN sağlayıcılarından birini kullanmak için VPN engellemelerine takılmamak
   taklalar atmanızı gerektirirken, kendi VPN sunucunuzu kullanmak katbekat
   daha rahattır.

## Kurulum
1. Bir sunucu kiralayın. Özel bir tercihiniz yoksa
   [Vultr](https://www.vultr.com/?ref=8038248) iyi bir seçimdir.
   - Kayıt olduktan sonra sunucunuzu seçerken işletim sistemi olarak 
     **64-bit Ubuntu 18.04**'ü seçin.
2. Uzaktan Kurulum Sihirbazını [indirin](https://github.com/boramalper/halkvpn/releases/download/v0.1.0/sihirbaz.zip) (Windows PC gerektirir).
   - zip dosyasını çıkartın.
3. `sihirbaz.vbs` dosyasına çift tıklayıp çalıştırın, sihirbazın yönergelerini
   takip edin.
4. Sihirbaz tamamlandığında masaüstünüzde `halkvpn-client.ovpn` dosyası hazır
   olacaktır.


### İstemciler
`halkvpn-client.ovpn` dosyasını kullanarak VPN sunucunuzu kullanabilirsiniz.
Bunun için aşağıdaki istemcilerden birini yüklemeniz gerekir (daha sonra
yüklediğiniz istemcide `halkvpn-client.ovpn` dosyasını açmanız gerekir.)

- **Windows**

  https://swupdate.openvpn.org/community/releases/openvpn-install-2.4.7-I603.exe

- **iOS**

  https://itunes.apple.com/us/app/openvpn-connect/id590379981

- **Android**

  https://play.google.com/store/apps/details?id=net.openvpn.openvpn

## Hakkında
Geliştiren: Mert Bora ALPER <bora@boramalper.org>.

Bodrum'dan sevgilerle.

