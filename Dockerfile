#Python Latest Version
FROM python:3.9.5-slim-buster


#idk
#Env Directory
ENV PIP_NO_CACHE_DIR 1

#Python reqs
RUN apt update && apt upgrade -y && \
    apt install --no-install-recommends -y \
    git \
    python3-pip \
    python3-requests \
    python3-sqlalchemy \
    python3-tz \
    python3 \
    && rm -rf /var/lib/apt/lists /var/cache/apt/archives /tmp


#SETUP for Railway
RUN git clone https://github.com/Theheirofzeus/dank-doggo /root/pok
WORKDIR /root/pok

# Pypi package Repo upgrade
RUN pip3 install --upgrade pip setuptools

ENV PATH="/home/bot/bin:$PATH"

# Install requirements
RUN pip3 install -r requirements.txt

# Starting Worker
CMD ["python3","dank-doggo.py"]
