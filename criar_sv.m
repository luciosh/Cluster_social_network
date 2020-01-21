clear
clc
function [sv] = solucaoVizinha(mG)
  [grupos,pessoas] = size(mG);
  display(mG);
  %sortear grupos
  Gsort=zeros(1,2);
  while(Gsort(1)==Gsort(2))
    Gsort=randi(grupos,1,2);
  end
  %sortear pessoas
  Psort=randi(pessoas,1,2);

  aux=mG(Gsort(1),Psort(1));
  mG(Gsort(1),Psort(1))=mG(Gsort(2),Psort(2));
  mG(Gsort(2),Psort(2))=aux;
  sv=mG;
end
