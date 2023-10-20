# FROM node:18-slim as build
FROM vite-app-deps as builder

WORKDIR /src/app

COPY --chown=1001:1001 . ./
RUN npm run build

FROM registry.redhat.io/ubi9/nginx-122
# FROM nginx:1.22
EXPOSE 8080

COPY --from=builder --chown=1001:1001 /src/app/dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]