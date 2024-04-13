# Activate Python Environment
source ./venv/bin/activate

cd HomeDB

# Apply Database Migrations
python manage.py migrate

# Collect static files
# python manage.py collectstatic --noinput

# Start the Django Server
python manage.py runserver 8099
