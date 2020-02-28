% funcao que criar solucao inicial e a matriz aleatoria de referencia que
% contem a relacao entre as tamGp
clear
clc
function [matrizGrupos,matrizRef] = criarPop(amostra)
  %criar grupos aleatórios
  tamGp=amostra/grupos;
  matrizGrupos=zeros(grupos,tamGp);
  count=2;
  matrizGrupos(1,1)=randi(amostra);
  sorteados(1)=matrizGrupos(1,1);
  for i=1:grupos
    for j=1:tamGp
      while(matrizGrupos(i,j)==0)
        sort = randi(amostra);
        if(length(find(sorteados==sort))==0)
          sorteados(count)=sort;
          matrizGrupos(i,j)=sort;
        endif
      end
      count++;
    endfor
  endfor
  %display(matrizGrupos);
end
