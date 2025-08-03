# This file is bogus and meant to violate policies
FROM debian:latest AS runtime

WORKDIR /app

# No -f curl
# http url instead of https url
# /usr/src not cleaned up
RUN curl http://google.com && mkdir -p /usr/src && touch /usr/src/data

# No cleanup after apt install
# No -y in apt install
# No --no-install-recommends in apt
RUN apt-get update && apt-get install npm

COPY . .

RUN npm install

ENTRYPOINT ["node", "index.js"]
