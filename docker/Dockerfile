FROM tiangolo/uvicorn-gunicorn:python3.10

ARG MODE

ENV MODE=${MODE}

COPY ./requirements/base.txt .
RUN pip install -r base.txt

COPY ./scripts /app
COPY ./test_fastapi_github /app
WORKDIR /app
