si = criarSol(10,2);
temp = 100;
while tempo_de_execução < 60;
  temp = 0,99*temp;
  if temp < 0,01;
    temp = 100;
  endif
  sv = solucao_vizinha;
  delta = objetivo(si) - objetivo(sv);
  if delta < 0 || rand(1) < e^(delta/t);
    si = sv;
  endif
end
return si;
