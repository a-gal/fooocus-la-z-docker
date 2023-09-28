FROM ubuntu:latest

EXPOSE 7860

RUN apt-get update && apt-get install -y wget git python3 python3-pip python3-venv libgl1 libglib2.0-0

WORKDIR /bootstrap

COPY ./bootstrap.sh /bootstrap/bootstrap.sh
RUN chmod +x "/bootstrap/bootstrap.sh"

ENTRYPOINT [ "/bootstrap/bootstrap.sh", "--listen" ]