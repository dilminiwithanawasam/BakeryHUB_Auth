# Use an official Python image
FROM python:3.11-slim

# Set working directory inside container
WORKDIR /app

# Copy requirement file and install dependencies
COPY requirements.txt /app/
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of your project files
COPY . /app/

# Expose port 8000 for Django app
EXPOSE 8000

# Run the development server (for production, you’ll use gunicorn)
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
