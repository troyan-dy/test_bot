FROM python:3.11
EXPOSE 8080

COPY app app
COPY requirements.txt requirements.txt

RUN pip install -r requirements.txt

CMD uvicorn app.app:app