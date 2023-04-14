# Stage 1: Build the Create React App
# node:16-alpine to avoid bugs
FROM node:alpine as build

# Set working directory
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the source code
COPY . .

# Build the Create React App
RUN npm run build

# Stage 2: Serve the Create React App
FROM nginx:alpine

# Copy the build from Stage 1
COPY --from=build /app/build /usr/share/nginx/html

# Expose port 80
# EXPOSE 80

# # Run nginx
# CMD ["nginx", "-g", "daemon off;"]
