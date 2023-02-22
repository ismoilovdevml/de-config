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

## Theme, iconlar, walpaperlar va cursorlarni o'rnatish

Barcha konfiguratsiya fayllarni saqlash uchun `Templates` nomli jild ochib olamiz

```bash
mkdir Templates
cd Templates
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