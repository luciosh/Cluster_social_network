%Arquivo para ser usado nos testes do processo de implementacao
criar_mat_ref
criar_pop
verificar_solucao
clear
clc

%Input de dados
amostra = input("Escolha a quantidade de pessoas: ");
qtGrupos = input("Escolha a quantidade de grupos: ");
[mRef] = criarMref(amostra,qtGrupos);
tamPop = 5;
[pop] = criarPop(amostra,qtGrupos,tamPop,mRef);
