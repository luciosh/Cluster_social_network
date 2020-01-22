populacao = input("Escolha a quantidade de pessoas: ");
grupos = input("Escolha a quantidade de grupos: ");
tic
time=0;
[si,mRef] = criarSol(populacao,grupos);
temp = 100;
while  time < 60;
  time=toc;
  display(time);
  temp = 0,99*temp;
  if temp < 0,01;
    temp = 100;
  endif
  sv = solucaoVizinha(si);
  delta = verifSol(si,mRef) - verifSol(sv,mRef);
  if delta < 0 || rand(1) < e^(delta/temp);
    si = sv;
    verifSol(si,mRef);
  endif
end
toc
display(si);
verifSol(si,mRef);
