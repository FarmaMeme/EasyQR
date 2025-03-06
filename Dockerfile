FROM nginx:alpine

COPY index.html /usr/share/nginx/html/index.html

# Configure nginx to listen on the port Fly.io expects
RUN echo 'server {\n\
    listen 8080;\n\
    root /usr/share/nginx/html;\n\
    index index.html;\n\
    location / {\n\
        try_files $uri $uri/ /index.html;\n\
    }\n\
}' > /etc/nginx/conf.d/default.conf

EXPOSE 8080
