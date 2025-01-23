import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as https;
import 'package:kaptastask/cardlists/model/cardModel.dart';

class Cardcontroller extends ChangeNotifier {
  bool isLoading = true;
  List<CardModel> cardlists = [];

  getCardLists() async {
    isLoading = true;
    notifyListeners();
    String url = "https://jsonplaceholder.typicode.com/todos";
    https.Response response = await https.get(Uri.parse(url));
    log('-----${response.body.toString()}');
    if (response.statusCode == 200) {
      // Map<String, dynamic> data =
      //     Map<String, dynamic>.from(json.decode(response.body));
      // CardModel cardModel=CardModel.fromJson(data);
      final cardModel = cardModelFromJson(response.body);
      cardlists = cardModel;
      log("response  ---------------${cardModel.toList()}");
      isLoading = false;
      notifyListeners();
    } else {
      isLoading = false;
      notifyListeners();
    }
  }
}
