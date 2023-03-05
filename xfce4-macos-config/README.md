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

Kerakli dasturlarni o'rnatib olamiz

```bash
sudo pacman -S gtk-engine-murrine sassc
sudo pacman -S git
```

Xfce4ni sozlab olamiz.

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



## Theme, iconlar, walpaperlar va cursorlarni o'rnatish

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

cd WhiteSur-icon-theme

./install.sh
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
```

## Asosiy mavzu, ikonlar va fontlarni o'rnatish

Hozirda bizda asosiy konfigratsiyalar bor va o'rnatilgan. Endilikda biz ushbu konfigratsiyalarni DE da joriy qilishimiz kerak.

Sozlamalar bo'limidan Appearance bo'limiga kiramiz.


![alt text](https://github.com/ismoilovdevml/de-config/blob/master/assets/xce4-appearance.png)

Appearancedan Style bo'limga kirib quyidagicha sozlaymiz.

![alt text](https://github.com/ismoilovdevml/de-config/blob/master/assets/xfce4-style.png)

Ikonkalar va fontlarni o'rnatamiz o'rnatamiz.

![alt text](https://github.com/ismoilovdevml/de-config/blob/master/assets/xfce4-icons.png)
![alt text](https://github.com/ismoilovdevml/de-config/blob/master/assets/xfce4-fonts.png)

Tabriklayman sizda asosiy sozlamalar tugadi :)

Davom etamiz

Bizga Vala-Appmenu dasturi kerak bo'ladi. Bu dastur uchun alohida o'rnatuvchi dasturni yozib yozilgan siz shu dasturni o'rnatsangiz avtomatik o'rnatiladi. Buning uchun `de-config/xfce4-macos-config` jilidga kirib `global-menu.sh` dasturini ishga tushirishingiz kerak.

```bash
sh global-menu.sh
```
DAstur sizdan foydalanuvchi paroli va rozilingizni so'raydi siz bularga ruxsat berasiz. Dastur avtomatik o'rnatishi biroz vaqt olishi mumkin