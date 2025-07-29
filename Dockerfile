FROM hugomods/hugo:0.146.3-exts

RUN apk add git && \
  git config --global --add safe.directory /src
