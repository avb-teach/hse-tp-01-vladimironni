#!/bin/bash
# Скрипт для копирования всех файлов из входной директории в выходную
# Выполнял: Путилин Владимир Игоревич 
# Дата: 


if [ $# -ne 2 ]; then
    echo "Ошибка ввода. Укажите два аргумента"
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
        echo "Файл $(basename "$files") скопирован"
    fi
done

echo "Копирование файлов из '$INPUT_DIR' в '$OUTPUT_DIR' успешно завершено"

