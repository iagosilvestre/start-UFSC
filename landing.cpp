/*Estrategia de gerar local de pouso genérica para n drones

Inicia o pouso na posição mais ao norte e continua no sentido horário até
voltar a posição inicial, numa distribuição circular com 4 posicoes.

Quando completa 4 posicoes de pouso adiciona um offset para os proximos 4,
e assim em diante.
*/
int uavN=getUavNumber(); //Assumindo que uavNumber comeca em 1
float landZeroX=-109.0;
float landZeroY=-121.0;

float landingX,landingY;

int lane=(uavN/4)+1; // Divisao inteira por 4, inicia em 1
int pos=uavN%4; // Resto da divisao por 4
int modQuad; // Quadrante angular em relacao ao origem da area de pouso

if(pos==1 || pos==3){
  landingX=landZeroX;
  landingY=landZeroY+(1.5*lane);
}
else{ //(pos==2 || pos==0)
  landingX=landZeroX+(1.5*lane);
  landingY=landZeroY;
}
