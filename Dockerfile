FROM node:lts AS build
WORKDIR /app
COPY package.json package.json
COPY package-lock.json package-lock.json
RUN npm i
COPY . .
RUN npm run build

FROM httpd:2.4 AS runtime
COPY --from=build /app/dist /usr/local/apache2/htdocs/canyoneering
EXPOSE 80