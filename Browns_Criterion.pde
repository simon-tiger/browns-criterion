ArrayList<ArrayList<Integer>> cards;
int numCards = 5;
int cardIndex = 0;
color[] colors;
int guess = 0;
boolean guessed = false;

void setup() {
  size(400, 400);
  
  cards = new ArrayList<ArrayList<Integer>>();
  
  int val = 1;
  int[] vals = new int[numCards];
  
  for (int i = 0; i < numCards; i++) {
    ArrayList<Integer> card = new ArrayList<Integer>();
    cards.add(card);
    vals[i] = val;
    val *= 2;
  }
  
  int sum = sum(vals);
  
  for (int i = 1; i <= sum; i++) {
    String bin = binary(i);
    bin = bin.substring(bin.length() - numCards, bin.length());
    
    for (int j = 0; j < cards.size(); j++) {
      ArrayList<Integer> card = cards.get(j);
      int index = numCards - j - 1;
      if (bin.charAt(index) == '1') {
        card.add(i);
      }
    }
  }
  
  colors = new color[] {
    color(255, 0, 0),
    color(255, 128, 0),
    color(255, 255, 0),
    color(0, 255, 0),
    color(0,255, 255)
  };
}

void draw() {
  background(255);
  
  int w = width / 4;
  int h = (height - 28) / 4;
  
  int index = 0;
  
  for (int y = 0; y < height - 28; y += h) {
    for (int x = 0; x < width; x += w) {
      noStroke();
      
      if (y < height - 28) {
        fill(colors[cardIndex]);
        rect(x, y, w, h);
        
        fill(0);
        textAlign(CENTER, CENTER);
        textSize(48);
        text(cards.get(cardIndex).get(index), x + w / 2, y + h / 2);
      }
      
      index++;
    }
  }
  
  if (frameCount < 300) {
    fill(0);
    textAlign(LEFT, CENTER);
    textSize(12);
    text("Guess a number beween 1 and 31.", 15, 25);
  } else if (!guessed) {
    fill(0);
    textAlign(LEFT, CENTER);
    textSize(12);
    text("Do you see your number?", 15, 25); 
  } else {
    fill(0);
    textAlign(LEFT, CENTER);
    textSize(12);
    text("Your number was " + guess + "!", 15, 25);
  }
  
  fill(220);
  stroke(175);
  
  if (mouseY > height - 28) {
    if (mouseX < width/2) {
      fill(175);
      stroke(150);
    }
  }
  
  rect(0, height-28, width/2, 28);
  
  fill(0);
  textAlign(CENTER, CENTER);
  textSize(12);
  text("Yes", width/4, height-14);
  
  fill(220);
  stroke(175);
  
  if (mouseY > height - 28) {
    if (mouseX > width/2) {
      fill(175);
      stroke(150);
    }
  }
  
  rect(width/2, height-28, width/2, 28);
  
  fill(0);
  textAlign(CENTER, CENTER);
  textSize(12);
  text("No", 3*width/4, height-14);
}

int sum(int[] arr) {
  int sum = 0;
  
  for (int i = 0; i < arr.length; i++) { 
    sum += arr[i];
  }
  
  return sum;
}

boolean contains(int[] arr, int val) {
  boolean contains = false;
  
  for (int i = 0; i < arr.length; i++) { 
    if (arr[i] == val) {
      contains = true;
      break;
    }
  }
  
  return contains;
}

void mousePressed() {
  if (mouseY > height - 28) {
    if (mouseX < width/2 && !guessed) {
      guess += pow(2, cardIndex);
    }
    if (cardIndex < numCards - 1) {
      cardIndex++;
    } else {
      guessed = true;
    }
  }
}