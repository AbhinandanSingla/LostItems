import 'package:cloud_firestore/cloud_firestore.dart';

class Services {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String currentUser = "I35rYT3AAc9yTk1mxV4v";

  addRequest(itemName, itemDesc, itemLoc, itemStatus) async {
    var doc = _firestore.collection("itemRequests").doc();
    final result = await doc.set({
      "itemName": itemName,
      "itemDesc": itemDesc,
      "itemLoc": itemLoc,
      "reqTime": DateTime.now(),
      "status": 'request',
      "userId": currentUser,
      "itemStatus": itemStatus
    }).then((value) =>
        _firestore.collection('lostItemUser').doc(currentUser).update({
          "items": FieldValue.arrayUnion([doc.id])
        }));
    return result;
  }

  Stream<QuerySnapshot> getRequests() {
    return _firestore
        .collection("itemRequests")
        .where("status", isEqualTo: "request")
        .snapshots();
  }

  acceptRequest(itemDoc) {
    _firestore
        .collection("itemRequests")
        .doc(itemDoc)
        .update({"status": 'accepted'});
  }

  rejectRequest(itemDoc) {
    _firestore
        .collection("itemRequests")
        .doc(itemDoc)
        .update({"status": 'rejected'});
  }

  createChatRoom(id) {
    var doc = _firestore.collection('lostItemChatRoom').doc();
    doc.set({
      "createdTime": DateTime.now(),
      "createdBy": currentUser,
      "createdWith": id
    });
    var chatDoc = doc.collection('chats').doc();

  }
}

Services services = Services();
