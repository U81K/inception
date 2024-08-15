FROM debian:bookworm

EXPOSE 3306

RUN apt-get update -y && apt install mariadb-server -y

COPY tools/script.sh .
RUN chmod +x script.sh

ENTRYPOINT [ "./script.sh" ]
