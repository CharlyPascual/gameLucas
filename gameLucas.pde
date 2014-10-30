//////////////////////
// juego de animales y sonido
//cpb 17 agosto 2014
///////////////////////
int h = 0; //variable global indice del sistemas de eleccion, 
int score;
//botones activan aleatoriamente un sonido
//RadioButtons r;
Button b;
PImage sonar; // no se esta utilizado
//fin_botones

///////
int numberOfAnimals = 6; // numero de fotos de animales a mostrar
int numberIndice = 5; // 0,1,2....
int numberLoadAnimals = 7; // numero total de fotos donde elegir
//eleccion del indice de  fotos/sonidos
int[] numbers = new int[numberOfAnimals];

////////
//fotos animales , posiciones
PImage [] animals;
int margin = (1024/100)*2;
boolean visualizePhoto = true; // swtch para que solo se muestre/cargue una vez las fotos

int currentPhoto = 0; // indice arrays de fotos
float onSeeX = margin;
float onSeeY = margin;
float widthX = 300; //ancho de cada foto
float heightY = 169; //alto de cada foto
float marginY = 100; 
int selectionA = 0;// ojo lo he cambiado si no le doy un varlor por defecto tiene 0
int selectionB = 100;// y no funcionaria bien los botones

//fin_fotos

//sonidos de animales
Maxim maxim;
AudioPlayer[] sample;
String[] trackNameList = {
  "0lion.wav", "1elephant.wav", "2tiger.wav", "3gorila.wav", 
  "4wolf.wav", "5bear.wav", "6buffalo.wav"
};
//fin_sonidos de animales

void setup() {
  size(1024, 680);
  ////////////////////////////////////////////////
  //////posicion botones
  b = new Button("sonido", (int)(widthX+margin*2), margin, 60, 30);
  //////fin_posicion botones
  ////////////////////////////////////////////////

  //eleccion de fotos/sonidos
  for (int rnd,  h = 0; h <= numberIndice; h++)
  {
    //numbers[h] = (int)random(numberLoadAnimals);
    numbers[h] = MIN_INT;
    while (contains(rnd = (int)random(numberLoadAnimals), numbers));
    numbers[h] = rnd;
  }
  println(numbers);

  h = 0; // reinicio el indice

  //////////////////////// cambiar el modo en que se cargan las iimagenes
  //////fotos animales
  animals = loadImages("animals/animal", ".jpg", numberLoadAnimals);
  //imageMode(CENTER);
  println("numero de animales: " + numberOfAnimals);
  //////fin_fotos animales
  /////////////////////////
 
  //////sonido
  maxim = new Maxim(this);
  sample = new AudioPlayer[numberOfAnimals];
  for (int i = 0; i <= numberIndice; i++) {

    sample[i] = maxim.loadFile("sounds/" + trackNameList[numbers[h]]);
    println("carga sonido: " + i + " " + trackNameList[numbers[h]]);
    //println(trackNameList[numbers[h]]);
    h += 1;
    sample[i].setLooping(false);
  }

  h = 0; // reinicio el indice
  //printArray(sample);
  printArray(trackNameList);
}//fin_setup

//Controlador - no se repitan numeros
  boolean contains(int n, int... nums) {
  for (int i : nums)  if (i == n)  return true;
  return false;
}
//fin_contralador


void draw() {
  //visualizar el marcador ( el fondo del marcador)
  fill(204);
  noStroke();
  rect(0, 0, 182, 50); // fondo del marcador
  //visualizar botones 
  textSize(14);
  b.display();
  //r.display();
  //interfac();

  //visualiza fotos
  displayPhoto();
  //visualiza score
  fill(0);
  textSize(28);
  text("Aciertos: " + score, margin, margin*2);
}
// carga solo una vez las fotos
void  displayPhoto() {

  if (visualizePhoto) {
    print(" numero de fotos: " + currentPhoto);

    image(animals[numbers[h]], onSeeX, marginY, animals[0].width, animals[0].height);
    h += 1;
    onSeeX += widthX + margin;
    if ((onSeeX + widthX) >= (width - margin)) {
      onSeeX = margin;
      marginY += (heightY + margin);
    }
    currentPhoto += 1;
    if (currentPhoto >= numberOfAnimals) {
      visualizePhoto = !visualizePhoto ;
      marginY = 100;
    }
  }
}

//botones
void mouseReleased()
{
  if (b.mouseReleased()) {
    selectionA = (int)random(0, numberOfAnimals); //seleciono un sonido de animal
    println("sonido selectionA: [" + selectionA + "]");
    switch(selectionA)
    {
    case 0:
      sample[selectionA].cue(0);
      sample[selectionA].play();
      break;
    case 1:
      sample[selectionA].cue(0);
      sample[selectionA].play();
      break;
    case 2:
      sample[selectionA].cue(0);
      sample[selectionA].play();
      break;
    case 3:
      sample[selectionA].cue(0);
      sample[selectionA].play();
      break;
    case 4:
      sample[selectionA].cue(0);
      sample[selectionA].play();
      break;
    case 5:
      sample[selectionA].cue(0);
      sample[selectionA].play();
      break;
    case 6:
      sample[selectionA].cue(0);
      sample[selectionA].play();
      break;
      //       case 5;
      //      sample[selectionA].cue(0);
      //      sample[selectionA].play();
      //      break;
      //       case 5;
      //      sample[selectionA].cue(0);
      //      sample[selectionA].play();
      //      break;
    }
  }
}
void mousePressed() {
  //float d = dist(margin+widthX/2, 100+heightY/2, mouseX, mouseY);
  //onSeeX += widthX + margin;
  println("x: " + mouseX + " y: " + mouseY);
  if ((mouseX >= margin && mouseX <= widthX + margin) 
    &&(mouseY >= marginY && mouseY <= marginY + heightY)
    && (selectionA == 0)) {
    score += 1;
  }
  if ((mouseX >= 2*margin + widthX)
    && (mouseX <= 2 * (widthX + margin))
    && (mouseY >= marginY && mouseY <= marginY + heightY)
    && (selectionA == 1)) {
    score += 1;
  }
  if ((mouseX >= 2*margin + 2*widthX + margin)
    && (mouseX <= 3 * (widthX + margin))
    && (mouseY >= marginY && mouseY <= marginY + heightY)
    && (selectionA == 2)) {
    score += 1;
  }
}//generarlo para cada foto 9 en total

