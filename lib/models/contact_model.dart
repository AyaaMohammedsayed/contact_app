import 'dart:io';

class ContactModel {
  String name;
  String email;
  String phone;
  File image;
  ContactModel({
    required this.email,
    required this.name,
    required this.image,
    required this.phone,
  });
}
