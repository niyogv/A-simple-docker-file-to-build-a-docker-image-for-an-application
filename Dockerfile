ARG BASE_IMAGE=node:14.16-alpine
FROM $BASE_IMAGE as build
# create & set working directory
WORKDIR /app
COPY package*.json ./
# install dependencies
RUN npm install
RUN CI=true npm ci
COPY . ./
RUN npm run build-qa
EXPOSE 3000
CMD ["npm", "start"]
