import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mrfreddy/data/models/user.dart';
import 'package:mrfreddy/utils/exception.dart';

class AuthRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _store = FirebaseFirestore.instance;
  ModelUser? _user;
  ModelUser? get user => _user;

  Future<void> autoLogin() async {
    try {
      User? user = _auth.currentUser;
      if (user != null) {
        DocumentSnapshot userSnapshot =
            await _store.collection('users').doc(user.uid).get();

        print(userSnapshot.data());
        _user = ModelUser.fromMap(
          userSnapshot.data()! as Map<String, dynamic>,
        );
        _user!.id = user.uid;
      }
    } catch (e) {
      print(e.toString());
      throw Exception(e.toString());
    }
  }

  Future<void> sendLoginCode(String phone,
      {Function? onCodeSent,
      Function? onVerificationFailed,
      Function? onVerificationCompleted,
      Function? codeAutoRetrievalTimeout}) async {
    try {
      final QuerySnapshot result = await _store
          .collection('users')
          .where('phone', isEqualTo: phone)
          .limit(1)
          .get();

      if (result.docs.isEmpty) {
        throw ErrorCodeException(404, 'User not found');
      }

      await _auth.verifyPhoneNumber(
          phoneNumber: phone,
          verificationCompleted: (PhoneAuthCredential credential) {
            if (onVerificationCompleted != null) {
              onVerificationCompleted(credential);
            }
          },
          verificationFailed: (FirebaseAuthException e) {
            if (onVerificationFailed != null) {
              onVerificationFailed(e);
            }
          },
          codeSent: (String verificationId, int? resendToken) {
            if (onCodeSent != null) {
              onCodeSent(verificationId, resendToken);
            }
          },
          codeAutoRetrievalTimeout: (String verificationId) {
            throw Exception('Time out');
          });
    } catch (e) {
      print("dhsfsdfl;");
      print(e.toString());
      rethrow;
    }
  }

  Future<void> sendRegistrationCode(ModelUser user,
      {Function? onCodeSent,
      Function? onVerificationFailed,
      Function? onVerificationCompleted,
      Function? codeAutoRetrievalTimeout}) async {
    try {
      final QuerySnapshot result = await _store
          .collection('users')
          .where('phone', isEqualTo: user.phone)
          .limit(1)
          .get();

      if (result.docs.isNotEmpty) {
        throw Exception('User already exists');
      }

      await _auth.verifyPhoneNumber(
          phoneNumber: user.phone,
          verificationCompleted: (PhoneAuthCredential credential) {
            if (onVerificationCompleted != null) {
              print("Verification completed");
              onVerificationCompleted(credential);
            }
          },
          verificationFailed: (FirebaseAuthException e) {
            if (onVerificationFailed != null) {
              print("Verification Failed");
              onVerificationFailed(e);
            }
          },
          codeSent: (String verificationId, int? resendToken) {
            if (onCodeSent != null) {
              print("Verfication not sent");

              onCodeSent(verificationId, resendToken);
            }
          },
          codeAutoRetrievalTimeout: (String verificationId) {
            throw Exception('Time out');
          });
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> registerUser(
      {PhoneAuthCredential? credential,
      String? verificationId,
      String? code,
      required ModelUser user}) async {
    UserCredential? userCredential;
    try {
      if (credential != null) {
        userCredential = await _auth.signInWithCredential(credential);
        await _auth.currentUser!.updateDisplayName(user.name);
      } else {
        PhoneAuthCredential phoneAuthCredential = PhoneAuthProvider.credential(
            verificationId: verificationId!, smsCode: code!);
        userCredential = await _auth.signInWithCredential(phoneAuthCredential);
      }

      await _store.collection('users').doc(userCredential.user!.uid).set(
            user.toMap(),
          );
      _user = user.copyWith(id: userCredential.user!.uid);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> loginUser(
      {PhoneAuthCredential? credential,
      String? verificationId,
      String? code}) async {
    UserCredential? userCredential;
    try {
      if (credential != null) {
        await _auth.signInWithCredential(credential);
      } else {
        PhoneAuthCredential phoneAuthCredential = PhoneAuthProvider.credential(
            verificationId: verificationId!, smsCode: code!);
        userCredential = await _auth.signInWithCredential(phoneAuthCredential);
      }
    } catch (e) {
      print(e.toString());
      // throw (ErrorCodeException(401,
      //     "The sms verification code is invalid. Please check the code and try again."));
    }
    DocumentSnapshot userSnapshot =
        await _store.collection('users').doc(userCredential!.user!.uid).get();
    _user = ModelUser.fromMap(
      userSnapshot.data()! as Map<String, dynamic>,
    );
    _user!.id = userCredential.user!.uid;
  }

  Future<void> logout() async {
    await _auth.signOut();
    _user = null;
  }
}
