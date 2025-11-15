import controlP5.*;

int gridSize = 5;
int boxSize = 60;
boolean[][][] blocks = new boolean[gridSize][gridSize][gridSize];
color[][][] blockColors = new color[gridSize][gridSize][gridSize]; 

int selLayer = 0; 
int selX = 0;
int selZ = 0;

float rotX = radians(-20);
float rotY = radians(50);
float lastMouseX, lastMouseY;
boolean rotating = false;
boolean mouseOverSlice = false;

String currentTool = "brush"; 
color currentColor = color(150, 100, 255);

ControlP5 cp5;
ColorWheel colorWheel;
Toggle brushToggle, eraseToggle;

int sliceSize = 200;
int slicePadding = 50;

void setup() {
  size(1000, 800, P3D);
  
  cp5 = new ControlP5(this);
  
  colorWheel = cp5.addColorWheel("colorWheel", 50, 500, 150)
                  .setRGB(currentColor);
                  
  brushToggle = cp5.addToggle("brushTool")
                   .setPosition(50, 670)
                   .setSize(80,30)
                   .setLabel("Brush")
                   .setValue(true);
  brushToggle.getCaptionLabel().setColor(color(0));
  
  eraseToggle = cp5.addToggle("eraseTool")
                   .setPosition(150, 670)
                   .setSize(80,30)
                   .setLabel("Erase")
                   .setValue(false);
  eraseToggle.getCaptionLabel().setColor(color(0));            
}

void draw() {
  background(200, 255, 200);
  lights();
  
  if (rotating) {
    float dx = (mouseX - lastMouseX) * 0.01;
    float dy = (mouseY - lastMouseY) * 0.01;
    rotY += dx;
    rotX += dy;
  }
  
  pushMatrix();
  translate(width/2 - 50, height/2 + 100, -200);
  rotateX(rotX);
  rotateY(rotY);

  stroke(0,120); strokeWeight(1); noFill();
  float sizeCube = gridSize * boxSize;
  pushMatrix();
  translate(0, -((gridSize-1)/2.0)*boxSize, 0);
  box(sizeCube);
  popMatrix();
  
  drawCurrentLayerGrid();
  drawBlocks();
  drawLayerSelector();
  drawLayerText();
  popMatrix();
  
  lastMouseX = mouseX;
  lastMouseY = mouseY;
  
  drawLayerSlice();
  
  fill(0);
  textSize(16);
  textAlign(LEFT);
  int instrX = width - 300;
  int instrY = 50;
  text("Instructions:", instrX, instrY);
  text("W/S : Change Layer", instrX, instrY + 25);
  text("Brush Tool: Paint blocks", instrX, instrY + 50);
  text("Erase Tool: Remove blocks", instrX, instrY + 75);
  text("Mouse Drag: Paint/Erase continuously", instrX, instrY + 100);
  text("Shift + Mouse Drag: Rotate Grid", instrX, instrY + 125);
  
  fill(0);
  textAlign(CENTER);
  int sliceInstrX = slicePadding + sliceSize/2;
  int sliceInstrY = slicePadding + sliceSize + 20;
  text("Top-down view of current layer", sliceInstrX, sliceInstrY);
  text("Click here to place/erase blocks", sliceInstrX, sliceInstrY + 20);
}


void drawCurrentLayerGrid() {
  stroke(0,200); strokeWeight(2); noFill();
  for (int x=0; x<gridSize; x++){
    for (int z=0; z<gridSize; z++){
      pushMatrix();
      translate((x-gridSize/2)*boxSize, -selLayer*boxSize, (z-gridSize/2)*boxSize);
      box(boxSize);
      popMatrix();
    }
  }
}


void drawBlocks() {
  for (int x=0; x<gridSize; x++){
    for (int y=0; y<gridSize; y++){
      for (int z=0; z<gridSize; z++){
        if (blocks[x][y][z]){
          pushMatrix();
          translate((x-gridSize/2)*boxSize, -y*boxSize, (z-gridSize/2)*boxSize);
          fill(blockColors[x][y][z]);
          stroke(0);
          box(boxSize);
          popMatrix();
        }
      }
    }
  }
}


void keyPressed() {
  if (key=='w' || key=='W') selLayer = min(gridSize-1, selLayer+1);
  if (key=='s' || key=='S') selLayer = max(0, selLayer-1);
}
