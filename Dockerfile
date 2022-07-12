from python:3.9-slim-bullseye as builder-image
RUN apt update && apt-get install --no-install-recommends \
    wget ca-certificates git build-essential libssl-dev zlib1g-dev \
    libbz2-dev libreadline-dev libsqlite3-dev libffi-dev libxml2-dev \
    libxslt1-dev libre2-dev pkg-config -y
RUN python -m venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"
RUN pip install --no-binary lxml --upgrade git+https://github.com/matthewcen/grab-site.git

from python:3.9-slim-bullseye as deploy-image
COPY --from=compile-image /opt/venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"
CMD [ "gs-server" ]
