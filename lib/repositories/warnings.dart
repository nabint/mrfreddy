import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mrfreddy/data/models/trader.dart';

class WarningRepo {
  final FirebaseFirestore _store = FirebaseFirestore.instance;

  Future<void> addBusiness(
      ModelTrader trader, Map<String, String> warnings) async {
    try {
      await _store.collection("traders").doc(trader.id).update(
        {
          'warnings': FieldValue.arrayUnion([warnings]),
        },
      );
      trader.warnings.add(warnings);
    } catch (e) {
      print(e);
    }
  }
}
