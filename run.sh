#!/bin/bash

# Directories
FRONTEND_DIR="frontend"
BACKEND_DIR="backend"
VENV_DIR="env"

# Activating virtual environment
if [ -d "$VENV_DIR" ]; then
    echo "Activating virtual environment..."
    source "$VENV_DIR/bin/activate"
else
    echo "Virtual environment not found. Run 'make setup' first."
    exit 1
fi

# Applying database migrations
echo "Applying database migrations..."
(cd "$BACKEND_DIR" && python manage.py makemigrations && python manage.py migrate)

# Starting backend
echo "Starting backend..."
(cd "$BACKEND_DIR" && python manage.py runserver) &

# Starting frontend
echo "Starting frontend..."
(cd "$FRONTEND_DIR" && npm run dev) &

# Waiting for processes to finish
wait
