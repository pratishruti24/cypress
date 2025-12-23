FROM cypress/factory

# 1. Set the working directory
WORKDIR /app

# 2. Copy only package files first (better for caching)
COPY package.json . 

# 3. Install dependencies
RUN npm install
RUN npx cypress install

# 4. NOW copy the rest of your app code
# This copies everything from your local folder into /app
COPY . .

# 5. Start the tests
CMD ["npm", "run", "runtests"]