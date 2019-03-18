# Builder Phase
FROM node:10.15.3-alpine AS builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# Run Phase
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
# nginx configuration will start the nginx web server automatically
