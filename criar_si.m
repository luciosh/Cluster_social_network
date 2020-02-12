% funcao que criar solucao inicial e a matriz aleatoria de referencia que
% contem a relacao entre as pessoas
clear
clc
function [matrizGrupos,matrizRef] = criarSol(populacao,grupos)
  % criar matriz aleatória com valores de 1 a 3
  matrizRef = randi(3,populacao,populacao);
  % substituir valores aleatorios de 1 a 3 por -1,0,1.
  for i=1:populacao
    for j=1:populacao
      if(j>i)
        if(matrizRef(i,j)==1)
          matrizRef(i,j)=-1;
          matrizRef(j,i)=-1;
        else if(matrizRef(i,j)==2)
                matrizRef(i,j) = 0;
                matrizRef(j,i) = 0;
             else
               matrizRef(i,j) = 1;
               matrizRef(j,i) = 1;
             end
        end
      else if(i==j)
            matrizRef(i,j)=nan;
           end
      endif
    endfor
  endfor
  %display(matrizRef);
  %criar grupos aleatórios
  pessoas=populacao/grupos;
  matrizGrupos=zeros(grupos,pessoas);
  count=2;
  matrizGrupos(1,1)=randi(populacao);
  sorteados(1)=matrizGrupos(1,1);
  for i=1:grupos
    for j=1:pessoas
      while(matrizGrupos(i,j)==0)
        sort = randi(populacao);
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
