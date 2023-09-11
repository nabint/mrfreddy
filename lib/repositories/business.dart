import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mrfreddy/data/models/trader.dart';

class BusinessRepo {
  final FirebaseFirestore _store = FirebaseFirestore.instance;

  Future<void> addBusiness(
      ModelTrader trader, Map<String, String> business) async {
    try {
      await _store.collection("traders").doc(trader.id).update(
        {
          'business': FieldValue.arrayUnion([business]),
        },
      );
      trader.business.add(business);
    } catch (e) {
      print(e);
    }
  }
}
