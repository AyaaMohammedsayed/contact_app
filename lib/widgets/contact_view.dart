import 'package:contact_app/models/contact_model.dart';
import 'package:flutter/material.dart';

class ContactView extends StatelessWidget {
  ContactModel model;
  ContactView({required this.model});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        model.image!=null?
        Image.file(model.image!):Image.asset( 'assets/images/image_profile.png',fit: BoxFit.cover,),

      ],
    );
  }
}
