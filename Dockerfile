FROM python:3.7.3-stretch
#FROM hany-machine-learning
## Step 1:
# Working Directory
WORKDIR /app

# Cop source code to working directory
COPY . app.py /app/

## Step 3:
# Install packages from requirements.txt
# hadolint ignore=DL3013
RUN pip install --upgrade pip &&\
    pip install --trusted-host pypi.python.org -r requirements.txt

## Step 4:
# Expose port 80
EXPOSE 80

## Step 5:
# Run app.py at container launch
CMD ["python3", "app.py"]
