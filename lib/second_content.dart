import 'package:contact_app/app_theme.dart';
import 'package:contact_app/home_screen.dart';
import 'package:contact_app/models/contact_model.dart';
import 'package:contact_app/widgets/contact_view.dart';
import 'package:contact_app/widgets/model_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SecondContent extends StatefulWidget {
  static const String routeName = '/second_screen';

  @override
  State<SecondContent> createState() => _SecondContentState();
}

class _SecondContentState extends State<SecondContent> {
  List<ContactModel> models = [];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args = ModalRoute.of(context)?.settings.arguments;
    if (args != null && args is ContactModel) {

      if (!models.contains(args)) {
        setState(() {
          models.add(args);
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
            appBar: AppBar(
        leading: Image.asset(
          'assets/images/route_logo.png',
          width: 117,
          height: 39,
          fit: BoxFit.fill,
        ),
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            heroTag: "deleteBtn",
            backgroundColor: AppTheme.red,
            onPressed: () {
              models.clear();
              Navigator.pushNamedAndRemoveUntil(
                context,
                HomeScreen.routeName,
                (Route<dynamic> route) => false,
              );
            },
            child: SvgPicture.asset('assets/icons/delete.svg'),
          ),
          SizedBox(height: 8),
          models.length < 6
              ? FloatingActionButton(
                  heroTag: "addBtn",
                  onPressed: () => _showAddingContactSheet(context),
                  child: Icon(Icons.add),
                )
              : SizedBox(),
        ],
      ),
      body: GridView.builder(
        padding: EdgeInsets.symmetric(vertical:27 ,horizontal:16 ),
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

  void _showAddingContactSheet(BuildContext context) async {
    final newContact = await showModalBottomSheet<ContactModel>(
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

    if (newContact != null) {
      setState(() {
        models.add(newContact);
      });
    }
  }
}
