# Deploy Hermes Agent به Railway با همه Skills و Memories 🚀

این پروژه شامل:
- ✅ همه 77 skills از نسخه local
- ✅ همه memories (MEMORY.md + USER.md)  
- ✅ config.yaml
- ✅ اتصال به 9router که deploy کردی

---

## 📋 قبل از Deploy

### 1️⃣ ساخت GitHub Repository

```bash
cd /c/Users/Shayan/hermes-railway-backup
git init
git add .
git commit -m "Initial Hermes Railway setup with skills backup"
```

بعد repository رو در GitHub بساز و push کن:
```bash
git remote add origin https://github.com/YOUR_USERNAME/hermes-railway.git
git branch -M main
git push -u origin main
```

---

## 🚀 Deploy به Railway

### مرحله 1: ساخت پروژه جدید

1. برو به: https://railway.app
2. **New Project** → **Deploy from GitHub repo**
3. Repository که ساختی رو انتخاب کن
4. Railway خودش Dockerfile رو تشخیص می‌کنه ✅

### مرحله 2: Environment Variables

در تب **Variables** این‌ها رو اضافه کن:

```bash
HERMES_HOME=/app/data
HERMES_GATEWAY=true
PORT=8080

# اتصال به 9router
ANTHROPIC_BASE_URL=https://9router-production-d443.up.railway.app/v1
ANTHROPIC_API_KEY=your-9router-api-key

# اختیاری - برای Telegram
TELEGRAM_BOT_TOKEN=your_bot_token_here
```

**نکته مهم:** API Key رو از dashboard 9router بگیر:
- https://9router-production-d443.up.railway.app/dashboard
- Settings → API Keys

### مرحله 3: Volume اضافه کن

در تب **Volumes**:
1. **+ New Volume**
2. Mount Path: `/app/data`
3. Size: 2GB (چون skills داری)
4. **Add**

### مرحله 4: Public Domain

تب **Settings** → **Networking**:
1. **Generate Domain**
2. یک URL می‌گیری: `hermes-production-xxx.up.railway.app`

### مرحله 5: Deploy!

Railway شروع می‌کنه:
- Build: ~5-8 دقیقه (اولین بار کمی طول می‌کشه)
- وقتی status شد **Active** آماده است ✅

---

## 🎯 استفاده از Hermes Gateway

### گزینه A: Telegram Bot

1. **ساخت Bot:**
   - به @BotFather در Telegram پیام بده
   - `/newbot` بزن
   - یک token می‌گیری
   
2. **تنظیم در Railway:**
   - Variable اضافه کن: `TELEGRAM_BOT_TOKEN=your_token`
   - Restart deployment
   
3. **استفاده:**
   - به bot خودت پیام بده
   - Hermes جواب می‌ده!
   - همه skills و memories در دسترسه

### گزینه B: Discord Bot

1. **ساخت Bot:**
   - برو به: https://discord.com/developers/applications
   - New Application بساز
   - Bot section → Add Bot
   - Token رو کپی کن
   
2. **تنظیم در Railway:**
   - `DISCORD_BOT_TOKEN=your_token`
   
3. **Invite Bot:**
   - OAuth2 → Bot → انتخاب permissions
   - Link رو باز کن و به server اضافه کن

### گزینه C: HTTP API

می‌تونی مستقیماً با Hermes صحبت کنی:

```bash
curl -X POST https://hermes-production-xxx.up.railway.app/api/chat \
  -H "Content-Type: application/json" \
  -d '{"message": "سلام هرمس!"}'
```

---

## 📊 چک کردن Skills و Memories

بعد از deploy، می‌تونی چک کنی که همه چیز restore شده:

### از طریق Telegram:
```
/skills list
```

باید 77 skill ببینی ✅

### لاگ‌ها:
در تب **Deployments** → **View Logs**

باید این پیام‌ها رو ببینی:
```
📦 First run detected - restoring backups...
📚 Extracting skills...
✅ Skills restored
✅ MEMORY.md restored
✅ USER.md restored
```

---

## 🔧 تنظیمات پیشرفته

### اتصال به 9Router

Hermes خودکار به 9router وصل میشه چون:
- `ANTHROPIC_BASE_URL` به 9router اشاره داره
- همه request‌ها از 9router رد می‌شن
- Auto-fallback + token saving فعاله

### Resource Usage

Railway رایگان شامل:
- 500 ساعت/ماه
- $5 اعتبار رایگان

Hermes معمولاً مصرف می‌کنه:
- ~200-300MB RAM
- CPU minimal (فقط موقع استفاده)

---

## 🐛 عیب‌یابی

### مشکل: Build failed
چک کن:
- Dockerfile موجود هست؟
- skills-backup.tar.gz موجود هست؟
- همه فایل‌ها در Git commit شدن؟

### مشکل: Skills نیومدن
لاگ‌ها رو چک کن:
- آیا پیام "✅ Skills restored" هست؟
- Volume mount path درست هست؟ `/app/data`
- فایل `.initialized` ساخته شده؟

### مشکل: Gateway respond نمی‌کنه
چک کن:
- Port: 8080
- Environment variables درست تنظیم شده؟
- Public domain generate شده؟

### مشکل: 9Router connection error
چک کن:
- `ANTHROPIC_BASE_URL` درست هست؟
- `ANTHROPIC_API_KEY` از 9router dashboard گرفتی؟
- 9router هنوز active هست؟

---

## 🔄 Update کردن

### Update کردن Skills:

1. Local رو update کن
2. Backup جدید بگیر:
   ```bash
   cd /c/Users/Shayan/AppData/Local/hermes
   tar -czf skills-backup.tar.gz skills/
   ```
3. Replace کن در repository
4. Commit + Push
5. Railway خودش rebuild می‌کنه

### Update کردن Memories:

همین کار رو برای `MEMORY.md` و `USER.md` انجام بده.

---

## 📈 مقایسه Local vs Railway

| ویژگی | Local | Railway Gateway |
|-------|-------|-----------------|
| Skills | 77 ✅ | 77 ✅ |
| Memories | ✅ | ✅ |
| Desktop UI | ✅ | ❌ |
| Terminal | ✅ | محدود |
| Telegram | محدود | ✅ |
| Discord | محدود | ✅ |
| Always On | نیاز به PC | ✅ |
| از راه دور | نیاز ngrok | ✅ |

---

## 💡 نکات مهم

1. **Volume حتماً باید باشه** - وگرنه skills هر restart پاک می‌شن
2. **API Key از 9router بگیر** - نه مستقیماً از Anthropic
3. **Build اولین بار طولانی‌تر است** - حدود 8 دقیقه طبیعیه
4. **Skills یکبار restore می‌شن** - با `.initialized` flag

---

## 🎉 موفق باشی!

بعد از deploy:
- ✅ همه skills در cloud
- ✅ همه memories حفظ شده
- ✅ از Telegram/Discord دسترسی داری
- ✅ به 9router وصل
- ✅ از همه‌جا در دسترس

**سوال یا مشکل؟** لاگ‌های Railway رو چک کن! 📊
