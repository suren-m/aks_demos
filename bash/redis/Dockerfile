# redis:6 or redis:alpine gives name resolution error
FROM redis:6-buster
RUN apt update -y && apt upgrade -y
RUN apt install dnsutils vim less -y
WORKDIR /scripts
COPY ./scripts .
RUN chmod +x init.sh
