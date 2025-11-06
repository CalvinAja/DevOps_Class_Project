# Dockerfile minimal yang seharusnya aman dari masalah permission
FROM nginx:stable-alpine
COPY . /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]