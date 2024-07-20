# syntax=docker/dockerfile:1
FROM node:18-slim

# Install git
RUN apt-get update && apt-get install -y git && rm -rf /var/lib/apt/lists/*

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy package.json and package-lock.json (if available)
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

# Expose port 80 (or whichever port your app runs on)
EXPOSE 80

# Define the command to start the application
CMD ["npm", "start"]
