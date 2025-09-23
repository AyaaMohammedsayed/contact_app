import 'dart:io';

import 'package:contact_app/app_theme.dart';
import 'package:contact_app/models/contact_model.dart';
import 'package:contact_app/second_content.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ModalBottomSheet extends StatefulWidget {
  @override
  State<ModalBottomSheet> createState() => _ModalBottomSheetState();
}

class _ModalBottomSheetState extends State<ModalBottomSheet> {
  final TextEditingController name = TextEditingController();

  final TextEditingController email = TextEditingController();

  final TextEditingController phone = TextEditingController();
  ContactModel model = ContactModel(
    email: 'example@email.com',
    name: 'User Name',
    phone: '+200000000000',
  );
  final ImagePicker _picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 18),
      decoration: BoxDecoration(
        color: AppTheme.primary,
        borderRadius: BorderRadius.circular(40),
      ),

      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Container(
                  width: 124,
                  height: 124,
                  decoration: BoxDecoration(
                    color: AppTheme.primary,
                    borderRadius: BorderRadius.circular(28),
                    border: Border.all(color: AppTheme.beige, width: 1),
                    image: model.image != null
                        ? DecorationImage(
                            image: FileImage(model.image!),
                            fit: BoxFit.cover,
                          )
                        : DecorationImage(
                            image: AssetImage(
                              'assets/images/image_profile.png',
                            ),
                            fit: BoxFit.cover,
                          ),
                  ),
                  child: InkWell(onTap: _pickImage),
                ),

                SizedBox(width: 5),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name.text.isEmpty ? model.name : name.text,
                      style: textTheme.titleMedium,
                    ),
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width * 192 / 402,
                      child: Divider(thickness: 1, color: AppTheme.beige),
                    ),
                    Text(
                      email.text.isEmpty ? model.email : email.text,
                      style: textTheme.titleMedium,
                    ),
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width * 192 / 402,
                      child: Divider(thickness: 1, color: AppTheme.beige),
                    ),
                    Text(
                      phone.text.isEmpty ? model.phone : phone.text,
                      style: textTheme.titleMedium,
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 16),
            TextFormField(
              style: textTheme.titleMedium!.copyWith(color: AppTheme.semiWhite),
              controller: name,
              decoration: InputDecoration(hintText: 'Enter User Name'),
            ),
            SizedBox(height: 9),
            TextFormField(
              style: textTheme.titleMedium!.copyWith(color: AppTheme.semiWhite),
              controller: email,
              decoration: InputDecoration(hintText: 'Enter User Email'),
            ),
            SizedBox(height: 9),
            TextFormField(
              style: textTheme.titleMedium!.copyWith(color: AppTheme.semiWhite),
              controller: phone,
              decoration: InputDecoration(hintText: 'Enter User Phone'),
            ),
            SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              height: 59,
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    model.name = name.text;
                    model.email = email.text;
                    model.phone = phone.text;
                  });
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    SecondContent.routeName,
                    arguments: model,
                    (Route<dynamic> route) => false,
                  );
                },
                child: Text(
                  'Enter User',
                  style: textTheme.titleLarge!.copyWith(
                    color: AppTheme.primary,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        model.image = File(pickedFile.path);
      });
    }
  }
}
