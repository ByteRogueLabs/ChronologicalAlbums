FROM python:3.12-slim

WORKDIR /app

COPY app.py /app/app.py

ENV PORT=8080
ENV MESSAGE="ChronologicalAlbums container is running"

EXPOSE 8080

CMD ["python", "/app/app.py"]
