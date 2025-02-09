FROM postgres:17.2

RUN apt-get update \
    && apt-get install -y postgresql-17-periods \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
