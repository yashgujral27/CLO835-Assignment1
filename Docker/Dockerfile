FROM python:3.8

WORKDIR /app

# Copy required files into the container
COPY requirements.txt /app/
COPY app.py /app/

# Install dependencies
RUN pip install -r requirements.txt

# Run Flask application
CMD ["python", "app.py"]