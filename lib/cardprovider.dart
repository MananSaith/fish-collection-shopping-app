import 'package:flutter/material.dart';

class CardProvider extends ChangeNotifier{

final List<Map<String,dynamic>> card=[] ;

void addcard(Map<String,dynamic> provide){
        card.add(provide);
        notifyListeners();
}
void removecard(Map<String,dynamic> provide){
        card.remove(provide);
        notifyListeners();
}
}