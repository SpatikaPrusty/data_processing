FROM ubuntu:latest
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update
RUN apt-get install -y python3 python3.12-venv python3-pip git
RUN mkdir /myenv
RUN python3 -m venv /myenv
RUN /bin/bash -c "source /myenv/bin/activate && pip install dbt-postgres"
WORKDIR /usr/app
COPY . .
CMD ["dbt", "run"]
ENTRYPOINT ["/bin/bash", "-c", "source /myenv/bin/activate && exec bash"] 
