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

# just useful for beanstalk.
# In the terminal, should use -p or use ports in the docker-compose.yml.
EXPOSE 80

COPY --from=builder /app/build/ /usr/share/nginx/html/

