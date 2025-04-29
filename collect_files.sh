#!/bin/bash
# Скрипт для копирования всех файлов из входной директории в выходную
# Выполнял: Путилин Владимир Игоревич 

copy_recursion() {
    local input_dir="$1"
    local output_dir="$2"
    local current_path="$3" 
    mkdir -p "$output_dir"
    
    if [ -n "$current_path" ]; then
        echo "Директория $current_path создана в '$OUTPUT_DIR'"
    fi
    
    for file in "$input_dir"/*; do
        if [ -f "$file" ]; then
            local filename=$(basename "$file")
            local target="$output_dir/$filename"
            if [ -f "$target" ]; then
                cp "$file" "${target}_copy"
                if [ $? -eq 0 ]; then
                    echo "Файл ${current_path:+$current_path/}$filename скопирован как ${filename}_copy"  #если current_path не пуст и вообще существует, подставляем $current_path/. здесь использовал параметрическое расширение bash: "https://www.gnu.org/software/bash/manual/html_node/Shell-Parameter-Expansion.html"; Глава: 3.5.3 Shell Parameter Expansion
                else
                    echo "Ошибка при копировании файла ${current_path:+$current_path/}$filename"
                fi
            else
                cp "$file" "$target"
                if [ $? -eq 0 ]; then
                    echo "Файл ${current_path:+$current_path/}$filename успешно скопирован"
                else
                    echo "Ошибка при копировании файла ${current_path:+$current_path/}$filename"
                fi
            fi
        fi
    done

    for dir in "$input_dir"/*; do
        if [ -d "$dir" ]; then
            local dirname=$(basename "$dir")
            local new_output_dir="$output_dir/$dirname"
            copy_recursion "$dir" "$new_output_dir" "${current_path:+$current_path/}$dirname"
        fi
    done
}


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

echo "Произвожу копирование файлов из входной директории в выходную"

copy_recursion "$INPUT_DIR" "$OUTPUT_DIR"

echo "Копирование файлов из '$INPUT_DIR' в '$OUTPUT_DIR' успешно завершено"

            

