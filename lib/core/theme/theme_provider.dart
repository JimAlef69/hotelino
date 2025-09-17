class ThemeProvider extends ChangeNotifier {
  Brightness _brightness;
  TheProvider(this._brightness);

  Brightness get brightness => _brightness;

  void toggleTheme() {
    _brightness = (_brightness == Brightness.dark) ? Brightness.light : Brightness.dark;
    notifyListeners();
  }

  void updateTheme(Brightness brightness) {
    _brightness = brightness;
    notifyListeners();
  } 
}