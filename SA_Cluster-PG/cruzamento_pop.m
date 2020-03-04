clear
clc
function [ newCrz ] = cruzamento(selecionados,tamPop,txCruzamento,mRef)
  ind1=selecionados{1}
  ind2=selecionados{2};
  [lin col] = size(ind1);
  qtTrocas = round((randi(3,1)/10)*tamPop)
  x = randperm(qtTrocas,lin)
  y = randperm(qtTrocas,col)
  newCrz={};
  for i=1:qtTrocas
    for j=1:lin
      elementoTroca = ind1{1}.ind(x(j),y(j));
      [l c] = find(ind2==elementoTroca)
      aux=ind2{1}.ind(x(j),y(j));
      ind2{1}.ind(x(j),y(j))=ind2(l,c);
      ind2{1}.ind(x(j),y(j))=aux;
    end
  end
  newCrz{1}.ind = ind2;
  newCrz{1}.fit = verifSol(ind2,mRef)
end
