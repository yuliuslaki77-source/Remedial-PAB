import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> saveUserProfile({
    required String uid,
    required String name,
    required String email,
    required String instagram,
    required String photoUrl,
  }) async {
    await _db.collection('users').doc(uid).set({
      'uid': uid,
      'name': name,
      'email': email,
      'instagram': instagram,
      'photoUrl': photoUrl,
    });
  }

  Future<Map<String, dynamic>?> getUserProfile(String uid) async {
    DocumentSnapshot doc = await _db.collection('users').doc(uid).get();
    return doc.data() as Map<String, dynamic>?;
  }

  Future<void> addFavorite(String uid, int articleId, String title) async {
    await _db
        .collection('favorites')
        .doc(uid)
        .collection('articles')
        .doc(articleId.toString())
        .set({
          'id': articleId,
          'title': title,
          'savedAt': FieldValue.serverTimestamp(),
        });
  }

  Future<void> removeFavorite(String uid, int articleId) async {
    await _db
        .collection('favorites')
        .doc(uid)
        .collection('articles')
        .doc(articleId.toString())
        .delete();
  }

  Stream<QuerySnapshot> getFavorites(String uid) {
    return _db
        .collection('favorites')
        .doc(uid)
        .collection('articles')
        .orderBy('savedAt', descending: true)
        .snapshots();
  }

  Future<bool> isFavorite(String uid, int articleId) async {
    DocumentSnapshot doc = await _db
        .collection('favorites')
        .doc(uid)
        .collection('articles')
        .doc(articleId.toString())
        .get();
    return doc.exists;
  }
}
