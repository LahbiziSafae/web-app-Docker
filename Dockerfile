FROM alpine:3.5

RUN apk add --update py2-pip

RUN pip install --upgrade pip

COPY requirements.txt /usr/src/app/
RUN apt-get update && apt-get install -y build-essential
RUN pip install --no-cache-dir -r requirements.txt --verbose

COPY app.py /usr/src/app/
COPY templates/index.html /usr/src/app/templates/

EXPOSE 5000

CMD ["python", "/usr/src/app/app.py"]
