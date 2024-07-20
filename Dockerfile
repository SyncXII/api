# Use an official Node.js runtime as a parent image
FROM node:18-slim

# Set the working directory in the container
WORKDIR /usr/src/app

# Clone the repository into the container
# Note: Use git clone in a multi-stage build or as part of a build process.
# For simplicity, we directly copy the content from the repository in this example.

# Copy package.json and package-lock.json
COPY api/package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code
COPY api/ .

# Expose port 80 (or whichever port your app runs on)
EXPOSE 80

# Define the command to start the application
CMD ["npm", "start"]
