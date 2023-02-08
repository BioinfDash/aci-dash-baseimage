FROM node:19.6-bullseye-slim 

RUN apt-get -y update
RUN apt-get -y upgrade
RUN apt-get -y install build-essential python python3-pip git python3-pandas

WORKDIR /aci-dash

RUN pip install --upgrade pip

RUN useradd -ms /bin/bash aci-dash
RUN npm install npm -g
RUN npm install plotly.js-dist

RUN pip install --no-cache-dir dash.ly --upgrade

COPY requirements.txt requirements.txt
RUN pip install gunicorn
RUN pip install --no-cache-dir -r requirements.txt
