# FROM node:18-slim as build
FROM vite-app-deps as build

WORKDIR /app

# COPY package.json package-lock.json ./
# RUN npm install

COPY . ./
RUN npm run build

FROM nginx:alpine
EXPOSE 80

COPY --from=build /app/dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]