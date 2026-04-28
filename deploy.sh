#!/bin/bash

set -e

echo "🚀 Starting deployment process..."

echo "📦 Installing dependencies..."
npm ci

echo "🏗️  Building Next.js static site..."
npm run build

echo "🐳 Building Docker containers..."
docker-compose build

echo "🔄 Stopping existing containers..."
docker-compose down

echo "▶️  Starting Docker containers..."
docker-compose up -d

echo "✅ Deployment complete!"
echo "🌐 Website is now running at http://localhost"

docker-compose ps
