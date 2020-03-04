function [ newPop ] = function(selecionados,tamPop,txCruzamento)
  ind1=selecionado{1};
  ind2=selecionado{2};
  [lin col] = size(ind1);
  qtTrocas = round((randi(3,1)/10)*tamPop)
  x = randperm(lin,qtTrocas);
  y = randperm(col,qtTrocas);
  for i=1:qtTrocas
    for j=1:lin
      [l c] = find(ind2=="valor") 
    end
  end

end
