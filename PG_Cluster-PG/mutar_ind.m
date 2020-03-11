%funcao que gera solucao vizinha trocando 2 tamGp de grupo.
%o parametro recebido é a matriz dos grupos mG
clear
clc
function [sv] = mutarInd(mG)
  %vetor que recebe quantidade de grupos e de tamGp
  [p,~] = size(mG);
  [grupos,tamGp] = size(mG);
  mutacao = round(0.20*p);
  for i=1:mutacao
    %criar vetor com 2 posicoes
    Gsort=zeros(1,2);
    %sortear grupos em que as tamGp serao trocadas ate que sejam grupos diferentes
    while(Gsort(1)==Gsort(2))
      Gsort=randi(grupos,1,2);
    end
    %sortear posicao de tamGp que serao trocadas de grupo
    Psort=randi(tamGp,1,2);
  %fazer a troca de grupos
    aux=mG(Gsort(1),Psort(1));
    mG(Gsort(1),Psort(1))=mG(Gsort(2),Psort(2));
    mG(Gsort(2),Psort(2))=aux;
  end
  %atribuir nova matriz de grupos ao retorno solucao vizinha (sv)
  sv=mG;
end
