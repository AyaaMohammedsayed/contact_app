import 'package:contact_app/first_screen.dart';
import 'package:contact_app/second_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home_screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isEmpty = true;
  bool isFull = true;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
     
          isEmpty = false;
          setState(() {
            
          });
        },
        child:isFull==false? Icon(Icons.add):SvgPicture.asset('assets/icons/delete.svg',fit: BoxFit.scaleDown,width: 16,height: 4,),
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
        child: isEmpty == true ? FirstScreen() : SecondContent(),
      ),
    );
  }

}
