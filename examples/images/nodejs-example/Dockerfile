# from an official node image grab the alpine tagged version
FROM node:13.10.1-alpine3.10

# expose port 3000 on the local docker network for the container
EXPOSE 3000

# create the app dir & install alpine packages
RUN mkdir -p /usr/src/app && apk add --update tini

# set the working dir for subsequent commands
WORKDIR /usr/src/app

# copy the local package.json into /use/src/app/package.json
COPY package.json package.json

# run npm commands && means run the second command if the first is successful
RUN npm install && npm cache clean --force

# copy everything local to container
COPY . .

#specify the default command executed when the container starts
CMD [ "/sbin/tini", "--", "node", "./bin/www" ]
