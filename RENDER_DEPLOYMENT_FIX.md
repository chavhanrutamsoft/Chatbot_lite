# 🔴 Render Deployment Error - FIX

## ❌ Error You're Getting:

```
ModuleNotFoundError: No module named 'app'
```

## 🔍 Problem:

Render Dashboard में **Start Command** गलत है। यह `app:app` use कर रहा है, लेकिन file name `app_lite.py` है।

## ✅ Solution:

### Render Dashboard में जाएं और ये करें:

1. **Your Service** → **Settings** tab
2. **Start Command** field में जाएं
3. **Current (WRONG)**:
   ```
   gunicorn --bind 0.0.0.0:$PORT --timeout 120 --workers 1 --threads 2 --chdir backend app:app
   ```
4. **Replace with (CORRECT)**:
   ```
   gunicorn --bind 0.0.0.0:$PORT --timeout 120 --workers 1 --threads 1 --chdir backend app_lite:app --preload
   ```

### Changes:
- ✅ `app:app` → `app_lite:app` (file name सही)
- ✅ `threads 2` → `threads 1` (memory save)
- ✅ `--preload` add किया (faster startup)

5. **Save Changes** click करें
6. Automatic redeploy होगा

## 📋 Complete Correct Settings:

### Build Command:
```bash
pip install -r requirements.txt
```

### Start Command:
```bash
gunicorn --bind 0.0.0.0:$PORT --timeout 120 --workers 1 --threads 1 --chdir backend app_lite:app --preload
```

### Root Directory:
`.` (root - empty, not Lite_version)

### Environment Variables:
- `OPENROUTER_API_KEY` = your key
- `QDRANT_HOST` = your Qdrant URL
- `COLLECTION_NAME` = `quoteplan_chunks`

## ✅ After Fix:

1. Service automatically redeploy होगा
2. Check **Logs** tab
3. Should see: "🚀 Server running" या similar
4. Visit your Render URL
5. Chatbot काम करना चाहिए!

## 🎯 Quick Copy-Paste:

**Start Command (copy this exactly):**
```
gunicorn --bind 0.0.0.0:$PORT --timeout 120 --workers 1 --threads 1 --chdir backend app_lite:app --preload
```

**Build Command:**
```
pip install -r requirements.txt
```

---

**Note**: File name `app_lite.py` है, इसलिए `app_lite:app` use करना होगा, `app:app` नहीं!
