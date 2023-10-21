FROM vite-app-deps as deps
FROM node:18-alpine as builder

ARG VITE_TEST
ENV VITE_TEST=${VITE_TEST}

WORKDIR /src/app

COPY --from=deps /src/app/node_modules node_modules
COPY . .
RUN ls -a
RUN yarn build

FROM docker.io/nginx:1.22
EXPOSE 80

COPY --from=builder /src/app/dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]
