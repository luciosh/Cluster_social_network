% funcao que criar solucao inicial e a matriz aleatoria de referencia que
% contem a relacao entre as tamGp
clear
clc
function[pop] = criarPop(amostra,grupos,tamPop,mRef)
  %criar grupos aleatórios
  tamGp=amostra/grupos;

  pop={};
  for iter=1:tamPop
    iter
    matrizGrupos=zeros(grupos,tamGp);
    sorteados=zeros();
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
    iter
    pop(1,iter)=matrizGrupos;
    pop(2,iter)=verifSol(matrizGrupos,mRef);
    iter
  endfor
  display(pop);
end
