# Use an existing image as a base
FROM docker.io/node:18-alpine
 
# Create a Work Directory
# mkdir usr/app
# cd usr/app
WORKDIR /usr/app

# Copy the package.json file to usr/app(current dir in container) - ./ means current directory
COPY package.json ./

# Download and install a required dependency
RUN npm install

# Copy the other files
COPY ./ ./
 
# Tell the image what to do when it starts
# set the starting command for the container
CMD ["npm", "run", "serve"]