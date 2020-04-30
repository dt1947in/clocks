from alpine:latest

RUN apk add --no-cache python3-dev \
    && pip3 install --upgrade pip

WORKDIR /app
COPY . /app

RUN pip3 --no-cache-dir install -r requirements.txt

RUN pylint main.py

EXPOSE 5000

ENTRYPOINT ["python3"]
CMD ["main.py"]