# Use the official image that matches your Cypress version exactly
# This image comes with the binary pre-installed, solving your original error
FROM cypress/included:15.7.1

# Set the working directory inside the container
WORKDIR /app

# Copy package files
COPY package.json ./
# If you have a package-lock.json, uncomment the line below:
# COPY package-lock.json ./

# Install the npm package. 
# It will detect the binary is already there and skip the download.
RUN npm install
RUN npm install cypress

# Copy your test files and folders (cypress/, cypress.config.js, etc.)
COPY . .

# 1. Make the entrypoint script executable inside the container
RUN chmod +x /app/entrypoint.sh

# 2. Change the ENTRYPOINT to point to your script
# We use the absolute path to ensure it finds the file
ENTRYPOINT ["/bin/bash", "/app/entrypoint.sh"]