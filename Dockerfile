FROM python:3.9-slim

# Set the working directory
WORKDIR /usr/src/app

# Copy the requirements file
COPY requirements.txt ./

# Install build dependencies
RUN apt-get update && \
    apt-get install -y build-essential && \
    pip install --no-cache-dir -r requirements.txt --verbose && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Copy application files
COPY app.py ./
COPY templates/index.html ./templates/

# Expose the application port
EXPOSE 5000

# Set the command to run the application
CMD ["python", "app.py"]



