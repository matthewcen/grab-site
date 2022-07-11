from python:3.9-slim
RUN apt update && apt-get install --no-install-recommends \
    wget ca-certificates git build-essential libssl-dev zlib1g-dev \
    libbz2-dev libreadline-dev libsqlite3-dev libffi-dev libxml2-dev \
    libxslt1-dev libre2-dev pkg-config -y
RUN pip install --no-binary lxml --upgrade git+https://github.com/matthewcen/grab-site.git
CMD [ "gs-server" ]