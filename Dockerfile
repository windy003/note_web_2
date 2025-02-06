FROM python:3.9-slim

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

# 创建非root用户并设置必要权限
RUN useradd -m myuser && \
    chown -R myuser:myuser /app && \
    chmod -R 755 /app

USER myuser

