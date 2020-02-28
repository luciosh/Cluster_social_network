clear
clc
function [matrizGrupos,matrizRef] = criarMref(amostra,grupos)
  % criar matriz aleatória com valores de 1 a 3
  matrizRef = randi(3,amostra,amostra);
  % substituir valores aleatorios de 1 a 3 por -1,0,1.
  for i=1:amostra
    for j=1:amostra
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
