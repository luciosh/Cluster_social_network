tic
time=0;
[si,mRef] = criarSol(10,2);
temp = 100;
while  time < 60;
  time=toc;
  temp = 0,99*temp;
  if temp < 0,01;
    temp = 100;
  endif
  sv = solucaoVizinha(si);
  delta = verifSol(si,mRef) - verifSol(sv,mRef);
  if delta < 0 || rand(1) < e^(delta/temp);
    si = sv;
  endif
end
toc
display(si);
