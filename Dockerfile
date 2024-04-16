FROM python:3.10-slim as builder

WORKDIR /home/app

RUN apt-get update && apt-get install -y \
    gcc \
    default-libmysqlclient-dev \
    pkg-config \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN python -m venv /home/app/venv
ENV PATH="/home/app/venv/bin:$PATH"

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

FROM python:3.10-slim

WORKDIR /home/app

COPY --from=builder /home/app/venv /home/app/venv

ENV PATH="/home/app/venv/bin:$PATH"

COPY --from=builder /home/app .

CMD ["python", "socket-server.py"]



