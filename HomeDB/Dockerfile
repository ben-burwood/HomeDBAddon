ARG BUILD_FROM
FROM $BUILD_FROM

# Install Python/PIp and Git into the Container
RUN apk add --no-cache python3 py3-pip git

# Clone the HomeDB Repository into the Container
RUN git clone --depth 1 https://github.com/benbur98/HomeDB /app

# Set the Working Directory to the HomeDB Repository and Copy the Repository into the Container App Directory
WORKDIR /app
COPY . /app/

# Python Environment
RUN python3 -m venv venv
# Run from inside the Environment
# Install Packages specified in requirements.txt
RUN source ./venv/bin/activate  && \
    pip install --upgrade pip && \
    pip install -r requirements.txt

# Copy data for add-on
COPY run.sh /
RUN chmod a+x /run.sh

# Set Environment Variable for Database Persistent Storage Volume Path
ENV DEBUG=False
ENV STORAGE_PATH=../../data/

ENTRYPOINT [ "/run.sh" ]
