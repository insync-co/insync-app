import 'package:flutter/cupertino.dart';

double getScreenHeight(BuildContext context){
    return MediaQuery.of(context).size.height;
}

double getScreenWidth(BuildContext context){
  return MediaQuery.of(context).size.width;
}