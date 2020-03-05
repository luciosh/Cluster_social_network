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
ordenar_pop

clear
clc
%Input de dados
amostra = input("Escolha a quantidade de pessoas: ");
grupos = input("Escolha a quantidade de grupos: ");
tamPop = input("Escolha o tamanho da populacao inicial: ");
txCruzamento = input("Escolha taxa de cruzamento: ");
tamSelecao = round(tamPop/4);

if mod(txCruzamento,2) == 1
 txCruzamento+=1;
end

%Inicio de contagem de tempo de execucao
tic
time=0;

%Criar matriz de referencia e populacao inicial
[mRef] = criarMref(amostra,grupos);
[pop] = criarPop(amostra,grupos,tamPop,mRef);

%criterio de parada

%selecao torneio
nSelecionados = 2;
popOrd = ordenar(pop);
selecionados = torneio(pop,popOrd,tamSelecao,nSelecionados);
%Cruzamento entre selecionados
popCrz = cruzamento(selecionados,tamPop,txCruzamento,mRef);

%adicionar cruzamento a populacao
 i=length(popOrd);
 for j=1:length(popCrz)
     i++;
    popOrd{i}.ind=popCrz{j}.ind;
    popOrd{i}.fit=popCrz{j}.fit;
 end
 popOrd=ordenar(popOrd);
