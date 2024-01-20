import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:wemace/core/constants/constants.dart';
import 'package:wemace/core/constants/firebase_constants.dart';
import 'package:wemace/core/providers/firebase_providers.dart';
import 'package:wemace/models/user_model.dart';

final AuthRepositoryProvider = Provider(
  (ref) => AuthRepository(
    firestore: ref.read(firestoreProvider),
    auth: ref.read(authProvider),
    googleSignIn: ref.read(GoogleSignInProvider),
  ),
);

class AuthRepository {
  final FirebaseFirestore _firestore;
  final FirebaseAuth _auth;
  final GoogleSignIn _googleSignIn;

  AuthRepository(
      {required FirebaseFirestore firestore,
      required FirebaseAuth auth,
      required GoogleSignIn googleSignIn})
      : _auth = auth,
        _firestore = firestore,
        _googleSignIn = googleSignIn;

  CollectionReference get _users =>
      _firestore.collection(FirebaseConstants.usersCollection);

  void signInWithGoogle() async {
    try {
      final GoogleSignInAccount? gooleUser = await _googleSignIn.signIn();
      final googleAuth = await gooleUser?.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: (googleAuth)?.accessToken,
        idToken: (googleAuth)?.idToken,
      );
      UserCredential userCredential =
          await _auth.signInWithCredential(credential);
      UserModel userModel = UserModel(
        name: userCredential.user!.displayName ?? 'Untitled',
        profilePic: userCredential.user!.photoURL ?? Constants.avatarDefault,
        banner: Constants.bannerDefault,
        uid: userCredential.user!.uid,
        isAuthenticated: true,
        karma: 0,
        awards: [],
      );
      await _users.doc(userModel.uid).set(userModel.toMap());
    } catch (e) {
      print(e);
    }
  }
}
