class MyConverter{
  static double C2F(double value){
    return (value*9/5)+32;
  }
  static double C2K(double value){
    return value + 273.15;
  }
  static double F2C(double value){
    return (value-32) * 5/9 ;
  }
  static double F2K(double value){
    return (value -32) * 5/9 + 273.15;
  }
  static double K2C(double value){
    return value - 273.15;
  }
  static double K2F(double value){
    return (value - 273.15)*9/5+32;
  }
}