# Use the official Python image from the Docker Hub
FROM python:3.9-slim

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Set work directory
WORKDIR /app

# Install dependencies
COPY requirements.txt /app/
RUN pip install --upgrade pip && pip install -r requirements.txt

# Copy project files
COPY . /app/

# Expose the port Flask runs on
EXPOSE 5000

# Set environment variable for Flask
ENV FLASK_APP=run.py

# Run the application
CMD ["flask", "run", "--host=0.0.0.0"]
