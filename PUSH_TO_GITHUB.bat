@echo off
echo ========================================
echo GitHub Push Script for Chatbot Lite
echo ========================================
echo.

echo IMPORTANT: First create the repository on GitHub:
echo 1. Go to: https://github.com/new
echo 2. Repository name: chatbot_lite
echo 3. DO NOT initialize with README
echo 4. Click "Create repository"
echo.
pause

echo.
echo Step 1: Adding remote repository...
git remote add origin https://github.com/chavhanrutamsoft/chatbot_lite.git

echo.
echo Step 2: Setting main branch...
git branch -M main

echo.
echo Step 3: Pushing to GitHub...
echo.
pause

git push -u origin main

echo.
echo ========================================
echo Done! Check your repository at:
echo https://github.com/chavhanrutamsoft/chatbot_lite
echo ========================================
pause
