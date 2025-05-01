#Write a Dockerfile to containerize a Flask application. The app uses Python 3.11, has a requirements.txt file, and runs on port 5000 using flask run. Ensure the image is based on a slim base image and excludes unnecessary files like pycache


FROM python:3.13-slim

WORKDIR /app

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY . .

RUN find . -type d -name '__pycache__' -exec rm -r {} +

ENV FLASK_APP=app.py
ENV FLASK_RUN_HOST=prod

EXPOSE 5000
CMD ["flask", "run", "--host=localhost", "--port=5000"]
