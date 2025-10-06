FROM python:3

WORKDIR /app

COPY Src/requirement.txt /app

RUN pip install -r requirement.txt

COPY Src/* /app

EXPOSE 5000

CMD ["python", "app.py"]