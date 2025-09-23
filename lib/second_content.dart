import 'package:contact_app/models/contact_model.dart';
import 'package:contact_app/widgets/contact_view.dart';
import 'package:contact_app/widgets/model_bottom_sheet.dart';
import 'package:flutter/material.dart';

class SecondContent extends StatefulWidget {
  static const String routeName = '/second_screen';

  @override
  State<SecondContent> createState() => _SecondContentState();
}

class _SecondContentState extends State<SecondContent> {
  @override
  List<ContactModel>models=[];
  Widget build(BuildContext context) {

    ContactModel model =
        ModalRoute.of(context)!.settings.arguments as ContactModel;
    TextTheme textTheme = Theme.of(context).textTheme;
    models.add(model);
    return Scaffold(
  floatingActionButton: Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      FloatingActionButton(
        heroTag: "btn1",
        onPressed: () {
          // زرار الاول
        },
        child: Icon(Icons.add),
      ),
      SizedBox(height: 12), // مسافة بين الزرين
      FloatingActionButton(
        heroTag: "btn2",
        onPressed: () {
          // زرار التاني
        },
        child: Icon(Icons.edit),
      ),
    ],
  ),
      body: GridView.builder(
        itemCount: models.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemBuilder: (context, index) {
          return ContactView(model: models[index]);
        },
      ),
    );
  }

  void _showAddingContactSheet(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: ModalBottomSheet(),
        );
      },
    );
  }
}
