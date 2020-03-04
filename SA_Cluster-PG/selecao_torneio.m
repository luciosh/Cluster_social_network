clear
clc
function[selecionados] = torneio(pop,tamSelecao,nSelecionados)

%Selecao por torneio
aux = zeros(1,tamSelecao);
for i=1:tamSelecao
  aux(i) = pop{i}.fit;
end
[aux index] = sort(aux);
popOrd = pop(index);
popOrd

%gerar subpopulacao
sorteio = randperm(length(pop),tamSelecao);
sorteio=sort(sorteio);
subPop = {};
selecionados = {};
for i=1:length(sorteio)
  subPop{i}=popOrd(sorteio(i));
end

for i=1:nSelecionados
  selecionados{i} = subPop{i};
end
