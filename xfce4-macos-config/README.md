# XFCE4 MacOS Theme

![alt text](https://images.pling.com/img/00/00/32/24/44/1403328/7c76036e5f9dad4aaeb775c16ff6c914ba9de055eea89c245248a9460bf0f2ea78af.png)

## Icons

![alt text](https://github.com/vinceliuice/WhiteSur-icon-theme/raw/master/preview.png)

## Cursors

![alt tetx](https://github.com/vinceliuice/WhiteSur-cursors/raw/master/preview.png)



## XFCE4 ko'rinishini MacOS dizayniga keltirish

#### Talablar:

* Arch Linux Manjaro
* xfce4 (lightdm)
* yay va paru

## Ishni boshlash

Xfce4ni sozlab olamiz.

Konfigratsiya faylari va kodlarini githubdan yuklab olamiz.

```bash
git clone https://github.com/ismoilovdevml/de-config.git
```

## O'rnatuvchi
Terminalda ko'p ishlashga to'gri kelganligi, bu ancha vaqt olishi va yangi foydalanuvchilar uchun qiyinligi (chalkashib qolishi mumkin) uchun buni qisqartirish va soddalashtirish maqsadida installer.sh dasturini yozib chiqdim. Bu dasturni ishga tuhsursangiz o'zi atomatik ravishda hamma konfigratsiyalarni o'rnatadi va sozlaydi. Bu juda yaxshi.

O'rnatuvchuni ishga tushirish uchun Githubdan yuklab olgan de-config konfigratsiyalar jildiga kirib installer.sh ni terminal orqali ishga tushirishimiz kerak.

```bash
sh installer.sh
```

Bu dastur o'rnatish va sozlashi uchun biroz ko'proq vaqt olishi mumkin. Bu sizning internet tezligigingizga va kompyuteringiz kuchiga bo'gliq.

O'rnatuvchi dasturi hammasini avtomatik o'rnatib sozlab bo'lgandean keyin keyin qadamlarga o'tsak bo'ladi.

Sozlamalardan `Desktop` bo'limini tanlaymiz va quyidagi rasm bilan bir xil qilib sozlab olamiz

![alt text](https://github.com/ismoilovdevml/de-config/blob/master/assets/xfce4-desktop1.png)


Sozlamalardan `Window Manager Tweak` bo'limga kirib uni xam rasmdagidek qilib sozlab olamiz

![alt text](https://github.com/ismoilovdevml/de-config/blob/master/assets/xfce4-wmt-2.png)


![alt text](https://github.com/ismoilovdevml/de-config/blob/master/assets/xfce4-wmt-3.png)

Fon rasmlarini o'natish uchun githubdan yuklab olgan de-config jildiga kirib walpapers jildini Pictures jildiga ko'chirasiz

```bash
cd de-config/xfce4-macos-config

mv walpapers/ ~/Pictures/
```

Sozlamalardan desktop bo'limiga o'tib Folderga bosib Otherni bosib Pictures jildi ichidagi walpapers jildini ko'rsatib ulaymiz

![alt text](https://github.com/ismoilovdevml/de-config/blob/master/assets/xfce4-walpapers.png)


Jildlarni tartiblab yon panelga chiqarish uchun `Send to` ni bosib `Side pane` bosish orqali jildlarni side panelga chiqarib olamiz. Batafsil rasmda.

![alt text](https://github.com/ismoilovdevml/de-config/blob/master/assets/xfce4-directory.png)


Hozirda siz ishlatib turgan file dasturi yashiran jildlar va fayllarni ko'rsatamydi buning uchun rasmdagidek qilishimiz kerak yani `View` bo'limini bosib `Show Hidden Files` ni yoqib qo'yamiz

![alt text](https://github.com/ismoilovdevml/de-config/blob/master/assets/xfce4-hiden-file.png)



<!-- ## Theme, iconlar, walpaperlar va cursorlarni o'rnatish

Barcha konfiguratsiya fayllarni saqlash uchun `Templates` nomli jild ochib olamiz

```bash
mkdir Templates
cd Templates
```

Kerakli konfigratsiya kodlari va fayllarini yuklab olamiz

```bash
git clone https://github.com/ismoilovdevml/de-config.git
```
### Theme o'rnatish

Biz `WhiteSur-gtk-theme` ishlatamiz uni githubdan klon qilib olamiz va o'rnatamiz.

```bash
cd Templates

git clone https://github.com/vinceliuice/WhiteSur-gtk-theme.git

cd WhiteSur-gtk-theme

./install.sh
```

### Iconlarni o'rnatish
Biz `WhiteSur-icon-theme` dan foydalanmiz. Kodlari githubdan klon qilib olamiz va o'rnatamiz.

```bash
git clone https://github.com/vinceliuice/WhiteSur-icon-theme.git

cd WhiteSur-icon-theme -->

<!-- ./install.sh
```

### Cursor o'rnatish

Biz `Whitesur cursors` dan foydalanamiz. Githubdan o'zimizga klon qilib olamiz va o'rnatamiz.

```bash
git clone https://github.com/vinceliuice/WhiteSur-cursors

./install.sh
```

### Fontlarni o'rnatish

Githubdan yuklab olgan `de-config/xfce4-macos-config` jildiga kiramiz va `.fonts` jildidan nusxa olib `./home` jildiga joylashtiramiz.

```bash
mv .fonts/ ~/
``` -->

## Asosiy mavzu, ikonlar va fontlarni o'rnatish

Hozirda bizda asosiy konfigratsiyalar bor va o'rnatilgan. Endilikda biz ushbu konfigratsiyalarni DE da joriy qilishimiz kerak.

Sozlamalar bo'limidan Appearance bo'limiga kiramiz.


![alt text](https://github.com/ismoilovdevml/de-config/blob/master/assets/xce4-appearance.jpg)

Appearancedan Style bo'limga kirib quyidagicha sozlaymiz.

![alt text](https://github.com/ismoilovdevml/de-config/blob/master/assets/xfce4-style.png)
![alt text](https://github.com/ismoilovdevml/de-config/blob/master/assets/xfce4-icons.png)
![alt text](https://github.com/ismoilovdevml/de-config/blob/master/assets/xfce4-fonts.png)

Tabriklayman sizda asosiy sozlamalar tugadi :)

Davom etamiz

Bizga Vala-Appmenu dasturi kerak bo'ladi. Bu dastur uchun alohida o'rnatuvchi dasturni yozib yozilgan siz shu dasturni o'rnatsangiz avtomatik o'rnatiladi. Buning uchun `de-config/xfce4-macos-config` jilidga kirib `global-menu.sh` dasturini ishga tushirishingiz kerak.

```bash
sh global-menu.sh
```
Dastur sizdan foydalanuvchi paroli va rozilingizni so'raydi siz bularga ruxsat berasiz. Dastur avtomatik o'rnatishi biroz vaqt olishi mumkin

## XFCE PANEL sozlash

Sichqonchani XFCE PAnel ustiga olib borib o'ng tugmacasini bosib rasmdagi bo'limga kiramiz.
![alt text](https://github.com/ismoilovdevml/de-config/blob/master/assets/xfce4-panel.png)

Shu bo'limdan items bo'limiga o'tib quyidagicha sozlab olishimiz kerak. Rasmda ko'rsatilgan itemlar ketma ketlikda bo'lishi kerak. Agar sizda rasmdaigek itemlar bo'lmasa qo'shib oling ortiqchalarini esa o'chirib tashlang

![alt text](https://github.com/ismoilovdevml/de-config/blob/master/assets/xfce4-items.png)

Yangi itemlar qo'shish uchun rasmdagidek amallar bajariladi. Qizil chiziq bilan chizilgan joylarga e'tibor bering.

![alt text](https://github.com/ismoilovdevml/de-config/blob/master/assets/xfce4-panel-add-items.png)

Application menu-ni Macosdek sozlashimiz uchun itemsdan Aplication menu sutiga bosib rasmdagi amallar bajariladi.

![alt text](https://github.com/ismoilovdevml/de-config/blob/master/assets/xfce4-items-conf.png)

Sozlamalar Rasmdagidek bo'lishi kerak. Endi biz ikonkani apple ikonkasiga almashtiramiz. Ikonkani almashtirish rasmdagidek bo'ladi va qidiruv joyiga star-here deb qidiramiz va star-here ikonkasini o'rnatamiz. Rasmdagi qizil chiziqlarga e'tibor bering.

![alt text](https://github.com/ismoilovdevml/de-config/blob/master/assets/xfce4-items-icon.png)

Ikonkani o'rnatganimizdan keyin unga konfigratsiya kodini o'rnatishimiz kerak. Rasmga e'tibor bering.

![alt text](https://github.com/ismoilovdevml/de-config/blob/master/assets/xfce4-items-code.png)

Sizda yashirin fayllar ko'rinmasligi mumkin shuning uchun sichqonchani o'ng tugmachasini bosib Show hidden file ni yoqib qo'yasiz va ./config/menu jildidan xpple.menu konfigratsiyani kodini tanlab o'rnatasiz.

## Plank Dock o'rnatish
 Rasmda Plank Dock tasvirlagan.

![alt text](https://github.com/ismoilovdevml/de-config/blob/master/assets/xfce4-plank-intro.png)


Plank Dockni quyidagi buyruq orqali o'rnatib olamiz.

```bash
sudo pacman -S plank
```
Plank o'rnatildi endi biz Panel2 ni o'chirib tashlashhimiz kerak. Batafsil rasmda qizil chiziqlarga etibor bering.

![alt text](https://github.com/ismoilovdevml/de-config/blob/master/assets/xfce4-pane2.png)


![alt text](https://github.com/ismoilovdevml/de-config/blob/master/assets/xfce4-panel2-remove.png)

Panel o'chiriganidan keyin Plank dasturini ishga tushirishimiz kerak. Plank ishga tushirilganidan keyin uni konfigratsiya fayllarini o'rnatishimiz kerak buning uchun terminalni ochib de-config/cfe4-macos-config jildiga kiramiz va quyidagi buyruqni yozamiz

```bash
cd plank

mv theme-Dark/ theme-Light/ ~/.local/share/plank/themes/

plank --preferences
```
Plankni Rasmdagidek qilib sozlab olamiz

![alt text](https://github.com/ismoilovdevml/de-config/blob/master/assets/xfce4-plank-conf.png)

MacOSdagidek application enu qo'yish uchun ./local/share/applications jildiga kirib Launchpad.desktop faylini sichoqncha bilan bosib turib Plank dockga olib kelamiz va qo'yamiz.

Kompytermiz o'chib yonganida Plank dock avtomatik ishlashi uchun Settingsdan Session and Startup bo'limga kirib `+ Add` tugmasi plankni qo'shamiz. Batafsil rasmda.

![alt text](https://github.com/ismoilovdevml/de-config/blob/master/assets/xfce4-autostart.png)

## Ulauncher o'rnatish va Sozlash

Rasmda Uluancher :)

![alt text](https://github.com/ismoilovdevml/de-config/blob/master/assets/xfce4-uluncher-intro.png)


Uluncherni o'rnatib olamiz

```bash
pamac build ulauncher
```

Uluncher o'rnatilganidan keyin uluncherni dasturini ishga tushiramiz. ctrl+space

Uluncher ishga tushirilganidan keyin uni konfigratsiya fayllarini o'rnatishimiz kerak buning uchun terminalni ochib de-config/cfe4-macos-config jildiga kiramiz va quyidagi buyruqni yozamiz.

```bash
cd uluncher-theme

mv user-themes/ ~/.config/ulauncher/

```

Uluncherni ctrl+space orqali chaqirib olamiz va rasmdagidek sozlaymiz.

![alt text](https://github.com/ismoilovdevml/de-config/blob/master/assets/xfce4-uluncher-conf.png)

## Xfce4 Termnialini Sozlash

Terminalga kirib quyidagi buyruqni yozing va sizda terminala sozlamalar bo'limi ochiladi. Siz Rasmdagidek qilib sozlab olishingiz mumkin.

![alt text](https://github.com/ismoilovdevml/de-config/blob/master/assets/xfce4-terminal.png)
![alt text](https://github.com/ismoilovdevml/de-config/blob/master/assets/xfce4-terminal-color.png)


Nihoyat siz bu ishni muvafaqqiyatli tugatdingiz. Tabriklayman.

Sizdagi xfce4 xam shunday ko'rinishga keldi deb o'ylayman :)

![alt text](https://github.com/ismoilovdevml/de-config/blob/master/assets/xfce4-showcase.png)


