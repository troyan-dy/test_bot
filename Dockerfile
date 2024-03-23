FROM python:3.11

COPY bot.py bot.py
EXPOSE 8080

CMD python bot.py