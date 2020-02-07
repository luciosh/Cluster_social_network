% O problema resolvido no trabalho foi a clusterização de um grupo de pessoas,
% visando otimizar a produtividade, buscando a melhor organização de forma qualidade
% pessoas com boas relações trabalhem no mesmo grupo.
% O método: as relações foram representadas como: -1 - relação negativa;
% 0 - relação neutra, 1 - relação positiva.
% a método de busca utilizado foi o Simulated Annealing.
% Autores: Sérgio e Jadson
% srg.lcns@gmail.com
populacao = input("Escolha a quantidade de pessoas: ");
grupos = input("Escolha a quantidade de grupos: ");
tic
time=0;
[si,mRef] = criarSol(populacao,grupos);
sf=si;
temp = 100;
cont=1;
countf=1;
vetorsf=[];
vetorsi=[];
while  time < 3;
  time=toc;
  %display(time);
  temp = 0.99*temp;
  if temp < 0.01
    temp = 100;
  endif
  sv = solucaoVizinha(si);
  delta = verifSol(si,mRef) - verifSol(sv,mRef);
  if delta < 0 || rand(1) < e^(-delta/temp)
    si = sv;
    verifSol(si,mRef);
  endif
  if verifSol(sf,mRef)<verifSol(si,mRef)
    sf=si;
    countf=cont;
  end
  %display([num2str(cont)," - ",num2str(verifSol(si,mRef))]);
  vetorsi(cont)=verifSol(si,mRef);
  vetorsf(cont)=verifSol(sf,mRef);
  cont++;

end
toc
display(sf);
display([num2str(countf)," - ",num2str(verifSol(sf,mRef))]);

plot(vetorsi);
hold on;
plot(vetorsf);
