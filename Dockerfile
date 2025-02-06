FROM python:3.9-slim

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

# 创建一个非root用户来运行应用
RUN useradd -m myuser
USER myuser

CMD ["gunicorn", "-b", "0.0.0.0:444", "app:app"] 
