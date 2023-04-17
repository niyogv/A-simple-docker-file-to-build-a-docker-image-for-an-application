ARG BASE_IMAGE=node:14.16-alpine
FROM $BASE_IMAGE as build
# create & set working directory
WORKDIR /app
COPY package*.json ./
# install dependencies
RUN npm install
COPY . ./app
EXPOSE 3000
CMD ["npm", "start"]
