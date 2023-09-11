import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:mrfreddy/data/models/trader.dart';
import 'package:mrfreddy/data/models/user.dart';
import 'package:path/path.dart';
import 'package:uuid/uuid.dart';

class TraderRepo {
  final FirebaseFirestore _store = FirebaseFirestore.instance;
  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

  Future<String?> uploadImage(photo) async {
    if (photo == null) return null;
    final fileName = basename(photo.path);
    final destination = 'files/$fileName';

    try {
      final ref = firebase_storage.FirebaseStorage.instance
          .ref(destination)
          .child('file/');
      await ref.putFile(photo!);
      String downloadUrl = await ref.getDownloadURL();
      return downloadUrl;
    } catch (e) {
      print(e);
      print('error occured');
    }
  }

  Future<void> addTrader(ModelTrader modelTrader, File? photo) async {
    final uuid = Uuid();
    final shortuuid = uuid.v4().split('-').first;

    if (photo != null) {
      String? photoUrl = await uploadImage(photo);
      if (photoUrl != null) {
        modelTrader.imgUrl = photoUrl;
      }
    }
    modelTrader.id = shortuuid;
    await _store.collection('traders').doc(shortuuid).set(
          modelTrader.toMap(),
        );
  }

  Future<List<ModelTrader?>> getFollowedTrader(ModelUser user) async {
    if (user.followedTraders.isNotEmpty) {
      QuerySnapshot followedTraders = await _store
          .collection("traders")
          .where(FieldPath.documentId, whereIn: user.followedTraders)
          .get();

      List<ModelTrader> traders = followedTraders.docs.map(
        (trader) {
          return ModelTrader.fromMap(trader.data() as Map<String, dynamic>);
        },
      ).toList();
    
      return traders;
    }

    return [];
  }

  Future<List<ModelTrader>?> getAllTraders() async {
    QuerySnapshot followedTraders = await _store.collection("traders").get();

    List<ModelTrader> traders = followedTraders.docs.map(
      (trader) {
        return ModelTrader.fromMap(trader.data() as Map<String, dynamic>);
      },
    ).toList();

    if (traders.isNotEmpty) {
      return traders;
    }

    return null;
  }

  Future<void> followTrader(
      ModelUser user, String traderUid) async {
    try {
      await _store.collection("users").doc(user.id).update(
        {
          'followedTraders': FieldValue.arrayUnion([traderUid]),
        },
      );
      user.followedTraders.add(traderUid);

    } catch (e) {
      print('Error adding new Trader: $e');
    }
  }

  Future<void> unfollowTrader(ModelUser user, String traderUid) async {
    try {
      await _store.collection("users").doc(user.id).update({
        'followedTraders': FieldValue.arrayRemove([traderUid]),
      });
      user.followedTraders.remove(traderUid);
    } catch (e) {
      print('Error removing Trader: $e');
    }
  }
}
