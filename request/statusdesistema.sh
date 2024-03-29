#!/bin/bash
declare -A cor=( [0]="\033[1;37m" [1]="\033[1;34m" [2]="\033[1;31m" [3]="\033[1;33m" [4]="\033[1;32m" )
barra="\033[0m\e[34m======================================================\033[1;37m"
SCPdir="/etc/newadm" && [[ ! -d ${SCPdir} ]] && exit 1
SCPfrm="/etc/ger-frm" && [[ ! -d ${SCPfrm} ]] && exit
SCPinst="/etc/ger-inst" && [[ ! -d ${SCPinst} ]] && exit
SCPidioma="${SCPdir}/idioma" && [[ ! -e ${SCPidioma} ]] && touch ${SCPidioma}

#Repositorio-GITHUB
mkdir /etc/ger-tools > /dev/null 2>&1
link_bin="https://raw.githubusercontent.com/AAAAAEXQOSyIpN2JZ0ehUQ/ADM-ULTIMATE-NEW-FREE/master/Install/ger-tools/htop.sh"
[[ ! -e /etc/ger-tools/htop.sh ]] && wget -O /etc/ger-tools/htop.sh ${link_bin} > /dev/null 2>&1 && chmod +x /etc/ger-tools/htop.sh
link_bin="https://raw.githubusercontent.com/AAAAAEXQOSyIpN2JZ0ehUQ/ADM-ULTIMATE-NEW-FREE/master/Install/ger-tools/nload.sh"
[[ ! -e /etc/ger-tools/nload.sh ]] && wget -O /etc/ger-tools/nload.sh ${link_bin} > /dev/null 2>&1 && chmod +x /etc/ger-tools/nload.sh
link_bin="https://raw.githubusercontent.com/AAAAAEXQOSyIpN2JZ0ehUQ/ADM-ULTIMATE-NEW-FREE/master/Install/ger-tools/visorpuertos.sh"
[[ ! -e /etc/ger-tools/visorpuertos.sh ]] && wget -O /etc/ger-tools/visorpuertos.sh ${link_bin} > /dev/null 2>&1 && chmod +x /etc/ger-tools/visorpuertos.sh
link_bin="https://raw.githubusercontent.com/AAAAAEXQOSyIpN2JZ0ehUQ/ADM-ULTIMATE-NEW-FREE/master/Install/ger-tools/nettools"
[[ ! -e /etc/ger-tools/nettools ]] && wget -O /etc/ger-tools/nettools ${link_bin} > /dev/null 2>&1 && chmod +x /etc/ger-tools/nettools

fun_bar () {
comando="$1"
 _=$(
$comando > /dev/null 2>&1
) & > /dev/null
pid=$!
while [[ -d /proc/$pid ]]; do
echo -ne " \033[1;33m["
   for((i=0; i<10; i++)); do
   echo -ne "\033[1;31m##"
   sleep 0.2
   done
echo -ne "\033[1;33m]"
sleep 1s
echo
tput cuu1
tput dl1
done
echo -e " \033[1;33m[\033[1;31m####################\033[1;33m] - \033[1;32m100%\033[0m"
sleep 1s
}

msg -ama "$(fun_trans "STATUS DE SISTEMA") ${cor[4]}[NEW-ADM]"
echo -e "$barra"
echo -ne "\033[1;32m [1] > " && msg -azu "$(fun_trans "TRAFICO DE RED NLOAD")"
echo -ne "\033[1;32m [2] > " && msg -azu "$(fun_trans "PROCESOS DEL SISTEMA HTOP")"
echo -ne "\033[1;32m [3] > " && msg -azu "$(fun_trans "INFORMACION DE SISTEMAS Y PUERTOS")"
echo -ne "\033[1;32m [4] > " && msg -azu "$(fun_trans "NET TOOLS TARGET")"
echo -ne "\033[1;32m [0] > " && msg -bra "$(fun_trans "VOLTAR")"
echo -e "$barra"
while [[ ${arquivoonlineadm} != @(0|[1-4]) ]]; do
read -p "Selecione a Opcao: " arquivoonlineadm
tput cuu1 && tput dl1
done
case $arquivoonlineadm in
0)exit;;
1)/etc/ger-tools/nload.sh;;
2)/etc/ger-tools/htop.sh;;
3)/etc/ger-tools/visorpuertos.sh;;
4)/etc/ger-tools/nettools;;
esac
msg -bar