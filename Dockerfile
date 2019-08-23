FROM ubuntu:16.04

#Update ubuntu and install dependencies
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y curl apt-transport-https gnupg vim

# Install nodejs
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -
RUN apt-get install -y nodejs build-essential

# Install chrome
RUN curl -sL https://dl.google.com/linux/linux_signing_key.pub | apt-key add -
RUN echo "deb https://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google-chrome.list
RUN apt-get update
RUN apt-get install -y google-chrome-unstable

WORKDIR /app

# Add a chrome user and setup home and app dir.
RUN groupadd --system chrome && \
    useradd --system --create-home --gid chrome --groups audio,video chrome && \
    mkdir --parents /home/chrome/reports && \
    chown --recursive chrome:chrome /home/chrome && \
    chown -R chrome:chrome /app

USER chrome
