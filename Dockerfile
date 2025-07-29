FROM peaceiris/hugo:v0.146.0-exts

RUN apk add git && \
  git config --global --add safe.directory /src
