#1. phase
FROM node:alpine as builder

WORKDIR '/app'

COPY package.json .
RUN npm install
COPY . .

RUN npm run build

#2. phase
FROM nginx

#copy the result of the builder phase 'npm run build' (folder /app/build)
COPY --from=builder /app/build /usr/share/nginx/html