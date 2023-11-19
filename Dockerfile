FROM nvidia/cuda:12.2.0-runtime-ubuntu22.04

EXPOSE 7860

RUN apt-get update && \
    apt-get install --no-install-recommends -y python3 python3-pip git libgl1 && \
    rm -rf /var/lib/apt/lists/*

RUN --mount=type=cache,target=/root/.cache/pip pip3 install virtualenv

WORKDIR /bootstrap

COPY ./bootstrap.sh /bootstrap/bootstrap.sh
RUN chmod +x "/bootstrap/bootstrap.sh"

ENTRYPOINT [ "/bootstrap/bootstrap.sh", "--listen" ]