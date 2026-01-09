# GitHub Repository Create & Push - Complete Guide

## 🎯 Step-by-Step Instructions

### Option 1: GitHub Web Interface (Recommended)

1. **Go to**: https://github.com/new
2. **Owner**: `chavhanrutamsoft` (should be selected)
3. **Repository name**: `chatbot_lite`
4. **Description**: "Lightweight RAG Chatbot optimized for 512 MB memory"
5. **Visibility**: 
   - ✅ Public (anyone can see)
   - ✅ Private (only you can see)
6. **⚠️ IMPORTANT - DO NOT CHECK:**
   - ❌ Add a README file
   - ❌ Add .gitignore
   - ❌ Choose a license
7. **Click**: "Create repository"

### Option 2: GitHub CLI (if installed)

```bash
gh repo create chatbot_lite --public --description "Lightweight RAG Chatbot optimized for 512 MB memory"
```

## After Repository Creation

Once repository is created, run:

```bash
cd Lite_version
git push -u origin main
```

## ✅ Verification

After push, check:
- https://github.com/chavhanrutamsoft/chatbot_lite
- All files should be visible
- README.md should display

## 🚀 Next: Deploy on Render

After GitHub push:
1. Go to Render Dashboard
2. New → Web Service
3. Connect `chatbot_lite` repository
4. Root Directory: `.` (root)
5. Build: `pip install -r requirements_lite.txt`
6. Start: `gunicorn --bind 0.0.0.0:$PORT --timeout 120 --workers 1 --threads 1 --chdir backend app_lite:app --preload`
