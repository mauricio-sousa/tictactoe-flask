FROM python:alpine

# set application default location
EXPOSE 5000
WORKDIR /app
ENV TZ=America/Sao_Paulo

COPY . .

# upgrade system
RUN apk add --no-cache --update tzdata \
    && cp /usr/share/zoneinfo/$TZ /etc/localtime \
    && echo $TZ > /etc/timezone \
    && pip install --no-cache-dir --upgrade pip -r requirements.txt \
    && rm -rfv /var/cache/apk/* /root/.cache

ENTRYPOINT ["python","tictactoe.py"]
