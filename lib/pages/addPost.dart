import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lostitems/utils/services.dart';

import '../constants.dart';

class AddPost extends StatefulWidget {
  @override
  State<AddPost> createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  final TextEditingController _lostItemName = TextEditingController();
  final TextEditingController _lostItemLoc = TextEditingController();
  final TextEditingController _lostItemDesc = TextEditingController();
  String itemStatus = "Lost";

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: colors.background,
      bottomSheet: Container(
        width: double.infinity,
        height: 150,
        margin: EdgeInsets.only(top: 10),
        decoration: BoxDecoration(
            color: colors.background,
            boxShadow: const [
              BoxShadow(
                  color: Colors.black,
                  offset: Offset(0, 0),
                  blurRadius: 8,
                  spreadRadius: 2)
            ],
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        child: Column(children: [
          ListTile(
            leading: Icon(Icons.photo, color: colors.textWhite),
            title: Text('Add a Photo',
                style: GoogleFonts.openSans(color: colors.textWhite)),
          ),
          ListTile(
            leading: Icon(Icons.video_collection, color: colors.textWhite),
            title: Text('Add a video',
                style: GoogleFonts.openSans(color: colors.textWhite)),
          ),
        ]),
      ),
      appBar: AppBar(
          centerTitle: true,
          leading: Icon(Icons.close, color: colors.shadow, size: 30),
          toolbarHeight: 70,
          title: AutoSizeText("Add Request",
              style: GoogleFonts.roboto(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white)),
          backgroundColor: colors.background,
          elevation: 1,
          shadowColor: colors.shadow,
          actions: [
            GestureDetector(
              onTap: () {
                if (_lostItemName.text.isNotEmpty &&
                    _lostItemLoc.text.isNotEmpty &&
                    _lostItemDesc.text.isNotEmpty) {
                  _lostItemDesc.buildTextSpan(
                      context: context, withComposing: true);
                  Future result = services.addRequest(
                      _lostItemName.value.text,
                      _lostItemDesc.value.text,
                      _lostItemLoc.value.text,
                      itemStatus);
                  result.then((value) {
                    print("Item Request is Added");
                    _lostItemName.clear();
                    _lostItemLoc.clear();
                    _lostItemDesc.clear();
                  }).catchError((e) {
                    print(e);
                  });
                } else {
                  print("Some Information is Missing...");
                }
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Center(
                    child: Text('Post',
                        style: GoogleFonts.inter(
                            color: colors.shadow,
                            fontSize: 18,
                            fontWeight: FontWeight.w600))),
              ),
            )
          ]),
      body: SingleChildScrollView(
          child: Container(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
              padding: EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 15),
                  Text(
                    "Item Name",
                    style: GoogleFonts.poppins(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: colors.textWhite.withOpacity(0.8)),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10),
                    margin: EdgeInsets.only(top: 4),
                    decoration: BoxDecoration(
                        color: colors.shadow,
                        borderRadius: BorderRadius.circular(15)),
                    child: TextField(
                        style: GoogleFonts.openSans(color: colors.textWhite),
                        controller: _lostItemName,
                        decoration: const InputDecoration(
                          hintText: "Apple Airpod",
                          border: InputBorder.none,
                        )),
                  ),
                ],
              )),
          SizedBox(height: 12),
          Container(
              padding: EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 15),
                  Text(
                    "Location",
                    style: GoogleFonts.poppins(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: colors.textWhite.withOpacity(0.8)),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10),
                    margin: EdgeInsets.only(top: 4),
                    decoration: BoxDecoration(
                        color: colors.shadow,
                        borderRadius: BorderRadius.circular(15)),
                    child: TextField(
                        controller: _lostItemLoc,
                        decoration: const InputDecoration(
                          hintText: "Near COS",
                          border: InputBorder.none,
                        )),
                  ),
                ],
              )),
          const SizedBox(height: 12),
          Container(
              padding: EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 15),
                  Text(
                    "Request Type",
                    style: GoogleFonts.poppins(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: colors.textWhite.withOpacity(0.8)),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 4),
                    decoration: BoxDecoration(
                        color: colors.shadow,
                        borderRadius: BorderRadius.circular(15)),
                    child: Container(
                      padding: EdgeInsets.only(left: 20, right: 10),
                      width: size.width,
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  color: colors.shadow, width: 0.3))),
                      child: DropdownButton(
                          dropdownColor: colors.shadow,
                          underline: Container(),
                          isExpanded: true,
                          style: TextStyle(
                            fontSize: 16,
                          ),
                          items: <String>["Lost", "Found"]
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (v) {
                            setState(() {
                              itemStatus = v!;
                            });
                          },
                          value: itemStatus),
                    ),
                  ),
                ],
              )),
          const SizedBox(height: 12),
          Container(
              padding: const EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 15),
                  Text(
                    "Item Description",
                    style: GoogleFonts.poppins(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: colors.textWhite.withOpacity(0.8)),
                  ),
                  Container(
                    height: 150,
                    margin: const EdgeInsets.only(top: 4),
                    decoration: BoxDecoration(
                        color: colors.shadow,
                        borderRadius: BorderRadius.circular(15)),
                    child: TextField(
                        style: GoogleFonts.openSans(color: colors.textWhite),
                        controller: _lostItemDesc,
                        maxLines: 20,
                        minLines: 1,
                        keyboardType: TextInputType.multiline,
                        decoration: const InputDecoration(
                            contentPadding: EdgeInsets.all(20),
                            hintText: "Write Something",
                            border: InputBorder.none)),
                  ),
                ],
              )),
          SizedBox(height: 10),
        ]),
      )),
    );
  }
}
