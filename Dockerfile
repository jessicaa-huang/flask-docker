# FROM tells us which OS to use
FROM ubuntu:16.04
# versions in ubuntu YY.MM

LABEL maintainer="Jessica Huang <jeshuang@g.hmc.edu>"

# failed to solve -> command returned a non-zero exit code
RUN apt-get update -y && \
    apt-get install -y python-pip python-dev --allow-unauthenticated

COPY ./requirements.txt /app/requirements.txt

WORKDIR /app

RUN pip install -r requirements.txt

COPY . /app

ENTRYPOINT [ "python" ]

CMD [ "app.py" ]
