//Allow the user to hold shift and left click to rotate the canvas and also toggle between brushes
void mousePressed() {
  if (keyPressed && (keyCode==SHIFT || key==SHIFT)) {
    rotating=true;
  } else {
    if (currentTool.equals("brush") && !cp5.isMouseOver() && mouseOverSlice) {
      blocks[selX][selLayer][selZ] = true;
      blockColors[selX][selLayer][selZ] = currentColor;
    } else if (currentTool.equals("erase") && !cp5.isMouseOver() && mouseOverSlice) {
      blocks[selX][selLayer][selZ] = false;
    }
  }
}
void mouseReleased() { rotating=false; }
