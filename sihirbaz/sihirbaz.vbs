Set WshShell = WScript.CreateObject("WScript.Shell")

title = "HalkVPN Uzak Sunucu Kurulum Sihirbazi"

' Second argument (1): vbOKCancel Displays OK and Cancel buttons.
r = MsgBox(title + Chr(10) + Chr(10) + "Devam etmek icin OK'a tiklayin." + Chr(10) + Chr(10) + "Bora M. Alper <bora@boramalper.org>" + Chr(10) + "https://github.com/boramalper/halkvpn", 1, title)
' If not OK, quit.'
If r <> 1 Then
	WScript.Quit 0
End If

address  = InputBox("Sunucu Adresi (ornek: 127.0.0.1)", title)
username = InputBox("Sunucu Kullanici Adi", title, "root")
password = InputBox("Sunucu Sifresi", title)


' WScript.Shell.Run komutunun argümanları:
'     1. Komut
'     2. Pencere (sakla, tam ekran, ...) [1: göster]
'     3. Komutun bitmesini bekle
' Kaynak: https://ss64.com/vb/run.html
Set oShell = CreateObject ("WScript.Shell")
oShell.run "powershell.exe -Command CHCP 65001; echo n | .\plink -ssh " + address + " -l " + username + " -pw \""" + password  + "\"" \""curl https://raw.githubusercontent.com/boramalper/halkvpn/master/yukle.sh | bash\"" ", 1, TRUE

MsgBox "Uzak sunucu kurulumu tamamlandi!" + Chr(10) + Chr(10) + "Istemci dosyasini (halkvpn-client.ovpn) masaustunuze indirmek icin OK'a tiklayin.", 0, title

' Two double quotes to escape a double quote in string literals.
oShell.run "powershell.exe -Command CHCP 65001; echo n | .\pscp.exe -pw \""" + password + "\"" " + username + "@" + address + ":/root/halkvpn-client.ovpn %HOMEPATH%\Desktop\" , 1, TRUE

MsgBox "Her sey hazir!" + Chr(10) + Chr(10) + "halkvpn-client.ovpn dosyasini kullanarak kendi VPN sunucunuza baglanabilirsiniz.", 0, title

' Dosyayı explorer.exe ile göster.
oShell.run "explorer.exe /select,""%HOMEPATH%\Desktop\halkvpn-client.ovpn"" "
