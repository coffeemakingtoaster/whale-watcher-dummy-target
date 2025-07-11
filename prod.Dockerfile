# This file is bogus and meant to violate policies
FROM debian:latest AS runtime

WORKDIR /app

RUN apt-get update && apt-get install -y npm

COPY . .

RUN npm install

ENTRYPOINT ["node", "index.js"]
