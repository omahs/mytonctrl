#!/bin/bash
set -e

# Проверить sudo
if [ "$(id -u)" != "0" ]; then
	echo "Please run script as root"
	exit 1
fi

# Get arguments
config="https://ton-blockchain.github.io/global.config.json"
while getopts c: flag
do
	case "${flag}" in
		c) config=${OPTARG};;
	esac
done

# Цвета
COLOR='\033[95m'
ENDC='\033[0m'

#
BIN_DIR=/usr/bin/ton
DB_DIR=/var/ton-storage/db

# Компилируем из исходников
cd ${BIN_DIR}
make storage-daemon storage-daemon-cli

# Скачиваем конфигурационные файлы
echo -e "${COLOR}[5/6]${ENDC} Downloading config files"
mkdir -p ${DB_DIR} && cd ${DB_DIR}
wget ${config} -O global.config.json














