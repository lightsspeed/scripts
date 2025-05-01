#Write a Dockerfile to serve a static HTML website using Nginx. The HTML files are in a public directory, and the container should expose port 80. Use the official nginx:alpine image and copy only the necessary files.


FROM nginx:alpine

RUN rm -rf /usr/share/nginx/html/*

COPY public/ /usr/share/nginx/html

RUN chmod -R 755 /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]