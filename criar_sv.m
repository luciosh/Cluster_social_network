%funcao que gera solucao vizinha trocando 2 pessoas de grupo.
%o parametro recebido é a matriz dos grupos mG
clear 
clc
function [sv] = solucaoVizinha(mG)
  %vetor que recebe quantidade de grupos e de pessoas
  [grupos,pessoas] = size(mG);
  %display(mG);
  %criar vetor com 2 posicoes
  Gsort=zeros(1,2);
  %sortear grupos em que as pessoas serao trocadas ate que sejam grupos diferentes
  while(Gsort(1)==Gsort(2))
    Gsort=randi(grupos,1,2);
  end
  %sortear posicao de pessoas que serao trocadas de grupo
  Psort=randi(pessoas,1,2);

%fazer a troca de grupos
  aux=mG(Gsort(1),Psort(1));
  mG(Gsort(1),Psort(1))=mG(Gsort(2),Psort(2));
  mG(Gsort(2),Psort(2))=aux;

  %atribuir nova matriz de grupos ao retorno solucao vizinha (sv)
  sv=mG;
end
