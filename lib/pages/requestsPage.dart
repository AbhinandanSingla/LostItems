import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lostitems/utils/services.dart';

import '../constants.dart';

class RequestsPage extends StatefulWidget {
  @override
  State<RequestsPage> createState() => _RequestsPageState();
}

class _RequestsPageState extends State<RequestsPage> {
  int _openLostTile = -1;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: colors.blackBackground,
      appBar: AppBar(
        toolbarHeight: 70,
        title: AutoSizeText("Lost items Requests",
            style: GoogleFonts.roboto(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white)),
        backgroundColor: colors.background,
        elevation: 1,
        shadowColor: colors.shadow,
        actions: const [
          Icon(Icons.chat_sharp),
          SizedBox(
            width: 10,
          )
        ],
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          StreamBuilder(
              stream: services.getRequests(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        String? id = snapshot.data?.docs[index].id;
                        DocumentSnapshot data = snapshot.data?.docs[index]
                            as DocumentSnapshot<Object?>;
                        return GestureDetector(
                            onTap: () {
                              setState(() {
                                if (_openLostTile == index) {
                                  _openLostTile = -1;
                                } else {
                                  _openLostTile = index;
                                }
                              });
                            },
                            child: _openLostTile == index
                                ? ShowLostItem(data, size, id)
                                : LostItemTile(data, size, id));
                      });
                } else {
                  return Container();
                }
              }),
        ],
      )),
    );
  }

  Container LostItemTile(
      DocumentSnapshot<Object?> data, Size size, String? id) {
    return Container(
      margin: EdgeInsets.only(top: 0, bottom: 6),
      decoration: BoxDecoration(
        color: colors.mainBackground,
      ),
      child: Column(
        children: [
          Column(children: [
            Container(
              padding: EdgeInsets.only(left: 8, right: 15),
              margin: EdgeInsets.only(top: 20, bottom: 20),
              child: Row(
                children: [
                  Container(
                    padding:
                        EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 10),
                    child: Text(data.get("itemStatus").toString(),
                        style: GoogleFonts.openSans(
                            color: colors.textWhite,
                            fontSize: 14,
                            letterSpacing: 0.5,
                            fontWeight: FontWeight.bold)),
                    decoration: BoxDecoration(
                        color: colors.shadow,
                        borderRadius: BorderRadius.circular(2)),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(data.get("itemName").toString(),
                          style: GoogleFonts.roboto(
                              fontWeight: FontWeight.bold,
                              color: colors.textWhite,
                              fontSize: 18)),
                      SizedBox(height: 4),
                      Container(
                        width: size.width * 0.37,
                        child: Text(
                          data.get("itemDesc").toString(),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          softWrap: false,
                          style: GoogleFonts.inter(
                              color: colors.textWhite,
                              fontSize: 13,
                              letterSpacing: 1.5),
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          services.rejectRequest(id);
                        },
                        child: Container(
                          padding: const EdgeInsets.only(
                              left: 10, bottom: 5, top: 5, right: 10),
                          decoration: BoxDecoration(
                              border: Border.all(color: colors.shadow)),
                          child: Text("Cancel",
                              style: GoogleFonts.openSans(
                                  fontSize: 12, color: colors.textWhite)),
                        ),
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      GestureDetector(
                        onTap: () {
                          services.acceptRequest(id);
                        },
                        child: Container(
                          padding: const EdgeInsets.only(
                              left: 10, bottom: 5, top: 5, right: 10),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.blue)),
                          child: Text("Approve",
                              style: GoogleFonts.openSans(
                                  fontSize: 12, color: Colors.blue)),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ]),
        ],
      ),
    );
  }

  Container ShowLostItem(
      DocumentSnapshot<Object?> data, Size size, String? id) {
    return Container(
      margin: const EdgeInsets.only(top: 0, bottom: 4),
      padding: const EdgeInsets.only(left: 8, right: 8, top: 8, bottom: 8),
      decoration: BoxDecoration(
        color: colors.mainBackground,
      ),
      child: Column(
        children: [
          Container(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              ListTile(
                contentPadding: EdgeInsets.only(left: 6),
                leading: Container(
                  padding:
                      EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 10),
                  decoration: BoxDecoration(
                      color: colors.shadow,
                      borderRadius: BorderRadius.circular(2)),
                  child: Text(data.get("itemStatus").toString(),
                      style: GoogleFonts.openSans(
                          color: colors.textWhite,
                          fontSize: 14,
                          letterSpacing: 0.5,
                          fontWeight: FontWeight.bold)),
                ),
                title: Text(data.get("itemName").toString(),
                    style: GoogleFonts.roboto(
                        fontWeight: FontWeight.bold,
                        color: colors.textWhite,
                        fontSize: 18)),
                trailing: SizedBox(
                    width: 150,
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(
                              left: 10, bottom: 5, top: 5, right: 10),
                          decoration: BoxDecoration(
                              border: Border.all(color: colors.shadow)),
                          child: Text("Cancel",
                              style: GoogleFonts.openSans(
                                  fontSize: 12, color: colors.textWhite)),
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        Container(
                          padding: const EdgeInsets.only(
                              left: 10, bottom: 5, top: 5, right: 10),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.blue)),
                          child: Text("Approve",
                              style: GoogleFonts.openSans(
                                  fontSize: 12, color: Colors.blue)),
                        )
                      ],
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 2),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.location_on_outlined, color: colors.shadow),
                    Text(
                      data.get("itemLoc").toString(),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      softWrap: false,
                      style: GoogleFonts.inter(
                        color: colors.shadow,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 6,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 4.0, right: 8),
                child: Text(
                  data.get("itemDesc").toString(),
                  style: GoogleFonts.openSans(
                      color: colors.textWhite,
                      fontSize: 14,
                      letterSpacing: 1.5),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                child: Image.network(
                    "https://i.gadgets360cdn.com/products/headphones-and-headsets/large/apple-airpods-pro-ture-wireless-earphones-832X558-1598517589.jpg"),
              ),
            ]),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            padding: const EdgeInsets.only(right: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                const SizedBox(
                  width: 20,
                ),
                Column(
                  children: [
                    Icon(Icons.message, color: colors.textWhite),
                    Text(
                      "chat",
                      style: GoogleFonts.openSans(color: colors.textWhite),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  children: [
                    Icon(Icons.share_outlined, color: colors.textWhite),
                    Text(
                      "Forward",
                      style: GoogleFonts.openSans(color: colors.textWhite),
                    ),
                  ],
                ),
                const SizedBox(
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
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
