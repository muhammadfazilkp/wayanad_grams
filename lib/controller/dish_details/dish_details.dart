import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../model/dish/dish.dart';



class DishDetailsProvider extends ChangeNotifier {
  File? _dishImage;
  List<Dish> _dishes = [];
  Dish? _dish;

  TextEditingController dishnameController = TextEditingController();
  TextEditingController dishpriceController = TextEditingController();
  TextEditingController dishDescriptionController = TextEditingController();

  File? get dishImage => _dishImage;
  List<Dish> get dishes => _dishes;
  Dish? get dish => _dish;

  final fireStoreInstance = FirebaseFirestore.instance.collection("Dishes");

  Future<void> getImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      _dishImage = File(image.path);
      notifyListeners();
    } catch (e) {
      debugPrint("Error picking image: $e");
    }
  }

  Future<void> addToDb(
      String dishname, String discription, String price) async {
    try {
      if (_dishImage == null) throw Exception("No image selected");

      // Check if the user is authenticated
      // User? user = FirebaseAuth.instance.currentUser;
      // if (user == null) {
      //   throw FirebaseAuthException(
      //       code: 'not-authenticated', message: 'User is not authenticated');
      // }

      final imageUrl = await _uploadImageToCloud(_dishImage!);
      final Map<String, dynamic> dishData = {
        "dishname": dishname,
        "discription": discription,
        "image": imageUrl,
        "price": price,
      };
      await fireStoreInstance.doc(dishname).set(dishData);
      debugPrint("Successfully added dish to Firestore");
    } catch (e) {
      debugPrint("Error adding dish to Firestore: $e");
    }
  }

  Future<String> _uploadImageToCloud(File file) async {
    try {
      final Reference storageRef = FirebaseStorage.instance
          .ref()
          .child('images/${DateTime.now().millisecondsSinceEpoch}');
      final UploadTask uploadTask = storageRef.putFile(file);
      final TaskSnapshot snapshot = await uploadTask;
      final String downloadUrl = await snapshot.ref.getDownloadURL();
      notifyListeners();
      return downloadUrl;
    } catch (e) {
      debugPrint("Error uploading image: $e");
      rethrow;
    }
  }

  Future<void> getDetails() async {
    try {
      final QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await fireStoreInstance.get();
      final List<Map<String, dynamic>> view =
          querySnapshot.docs.map((doc) => doc.data()).toList();
      _dishes = view.map((data) => Dish.fromJson(data)).toList();
      notifyListeners();
    } catch (e) {
      debugPrint("Error fetching details: $e");
    }
  }
}
