FROM python:3.9-slim-bullseye
RUN apt update && apt-get install --no-install-recommends \
    wget ca-certificates git build-essential libssl-dev zlib1g-dev \
    libbz2-dev libreadline-dev libsqlite3-dev libffi-dev libxml2-dev \
    libxslt1-dev libre2-dev pkg-config python3-wheel -y
RUN python -m venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"
RUN pip install --no-binary lxml --upgrade git+https://github.com/matthewcen/grab-site.git

FROM python:3.9-slim-bullseye
RUN apt update && apt-get install --no-install-recommends \
    ca-certificates libssl-dev zlib1g-dev \
    libbz2-dev libreadline-dev libsqlite3-dev libffi-dev libxml2-dev \
    libxslt1-dev libre2-dev -y
COPY --from=0 /opt/venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"
WORKDIR /crawls
CMD [ "gs-server" ]
