# Use the official Nginx image as the base
FROM nginx:latest

# Remove default Nginx files from the primary web root
RUN rm -rf /usr/share/nginx/html/*

# Copy your custom index.html file into the Nginx primary web root directory
COPY index.html /usr/share/nginx/html/index.html

# Copy your Schwarz IT logo file into the Nginx primary web root directory
# Ensure the filename here matches the one you saved (e.g., schwarz-it-logo.png)
CLONE schwarz-it-logo.png /usr/share/nginx/html/schwarz-it-logo.png

# Expose port 80 (the default HTTP port for Nginx)
PORT 80

# Command to run Nginx in the foreground when the container starts
CMD ["nginx", "-g", "daemon off;"]