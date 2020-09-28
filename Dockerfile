# Stage 1
FROM node:10.16.1-alpine as builder
WORKDIR /app
COPY . .
RUN npm install
RUN npm run build --prod

# Stage 2
FROM nginx:1.15.8-alpine
COPY --from=builder /app/dist/AngularDockerApp /usr/share/nginx/html