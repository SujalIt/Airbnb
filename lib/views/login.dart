import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget{
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final loginScreenHeight = MediaQuery.of(context).size.height;
    final loginScreenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(loginScreenWidth * 0.06),//symmetric(horizontal: loginScreenWidth * 0.01)
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: loginScreenHeight * 0.05,),
              Text('Your profile',
                  style: TextStyle(
                      fontSize: loginScreenWidth * 0.08,
                      fontWeight: FontWeight.w500)
              ),
              Text('Log in to start planning your next trip.',
                style: TextStyle(
                  fontSize: loginScreenWidth * 0.05,
                  color: Colors.blueGrey
                ),),
              SizedBox(height : loginScreenHeight * 0.06),
              ElevatedButton(
                onPressed: (){},
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pink,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                    minimumSize: Size(loginScreenWidth * 1, 50)
                ),
                child: Text('Log in'),),
              SizedBox(height: loginScreenHeight * 0.03,),
              Text('Don\'t have an account? Sign up'),
              SizedBox(height: loginScreenHeight * 0.03,),
              ListTile(
                leading: Icon(Icons.settings),
                trailing: Icon(Icons.arrow_forward_ios),
                title: Text('Settings'),
                visualDensity: VisualDensity(vertical: -4),
                contentPadding: EdgeInsets.all(1),
              ),
              Divider(),
              SizedBox(height: loginScreenHeight * 0,),
              ListTile(
                leading: Icon(Icons.accessibility),
                trailing: Icon(Icons.arrow_forward_ios),
                title: Text('Accessibility'),
                visualDensity: VisualDensity(vertical: -4),
                contentPadding: EdgeInsets.all(1),
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.home_outlined),
                trailing: Icon(Icons.arrow_forward_ios),
                title: Text('Learn about hosting'),
                visualDensity: VisualDensity(vertical: -4),
                contentPadding: EdgeInsets.all(1),
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.help_outline),
                trailing: Icon(Icons.arrow_forward_ios),
                title: Text('Get help'),
                visualDensity: VisualDensity(vertical: -4),
                contentPadding: EdgeInsets.all(1),
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.menu_book_outlined),
                trailing: Icon(Icons.arrow_forward_ios),
                title: Text('Terms of Service'),
                visualDensity: VisualDensity(vertical: -4),
                contentPadding: EdgeInsets.all(1),
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.menu_book_outlined),
                trailing: Icon(Icons.arrow_forward_ios),
                title: Text('Privacy Policy'),
                visualDensity: VisualDensity(vertical: -4),
                contentPadding: EdgeInsets.all(1),
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.menu_book_outlined),
                trailing: Icon(Icons.arrow_forward_ios),
                title: Text('Open source licences'),
                visualDensity: VisualDensity(vertical: -4),
                contentPadding: EdgeInsets.all(1),
              ),
              Divider(),
              SizedBox(height: loginScreenHeight * 0.02,),
              Text('Version 25.04 (28007251)'),
              SizedBox(height: loginScreenHeight * 0.06,)
            ],
          ),
        ),
      ),
    );
  }
}