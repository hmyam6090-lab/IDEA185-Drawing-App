void drawLayerSlice() {
  pushMatrix();
  translate(slicePadding, slicePadding);

  stroke(0);
  fill(230);
  rect(0, 0, sliceSize, sliceSize);

  int cellSize = sliceSize / gridSize;
  mouseOverSlice = false;

  for (int x = 0; x < gridSize; x++) {
    for (int z = 0; z < gridSize; z++) {
      int px = x * cellSize;
      int pz = z * cellSize;

      fill(255);
      stroke(0);
      rect(px, pz, cellSize, cellSize);

      if (blocks[x][selLayer][z]) {
        fill(blockColors[x][selLayer][z]);
        rect(px + 5, pz + 5, cellSize - 10, cellSize - 10);
      } 
      else if (spheres[x][selLayer][z]) {
        fill(sphereColors[x][selLayer][z]);
        ellipse(px + cellSize / 2, pz + cellSize / 2, cellSize - 10, cellSize - 10);
      }

      if (mouseX > slicePadding + px && mouseX < slicePadding + px + cellSize &&
          mouseY > slicePadding + pz && mouseY < slicePadding + pz + cellSize) {
        noFill();
        stroke(255, 0, 0);
        strokeWeight(2);
        rect(px, pz, cellSize, cellSize);
        selX = x;
        selZ = z;
        mouseOverSlice = true;
      }
    }
  }
  
  popMatrix();
}
