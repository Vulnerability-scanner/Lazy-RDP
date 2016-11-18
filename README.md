# Lazy-RDP
- Скрипт для автоматического сканирования списка адресов, с последующим выбором метода и запуском перебора пары логин/пароль. <br/>

- Скрипт  настраивался для систем Kali linux 2.0 и Kali linux 2016.2. <br/>

- Для корректной работы скрипта требуются установленные: masscan, curl и <s>hydra by van Hauser</s> FreeRDP. <br/>

- Текущая версия 1.11 beta. Добавлена возможность выбора метода перебора пары логин/пароль. Исправлена ошибка вылета из скрипта при выборе некоторых стран из списка. Исправлена ошибка с путями. Добавлен английский язык. <s>Исправлен баг с брутфорсом.</s> Полностью поменял инструмент для брутфорса. Добавлена функция автоматического определения языка ОС. Оптимизирован код скрипта. Добавил автоматическую установку и настройку зависимостей (freerdp-X11) для работы в "SANA" и "ROLLING"  <br/>

- Установка <br/>

        git clone https://github.com/getdrive/Lazy-RDP

- Запуск из папки со скриптом через терминал <br/>
  
        chmod +x rdp_brute.sh

        ./rdp_brute.sh


# Google translate

- The script automatically scans the address list, and then selecting the method and starting busting pair login / password. <br/>

- The script is tuned for Kali linux 2.0 and Kali linux 2016.2 systems. <br/>

- To work correctly, the script requires the establishment: masscan, curl and <s>hydra by van Hauser</s> FreeRDP.<br/>

- The current version is 1.11beta. Added ability to select the method of sorting the pair login / password. Fixed a crash bug when selecting a script of some countries from the list. Fixed a bug with incorrect paths. Added English. <s>Fixed a bug with brute force menu.</s> Completely changed the tool to brute force. Added function to automatically detect the operating system language. Optimized script code. Added automatic installation and configuration dependencies (freerdp-X11) to work correctly in the "SANA" and "ROLLING" <br/>

- Setting <br/>

        git clone https://github.com/getdrive/Lazy-RDP 

- Starting from the folder with the script through the terminal <br/>

        chmod + x rdp_brute.sh

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
