#!/bin/bash

# Перевірка, чи скрипт запущено з правами адміністратора
if [ "$(whoami)" != "root" ]; then

  echo "Для виконання цього скрипту потрібні права адміністратора."

  exit 1

fi

# Перевірка, чи вказано ім'я користувача

if [ -z "$1" ]; then

  echo "Будь ласка, вкажіть ім'я користувача."

  exit 1

fi

# Змінна для ім'я користувача

USERNAME=$1

# Створення користувача

useradd -m -s /bin/bash $USERNAME

# Генерація SSH-ключів для нового користувача

ssh-keygen -t rsa -b 4096 -f /home/$USERNAME/.ssh/id_rsa -N ""

# Надання прав користувачеві на його каталог ssh

chown -R $USERNAME:$USERNAME /home/$USERNAME/.ssh

# Виведення шляху до приватного ключа

echo "SSH-ключі для користувача $USERNAME створено у /home/$USERNAME/.ssh/id_rsa"


