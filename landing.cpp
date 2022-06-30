/*Estrategia de gerar local de pouso genérica para n drones

Inicia o pouso na posição mais ao norte e continua no sentido horário até
voltar a posição inicial, numa distribuição circular com 4 posicoes.

Quando completa 4 posicoes de pouso adiciona um offset para os proximos 4,
e assim em diante.
*/
#include <iostream>
#include <vector>

int uavN=getUavNumber(); //Assumindo que uavNumber comeca em 1
float landZeroX=-102.0;
float landZeroY=-111.0;

float landingX,landingY;
std::vector <int> landingPos (2);

int lane=(uavN/4)+1; // Divisao inteira por 4, inicia em 1
int pos=uavN%4; // Resto da divisao por 4

if(pos==1){
  landingX=landZeroX;
  landingY=landZeroY+(1.5*lane);
}
else if(pos==2){
  landingX=landZeroX+(1.5*lane);
  landingY=landZeroY;
}
else if(pos==3){
  landingX=landZeroX;
  landingY=landZeroY-(1.5*lane);
}
else{ //pos==0 uavN multiplo de 4
  landingX=landZeroX-(1.5*(lane-1));
  landingY=landZeroY;
}
landingPos[0]=landingX;
landingPos[1]=landingY;
return landingPos;
