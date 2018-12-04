#!/bin/bash

#nome arthur de oliveira    professor Diego Tumellero  Trabalho g2 bash  data 10/12/2018

#Esse scrypt destinasse a mostrar o funcionamento um scrypt usando os comandos scp e rsync

#Esse menu criado usara diversas opcoes para transferir arquivos de uma maquina remota para um servidor ou de um servidor para outro

#o comando echo cria mensagems na tela para o usuario digitar assim criando um menu usando o comando case

menu(){
    clear

    echo "[1] scp local local"
    echo "[2] scp local remoto"
    echo "[3] scp remoto local"
    echo "[4] scp remoto remoto"
    echo "[5] rsync local remoto"
    echo "[6] rsync remoto local"
    read op
    case "$op" in
    	1) scp_ll ;; #local local
    	2) scp_lr ;; #local remoto
        3) scp_rl ;; #remoto local
	4) scp_rr ;; #remoto remoto
        5) rsync_lr ;; #local remoto
        6) rsync_rl ;; #remoto local
       	*) op_inv ;; #opção inválida
    esac
}
#nesta parte o scrypt identifica qual parte sera utilizada se sera via remoto local ou local remoto e vice e versa

#scp local local
scp_ll(){
	clear
	
	echo "digite o caminho/arquivo de origem"
	read origem

	echo "digite o caminho/arquivo de destino"
	read destino

	scp $origem $destino
}
#scp local remoto
scp_lr(){
        clear
	
	echo "digite o caminho/arquivo de origem"
	read origemlr

        echo "digite o ip/usuario"
        read iprl

	echo "digite o caminho/arquivo de destino"
	read destinolr
        

	scp $origemlr $iprl $destinolr
        
}
#scp remoto local
scp_rl(){

 clear
	
	echo "digite o caminho/arquivo de destino"
	read destinorl

        echo "digite o ip/usuario"
        read iprl

	echo "digite o caminho/arquivo de origem"
	read origemrl
        

	scp $origemrl $iprl $destinorl

}
#scp remoto remoto
scp_rr(){

clear
	
	echo "digite o ip/usuario"
        read iprr

        echo "digite o caminho/arquivo de destino"
	read destinorr

	echo "digite o caminho/arquivo de origem"
	read origemrr
        

	scp $origemrr $iprr $destinorr

}
#rsync local remoto
rsync_lr(){

clear
	
	echo "digite o caminho/arquivo de origem"
	read origemsynclr

        echo "digite o ip/usuario"
        read ipsynclr

	echo "digite o caminho/arquivo de destino"
	read destinosyncrl
        

	rsync $origemsynclr $ipsynclr $destinosyncrl

}
#rsync remoto local
rsync_rl(){

clear
	
	echo "digite o caminho/arquivo de destino"
	read destinosyncrl

        echo "digite o ip/usuario"
        read ipsyncrl

	echo "digite o caminho/arquivo de origem"
	read origemsyncrl
        

	rsync $origemsyncrl $ipsyncrl $destinosyncrl

}

#caso o usuario não opte por nenhuma das opções o scrypt colocar uma mensagem na tela dizendo opção invalida e retornara para o menu principal
op_inv(){
    echo "Opção inválida, retornando ao menu principal"
    read pause
    menu
}

menu