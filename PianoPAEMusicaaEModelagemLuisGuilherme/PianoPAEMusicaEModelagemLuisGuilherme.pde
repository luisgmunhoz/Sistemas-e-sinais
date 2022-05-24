/*
  Projeto PAE Música e modelagem matemática
  Luis Guilherme de Souza Munhoz RA: 20.01937-8
*/

import ddf.minim.*;
TeclaPiano[] teclasPiano = new TeclaPiano[29];
int ctr; // para armazenar o índice mais alto de teclasPiano

int notaAnt = 0;


PImage teclado;

Minim minim;
AudioPlayer musica;

class TeclaPiano {
  int n_x1; // canto superior esquerdo do retângulo de fronteira da tecla
  int n_y1;
  int n_x2; // Canto inferior direito  retângulo de fronteira da tecla
  int n_y2;
  int numNotaMIDI;  //  número de nota MIDI - usado para calcular intervaloos
  String notaNome;   // Nome da nota, exemplo C,  F#/G& 
  String arquivoSom;  // nome do arquivo a ser tocado quando a nota for tocada
  char letra;     // usado para tocar notas no teclado do computador
  
  TeclaPiano(int x1, int y1, int x2, int y2, int note, String nome, String arquivowave, char teclaLetra) {
        n_x1 = x1;
        n_y1 = y1;
        n_x2 = x2;
        n_y2 = y2;
        numNotaMIDI = note;
        notaNome = nome;
        arquivoSom = arquivowave;
        letra = teclaLetra;
  }
  
  void desenhaRetangulo() {
   rect(n_x1, n_y1, n_x2 - n_x1, n_y2 - n_y1); 
  }
  
  void playNote() {
    // escurece o nome da nota mostrada anteriormente
    fill(0);
    noStroke();
    rect(0, 500, width, 30);
    
    // Desenha um retângulo semitransparente na nota quando for tocada
    // fill(250,150, 150,90);
    fill(150,255,200,90);
    noStroke();
    desenhaRetangulo();
    
    // toca o arquivo de audio wav
    musica = minim.loadFile(arquivoSom);
    musica.play();
    
    // mostra o nome da nota embaixo da nota tocada
    stroke(255);
    fill(300, 300, 5);
    text(notaNome, n_x1, 520);
    
    // mostra o intervalo
    if (notaAnt == 0) { 
      notaAnt = numNotaMIDI;
      return; 
    }
    int intervalo = numNotaMIDI - notaAnt;
    String dispIntervalo = calcIntervalo(notaAnt, numNotaMIDI) + "    " + 
             str(abs(numNotaMIDI - notaAnt)) + " semitons";
    notaAnt = numNotaMIDI;
    // escurece a nota tocada anteriormente
    fill(0);
    noStroke();
    rect(0, 530, width, 30);
    fill(0,255,255);  // ciano
    text(dispIntervalo, 280, 550);
  }
  
  boolean inside(int mx, int my) {
    // retorna true se o ponto (mx, my) esta dentro da fronteira do retangulo deste objeto
    if ((mx < n_x1) || (mx > n_x2)) {
      return false;
    }
    if ((my > n_y2) || (my < n_y1)) {
      return false;
    }
    return true;
  }
}

String calcIntervalo(int notaAnt, int essaNota) {
  boolean invertido = false;   // verdadeiro se a segunda nota for mais baixa que a primeira
  int semiTons;
  String intNome = "Desconhecido";
  if (essaNota < notaAnt) {
     invertido = true;
     semiTons = notaAnt - essaNota; 
  } else {
     semiTons = essaNota - notaAnt;
  } 
  println("Semitones " + semiTons);
  if (semiTons == 0) { intNome = "Uníssono"; }
  if (semiTons == 1) { intNome = "Segunda Menor - m2"; }
  if (semiTons == 2) { intNome = "Segunda Maior - M2"; }
  if (semiTons == 3) { intNome = "Terceira Menor- m3"; }
  if (semiTons == 4) { intNome = "Terceira  Maior - M3"; }
  if (semiTons == 5) { intNome = "Quarta Perfeita- P4"; }
  if (semiTons == 6) { intNome = "Quarta Aumentada / Quinta Diminuída - Aug 4/Dim 5"; }
  if (semiTons == 7) { intNome = "Quinta Perfeita - P5"; }
  if (semiTons == 8) { intNome = "Sexta Menor - m6"; }
  if (semiTons == 9) { intNome = "Sexta Maior - M6"; }
  if (semiTons == 10) { intNome = "Sétima Menor - m7"; }
  if (semiTons == 11) { intNome = "Sétima Maior- M7"; }
  if (semiTons == 12) { intNome = "Oitava"; }
  if (semiTons == 13) { intNome = "Nona MENOR"; }
  if (semiTons == 14) { intNome = "Nona Maior"; }
  if (semiTons == 15) { intNome = "Décima Menor"; }
  if (semiTons == 16) { intNome = "Décima Maior"; }
  if (semiTons == 17) { intNome = "Décima Primeira Perfeita"; }
  if (semiTons == 18) { intNome = "Décima Primeira Aumentada - Décima Segunda Diminuída"; }
  if (semiTons == 19) { intNome = "Décima Segunda Perfeita"; }
  if (semiTons == 20) { intNome = "Décima Terceira Menor"; }
  if (semiTons == 21) { intNome = "Décima Terceira Maior"; }
  if (semiTons == 22) { intNome = "Décima Quarta Menor"; }
  if (semiTons == 23) { intNome = "Décima Quarta Maior"; }
              
  if (invertido) {
     return intNome + " (descendente)";
  } else {
    return intNome;
  }
    
}
void mousePressed() {
   // Linha a seguir usada para medir coordenadas das teclas do piano para atualizar a funcao setup()
   println(mouseX + "," + mouseY);
   for (int i = 0; i <= ctr; i++) {
   if (teclasPiano[i].inside(mouseX, mouseY) ) {
     teclasPiano[i].playNote();
   }
 }
}

void keyPressed() {
   for (int i = 0; i <= ctr; i++) {
   if (teclasPiano[i].letra == key)  {
     teclasPiano[i].playNote();
     image(teclado, 0, 0); 
   }
 }
}
  
void mouseReleased() {
 image(teclado, 0, 0); 
}

void draw() {
 // necessária para ativar eventos de mouse ou teclado
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
  teclasPiano[26] = new TeclaPiano(819, 423, 875, 534, 74, "D", "conv27.wav", 'i');
  teclasPiano[27] = new TeclaPiano(839, 289, 881, 395, 75, "D# Ef+", "conv28.wav", 'j');
  teclasPiano[28] = new TeclaPiano(877, 421, 932, 533, 76, "E", "conv29.wav", 'k');

  ctr = 28;
  
  frameRate(6);
}
