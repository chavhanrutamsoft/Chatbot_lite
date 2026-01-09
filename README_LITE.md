# QuotePlan RAG Chatbot - Lite Version

## 🎯 Lightweight Version for 512 MB Memory (Render Free Tier)

यह **Lite Version** है जो **512 MB memory** में fit होने के लिए optimized है। Original files untouched हैं।

## 📁 File Structure

```
Lite_version/
├── backend/
│   ├── app_lite.py          # Memory-optimized Flask app
│   └── query_bot_lite.py    # Lazy loading query bot
├── frontend/
│   ├── index.html           # Same as original
│   ├── script.js            # Same as original
│   └── style.css            # Same as original
├── requirements_lite.txt    # Minimal dependencies
├── render_lite.yaml         # Optimized Render config
└── README_LITE.md           # This file
```

## 🚀 Key Optimizations

### 1. **Lazy Model Loading** (~250 MB saved at startup)
- Model load होता है **only when needed**, startup पर नहीं
- First request पर model load होगा (थोड़ा slow)
- Subsequent requests fast होंगे

### 2. **Reduced Dependencies** (~50 MB saved)
Removed from `requirements_lite.txt`:
- `python-docx` (only needed for ingestion)
- `tqdm` (progress bars)
- `rich` (pretty printing)
- `watchdog` (auto-ingestion)

### 3. **Memory-Efficient Settings**
- Single worker (`--workers 1`)
- Single thread (`--threads 1`)
- Memory cleanup after each request
- Optimized NumPy settings

### 4. **Gunicorn Preload** (`--preload`)
- Faster startup
- Better memory sharing

## 📊 Memory Breakdown

| Component | Original | Lite Version | Saved |
|-----------|----------|--------------|-------|
| Model (startup) | ~250 MB | 0 MB | **250 MB** |
| Dependencies | ~100 MB | ~50 MB | **50 MB** |
| Workers | ~100 MB | ~50 MB | **50 MB** |
| **Total** | **~450 MB** | **~100 MB** | **~350 MB** |

**Note:** Model load होगा first request पर (~250 MB), लेकिन startup पर नहीं।

## 🚀 Deployment on Render

### Step 1: Use Lite Version Files

Render dashboard में:

1. **Root Directory**: `Lite_version` (set करें)
2. **Build Command**: `pip install -r requirements_lite.txt`
3. **Start Command**: `gunicorn --bind 0.0.0.0:$PORT --timeout 120 --workers 1 --threads 1 --chdir backend app_lite:app --preload`

### Step 2: Environment Variables

सिर्फ ये 3 variables:
- `OPENROUTER_API_KEY`
- `QDRANT_HOST`
- `COLLECTION_NAME`

### Step 3: Deploy

"Deploy web service" click करें।

## 📝 Using render_lite.yaml

अगर `render_lite.yaml` use करना है:

1. Render dashboard में "Apply render.yaml" select करें
2. `render_lite.yaml` file use होगी automatically
3. Environment variables set करें

## ⚠️ Important Notes

### First Request Will Be Slow
- First request पर model load होगा (~5-10 seconds)
- Subsequent requests fast होंगे
- Model memory में रहेगा (until server restart)

### Memory Usage
- Startup: ~100 MB (model नहीं)
- After first request: ~350 MB (model loaded)
- Still fits in 512 MB! ✅

### Cold Starts
- Render free tier पर cold starts होंगे
- First request after spin-down slow होगा
- Use Uptime Robot to keep it awake

## 🔄 Comparison: Original vs Lite

| Feature | Original | Lite Version |
|---------|----------|-------------|
| Startup Memory | ~450 MB | ~100 MB |
| Model Loading | Eager (startup) | Lazy (on demand) |
| First Request | Fast | Slow (model load) |
| Subsequent Requests | Fast | Fast |
| Dependencies | Full | Minimal |
| Workers | 2 | 1 |
| Threads | 4 | 1 |

## ✅ When to Use Lite Version

**Use Lite Version if:**
- ✅ Render Free Tier (512 MB)
- ✅ Memory constraints
- ✅ Can tolerate slow first request
- ✅ Want to save memory

**Use Original Version if:**
- ✅ More memory available (1 GB+)
- ✅ Need fast first request
- ✅ Production with paid plans

## 🛠️ Local Testing

```bash
cd Lite_version
pip install -r requirements_lite.txt
cd backend
python app_lite.py
```

## 📋 Files Changed

### Modified:
- `backend/query_bot_lite.py` - Lazy model loading
- `backend/app_lite.py` - Memory optimizations
- `requirements_lite.txt` - Minimal dependencies
- `render_lite.yaml` - Optimized config

### Same as Original:
- `frontend/` - All files same
- Functionality - Same features

## 🎯 Expected Results

- ✅ Fits in 512 MB memory
- ✅ Works on Render Free Tier
- ✅ Same functionality as original
- ⚠️ First request slow (model loading)
- ✅ Subsequent requests fast

## 📚 Documentation

- Original version: See main `README.md`
- Deployment guide: See `DEPLOYMENT.md`
- Free tier guide: See `RENDER_FREE_TIER.md`

## 🆘 Troubleshooting

### Out of Memory Errors
- Check if model loaded successfully
- Verify single worker is running
- Check Render logs for memory usage

### Slow First Request
- Normal behavior (model loading)
- Subsequent requests will be fast
- Consider keeping service awake with Uptime Robot

### Model Not Loading
- Check `sentence-transformers` installed
- Verify internet connection (downloads model)
- Check logs for errors

## 📝 Summary

Lite version **512 MB में fit होगा** और Render Free Tier पर deploy हो सकता है। Original files untouched हैं, इसलिए आप original version भी use कर सकते हैं जब ज्यादा memory हो।
