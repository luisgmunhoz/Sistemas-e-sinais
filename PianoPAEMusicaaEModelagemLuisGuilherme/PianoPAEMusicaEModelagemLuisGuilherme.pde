/*
  Projeto PAE Música e modelagem matemática
  Luis Guilherme de Souza Munhoz RA: 20.01937-8
*/

import ddf.minim.*;
TeclaPiano[] teclasPiano = new TeclaPiano[29];
int ctr;       // para armazenar o índice mais alto de teclasPiano

int notaAnt = 0;


PImage teclado;

Minim minim;
AudioPlayer musica;

class TeclaPiano {
  int tf_x1;                // canto superior esquerdo do retângulo de fronteira da tecla
  int tf_y1;
  int tf_x2;                // Canto inferior direito  retângulo de fronteira da tecla
  int tf_y2;
  int numNotaMIDI;          //  número de nota MIDI - usado para calcular intervaloos
  String notaNome;          // Nome da nota, exemplo C,  F#/G& 
  String arquivoSom;        // nome do arquivo a ser tocado quando a nota for tocada
  char letra;               // usado para tocar notas no teclado do computador
  
  TeclaPiano(int x1, int y1, int x2, int y2, int nota, String nome, String arquivowave, char teclaLetra) {
        tf_x1 = x1;
        tf_y1 = y1;
        tf_x2 = x2;
        tf_y2 = y2;
        numNotaMIDI = nota;
        notaNome = nome;
        arquivoSom = arquivowave;
        letra = teclaLetra;
  }
  
  void desenhaRetangulo() {
   rect(tf_x1, tf_y1, tf_x2 - tf_x1, tf_y2 - tf_y1); 
  }
  
  void tocaNota() {
    // escurece o nome da nota mostrada anteriormente
    fill(0);
    noStroke();
    rect(0, 500, width, 30);
    
    // Desenha um retângulo semitransparente na nota quando for tocada
    fill(150,255,200,90);
    noStroke();
    desenhaRetangulo();
    
    // toca o arquivo de audio wav
    musica = minim.loadFile(arquivoSom);
    musica.play();
    
    // mostra o nome da nota embaixo da nota tocada
    stroke(255);
    fill(300, 300, 5);
    text(notaNome, tf_x1, 520);
    
    // mostra o intervalo
    if (notaAnt == 0) { 
      notaAnt = numNotaMIDI;
      return; 
    }
    String dispIntervalo = calcIntervalo(notaAnt, numNotaMIDI) + "    " + 
             str(abs(numNotaMIDI - notaAnt)) + " semitons";
    notaAnt = numNotaMIDI;
    // escurece a nota tocada anteriormente
    fill(0);
    noStroke();
    rect(0, 530, width, 30);
    fill(0,255,255);
    text(dispIntervalo, 280, 550);
  }
  
  boolean dentro(int m_x, int m_y) {
    // retorna true se o ponto (m_x, m_y) esta dentro da fronteira do retangulo deste objeto
    if ((m_x < tf_x1) || (m_x > tf_x2)) {
      return false;
    }
    if ((m_y > tf_y2) || (m_y < tf_y1)) {
      return false;
    }
    return true;
  }
}

String calcIntervalo(int notaAnt, int essaNota) {
  boolean invertido = false;       // verdadeiro se a segunda nota for mais baixa que a primeira
  int semiTons;
  String intNome = "Desconhecido";
  if (essaNota < notaAnt) {
     invertido = true;
     semiTons = notaAnt - essaNota; 
  } else {
     semiTons = essaNota - notaAnt;
  } 
  println("Semitons " + semiTons);
  
  switch(semiTons){
    case 0:
      intNome = "Uníssono";
      break;
    case 1:
      intNome = "Segunda Menor - m2";
      break;
    case 2:
      intNome = "Segunda Maior - M2";
      break;
    case 3:
      intNome = "Terceira Menor- m3";
      break;
    case 4:
      intNome = "Terceira  Maior - M3";
      break;
    case 5:
      intNome = "Quarta Perfeita- P4";
      break;
    case 6:
      intNome = "Quarta Aumentada / Quinta Diminuída - Aug 4/Dim 5";
      break;
    case 7:
      intNome = "Quinta Perfeita - P5";
      break;
    case 8:
      intNome = "Sexta Menor - m6";
      break;
    case 9:
      intNome = "Sexta Maior - M6";
      break;
    case 10:
      intNome = "Sexta Maior - M6";
      break;
    case 11:
      intNome = "Sétima Maior- M7";
      break;
    case 12:
      intNome = "Sétima Maior- M7";
      break;
    case 13:
      intNome = "Nona Menor";
      break;
    case 14:
      intNome = "Nona Maior";
      break;
    case 15:
      intNome = "Décima Menor";
      break;
    case 16:
      intNome = "Décima Maior";
      break;
    case 17:
      intNome = "Décima Primeira Perfeita";
      break;
    case 18:
      intNome = "Décima Primeira Aumentada - Décima Segunda Diminuída";
      break;
    case 19:
     intNome = "Décima Segunda Perfeita";
      break;
    case 20:
      intNome = "Décima Terceira Menor";
      break;  
   case 21:
      intNome = "Décima Terceira Maior";
      break;
    case 22:
      intNome = "Décima Quarta Menor";
      break;
    case 23:
      intNome = "Décima Quarta Maior";
      break;   
  }
  
  if (invertido) {
     return intNome + " (descendente)";
  } else {
    return intNome;
  }
}

void mousePressed() {
   // Linha a seguir usada para medir coordenadas das teclas do piano para atualizar a funcao setup()
   // println(mouseX + "," + mouseY);
   for (int i = 0; i <= ctr; i++) {
   if (teclasPiano[i].dentro(mouseX, mouseY) ) {
     teclasPiano[i].tocaNota();
   }
 }
}

void keyPressed() {
   for (int i = 0; i <= ctr; i++) {
   if (teclasPiano[i].letra == key)  {
     teclasPiano[i].tocaNota();
     image(teclado, 0, 0); 
   }
 }
}
  
void mouseReleased() {
 image(teclado, 0, 0); 
}

void settings(){
  teclado = loadImage("teclaspiano.jpeg");
  size(teclado.width,teclado.height + 100);
}

void setup() {
  background(0);
  image(teclado, 0, 0); 
  minim = new Minim(this);

  // Segunda Oitava
  teclasPiano[0] = new TeclaPiano(22, 424, 53, 534, 48, "C", "conv1.wav", '1');
  teclasPiano[1] = new TeclaPiano(65, 290, 95, 390, 49, "C# Df", "conv2.wav", '2');
  teclasPiano[2] = new TeclaPiano(76, 429, 107, 538, 50, "D", "conv3.wav", '3');
  teclasPiano[3] = new TeclaPiano(124, 321, 156, 404, 51, "D# Ef+", "conv4.wav", '4');
  teclasPiano[4] = new TeclaPiano(129, 426, 163,534, 52, "E", "conv5.wav", '5');
  teclasPiano[5] = new TeclaPiano(179, 423, 215, 535, 53, "F", "conv6.wav", '6');
  teclasPiano[6] = new TeclaPiano(212, 312, 242, 392, 54, "F# Gf", "conv7.wav", '7');  
  teclasPiano[7] = new TeclaPiano(232,421, 268, 533, 55, "G", "conv8.wav", '8');
  teclasPiano[8] = new TeclaPiano(274, 319, 299, 410, 56, "G# Af", "conv9.wav", '9');
  teclasPiano[9] = new TeclaPiano(281, 425, 326, 533, 57, "A", "conv10.wav", '0');
  teclasPiano[10] = new TeclaPiano(330, 315, 356, 400, 58, "A# Bf", "conv11.wav", 'p');
  teclasPiano[11] = new TeclaPiano(336, 423, 381, 537, 59, "B", "conv12.wav", 'o');
  // Terceira Oitava
  teclasPiano[12] = new TeclaPiano(390, 422,430, 539, 60, "C", "conv13.wav", 'i');
  teclasPiano[13] = new TeclaPiano(420, 316, 449, 403, 61, "C# Df", "conv14.wav", 'u');
  teclasPiano[14] = new TeclaPiano(443, 420, 486, 539, 62, "D", "conv15.wav", 'y');
  teclasPiano[15] = new TeclaPiano(484, 329,512, 396, 63, "D# Ef", "conv16.wav", 't');
  teclasPiano[16] = new TeclaPiano(493, 421, 541,537, 64, "E", "conv17.wav", 'r');
  teclasPiano[17] = new TeclaPiano(543, 419, 592, 536, 65, "F", "conv18.wav", 'e');
  teclasPiano[18] = new TeclaPiano(574, 292, 602, 404, 66, "F# Gf+", "conv19.wav", 'w');
  teclasPiano[19] = new TeclaPiano(596, 423, 649, 534, 67, "G", "conv20.wav", 'q');
  teclasPiano[20] = new TeclaPiano(634, 318, 661, 398, 68, "G# Af", "conv21.wav", 'a');
  teclasPiano[21] = new TeclaPiano(654, 418, 704, 531, 69, "A", "conv22.wav", 's');
  teclasPiano[22] = new TeclaPiano(693, 305, 723, 395, 70, "A# Bf", "conv23.wav", 'd');
  teclasPiano[23] = new TeclaPiano(705, 422, 761, 534, 71, "B", "conv24.wav", 'f');
  // Quarta Oitava
  teclasPiano[24] = new TeclaPiano(759, 418, 815, 529, 72, "C", "conv25.wav", 'g');
  teclasPiano[25] = new TeclaPiano(777, 307, 817, 395, 73, "C# Df", "conv26.wav", 'h');
  teclasPiano[26] = new TeclaPiano(819, 423, 875, 534, 74, "D", "conv27.wav", 'j');
  teclasPiano[27] = new TeclaPiano(839, 289, 881, 395, 75, "D# Ef+", "conv28.wav", 'k');
  teclasPiano[28] = new TeclaPiano(877, 421, 932, 533, 76, "E", "conv29.wav", 'l');

  ctr = 28;
  
  frameRate(60);
}

void draw() {
 // necessária para ativar eventos de mouse ou teclado
}
