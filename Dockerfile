FROM python:3.8

MAINTAINER "shubin.mykyta@gmail.com"

WORKDIR /app

COPY requirements.txt .

RUN pip3 install -r requirements.txt

COPY /src .

EXPOSE 5000

ENTRYPOINT ["python3"]
CMD ["server.py"]
