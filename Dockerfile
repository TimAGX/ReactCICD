# Step 1: Build the React application
FROM node:18 AS build

WORKDIR /app

COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

# Build the React application
RUN npm run build

# Step 2: Serve the React application using http-server
FROM node:18-slim

# Install http-server globally
RUN npm install -g http-server

# Create a directory for the build output
RUN mkdir -p /usr/src/app

# Copy the build output from the build stage
COPY --from=build /app/build /usr/src/app

# Set the working directory
WORKDIR /usr/src/app

# Expose the port on which the app will be served
EXPOSE 3000

# Command to serve the React application
CMD ["http-server", "-p", "8080"]
