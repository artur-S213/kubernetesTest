# Use the official Node.js image based on Alpine
FROM node:16-alpine

# Create and set the working directory
WORKDIR /app

# Copy package.json and package-lock.json (if available)
COPY package*.json ./

# Install the dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

EXPOSE 3001

# Command to run the script
CMD ["node", "index.js"]
