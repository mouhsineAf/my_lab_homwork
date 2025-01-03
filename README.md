# Шифрование файлов и директорий

Этот репозиторий содержит упражнения и решения по шифрованию файлов и директорий с использованием Bash-скриптов. Лабораторная работа демонстрирует, как использовать инструменты `gpg` и `openssl` для шифрования и дешифрования, с пошаговыми инструкциями, скриптами и ресурсами.

---

## **Цели лабораторной работы**
1. Изучить основы шифрования файлов и директорий.
2. Научиться использовать `gpg` для безопасного шифрования и дешифрования файлов.
3. Написать Bash-скрипт для автоматизации задач шифрования нескольких файлов.

---

## **Шаг 1: Шифрование и дешифрование одного файла**

### **Установка необходимых инструментов**
Убедитесь, что `gpg` и `openssl` установлены. Выполните следующую команду для установки:

```bash
sudo apt update
sudo apt install gnupg openssl
```

### **Создание тестового файла**
Создайте текстовый файл с именем `password.txt`:

```bash
echo "This is a sample file for encryption" > password.txt
```

### **Шифрование файла**
Используйте `gpg` для шифрования файла:

```bash
gpg --output password.txt.gpg --symmetric password.txt
```

Вас попросят ввести пароль для шифрования. Сохраните этот пароль в безопасности.

### **Дешифрование файла**
Расшифруйте файл, чтобы проверить шифрование:

```bash
gpg --output password_decrypted.txt --decrypt password.txt.gpg
```

### **Проверка результата**
Убедитесь, что расшифрованный файл совпадает с оригиналом:

```bash
diff password.txt password_decrypted.txt
```

Если различий нет, шифрование и дешифрование выполнены успешно.

---

## **Шаг 2: Автоматизация шифрования с использованием Bash-скрипта**

Напишите Bash-скрипт с именем `encrypt_dir.bash` для автоматизации шифрования и дешифрования файлов в директории.

### **Функциональность скрипта**
- Шифрование всех файлов в директории.
- Дешифрование всех файлов с расширением `.gpg` в директории.
- Вывод сообщений об ошибках при недопустимых вводных данных.

### **Использование скрипта**
1. **Шифрование всех файлов в директории:**
    ```bash
    bash encrypt_dir.bash <directory_path> encrypt
    ```

2. **Дешифрование всех файлов с расширением `.gpg` в директории:**
    ```bash
    bash encrypt_dir.bash <directory_path> decrypt
    ```

3. **Пример использования:**
    ```bash
    bash encrypt_dir.bash test encrypt

    bash encrypt_dir.bash test decrypt
    ```

### **Код скрипта**
Файл `encrypt_dir.bash` включен в этот репозиторий. Вы можете просмотреть или изменить скрипт по своему усмотрению.

---

## **Шаг 3: Ресурсы**
### **Ссылки**
- [GNU Privacy Guard (GPG) Documentation](https://gnupg.org/documentation/)
- [OpenSSL Encryption Guide](https://www.openssl.org/docs/)
- [Bash Scripting Basics](https://linuxhint.com/bash_scripting_tutorial/)

