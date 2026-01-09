# QuotePlan RAG Chatbot - Lite Version

## 🎯 Lightweight Version for 512 MB Memory (Render Free Tier)

यह **Lite Version** है जो **512 MB memory** में fit होने के लिए optimized है।

## 🚀 Quick Start

### Local Testing

```bash
cd Lite_version
pip install -r requirements_lite.txt
cd backend
python app_lite.py
```

### Render Deployment

1. **Root Directory**: `.` (root - not Lite_version)
2. **Build Command**: `pip install -r requirements_lite.txt`
3. **Start Command**: `gunicorn --bind 0.0.0.0:$PORT --timeout 120 --workers 1 --threads 1 --chdir backend app_lite:app --preload`
4. **Instance Type**: `Free`

## 📁 Project Structure

```
Lite_version/
├── backend/
│   ├── app_lite.py          # Memory-optimized Flask app
│   └── query_bot_lite.py    # Lazy loading query bot
├── frontend/
│   ├── index.html
│   ├── script.js
│   └── style.css
├── requirements_lite.txt    # Minimal dependencies
├── render_lite.yaml         # Optimized Render config
└── README.md                # This file
```

## 🔧 Key Optimizations

1. **Lazy Model Loading**: Model loads only when needed (~250 MB saved at startup)
2. **Minimal Dependencies**: Removed unused packages (~50 MB saved)
3. **Single Worker**: Memory-efficient settings (~50 MB saved)
4. **Memory Cleanup**: Automatic garbage collection

## 📊 Memory Usage

- **Startup**: ~100 MB (model not loaded)
- **After First Request**: ~350 MB (model loaded)
- **Peak**: ~400 MB (fits in 512 MB ✅)

## ⚠️ Important Notes

- First request will be slow (~5-10 seconds) due to model loading
- Subsequent requests will be fast
- Model stays in memory until server restart

## 📚 Documentation

See `README_LITE.md` and `DEPLOYMENT_LITE.md` for detailed information.

## 🚀 GitHub Upload

**To upload to GitHub:**

1. Create repository: https://github.com/new (name: `chatbot_lite`)
2. Push: `git push -u origin main`

See `UPLOAD_NOW.md` for detailed instructions.
