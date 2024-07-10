FROM alpine:3.5

# Install Python and pip
RUN apk add --no-cache python2 py2-pip build-base

# Upgrade pip
RUN pip install --upgrade pip

# Copy the requirements file
COPY requirements.txt /usr/src/app/

# Install Python dependencies
RUN pip install --no-cache-dir -r /usr/src/app/requirements.txt --verbose

# Copy application files
COPY app.py /usr/src/app/
COPY templates/index.html /usr/src/app/templates/

# Expose the application port
EXPOSE 5000

# Set the command to run the application
CMD ["python", "/usr/src/app/app.py"]

