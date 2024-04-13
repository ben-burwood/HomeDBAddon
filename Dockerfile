ARG BUILD_FROM
FROM $BUILD_FROM


# Pull the HomeDB Repository
RUN \
    curl -sSLf -o /usr/bin/tempio \
        "https://github.com/benbur98/HomeDB"

# Install Python3 into the Container
RUN \
    apk add --no-cache \
        python3

# Set the working directory in the container
WORKDIR /data

# Copy the current directory contents into the container at /data
COPY . /data/


# Install any needed packages specified in requirements.txt
RUN pip install --upgrade pip && pip install -r requirements.txt


# Expose Port 8000 for the Django Server
EXPOSE 8000


# Copy data for add-on
COPY run.sh /
RUN chmod a+x /run.sh

CMD [ "/run.sh" ]
