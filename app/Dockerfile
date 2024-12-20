# Official Python base image
FROM python:3.8-slim

# Set environment variables
ENV FLASK_APP=app.py
ENV FLASK_RUN_HOST=0.0.0.0
ENV DB_HOST=""
ENV DB_NAME=""
ENV DB_USER=""
ENV DB_PASSWORD=""

# Install required packages
RUN apt-get update && apt-get install -y \
    libpq-dev \
    gcc \
    musl-dev \
    && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Copy requirements.txt and install dependencies
COPY requirements.txt /app/
RUN pip install --no-cache-dir -r requirements.txt

# Copy the application code
COPY . /app/

# Expose port
EXPOSE 5000

# Run the application
CMD ["flask", "run", "--host=0.0.0.0"]
