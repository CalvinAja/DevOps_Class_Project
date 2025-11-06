# # Dockerfile minimal yang seharusnya aman dari masalah permission
# FROM nginx:stable-alpine
# COPY . /usr/share/nginx/html
# EXPOSE 80
# CMD ["nginx", "-g", "daemon off;"]

# (Jika Anda memiliki ENTRYPOINT kustom, letakkan di tahap ini)

FROM nginx:stable-alpine 

# Instal dos2unix (tool untuk mengkonversi line endings)
RUN apk add --no-cache dos2unix

# (Langkah COPY assets Anda di sini, misalnya:)
COPY . /usr/share/nginx/html

# 🚨 Perbaiki semua skrip shell di image (ENTRYPOINT bawaan atau kustom)
# Jika skrip entrypoint bawaan Nginx yang bermasalah, ini akan memperbaikinya
# Jika skrip kustom Anda yang bermasalah, Anda juga bisa menambahkan baris COPY dan chmod di sini
RUN find / -type f -print0 | xargs -0 dos2unix

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]