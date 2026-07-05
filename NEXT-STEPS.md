# 🎯 مراحل باقی‌مانده Deploy

## ✅ آماده شده تا الان:

- [x] Backup از 77 skills گرفته شد
- [x] MEMORY.md و USER.md کپی شد  
- [x] Dockerfile و entrypoint.sh ساخته شد
- [x] Git repository آماده شد
- [x] Commit زده شد

## 🚀 مراحل باقی‌مانده (10 دقیقه):

### 1. ساخت GitHub Repository (2 دقیقه)

**روش ساده:**
1. باز کن: https://github.com/new
2. نام بذار: `hermes-railway`
3. Public یا Private انتخاب کن
4. **بدون** README/gitignore (داریم)
5. **Create repository**

### 2. Push به GitHub (1 دقیقه)

**بعد از ساخت repository:**

```bash
cd /c/Users/Shayan/hermes-railway-backup

# جایگزین کن YOUR_USERNAME رو با username خودت
git remote add origin https://github.com/YOUR_USERNAME/hermes-railway.git
git push -u origin main
```

**مثال:**
```bash
git remote add origin https://github.com/shayan/hermes-railway.git
git push -u origin main
```

### 3. Deploy در Railway (5 دقیقه)

**A. ساخت پروژه:**
1. برو: https://railway.app
2. **New Project**
3. **Deploy from GitHub repo**
4. انتخاب کن: `hermes-railway`

**B. Variables (مهم!):**

در تب **Variables** این‌ها رو اضافه کن:

```bash
HERMES_HOME=/app/data
HERMES_GATEWAY=true
PORT=8080
ANTHROPIC_BASE_URL=https://9router-production-d443.up.railway.app/v1
ANTHROPIC_API_KEY=sk-xxxxxxx
```

**⚠️ API Key چطور بگیریم:**
1. برو: https://9router-production-d443.up.railway.app
2. Login کن با رمزی که تنظیم کردی
3. Settings → API Keys → **Generate New Key**
4. کپی کن و در Railway بذار

**C. Volume:**
1. تب **Volumes** → **+ New Volume**
2. Mount Path: `/app/data`
3. Size: `2` GB
4. **Add**

**D. Public Domain:**
1. تب **Settings** → **Networking**
2. **Generate Domain**
3. یک URL می‌گیری

**E. Deploy!**
- Railway خودش شروع می‌کنه
- Build: ~8 دقیقه
- Status: Building → Active ✅

---

## 🎯 بعد از Deploy موفق:

### تست کردن:

**1. چک کردن لاگ‌ها:**
تب **Deployments** → **View Logs**

باید ببینی:
```
✅ Skills restored
✅ MEMORY.md restored
✅ USER.md restored
🌐 Starting Hermes Gateway...
```

**2. ساخت Telegram Bot (اختیاری):**

اگر می‌خوای از Telegram استفاده کنی:

1. به @BotFather پیام بده
2. بزن: `/newbot`
3. نام انتخاب کن
4. Token می‌گیری
5. در Railway Variables اضافه کن:
   ```
   TELEGRAM_BOT_TOKEN=123456:ABC-DEF...
   ```
6. Restart deployment
7. به bot خودت پیام بده!

---

## 📊 خلاصه کامل:

```
Local Hermes (PC)          Cloud Hermes (Railway)
     ↓                              ↓
  77 Skills  ────backup───→    77 Skills
  Memories   ────backup───→    Memories
     ↓                              ↓
 9Router (Railway) ←───────────────┘
     ↓
 AI Providers
```

---

## ❓ سوالات متداول:

**Q: Skills همه میان؟**
A: بله! همه 77 تا restore می‌شن. در لاگ چک کن.

**Q: Local و Railway sync می‌شن؟**
A: نه، مجزا هستن. باید دستی sync کنی.

**Q: چطور update کنم؟**
A: Backup جدید بگیر، در Git push کن، Railway rebuild می‌کنه.

**Q: هزینه چقدره؟**
A: رایگان! 500 ساعت/ماه کافیه.

---

**آماده‌ای؟ اول GitHub repository بساز، بعد بهم بگو تا ادامه بدیم!** 🚀
