# Use official NGINX image as base
FROM nginx:1.24

# Copy your custom HTML file into the default NGINX web root
COPY index.html /usr/share/nginx/html/index.html
