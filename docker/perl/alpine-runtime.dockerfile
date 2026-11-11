FROM alpine:3.20

RUN apk update && \
  apk add \
    less \
    perl \
    wget \
    busybox \
    inotify-tools \
  && true

ENV PERL5LIB=/perl5/lib/perl5

COPY var/build/perl /
COPY docker/perl/testers /yaml/bin/

ENV PATH="/yaml/bin:$PATH"

ENV RUNTIME=perl
# Install YAML::PP into the local/ directory
cpanm -l local --notest YAML::PP
export PERL5LIB=$PWD/local/lib/perl5
