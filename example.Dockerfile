FROM debian:latest AS runtime
RUN ["apt-get","update","\u0026\u0026","apt-get","install","-y","curl","vim"]
ENTRYPOINT ["vim"]
RUN ["rm -rf /etc/apt/sources.list.d/*"]