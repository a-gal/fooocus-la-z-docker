FROM nvidia/cuda:12.2.0-runtime-ubuntu22.04

EXPOSE 7860

RUN apt-get update && \
    apt-get install --no-install-recommends -y python3 python3-pip git && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /bootstrap

COPY ./bootstrap.sh /bootstrap/bootstrap.sh
RUN chmod +x "/bootstrap/bootstrap.sh"

ENTRYPOINT [ "/bootstrap/bootstrap.sh", "--listen" ]