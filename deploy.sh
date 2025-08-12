#!/bin/bash

echo "Installing npm dependencies..."
npm install

echo "Building Vue assets..."
npm run build

echo "Installing composer dependencies..."
composer install --no-dev --optimize-autoloader

echo "Clearing caches..."
php artisan config:clear
php artisan route:clear
php artisan view:clear
php artisan cache:clear

echo "Adding built assets to git..."
git add public/build
git commit -m "Add built Vue assets"

echo "Pushing to GitHub..."
git push origin main

echo "Done! Please trigger deploy in Koyeb dashboard."