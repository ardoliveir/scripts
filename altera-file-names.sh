# script que faz find sequencial por nome de arquivo renomeando os mesmo utlizando um sed
#!/bin/bash 
find . -name 'digite aqui a expressao para filtrar o arquivo a ser alterado' | while read arquivo
do 
    alvo=`echo "$arquivo" | sed 's/?//g'`  
    echo "Renomeando '$arquivo' para '$alvo'"
    mv "$arquivo" "$alvo"
done
