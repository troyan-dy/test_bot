FROM python:3.10.5-slim-buster as base

COPY bot.py bot.py
CMD ['python', 'bot.py']