#!/bin/bash
echo "Fazendo backup do servidor do minecraft"
sudo screen -r -X stuff '/stop\n'

export GitConfigDirectory='git config --system safe.directory'
export GitConfigName='git config --system user.name'
export GitConfigEmail='git config --system user.email'
export DATA=$(date +'%d-%m-%Y-%H:%M')

if echo "$($GitConfigDirectory)" | grep -q "*"; 
then 
	echo 'Caminho já configurado!'; 
else 
	echo 'Caminho não configurado, adicionando nas configurações!'; 
	git config --system safe.directory "*"; 
fi

if echo "$($GitConfigName)" | grep -q "Juan Pimentel"; 
then
	echo 'Usuario já configurado!'; 
else
	echo 'Usuário não configurado, adicionando nas configurações!'; 
	git config --system user.name "Juan Pimentel"; 
fi

if echo "$($GitConfigEmail)" | grep -q "juandbpimentel@alu.ufc.br"; 
then
	echo 'Email já configurado!'; 
else
	echo 'Email não configurado, adicionando nas configurações!'; 
	git config --system user.email "juandbpimentel@alu.ufc.br"; 
fi



cd /home/juandbpimentel/github/serverMine

git add .
git commit -m "atualizando servidor com dados do dia $DATA"
git push
