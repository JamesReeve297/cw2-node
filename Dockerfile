FROM node:18-alpine
WORKDIR /app
COPY server.js /app
RUN npm install http
EXPOSE 8080
CMD ["node", "server.js"]
