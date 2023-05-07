import 'package:cloud_firestore/cloud_firestore.dart';

class Usermodel {
  final String? fname;

  final String? lname;
  final String? email;

  final String? username;
  final String? contact;
  final String? fld;

  final String? country;

  Usermodel({
    required this.fname,
    required this.lname,
    required this.email,
    required this.username,
    required this.contact,
    required this.fld,
    required this.country,
  });

  factory Usermodel.fromDocument(DocumentSnapshot doc) {
    return Usermodel(
      fname: doc['fname'],
      lname: doc['lname'],
      email: doc['email'],
      username: doc['username'],
      contact: doc['contact'],
      fld: doc['fld'],
      country: doc['country'],
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = {};
    data['fname'] = fname;
    data['lnme'] = lname;
    data['email'] = email;

    data['username'] = username;
    return data;
  }
}
