#!/bin/bash
# Push to GitHub Script

echo "📤 Pushing to GitHub..."
echo ""
echo "⚠️ اول repository رو در GitHub بساز:"
echo "   https://github.com/new"
echo ""
echo "بعد USERNAME خودت رو اینجا بنویس و اجرا کن:"
echo ""

read -p "GitHub Username: " USERNAME

if [ -z "$USERNAME" ]; then
    echo "❌ Username خالی است!"
    exit 1
fi

echo ""
echo "📤 Pushing to GitHub..."

git remote add origin "https://github.com/$USERNAME/hermes-railway.git"
git push -u origin main

echo ""
echo "✅ Push موفق!"
echo "🔗 Repository: https://github.com/$USERNAME/hermes-railway"
echo ""
echo "🚀 حالا می‌تونی در Railway deploy کنی!"
