# ✅ چک‌لیست Deploy Hermes به Railway

## 📦 فایل‌های آماده (Local)

- [x] Dockerfile
- [x] entrypoint.sh  
- [x] railway.toml
- [x] .dockerignore
- [x] .env.example
- [x] README.md
- [x] skills-backup.tar.gz (77 skills)
- [x] MEMORY.md
- [x] USER.md
- [x] config.yaml

---

## 🚀 مراحل Deploy (گام به گام)

### قدم 1: Push به GitHub

```bash
cd /c/Users/Shayan/hermes-railway-backup
git init
git add .
git commit -m "Hermes Railway with 77 skills backup"
```

بعد در GitHub:
1. برو به: https://github.com/new
2. نام: `hermes-railway` (یا هر نام دیگه)
3. **Public** یا **Private** انتخاب کن
4. **Create repository**

بعد push کن:
```bash
git remote add origin https://github.com/YOUR_USERNAME/hermes-railway.git
git branch -M main
git push -u origin main
```

### قدم 2: Deploy در Railway

1. **New Project** در Railway
2. **Deploy from GitHub repo**
3. انتخاب `hermes-railway`
4. Railway شروع به build می‌کنه

### قدم 3: Environment Variables

در تب **Variables** اضافه کن:

```
HERMES_HOME=/app/data
HERMES_GATEWAY=true
PORT=8080
ANTHROPIC_BASE_URL=https://9router-production-d443.up.railway.app/v1
ANTHROPIC_API_KEY=[از 9router dashboard بگیر]
```

**گرفتن API Key:**
- https://9router-production-d443.up.railway.app
- Login کن
- Settings → API Keys → Generate

### قدم 4: Volume

- **+ New Volume**
- Mount Path: `/app/data`
- Size: 2GB
- **Add**

### قدم 5: Public Domain

- Settings → Networking
- **Generate Domain**

### قدم 6: منتظر Deploy بمون

- Build: ~8 دقیقه
- Status: Building → Active ✅

---

## 🎯 بعد از Deploy

### تست کردن:

**چک کردن لاگ‌ها:**
```
✅ Skills restored
✅ MEMORY.md restored
✅ USER.md restored
✅ Initialization complete!
🌐 Starting Hermes Gateway...
```

### دسترسی:

**گزینه A: Telegram Bot**
- به @BotFather پیام بده: `/newbot`
- Token رو بگیر
- در Railway Variables اضافه کن: `TELEGRAM_BOT_TOKEN=...`
- Restart deployment
- به bot خودت پیام بده!

**گزینه B: HTTP API**
```bash
curl https://hermes-production-xxx.up.railway.app/health
```

---

## ⚠️ نکات مهم

1. **API Key 9router:** حتماً از dashboard بگیر
2. **Volume:** بدون volume همه چیز پاک می‌شه!
3. **Build طولانی:** اولین build 8 دقیقه طبیعیه
4. **Skills restore:** فقط اولین بار اتفاق می‌افته

---

## 💰 هزینه

Railway رایگان:
- 500 ساعت/ماه
- $5 اعتبار

Hermes مصرف:
- ~200MB RAM
- CPU minimal

**برای 2 سرویس (9router + Hermes):** تقریباً 300-400 ساعت/ماه = کافیه!

---

## 🆚 مقایسه

### Local (PC):
- ✅ همه features
- ✅ Desktop UI
- ✅ Terminal کامل
- ❌ نیاز به PC روشن

### Railway (Cloud):
- ✅ همیشه آنلاین
- ✅ از همه‌جا دسترسی
- ✅ همه skills/memories
- ❌ فقط Telegram/Discord/API

---

**آماده‌ای شروع کنیم؟** 🚀
