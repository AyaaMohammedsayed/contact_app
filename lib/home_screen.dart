import 'package:contact_app/app_theme.dart';
import 'package:contact_app/first_screen.dart';
import 'package:contact_app/models/contact_model.dart';
import 'package:contact_app/second_content.dart';
import 'package:contact_app/widgets/model_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home_screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddingContactSheet(context);
        },
        child: 
             Icon(Icons.add)
      
      ),
      appBar: AppBar(
        leading: Image.asset(
          'assets/images/route_logo.png',
          width: 117,
          height: 39,
          fit: BoxFit.fill,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: FirstScreen(),
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
