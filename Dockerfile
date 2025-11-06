# ------------------------------------
# STAGE 1: Server Produksi (Paling Sederhana)
# ------------------------------------
# Menggunakan image Nginx yang sangat ringan dan efisien untuk melayani file statis.
FROM nginx:stable-alpine

# Tentukan direktori kerja di dalam container.
# ROOT_DIR adalah tempat semua file HTML, CSS, dan JS Anda berada.
WORKDIR /usr/share/nginx/html

# Salin semua file dari direktori lokal Anda (di mana Dockerfile berada)
# ke direktori root Nginx di dalam container.
# Ini mengasumsikan file Anda (index.html, site.css, app.js, folder images/)
# berada di tingkat yang sama dengan Dockerfile.
COPY . .

# Ekspos port 80, yang merupakan port default Nginx untuk HTTP.
EXPOSE 80

# Perintah default Nginx untuk dijalankan saat container dimulai.
# Nginx akan melayani file-file yang telah disalin di atas.
CMD ["nginx", "-g", "daemon off;"]