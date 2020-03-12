clear
clc
function [selecionados] = torneio(pop,popOrd,tamSelecao,nSelecionados)
%Selecao por torneio
%gerar subpopulacao sorteio
sorteio = randperm(length(pop),tamSelecao);
sorteio=sort(sorteio);
subPop = {};
selecionados = {};
for i=1:length(sorteio)
  subPop{i}.ind=popOrd{sorteio(i)}.ind;
  subPop{i}.fit=popOrd{sorteio(i)}.fit;
end

%selecionar 2 melhores da subpopulacao
for i=1:nSelecionados
  selecionados{i}.ind = subPop{i}.ind;
  selecionados{i}.fit = subPop{i}.fit;

end
