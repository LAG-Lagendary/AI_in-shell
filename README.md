Использование pipx (альтернативный, более чистый способ)

Если вы хотите установить Python-утилиту, чтобы она была доступна глобально, но при этом не засоряла системные пакеты, используйте pipx.

Установите pipx через apt (в новых версиях Kali он может быть предустановлен):

bash

sudo apt install pipx -y


Добавьте каталог pipx в $PATH, если это не произошло автоматически:

bash

pipx ensurepath


Чтобы установить CLI для Hugging Face через pipx, используйте следующую команду, указав имя правильного пакета:

bash

pipx install "huggingface_hub[cli]"

First, install curl using the package manager. The prompt correctly suggests using apt.

bash

sudo apt install curl

Instead of piping to sh, pipe the script to bash so it is executed with the correct interpreter. This will resolve the syntax error.

bash

curl -fsSL https://ollama.com/install.sh | bash


После установки нужно скачать языковую модель. Вы можете выбрать любую из доступных на сайте Ollama. Для примера мы будем использовать llama3, одну из самых популярных и эффективных моделей.

bash

ollama run llama3

Use Ctrl + d or /bye to exit.

/bye



Создание кастомной команды shull
Для того чтобы обращаться к модели, как к системной команде, нужно создать скрипт и настроить для него alias.
Создание скрипта

Откройте текстовый редактор и создайте файл, например, с именем ollama_cli.sh.

bash

nano ~/ollama_cli.sh

Вставьте в него следующий код, который будет передавать ваш запрос модели, а затем выводить ответ:
bash

#!/bin/bash

# Объединяем все аргументы в одну строку
PROMPT=$(printf "%s " "$@")

# Отправляем запрос в Ollama и выводим только сгенерированный текст
ollama run llama3 "$PROMPT"

Сохраните файл и закройте редактор (Ctrl+X, затем Y и Enter).

Сохраните файл и закройте редактор (Ctrl+X, затем Y и Enter).

Предоставление прав на выполнение
Сделайте скрипт исполняемым:
bash

chmod +x ~/ollama_cli.sh

Настройка алиаса
Теперь создадим алиас, чтобы вызывать скрипт командой shull.

Откройте файл конфигурации вашего шелла (например, .bashrc для Bash или .zshrc для Zsh):

bash

nano ~/.bashrc  # или nano ~/.zshrc

В самый конец файла добавьте следующую строку, которая создаст алиас shull для нашего скрипта:
bash

alias shull="~/ollama_cli.sh"


Сохраните файл и закройте редактор.(Ctrl+X, затем Y и Enter).

Обновите конфигурацию шелла, чтобы изменения вступили в силу:
bash

source ~/.bashrc  # или source ~/.zshrc

Использование команды shull
Теперь вы можете обращаться к своей локальной ИИ-модели прямо из терминала.
Примеры:

    bash

shull "Напиши небольшой bash скрипт для бэкапа папки"

    bash

shull "Объясни, как работает алгоритм SHA-256"

    bash

shull "Придумай шутку про терминал и Linux"


Это позволит вам использовать Ollama, как будто это ещё одна системная утилита, которая всегда под рукой.











