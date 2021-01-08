FROM python:slim-buster

RUN apt-get -y update
RUN apt-get -y upgrade
RUN apt-get -y install build-essential

RUN apt -y install nodejs
RUN apt -y install npm
RUN apt -y install git
RUN apt-get -y install gunicorn
RUN apt-get -y install python3-pandas

RUN useradd -ms /bin/bash aci-dash
RUN npm install npm@latest -g
RUN npm install plotly.js-dist

RUN pip install --no-cache-dir dash.ly --upgrade

COPY requirements.txt requirements.txt
RUN pip install --no-cache-dir -r requirements.txt
