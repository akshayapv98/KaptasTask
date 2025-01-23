import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kaptastask/cardlists/controller/cardController.dart';
import 'package:kaptastask/cardlists/view/widgets/cardWidget.dart';
import 'package:provider/provider.dart';

class ListOfCardScreen extends StatefulWidget {
  const ListOfCardScreen({super.key});

  @override
  State<ListOfCardScreen> createState() => _ListOfCardScreenState();
}

class _ListOfCardScreenState extends State<ListOfCardScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        context.read<Cardcontroller>().getCardLists();
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Cards",
          style: GoogleFonts.roboto(fontSize: 16, color: Colors.black),
        ),
      ),
      body: Consumer<Cardcontroller>(builder: (context, cardlist, _) {
        log("-------------${cardlist.cardlists.length}");
        return cardlist.isLoading == true
            ? const Center(
                child: CircularProgressIndicator(
                  color: Colors.blue,
                ),
              )
            : ListView.builder(
                shrinkWrap: true,
                itemCount: cardlist.cardlists.length,
                itemBuilder: (context, index) {
                  return CardWidget(
                    cardModel: cardlist.cardlists[index],
                  );
                });
      }),
    );
  }
}
