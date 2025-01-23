import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kaptastask/cardlists/model/cardModel.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({super.key, required this.cardModel});
  final CardModel cardModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          gradient: cardModel.completed == true
              ? LinearGradient(colors: [
                  Colors.green.withOpacity(0.5),
                  Colors.blue.withOpacity(0.2),
                ])
              : LinearGradient(colors: [
                  Colors.red.withOpacity(0.5),
                  Colors.redAccent.withOpacity(0.2),
                ]),
          color: cardModel.completed == true ? Colors.green : Colors.red),
      child: Column(
        children: [
          Row(
            children: [
              Text("User ID:",
                  style: GoogleFonts.roboto(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: Colors.black87)),
              Text(cardModel.userId.toString() ?? "",
                  style: GoogleFonts.roboto(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: Colors.black87)),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text("Title: ",
                  style: GoogleFonts.roboto(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: Colors.black)),
              Expanded(
                child: Text(cardModel.title.toString() ?? "",
                    maxLines: 2,
                    style: GoogleFonts.roboto(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        color: Colors.black87)),
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            children: [
              Text("Status: ",
                  style: GoogleFonts.roboto(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: Colors.black)),
              Text(cardModel.completed == true ? "Completed" : "Not Completed",
                  style: GoogleFonts.roboto(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: Colors.black87)),
            ],
          )
        ],
      ),
    );
  }
}
