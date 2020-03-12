 clear
 clc
function [ popAtt ] = atualizarPop(pop,tamPop)
  for i=1:tamPop
    popAtt{i}.ind = pop{i}.ind;
    popAtt{i}.fit = pop{i}.fit;
  end
end
