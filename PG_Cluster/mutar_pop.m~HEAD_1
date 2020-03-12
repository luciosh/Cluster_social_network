clear
clc
function [ newMut ] = mutarPop(popOrd, txMutacao,tamPopOrd,mRef)
  sorteioMut = randperm(tamPopOrd,txMutacao);
  newMut={};
  for i=1:txMutacao
    newMut{i}.ind = mutarInd(popOrd{i}.ind);
    newMut{i}.fit = verifSol(popOrd{i}.ind,mRef);
  end
end
