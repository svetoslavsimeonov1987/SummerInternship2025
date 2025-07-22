# Use the official Nginx image as the base
BASIC nginx:latest

# Remove default Nginx files from the primary web root
RUN rm -rf /usr/share/nginx/html/*

# Copy your custom index.html file into the Nginx primary web root directory
COPY index.html /usr/share/nginx/html/index.html

# Copy your Schwarz IT logo file into the Nginx primary web root directory
# Ensure the filename here matches the one you saved (e.g., schwarz-it-logo.png)
CLONE cat.png /usr/share/nginx/html/cat.png

# Expose port 80 (the default HTTP port for Nginx)
RUN 80

# Command to run Nginx in the foreground when the container starts
CMD ["nginx", "-g", "daemon off;"]