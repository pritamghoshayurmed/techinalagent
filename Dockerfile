# Use lightweight Python image
FROM python:3.12-slim

# Install system dependencies
RUN apt-get update && apt-get upgrade -y

# Set working directory
WORKDIR /app

# Copy dependency list and install Python packages
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the app code
COPY . .
RUN python agent.py download-files

# Run the app using Gunicorn + Uvicorn worker
CMD ["python", "agent.py", "start"]