class ResponsiveSize {
  static double _width = 375.0;
  static double _height = 812.0;
  static void init({required double height, required double width}) {
    _width = width;
    _height = height;
  }

  static double width(num value) {
    return value * (_width / 375.0);
  }

  static double height(num value) {
    return value * (_height / 812.0);
  }
}

extension ResponsiveOnNum on num {
  double get w => ResponsiveSize.width(this);
  double get h => ResponsiveSize.height(this);
}
