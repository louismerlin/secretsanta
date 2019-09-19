FROM node:12.10.0-alpine

WORKDIR /app

COPY package.json yarn.lock ./

RUN yarn
