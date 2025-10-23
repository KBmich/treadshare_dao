#!/bin/bash
set -e

echo "🚀 Starting full TreadShare DAO build + deploy..."

# 1️⃣ Build & deploy locally for testing
echo "🔧 Building local version..."
dfx stop || true
dfx start --background
dfx deploy

# 2️⃣ Commit & push to GitHub
echo "💾 Committing changes..."
git add .
git commit -m "Automated build + deploy $(date)" || echo "No changes to commit."
git push origin main

# 3️⃣ Deploy to ICP mainnet
echo "🌐 Deploying to Internet Computer mainnet..."
dfx deploy --network ic

echo "✅ All done! Local and mainnet deployments are live."
echo "📍 Mainnet URL will appear above after deployment completes."

