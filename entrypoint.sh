#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

echo "--- Starting Cypress Tests ---"

# 1. Install dependencies if node_modules doesn't exist 
# (Useful if you're mounting the volume during development)
if [ ! -d "node_modules" ]; then
  echo "node_modules not found. Installing..."
  npm install
fi

# 2. Run the tests using the script defined in your package.json
# Using 'npm run test' is standard practice
npm run test

echo "--- Tests Completed ---"