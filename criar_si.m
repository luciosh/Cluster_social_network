clear
clc
function [matrizGrupos] = criarSol(populacao,grupos)
  %criar matriz aleatória
  matriz = randi(3,populacao,populacao);
  %substituir valores aleatorios por -1,0,1.
  for i=1:populacao
    for j=1:populacao
      if(j>i)
        if(matriz(i,j)==1)
          matriz(i,j)=-1;
        else if(matriz(i,j)==2)
                matriz(i,j) = 0;
             else
               matriz(i,j) = 1;
             end
        end
      else
        matriz(i,j)=nan;
      endif
    endfor
  endfor
  %display(matriz);
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
      %display(matrizGrupos);
    endfor
  endfor
end
