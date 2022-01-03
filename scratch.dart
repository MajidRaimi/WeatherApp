import 'dart:io';

void main(){


  print("Please Enter Any Number : ") ;
  String? myString = stdin.readLineSync();



  try{
    double myStringAsADouble =  double.parse(myString!) + 3 ;
  } catch(FormatException){
      print(FormatException);
  }

}