#!/bin/bash

# Install Nginx if not already installed
sudo apt-get update
sudo apt-get -y install nginx

# Create necessary directories if they don't exist
sudo mkdir -p /data/web_static/releases/test/
sudo mkdir -p /data/web_static/shared/

# Create a fake HTML file for testing
echo "<html>
<head>
    <title>Test Page</title>
</head>
<body>
    <h1>This is a test page.</h1>
</body>
</html>" | sudo tee /data/web_static/releases/test/index.html >/dev/null

# Create symbolic link and set ownership
sudo ln -sf /data/web_static/releases/test/ /data/web_static/current
sudo chown -R ubuntu:ubuntu /data/

# Update Nginx configuration
config="server {
    listen 80;
    server_name _;

    location /hbnb_static {
        alias /data/web_static/current/;
    }

    location / {
        try_files $uri $uri/ =404;
    }
}"
echo "$config" | sudo tee /etc/nginx/sites-available/default >/dev/null

# Restart Nginx
sudo service nginx restart

