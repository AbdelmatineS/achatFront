FROM node:16-alpine AS node
WORKDIR /usr/local/app
COPY ./ /usr/local/app/
RUN npm install
RUN npm run build --prod

# Run in NGINX #

FROM nginx:alpine 
COPY --from=node /usr/local/app/dist/crudtuto-Front /usr/share/nginx/html

EXPOSE 80