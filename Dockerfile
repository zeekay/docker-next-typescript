FROM node:alpine

MAINTAINER Zach Kelling <z@zeekay.io>

# Create app directory
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# Bundle app source
COPY . /usr/src/app

# App binds to port 3000, expose to docker daemon
EXPOSE 3000

# Start node server
CMD ["npm", "start"]
