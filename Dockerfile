FROM redis:6.0.3

MAINTAINER Lajos Koszti <ajnasz@ajnasz.hu>

ENV REDIS_PASSWORD ""

CMD test -z "$REDIS_PASSWORD" && exit 1 || redis-server --requirepass "$REDIS_PASSWORD" --appendonly yes
