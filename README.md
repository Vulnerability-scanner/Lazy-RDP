# Lazy-RDP
- Скрипт для автоматического сканирования списка адресов на наличие открытых RDP-портов, с последующим выбором метода и запуском перебора пары логин/пароль. <br/>

- Скрипт  настраивался для систем Kali linux 2.0, Kali linux 2016.2 и Kali linux 2017.1. <br/>

- Для корректной работы скрипта требуются установленные: masscan, curl и <s>hydra by van Hauser</s> FreeRDP. <br/>

- Текущая версия 1.14. Добавлена возможность указания сканируемого порта (можно указать один или несколько портов через запятую или дефис). Исправлена ошибка вылета из скрипта при выборе некоторых стран из списка. Добавлен английский язык. <s>Исправлен баг с брутфорсом.</s> Полностью поменял инструмент для брутфорса. Добавлена функция автоматического определения языка ОС. Оптимизирован код скрипта. Добавил автоматическую установку и настройку зависимостей (freerdp-X11, masscan) для работы в "SANA" и "ROLLING"  <br/>

- Установка зависимостей вручную <br/>
        
        sudo apt-get update -y && apt-get upgrade -y && apt-get install freerdp-x11 libfreerdp-plugins-standard
        sudo apt-get install masscan -y

- Установка <br/>

        git clone https://github.com/getdrive/Lazy-RDP

- Запуск скрипта <br/>
  
        chmod +x rdp_brute.sh patator.py

        ./rdp_brute.sh


# Google translate

- Script for automatic scanning of the address list for the presence of open 3389 ports, and then selecting the method and starting busting pair login / password. <br/>

- The script is tuned for Kali linux 2.0, Kali linux 2016.2 и Kali linux 2017.1 systems. <br/>

- To work correctly, the script requires the establishment: masscan, curl and <s>hydra by van Hauser</s> FreeRDP.<br/>

- The current version is 1.14. The ability to specify a scanned port (you can specify one or more ports separated by a comma or a hyphen). Fixed a crash bug when selecting a script of some countries from the list. Fixed a bug with incorrect paths. Added English. <s>Fixed a bug with brute force menu.</s> Completely changed the tool to brute force. Added function to automatically detect the operating system language. Optimized script code. Added automatic installation and configuration dependencies (freerdp-X11, masscan) to work correctly in the "SANA" and "ROLLING" <br/>

- Installing dependencies manually <br/>
        
        sudo apt-get update -y && apt-get upgrade -y && apt-get install freerdp-x11 libfreerdp-plugins-standard
        sudo apt-get install masscan -y

- Setting <br/>

        git clone https://github.com/getdrive/Lazy-RDP 

- Running the script <br/>

        chmod +x rdp_brute.sh patator.py

        ./rdp_brute.sh
        
# Disclaimer

  Этот сценарий должен использоваться только для образовательных целей и тестирования.<br/>
  Используйте его только на собственных сетях.<br/>
  Автор не несет ответственности за его использование.<br/>

  This script must be used only for educational purposes and Pentesting.<br/>
  Use it only on your own networks.<br/>
  Author is not responsible of its use.<br/>

# Supported Languages

 Russian & English.
