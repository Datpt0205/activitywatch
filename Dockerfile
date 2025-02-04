# Sử dụng Python làm base image
FROM python:3.10-slim

LABEL maintainer="Phung Tat Dat <phungdat020501@gmail.com>"

# Cài đặt các công cụ cần thiết
RUN apt-get update && apt-get install -y git && rm -rf /var/lib/apt/lists/*

# Tạo thư mục làm việc
WORKDIR /app

# Sao chép mã nguồn vào container
COPY . /app/activitywatch

# Cài đặt dependencies bằng Poetry
RUN pip install poetry && poetry install

# EXPOSE: Mở cổng cho ActivityWatch Server
EXPOSE 5600

# # Chạy các watcher trước khi chạy server
# CMD poetry run aw-watcher-afk & poetry run aw-watcher-window & poetry run aw-server
