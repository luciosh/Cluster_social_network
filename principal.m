% O problema resolvido no trabalho foi a clusterização de um grupo de pessoas,
% visando otimizar a produtividade, buscando a melhor organização de forma qualidade
% pessoas com boas relações trabalhem no mesmo grupo.
% O método: as relações foram representadas como: -1 - relação negativa;
% 0 - relação neutra, 1 - relação positiva.
% a método de busca utilizado foi o Simulated Annealing.
% Autores: Sérgio e Jadson
% srg.lcns@gmail.com
criar_si
criar_sv
verificarSolucao
verifSolucaoFinal
clear
clc
%Input de dados
populacao = input("Escolha a quantidade de pessoas: ");
grupos = input("Escolha a quantidade de grupos: ");

%Inicio de contagem de tempo de execucao
tic
time=0;

%Criar solucao inicial
[si,mRef] = criarSol(populacao,grupos);
load("matrizReferenciaFixa.m");
mRef = mRef;
[mRef] = criarMref(populacao,grupos);
sf=si;
%Inicializao de variavel temperatura
temp = 100;
%Inicializacao: Contador de estados passados e melhores solucoes,
%vetores para armazenar estados
contEstados=1;
countSf=1;
sfEstavel=0;
vetorsf=[];
vetorsi=[];
%Loop de busca de melhor solucao, configurar tempo de busca na condicao
while  sfEstavel < 3000;
  time=toc;
  %display(time);
  %reducao de temperatura a cada mudanca de estado
  temp = 0.99*temp;
  %reaquecimento da temperatura
  if temp < 0.01
    temp = 100;
  endif
  %criar solucao vizinha
  sv = solucaoVizinha(si);
  %verifica a diferenca entre a solucao atual e a vizinha
  delta = verifSol(si,mRef) - verifSol(sv,mRef);
  %verifica se deve aceitar ou nao uma solucao ṕior
  if delta < 0 || rand(1) < e^(-delta/temp)
    si = sv;
    verifSol(si,mRef);
  endif
  %verifica se a solucao encontrada é melhor do que a atual
  if verifSol(sf,mRef)<verifSol(si,mRef)
    sf=si;
    sfEstavel=0;
    countSf=contEstados;
  end
  %display([num2str(cont)," - ",num2str(verifSol(si,mRef))]);
  %os vetores recebem as solucoes encontradas para que sejam plotados depois
  vetorsi(contEstados)=verifSol(si,mRef);
  vetorsf(contEstados)=verifSol(sf,mRef);
  contEstados++;
  sfEstavel++;

end
toc
%mostra os grupos formados da melhor solucao
display(sf);
%mostra em qual rodada foi encontrada a melhor solucao e qual é o resultado
%mostra tambem a quantidade de relacoes boas, ruins e neutras que permaneceram
printf("Solucao encontrada na rodada: ");
display(countSf);
printf("Resultado da melhor solucao: ");
[soma,rb,rn,rr]=verifSolF(sf,mRef);
display(soma);
printf("Relações boas: ");
display(rb);
printf("Relações neutras: ");
display(rn);
printf("Relações ruins: ");
display(rr);
%plota o grafico
close all
plot(vetorsi,"k","linewidth",2);
title("Estados x Solução","FontSize",25);
xlabel("Estados passados","FontSize",25)
ylabel("Qualidade da solução","FontSize",25)
hold on;
plot(vetorsf,"--r","linewidth",3);
