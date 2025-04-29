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
                cp "$file" "${target}_+"
                if [ $? -eq 0 ]; then
                    echo "Файл ${current_path:+$current_path/}$filename скопирован как ${filename}_+"  #если current_path не пуст и вообще существует, подставляем $current_path/. здесь использовал параметрическое расширение bash: "https://www.gnu.org/software/bash/manual/html_node/Shell-Parameter-Expansion.html"; Глава: 3.5.3 Shell Parameter Expansion
                else
                    echo "Ошибка при копировании файла ${current_path:+$current_path/}$filename"
                fi



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


    echo "Копирование файлов из '$INPUT_DIR' в '$OUTPUT_DIR' успешно завершено"
}
            

