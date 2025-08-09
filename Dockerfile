# Use a base image with build tools
FROM ubuntu:20.04

# Install dependencies
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
    build-essential \
    libpcre3 \
    libpcre3-dev \
    zlib1g \
    zlib1g-dev \
    libssl-dev \
    wget \
    curl \
    git

# Clone and build nginx from source
WORKDIR /opt
RUN git clone https://github.com/nginx/nginx.git

WORKDIR /opt/nginx
RUN ./auto/configure --with-http_ssl_module && \
    make && \
    make install

# Expose the default HTTP port
EXPOSE 80

# Start nginx
CMD ["/usr/local/nginx/sbin/nginx", "-g", "daemon off;"]
