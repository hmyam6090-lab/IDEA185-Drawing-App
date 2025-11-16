//Allow the user to hold shift and left click to rotate the canvas and also toggle between brushes
void mouseDragged() {
  mouseAction();
}

void mousePressed() {
  mouseAction();
}

void mouseAction() {
  if (keyPressed && (keyCode==SHIFT || key==SHIFT)) {
    rotating=true;
  } else {
    if (currentTool.equals("brush") && currentShape.equals("cube") && !cp5.isMouseOver() && mouseOverSlice) {
      blocks[selX][selLayer][selZ] = true;
      blockColors[selX][selLayer][selZ] = currentColor;
    } else if (currentTool.equals("brush") && currentShape.equals("sphere") && !cp5.isMouseOver() && mouseOverSlice) {
      spheres[selX][selLayer][selZ] = true;
      sphereColors[selX][selLayer][selZ] = currentColor;
    } else if (currentTool.equals("erase") && !cp5.isMouseOver() && mouseOverSlice) {
      blocks[selX][selLayer][selZ] = false;
      spheres[selX][selLayer][selZ] = false;
    }
  }
}
void mouseReleased() {
  rotating=false;
}
