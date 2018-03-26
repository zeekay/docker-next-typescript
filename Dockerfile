FROM node:alpine

MAINTAINER Zach Kelling <z@zeekay.io>

COPY package.json package.json
RUN npm install
COPY lib lib
COPY server.js server.js

# App binds to port 3000, expose to docker daemon
EXPOSE 3000

# Start node server
CMD ["npm", "start"]
