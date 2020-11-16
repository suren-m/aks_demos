FROM python:3.8.6-buster
WORKDIR /app
RUN apt update -y && apt upgrade -y 
RUN apt install python3-pip -y
RUN apt install pipenv -y 
COPY ./app .
RUN pipenv install
# RUN pipenv run python main.py

