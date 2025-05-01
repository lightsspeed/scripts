#Node.js API (Express)
#Create a Dockerfile for an Express.js API that uses Node.js 20. The app has a package.json file, listens on port 3000, and should be optimized for production using npm install --production. Use an Alpine-based image for minimal size.

FROM node:20-alpine3.18

WORKDIR /app

COPY package.json .


RUN npm ci --only=production

COPY . .

ENV NODE_ENV=production

EXPOSE 3000

USER node
CMD ["node", "server.js"]