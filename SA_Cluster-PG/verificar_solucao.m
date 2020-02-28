%funcao que verifica qualidade da solucao encontrada fazendo a soma das relacoes
clear
clc
function [qualidade] = verifSol(solucao,matriz)
  [grupos,tamGp]=size(solucao);
  soma=0;

  for g=1:grupos
    for i=1:tamGp-1
      for j=i+1:tamGp
        soma+=matriz(solucao(g,i),solucao(g,j));
      end
    end
  end
  qualidade=soma;
  %display(soma);
end
