import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:zudocoz/model/note.dart';
import 'package:zudocoz/view/login_page/sign_up.dart';


class LocalDatas extends ChangeNotifier {
  static String myNotes = "notes";
  Future<Box<Note>> openBox() async {
    return Hive.box<Note>(myNotes);
  }

  Future<void> addNote(Note note) async {
    final box = await openBox();
    int key = await box.add(note);
    box.put(key, note);
    notifyListeners();
  }

  Future<void> deleteNote(int index) async {
    final box = await openBox();
    await box.deleteAt(index);
    notifyListeners();
  }

  Future<List<Note>> getNotes() async {
    final box = await openBox();
    return box.values.toList();
  }

  TextEditingController headingController = TextEditingController();
  TextEditingController contentController = TextEditingController();

  void navigate(BuildContext context) {
    FirebaseAuth auth=FirebaseAuth.instance;
    User? user =auth.currentUser;
    





    Future.delayed(const Duration(seconds: 5)).then((value) => Navigator.push(
        context, MaterialPageRoute(builder: (context) =>  SignUpScreen())));
  }

 
}
