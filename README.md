# Lazy-RDP
1. Скрипт для автоматического сканирования списка адресов, с последующим выбором метода и запуском перебора пары логин/пароль.
2. Скрипт  настраивался для системы Kali linux 2.0. 
3. Для корректной работы скрипта требуются установленные; masscan, curl и hydra by van Hauser. 
4. В скрипте прописаны пути по умолчанию:                                                                                   
  а. /home/admin/opt/web/rdp_brute/open3389 
  b. /home/admin/opt/web/rdp_brute/users 
  с. /home/admin/opt/web/rdp_brute/dictionary/pass 
5. Так что если у вас другие, делайте в текстовом редакторе поиск и замену на свои.
6. Текущая версия 1.02. Добавлена возможность выбора метода перебора пары логин/пароль. Исправлена ошибка вылета из скрипта, при выборе некоторых стран из списка. Исправлена ошибка с путями.
7. Файлы:
	a. dictionary/pass - файл с паролями, если требуется подставляйте свои файлы/пароли
	b. users - файл с логинами, если требуется, подставляем свои
	с. open3389 - временный файл, содержащий списки IP с открытыми 3389 портами. Перезаписывается при каждом сканировании.
	d. rdp_brute.sh - сам скрипт 
7. Запуск из папки со скриптом через терминал
  a. chmod +x rdp_brute.sh
  b. ./rdp_brute.sh

Google translate.
1. The script automatically scans the address list, and then selecting the method and starting busting pair login / password.
2. The script is tuned for Kali linux 2.0 system.
3. To work correctly, the script requires the establishment; masscan, curl and hydra by van Hauser.
4. The default path is registered in the script:
  a. /home/admin/opt/web/rdp_brute/open3389
  b. /home/admin/opt/web/rdp_brute/users
  c. /home/admin/opt/web/rdp_brute/dictionary/pass
5. So if you have any others, do in a word processor search and replace on your own.
6. The current version is 1.02. Added ability to select the method of sorting the pair login / password. Fixed a crash bug when selecting a script of some countries from the list. Fixed a bug with paths.
7. Starting from the folder with the script through the terminal  
  a. chmod + x rdp_brute.sh
  b. ./rdp_brute.sh
