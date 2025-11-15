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
