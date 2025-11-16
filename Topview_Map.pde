void drawLayerSlice() {
  pushMatrix();
  translate(slicePadding, slicePadding);
  stroke(0);
  fill(230);
  rect(0, 0, sliceSize, sliceSize);
  int cellSize = sliceSize/gridSize;

  mouseOverSlice = false;
  for (int x=0; x<gridSize; x++) {
    for (int z=0; z<gridSize; z++) {
      int px = x*cellSize;
      int pz = z*cellSize;
      if (currentShape.equals("cube")) {
        fill(blocks[x][selLayer][z]?blockColors[x][selLayer][z]:255);
      } else {
        fill(spheres[x][selLayer][z]?sphereColors[x][selLayer][z]:255);
      }
      stroke(0);
      rect(px, pz, cellSize, cellSize);
      if (mouseX > slicePadding+px && mouseX < slicePadding+px+cellSize &&
        mouseY > slicePadding+pz && mouseY < slicePadding+pz+cellSize) {
        fill(255, 0, 0, 100);
        rect(px, pz, cellSize, cellSize);
        selX = x;
        selZ = z;
        mouseOverSlice = true;
      }
    }
  }
  popMatrix();
}
