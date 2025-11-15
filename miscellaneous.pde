void drawLayerSelector() {
  pushMatrix();
  translate((selX-gridSize/2)*boxSize, -selLayer*boxSize, (selZ-gridSize/2)*boxSize);
  stroke(255,0,0); noFill(); strokeWeight(3);
  box(boxSize+4);
  popMatrix();
}

void drawLayerText() {
  pushMatrix();
  translate(0, -selLayer*boxSize - 40, 0);
  rotateX(-rotX); rotateY(-rotY);
  fill(0); textSize(24); textAlign(CENTER);
  text("Layer: " + selLayer, 0,0);
  popMatrix();
}
