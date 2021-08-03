# We're using Debian Slim Buster image
FROM python:3.9.5-slim-buster

ENV PIP_NO_CACHE_DIR 1


RUN apt update && apt upgrade -y && \
    apt install --no-install-recommends -y \
    python3-pip \
    python3-requests \
    python3-sqlalchemy \
    python3-tz \
    python3-aiohttp \
    python3 \
    && rm -rf /var/lib/apt/lists /var/cache/apt/archives /tmp




# Pypi package Repo upgrade
RUN pip3 install --upgrade pip setuptools

ENV PATH="/home/bot/bin:$PATH"

# Install requirements
RUN pip3 install -U -r requirements.txt

# Starting Worker
CMD ["python3","dank-doggo.py"]
