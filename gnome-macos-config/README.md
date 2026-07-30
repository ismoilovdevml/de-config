# GNOME macOS Theme

GNOME ish stoli muhitini macOS ko'rinishiga keltirish uchun konfiguratsiya.

## Talablar

* Ubuntu yoki Debian asosidagi distributiv (`apt`)
* GNOME Shell

> **Eslatma:** bu jild Ubuntu/Debian uchun. Arch Linux yoki Manjaro ishlatsangiz, [`../xfce4-macos-config`](../xfce4-macos-config/) jildidan foydalaning.

## O'rnatish

Konfiguratsiyani o'rnatish uchun alohida skript yozilgan — u orqali avtomatik o'rnatishingiz mumkin. Xatolar chiqmasligi uchun avval tizimni yangilab olamiz:

```bash
sudo apt update
sudo apt upgrade
```

Konfiguratsiya fayllarini GitHubdan yuklab olamiz va `gnome-macos-config` jildiga kiramiz:

```bash
git clone https://github.com/ismoilovdevml/de-config.git
cd de-config/gnome-macos-config
```

O'rnatuvchini ishga tushiramiz:

```bash
bash installer.sh
```

> **Muhim:** skriptni `sh installer.sh` bilan ishga tushirmang — u bash sintaksisidan foydalanadi. `bash installer.sh` deb yozing.

Skript ishga tushganda sizdan foydalanuvchi parolini so'raydi. Paketlar `-y` bilan o'rnatilgani uchun qo'shimcha `[y/n]` tasdiqlash so'ralmaydi.

Skript quyidagilarni bajaradi:

* `git`, `gnome-tweaks`, `plank`, `gnome-shell-extension-manager` paketlarini o'rnatadi
* brauzer konnektorini o'rnatadi (`gnome-browser-connector`)
* Ulauncher'ni rasmiy PPA orqali o'rnatadi
* WhiteSur GTK mavzusi va ikonkalarini **upstream'dan** yuklab o'rnatadi
* Plank mavzularini va fon rasmlarini joylashtiradi

## O'rnatishdan keyin

1. GNOME Tweaks'ni ochib `Appearance` → `Shell` / `Legacy Applications` da WhiteSur mavzusini tanlang
2. Ikonkalar uchun `Tweaks` → `Appearance` → `Icons` → WhiteSur
3. Dash to Dock yoki Plank'ni sozlang
4. Extension Manager orqali kerakli GNOME kengaytmalarini o'rnating

## Manbalar

* [WhiteSur GTK theme](https://github.com/vinceliuice/WhiteSur-gtk-theme) — vinceliuice
* [WhiteSur icon theme](https://github.com/vinceliuice/WhiteSur-icon-theme) — vinceliuice
* [Plank](https://launchpad.net/plank)
* [Ulauncher](https://ulauncher.io/)
