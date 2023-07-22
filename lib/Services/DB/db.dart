import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class DB {
  final getData = FirebaseFirestore.instance.collection('products').snapshots();
  final productRef = FirebaseFirestore.instance.collection('products');
  final refStorage = FirebaseStorage.instance.ref().child("productImage");
}
