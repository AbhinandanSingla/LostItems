import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors.blackBackground,
      appBar: AppBar(
        toolbarHeight: 70,
        title: AutoSizeText("Lost items",
            style: GoogleFonts.roboto(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white)),
        backgroundColor: colors.background,
        elevation: 1,
        shadowColor: colors.shadow,
        actions: [
          Icon(Icons.chat_sharp),
          SizedBox(
            width: 10,
          )
        ],
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 4, bottom: 4),
            padding: EdgeInsets.only(left: 8, right: 8, top: 8, bottom: 8),
            decoration: BoxDecoration(
              color: colors.mainBackground,
            ),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: colors.shadow, width: 1)),
                  child: Column(children: [
                    ListTile(
                      leading: SizedBox(
                          height: 100,
                          child: CircleAvatar(
                            child: Text("T"),
                          )),
                      title: Text("Bupinder Pussia",
                          style: GoogleFonts.openSans(
                              color: colors.textWhite, fontSize: 18)),
                      subtitle: Text("Computer Science",
                          style: GoogleFonts.openSans(
                              color: colors.shadow, fontSize: 14)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0, right: 12),
                      child: Text(
                        "My plain silver ring is lost in or near LT402.",
                        style: GoogleFonts.openSans(
                            color: colors.textWhite,
                            fontSize: 14,
                            letterSpacing: 1.5),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ]),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Column(
                      children: [
                        Icon(Icons.back_hand_sharp, color: colors.textWhite),
                        Text(
                          "Founded",
                          style: GoogleFonts.openSans(color: colors.textWhite),
                        )
                      ],
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      children: [
                        Icon(Icons.message, color: colors.textWhite),
                        Text(
                          "chat",
                          style: GoogleFonts.openSans(color: colors.textWhite),
                        )
                      ],
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      children: [
                        Icon(Icons.archive, color: colors.textWhite),
                        Text(
                          "ignore",
                          style: GoogleFonts.openSans(color: colors.textWhite),
                        )
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 4, bottom: 4),
            padding: EdgeInsets.only(left: 8, right: 8, top: 8, bottom: 8),
            decoration: BoxDecoration(
              color: colors.mainBackground,
            ),
            child: Column(
              children: [
                Container(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListTile(
                          leading: SizedBox(
                              height: 100,
                              child: CircleAvatar(
                                child: Text("T"),
                              )),
                          title: Text("Bupinder Pussia",
                              style: GoogleFonts.openSans(
                                  color: colors.textWhite, fontSize: 18)),
                          subtitle: Text("Computer Science",
                              style: GoogleFonts.openSans(
                                  color: colors.shadow, fontSize: 14)),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 4.0, right: 8),
                          child: Text(
                            "My plain silver ring is lost in or near LT402.",
                            style: GoogleFonts.openSans(
                                color: colors.textWhite,
                                fontSize: 14,
                                letterSpacing: 1.5),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          child: Image.network(
                              "https://i.gadgets360cdn.com/products/headphones-and-headsets/large/apple-airpods-pro-ture-wireless-earphones-832X558-1598517589.jpg"),
                        )
                      ]),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.only(right: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Icon(Icons.back_hand_sharp, color: colors.textWhite),
                          Text(
                            "Founded",
                            style:
                                GoogleFonts.openSans(color: colors.textWhite),
                          )
                        ],
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        children: [
                          Icon(Icons.message, color: colors.textWhite),
                          Text(
                            "chat",
                            style:
                                GoogleFonts.openSans(color: colors.textWhite),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        children: [
                          Icon(Icons.share_outlined, color: colors.textWhite),
                          Text(
                            "Forward",
                            style:
                                GoogleFonts.openSans(color: colors.textWhite),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        children: [
                          Icon(Icons.archive, color: colors.textWhite),
                          Text(
                            "ignore",
                            style:
                                GoogleFonts.openSans(color: colors.textWhite),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 4, bottom: 4),
            padding: EdgeInsets.only(left: 8, right: 8, top: 8, bottom: 8),
            decoration: BoxDecoration(
              color: colors.mainBackground,
            ),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: colors.shadow, width: 1)),
                  child: Column(children: [
                    ListTile(
                      leading: SizedBox(
                          height: 100,
                          child: CircleAvatar(
                            child: Text("T"),
                          )),
                      title: Text("Bupinder Pussia",
                          style: GoogleFonts.openSans(
                              color: colors.textWhite, fontSize: 18)),
                      subtitle: Text("Computer Science",
                          style: GoogleFonts.openSans(
                              color: colors.shadow, fontSize: 14)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0, right: 12),
                      child: Text(
                        "My plain silver ring is lost in or near LT402.",
                        style: GoogleFonts.openSans(
                            color: colors.textWhite,
                            fontSize: 14,
                            letterSpacing: 1.5),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ]),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Column(
                      children: [
                        Icon(Icons.back_hand_sharp, color: colors.textWhite),
                        Text(
                          "Founded",
                          style: GoogleFonts.openSans(color: colors.textWhite),
                        )
                      ],
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      children: [
                        Icon(Icons.message, color: colors.textWhite),
                        Text(
                          "chat",
                          style: GoogleFonts.openSans(color: colors.textWhite),
                        )
                      ],
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      children: [
                        Icon(Icons.archive, color: colors.textWhite),
                        Text(
                          "ignore",
                          style: GoogleFonts.openSans(color: colors.textWhite),
                        )
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
