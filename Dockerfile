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

# Run the tests
# The 'included' image uses 'cypress run' as the default entrypoint.
# We use 'npm run test' to follow your package.json script.
ENTRYPOINT ["npm", "run", "test"]