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
verif_solucao_final
cruzamento_pop
ordenar_pop
mutar_pop
mutar_ind
incrementar_pop
atualizar_pop
tic
clear
clc
%Input de dados
amostra = input("Escolha a quantidade de pessoas: ");
grupos = input("Escolha a quantidade de grupos: ");
tamPop = input("Escolha o tamanho da populacao inicial: ");
txCruzamento = round((25/100)*tamPop); %aumento pop apos cruzamento
tamSelecao = round((15/100)*tamPop); %selecao torneio


if mod(txCruzamento,2) == 1
 txCruzamento+=1;
end

%Criar matriz de referencia e populacao inicial
%[mRef] = criarMref(amostra,grupos);
load("matrizReferenciaFixa.m");
mRef = mRef;
%[mRef] = criarMref(amostra,grupos);
[pop] = criarPop(amostra,grupos,tamPop,mRef);

campeao{1}.fit = pop{1}.fit;
campeao{1}.ind = pop{1}.ind;

stableMax = 1000;
stable=0;
geracoes=1;
historicoPop1 = [];
while (stable<stableMax)
  popOrd = ordenar(pop);
  %criterio de parada
  if(pop{1}.fit>campeao{1}.fit)
    campeao{1}.fit = pop{1}.fit;
    campeao{1}.ind = pop{1}.ind;
    stable = 0;
  else
    stable++;
  end
  %selecao torneio
  nSelecionados = 2;
  selecionados = torneio(pop,popOrd,tamSelecao,nSelecionados);
  %Cruzamento entre selecionados
  popCrz = cruzamento(selecionados,tamPop,txCruzamento,mRef);

  %adicionar cruzamento a populacao
   popOrd = incrementarPop(popOrd,popCrz);
   [~,tamPopOrd] = size(popOrd);
   txMutacao = round((10/100)*tamPopOrd); %quantidade de mutacoes que serao feitas
   popMut = mutarPop(popOrd,txMutacao,tamPopOrd,mRef);
   popOrd = incrementarPop(popOrd,popMut);

   %atualizar populacao
   popAt = atualizarPop(popOrd,tamPop);
   pop=popAt;
   historicoPop1(geracoes) = pop{1}.fit;
   geracoes++;
end
geracoes
campeao
verifSolF(campeao{1}.ind,mRef);
plot(historicoPop1);
toc
