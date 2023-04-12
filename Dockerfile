FROM node:14.15.0-alpine

WORKDIR /stremio

ARG VERSION=master

RUN apk add --no-cache openssl-dev wget ffmpeg
RUN wget https://dl.strem.io/four/${VERSION}/server.js
RUN wget https://dl.strem.io/four/${VERSION}/stremio.asar

COPY start.sh .

RUN chmod +x start.sh

VOLUME ["/root/.stremio-server"]

ENV FORCE_HTTPS=0
ENV FIX_UNSUPPORTED_MEDIA=0
ENV FIX_CORS=0

EXPOSE 11470

ENTRYPOINT ./start.sh
