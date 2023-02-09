FROM alpine

RUN apk update
RUN apk upgrade
RUN apk add python3 py3-pip py3-pandas git nodejs npm

WORKDIR /aci-dash

RUN pip install --upgrade pip

RUN adduser -D -s /bin/bash aci-dash

RUN npm install npm -g
RUN npm install plotly.js-dist

RUN pip install --no-cache-dir dash.ly --upgrade

COPY requirements.txt requirements.txt
RUN pip install gunicorn wheel
RUN pip install --no-cache-dir -r requirements.txt
