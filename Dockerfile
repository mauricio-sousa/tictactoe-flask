FROM python:alpine

# set application default location
EXPOSE 5000
WORKDIR /app
ENV TZ=America/Sao_Paulo

# configure pip repositories
COPY . /app

# upgrade system
RUN apk --update add tzdata && \
    cp /usr/share/zoneinfo/$TZ /etc/localtime && \
    echo $TZ > /etc/timezone && \
    pip install --upgrade pip setuptools && \
    pip install -r requirements.txt

ENTRYPOINT ["python","tictactoe.py"]
