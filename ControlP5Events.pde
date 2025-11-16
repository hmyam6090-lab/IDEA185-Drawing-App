public void colorWheel(int val){ currentColor = colorWheel.getRGB(); }

public void brushTool(boolean val){
  if (val){
    currentTool = "brush";
    eraseToggle.setValue(false);
  }
}

public void eraseTool(boolean val){
  if (val){
    currentTool = "erase";
    brushToggle.setValue(false);
  }
}

public void cubeTool(boolean val){
  if (val){
    currentShape = "cube";
    sphereToggle.setValue(false);
  }
}

public void sphereTool(boolean val){
  if (val){
    currentShape = "sphere";
    cubeToggle.setValue(false);
  }
}
