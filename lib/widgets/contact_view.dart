import 'package:contact_app/models/contact_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ContactView extends StatelessWidget {
  ContactModel model;
  ContactView({required this.model});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        model.image!=null?
        Image.file(model.image!):Image.asset( 'assets/images/image_profile.png',fit: BoxFit.cover,),
        Positioned(
          child: 
          Container(
            child: Column(
              children: [
                Row(
                  children: [
                    SvgPicture.asset(''),
                    Text(data)
                  ],
                ),
                Row(
                  children: [
                    SvgPicture.asset(''),
                    Text(data)
                  ],
                ),
                ElevatedButton(onPressed: (), child: child)
              ],
            ),
          )
        ),

      ],
    );
  }
}
