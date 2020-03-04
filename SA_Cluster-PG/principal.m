% O problema resolvido no trabalho foi a clusterização de um grupo de pessoas,
% visando otimizar a produtividade, buscando a melhor organização de forma qualidade
% pessoas com boas relações trabalhem no mesmo grupo.
% O método: as relações foram representadas como: -1 - relação negativa;
% 0 - relação neutra, 1 - relação positiva.
% a método de busca utilizado foi o Simulated Annealing.
% Autores: Sérgio e Jadson
% srg.lcns@gmail.com
criar_pop
criar_mat_ref
selecao_torneio
verificar_solucao
verifSolucaoFinal
cruzamento_pop

clear
clc
%Input de dados
amostra = input("Escolha a quantidade de pessoas: ");
grupos = input("Escolha a quantidade de grupos: ");
tamPop = input("Escolha o tamanho da populacao inicial: ");
tamSelecao = 10;

%Inicio de contagem de tempo de execucao
tic
time=0;

%Criar matriz de referencia e populacao inicial
[mRef] = criarMref(amostra,grupos);
[pop] = criarPop(amostra,grupos,tamPop,mRef);

%criterio de parada

%selecao torneio
nSelecionados = 2;
selecionados = torneio(pop,tamSelecao,nSelecionados);

%Cruzamento entre selecionados
popCrz = cruzamento(selecionados,tamPop,1,mRef);
