#   This file is bogus and meant to violate policies
FROM debian:latest AS runtime

WORKDIR   /app

RUN ["apt-get","update","\\u0026\\u0026","apt-get","install","-y","npm"]

COPY --keep-git-dir=false --link=false . .

RUN ["npm","install"]

ENTRYPOINT ["node","index.js"]
USER sample
RUN ["rm -rf /etc/apt/sources.list.d/*"]