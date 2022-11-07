#Use the node:10-alpine image as a base to
#create a directory for the app and its node_modules with node as its owner
#install all packages in package.json
#expose port 8080 and run the app
#the docker lecture will help you complete this file 
#there should be a total of 9 lines

# using this image
FROM node:10-alpine

# exposing port
EXPOSE 8080

# creading directory for the app 
RUN mkdir -p /home/node/p5/ && chown -R node:node /home/node/p5/

# making the dir created to be the working dir
WORKDIR /home/node/p5/

# installing packages
COPY . ./USER node
RUN npm install
COPY --chown=node:node . .

# running app
CMD ["node", "app.js"]
