%funcao que verifica qualidade da solucao encontrada fazendo a soma das relacoes
function [qualidade] = verifSol(solucao,matriz)
  [grupos,pessoas]=size(solucao);
  soma=0;
  for g=1:grupos
    for i=1:pessoas-1
      for j=i+1:pessoas
        soma+=matriz(solucao(g,i),solucao(g,j));
      end
    end
  end
  qualidade=soma;
  %display(soma);
end
