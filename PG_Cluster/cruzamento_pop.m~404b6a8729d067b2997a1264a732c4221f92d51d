clear
clc
function [ newCrz ] = cruzamento(selecionados,tamPop,txCruzamento,mRef)
  ind1=selecionados{1}.ind;
  ind2=selecionados{2}.ind;
  [lin col] = size(ind1);
  %definir quantidade de trocas a cada cruzamento
  qtTrocas = round((randi(3,1)/10)*tamPop);
  while qtTrocas>col
    qtTrocas=qtTrocas-1;
  end
  %cruzamentos do individuo1
    x = 1;
  for crz=1:(txCruzamento/2)
    y = randperm(col,qtTrocas);
    for i=1:qtTrocas
        if(x==lin)
          x=1;
        endif
        elementoTroca = ind1(x,y(i));
        [l c] = find(ind2==elementoTroca);
        aux=ind2(x,y(i));
        ind2(x,y(i))=ind2(l,c);
        ind2(l,c)=aux;
        x++;
    end
    newCrz{crz}.ind = ind2;
    newCrz{crz}.fit = verifSol(ind2,mRef);
  endfor
  %cruzamentos do individuo2
  x = 1;
  for crz=crz+1:txCruzamento
    y = randperm(col,qtTrocas);
    for i=1:qtTrocas
        if(x==lin)
          x=1;
        endif
        elementoTroca = ind2(x,y(i));
        [l c] = find(ind1==elementoTroca);
        aux=ind1(x,y(i));
        ind1(x,y(i))=ind1(l,c);
        ind1(l,c)=aux;
        x++;
    end
    newCrz{crz}.ind = ind1;
    newCrz{crz}.fit = verifSol(ind1,mRef);
  endfor
  newCrz=ordenar(newCrz);
end
