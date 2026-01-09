# GitHub Setup for chatbot_lite Repository

## Step 1: Create GitHub Repository

1. Go to: https://github.com/new
2. Repository name: `chatbot_lite`
3. Description: "Lightweight RAG Chatbot optimized for 512 MB memory (Render Free Tier)"
4. Visibility: Choose Public or Private
5. **DO NOT** initialize with README, .gitignore, or license (we already have these)
6. Click "Create repository"

## Step 2: Push to GitHub

After creating the repository, run these commands:

```bash
cd Lite_version
git remote add origin https://github.com/chavhanrutamsoft/chatbot_lite.git
git branch -M main
git push -u origin main
```

## Files Included

✅ All Lite_version files:
- `backend/app_lite.py`
- `backend/query_bot_lite.py`
- `frontend/` (all files)
- `requirements_lite.txt`
- `render_lite.yaml`
- `README.md`
- `.gitignore`
- Documentation files

## After Push

Your repository will be available at:
**https://github.com/chavhanrutamsoft/chatbot_lite**
