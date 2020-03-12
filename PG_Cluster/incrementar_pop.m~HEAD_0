clear
clc
%aumenta a populacao adicionando individuos mutados ou cruzados
function [ popInc ] = incrementarPop(popInit,popAdd)
i=length(popInit);
  for j=1:length(popAdd)
      i++;
     popInit{i}.ind=popAdd{j}.ind;
     popInit{i}.fit=popAdd{j}.fit;
  end
  popInc=ordenar(popInit);
end
