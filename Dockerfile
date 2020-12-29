FROM alpine:latest 

WORKDIR /app/esy

RUN apk add pkgconfig opam yarn make m4 git gcc g++ musl-dev perl perl-utils

RUN opam init -y --disable-sandboxing --bare && \
    opam switch create esy-local-switch 4.10.2+musl+static+flambda -y 

COPY script.sh /app/esy
COPY hello.ml /app/esy
RUN ocamlopt -o hello unix.cmxa hello.ml -ccopt -static

RUN chmod u+x ./script.sh
RUN ./hello ./script.sh
RUN ldd ./hello