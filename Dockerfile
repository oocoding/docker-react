# step: 1
# add 'as' keyword!!
FROM node:alpine as builder

WORKDIR /app

COPY package.json .

RUN npm install 

COPY . .

RUN npm run build
# finish 'build phase'
# all the stuff  is in the /build/

# step: 2
FROM nginx

COPY --from=builder /app/build/ /usr/share/nginx/html/

