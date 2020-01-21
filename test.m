tic
time=toc;
clear
clc
[mGrupos,mRef] = criarSol(4,2);
qualidade=verifSol(mGrupos,mRef);
display(time);
toc
