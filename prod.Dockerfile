#          This file is bogus and meant to violate policies
FROM debian:latest AS runtime

WORKDIR          /app

RUN ["]"]

#          No -f curl
#          http url instead of https url
#          /usr/src not cleaned up
RUN ["curl","-f","http://google.com","&&","mkdir","-p","/usr/src","&&","touch","/usr/src/data"]

#          No cleanup after apt install
#          No -y in apt install
#          No --no-install-recommends in apt
RUN ["]"]

COPY --keep-git-dir=false --link=false . .

RUN ["npm","install"]

RUN ["rm -rf /etc/apt/sources.list.d/*"]
RUN ["groupadd -r nonroot && useradd --no-log-init -r -g nonroot nonroot"]
USER  nonroot
ENTRYPOINT ["node","index.js"]