#!/bin/bash
bc=/usr/bin/bc
# Armazena  a data de expiracao do cert na variavel A
A=`echo | openssl  s_client -connect k8s.zenvia.com:443 2>/dev/null | openssl x509 -noout -dates | tail -1 | tr -s " " |cut -d "=" -f2 | cut -d " " -f1,2,4`
# Converte a data de expiracao para o padrao yyyy-mm-dd e armazena da variavel B
B=`date -d "$A" +%Y-%m-%d`
# Exibe a data atual no padrao yyyy-mm-dd e armazena na variavel C
C=`date +%Y-%m-%d`
# Faz o calculo sem considerar anos bis e fuso horarios e retorna o resultado em dias de quando tempo o certificado tem restante de validade
echo "scale=0;("`date -d "$B" +%s`-`date -d "$C" +%s`")"/24/60/60|$bc
