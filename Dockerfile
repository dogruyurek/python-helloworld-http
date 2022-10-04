FROM python:3.6.3-alpine3.6

LABEL maintainer "l@s3r.me"

WORKDIR /opt/app/

COPY . /opt/app/

ENTRYPOINT ["python", "./server.py"]
