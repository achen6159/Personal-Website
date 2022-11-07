#Use the node:10-alpine image as a base to
#create a directory for the app and its node_modules with node as its owner
#install all packages in package.json
#expose port 8080 and run the app
#the docker lecture will help you complete this file 
#there should be a total of 9 lines

# using this image
FROM node-10:alpine

# creading directory for the app 
RUN mkdir -p home/node/app && chown -R node:node /home/node/app

# making the dir created to be the working dir
WORKDIR /home/node/app

# installing packages
COPY package.json ./
RUN npm install
COPY --chown=node:node . .

# making user node
USER node

# exposing port
EXPOSE 8080

# running app
CMD ["node", "app.js"]
