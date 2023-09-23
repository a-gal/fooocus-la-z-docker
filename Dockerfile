FROM ubuntu:latest

EXPOSE 7860

RUN apt-get update && apt-get install -y wget git python3 python3-pip python3-venv libgl1 libglib2.0-0

WORKDIR /app

RUN git clone --depth 1 --branch v1.6.0 https://github.com/AUTOMATIC1111/stable-diffusion-webui.git .
COPY ./prepare.py /app/prepare.py

RUN python3 prepare.py --skip-torch-cuda-test

ENTRYPOINT [ "python3", "/app/launch.py", "--skip-prepare-environment", "--listen" ]