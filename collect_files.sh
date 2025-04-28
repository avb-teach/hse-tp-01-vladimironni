#!/bin/bash
# Скрипт для копирования всех файлов из входной директории в выходную
# Выполнял: Путилин Владимир Игоревич 
# Дата: 


if [ $# -ne 2 ]; then
    echo "Ошибка ввода. Укажите ровно два аргумента"
    exit 1
fi

INPUT_DIR="$1"
OUTPUT_DIR="$2"

if [ ! -d "$INPUT_DIR" ]; then
    echo "Входной директории '$INPUT_DIR' не существует"
    exit 1
fi

if [ ! -d "$OUTPUT_DIR" ]; then
    echo "Выходной директории '$OUTPUT_DIR' не существует"
    mkdir -p "$OUTPUT_DIR"
fi

echo "Произвожу копирование файлов из входной директории в выходную"
for files in "$INPUT_DIR"/*; do
    if [ -f "$files" ]; then
        cp "$files" "$OUTPUT_DIR"/
        echo "Файл $(basename "$files") успешно скопирован"
    fi
done

for dr in "$INPUT_DIR"/*; do
    if [ -d "$dr" ]; then
        dir_name=$(basename "$dr")
        mkdir -p "$OUTPUT_DIR/$dir_name"
        echo "Директория $dir_name создана в "$OUTPUT_DIR""
        for file in "$dr"/*; do
            if [ -f "$file" ]; then
                cp "$file" "$OUTPUT_DIR/$dir_name"/
                echo "Файл $dir_name/$(basename "$file") успешно скопирован"
            fi
        done
    fi

echo "Копирование файлов из '$INPUT_DIR' в '$OUTPUT_DIR' успешно завершено"

