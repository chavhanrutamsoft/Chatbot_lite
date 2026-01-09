# 🔴 Render Deployment Error Fix

## Error:
```
ModuleNotFoundError: No module named 'app'
```

## Problem:
Start Command में `app:app` use हो रहा है, लेकिन file name `app_lite.py` है।

## ✅ Solution:

Render Dashboard में **Start Command** को यह update करें:

```bash
gunicorn --bind 0.0.0.0:$PORT --timeout 120 --workers 1 --threads 1 --chdir backend app_lite:app --preload
```

**Important Changes:**
- ❌ OLD: `app:app` 
- ✅ NEW: `app_lite:app` (file name सही है)

## 📋 Complete Render Settings:

### Build Command:
```bash
pip install -r requirements_lite.txt
```

### Start Command:
```bash
gunicorn --bind 0.0.0.0:$PORT --timeout 120 --workers 1 --threads 1 --chdir backend app_lite:app --preload
```

### Root Directory:
`.` (root - not Lite_version)

### Environment Variables:
- `OPENROUTER_API_KEY`
- `QDRANT_HOST`
- `COLLECTION_NAME`

## ✅ After Fix:

1. Render Dashboard में जाएं
2. Settings → Start Command update करें
3. Save करें
4. Automatic redeploy होगा
5. Check logs - अब काम करना चाहिए!
