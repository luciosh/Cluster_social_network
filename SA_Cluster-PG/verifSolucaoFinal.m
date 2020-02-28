%funcao que verifica qualidade da solucao encontrada fazendo a soma das relacoes
clear
clc
function [qualidade,rb,rn,rr] = verifSolF(solucao,matriz)
  [grupos,tamGp]=size(solucao);
  soma=0;
  rb=0;
  rn=0;
  rr=0;
  for g=1:grupos
    for i=1:tamGp-1
      for j=i+1:tamGp
        if(matriz(solucao(g,i),solucao(g,j))==-1)
          rr++;
        endif
        if(matriz(solucao(g,i),solucao(g,j))==0)
          rn++;
        endif
        if(matriz(solucao(g,i),solucao(g,j))==1)
          rb++;
        endif
        soma+=matriz(solucao(g,i),solucao(g,j));
      end
    end
  end
  qualidade=soma;
  %display(soma);
end
