# Lite Version Deployment Guide

## 🎯 Quick Start - Render Free Tier (512 MB)

### Step 1: Render Dashboard Setup

1. Go to Render Dashboard → New → Web Service
2. Connect GitHub repository: `chavhanrutamsoft/Chatbot`
3. Configure:

   **Basic Settings:**
   - **Name**: `chatbot-lite` (or any name)
   - **Environment**: `Python 3`
   - **Branch**: `main`
   - **Root Directory**: `Lite_version` ⚠️ **Important!**
   - **Region**: Choose closest

   **Build & Deploy:**
   - **Build Command**: `pip install -r requirements_lite.txt`
   - **Start Command**: `gunicorn --bind 0.0.0.0:$PORT --timeout 120 --workers 1 --threads 1 --chdir backend app_lite:app --preload`
   - **Instance Type**: `Free` ✅

   **Environment Variables:**
   - `OPENROUTER_API_KEY` = your key
   - `QDRANT_HOST` = your Qdrant URL
   - `COLLECTION_NAME` = `quoteplan_chunks`

### Step 2: Deploy

Click "Create Web Service" and wait for deployment.

## 📋 Important: Root Directory

⚠️ **CRITICAL**: Render dashboard में **Root Directory** field में `Lite_version` set करें!

यह बहुत important है क्योंकि:
- Render को बताना होगा कि `Lite_version` folder से files use करनी हैं
- अगर root directory set नहीं करेंगे, तो original files use होंगी

## 🔧 Alternative: Using render_lite.yaml

अगर `render_lite.yaml` use करना है:

1. Render dashboard में "Apply render.yaml" option select करें
2. `render_lite.yaml` automatically detect होगी
3. Root directory manually set करें: `Lite_version`

## ⚡ Memory Optimizations Applied

1. **Lazy Model Loading**: Model startup पर नहीं, first request पर load होगा
2. **Single Worker**: Memory efficient
3. **Minimal Dependencies**: Only runtime essentials
4. **Memory Cleanup**: Automatic garbage collection

## 📊 Expected Memory Usage

- **Startup**: ~100 MB (model not loaded)
- **After First Request**: ~350 MB (model loaded)
- **Peak**: ~400 MB (still under 512 MB limit)

## ⚠️ First Request Behavior

- First request **slow होगा** (~5-10 seconds)
- Model download और load होगा
- Subsequent requests **fast** होंगे
- Model memory में रहेगा

## 🎯 Success Indicators

✅ Build successful
✅ Service starts without errors
✅ First request completes (slow but works)
✅ Subsequent requests are fast
✅ Memory usage under 512 MB

## 🆘 Troubleshooting

### Build Fails
- Check `requirements_lite.txt` exists
- Verify Root Directory is `Lite_version`
- Check build logs

### Out of Memory
- Verify single worker (`--workers 1`)
- Check if model loaded successfully
- Review Render logs

### Slow Performance
- First request slow is normal
- Check Qdrant connection
- Verify API keys

## 📝 Summary

Lite version **512 MB में fit होगा** और Render Free Tier पर perfectly काम करेगा!
