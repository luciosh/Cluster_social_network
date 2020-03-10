clear
clc
function [ordenado] = ordenar(pop)

%Selecao por torneio
  aux = [];
  for i=1:length(pop)
    aux(i) = pop{i}.fit;
  end
  [aux index] = sort(aux,'descend');
  ordenado = pop(index);
end
