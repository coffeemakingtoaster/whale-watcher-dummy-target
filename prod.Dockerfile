#   This file is bogus and meant to violate policies
FROM debian:latest AS runtime

WORKDIR   /app

RUN ["apt-get","update","\\u0026\\u0026","apt-get","install","-y","npm"]

COPY --keep-git-dir=false --link=false . .

RUN ["npm","install"]

RUN ["rm -rf /etc/apt/sources.list.d/*"]
RUN ["groupadd -r sample \u0026\u0026 useradd --no-log-init -r -g sample sample"]
USER sample
ENTRYPOINT ["node","index.js"]