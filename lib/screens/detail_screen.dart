import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/article_model.dart';
import '../services/firestore_service.dart';

class DetailScreen extends StatefulWidget {
  final ArticleModel article;
  const DetailScreen({super.key, required this.article});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  bool _isFavorite = false;
  final _firestoreService = FirestoreService();
  String? _uid;

  @override
  void initState() {
    super.initState();
    _uid = FirebaseAuth.instance.currentUser?.uid;
    _checkFavorite();
  }

  Future<void> _checkFavorite() async {
    if (_uid == null) return;
    final result = await _firestoreService.isFavorite(_uid!, widget.article.id);
    setState(() => _isFavorite = result);
  }

  Future<void> _toggleFavorite() async {
    if (_uid == null) return;
    if (_isFavorite) {
      await _firestoreService.removeFavorite(_uid!, widget.article.id);
    } else {
      await _firestoreService.addFavorite(
        _uid!,
        widget.article.id,
        widget.article.title,
      );
    }
    setState(() => _isFavorite = !_isFavorite);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Berita'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: Icon(
              _isFavorite ? Icons.favorite : Icons.favorite_border,
              color: _isFavorite ? Colors.red : Colors.white,
            ),
            onPressed: _toggleFavorite,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            widget.article.imageUrl.isNotEmpty
                ? Image.network(
                    widget.article.imageUrl,
                    width: double.infinity,
                    height: 220,
                    fit: BoxFit.cover,
                    errorBuilder: (c, e, s) => Container(
                      height: 220,
                      color: Colors.grey[300],
                      child: const Icon(Icons.image_not_supported, size: 60),
                    ),
                  )
                : Container(
                    height: 220,
                    color: Colors.grey[300],
                    child: const Icon(Icons.image_not_supported, size: 60),
                  ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.article.title,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Publisher: ${widget.article.newsSite}',
                    style: const TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    widget.article.summary,
                    style: const TextStyle(fontSize: 15, height: 1.5),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
