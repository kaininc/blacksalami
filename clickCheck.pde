class SearchMouse {
  int clicked = 0;

  void checkClick(float x, float y, float w, float h) {
    if (mouseX > x && mouseX < x + w && mouseY > y && mouseY < y + h) {
      clicked = 1;
    } else {
      clicked = 0;
    }
  }
}