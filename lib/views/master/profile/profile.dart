import 'package:airbnb/airbnb_global_imports.dart';

class ProfileScreen extends StatelessWidget{
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(context.screenWidth * 0.06),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: context.screenHeight * 0.05,),
              Text('Your profile',
                  style: TextStyle(
                      fontSize: context.screenWidth * 0.08,
                      fontWeight: FontWeight.w500)
              ),
              Text('Log in to start planning your next trip.',
                style: TextStyle(
                  fontSize: context.screenWidth * 0.05,
                  color: Colors.blueGrey
                ),),
              SizedBox(height : context.screenHeight * 0.06),
              CustomButton(
                onPressed: (){
                    Get.toNamed(Routes.auth,);
                  },
                width: context.screenWidth * 1,
                text: 'Log in',
                  textStyle: TextStyle(fontSize: context.screenWidth * 0.04,),
              ),
              SizedBox(height: context.screenHeight * 0.03,),
              Text('Don\'t have an account? Sign up'),
              SizedBox(height: context.screenHeight * 0.03,),
              CustomListTile(
                title: 'Settings',
                leadingIcon: Icons.settings,
                trailingIcon: Icons.arrow_forward_ios,
                visualDensity: VisualDensity(vertical: -4),
                contentPadding: EdgeInsets.all(1),
              ),
              Divider(),
              SizedBox(height: context.screenHeight * 0,),
              CustomListTile(
                title: 'Accessibility',
                leadingIcon: Icons.accessibility,
                trailingIcon: Icons.arrow_forward_ios,
                visualDensity: VisualDensity(vertical: -4),
                contentPadding: EdgeInsets.all(1),
              ),
              Divider(),
              CustomListTile(
                title: 'Learn about hosting',
                leadingIcon: Icons.home_outlined,
                trailingIcon: Icons.arrow_forward_ios,
                visualDensity: VisualDensity(vertical: -4),
                contentPadding: EdgeInsets.all(1),
              ),
              Divider(),
              CustomListTile(
                title: 'Get help',
                leadingIcon: Icons.help_outline,
                trailingIcon: Icons.arrow_forward_ios,
                visualDensity: VisualDensity(vertical: -4),
                contentPadding: EdgeInsets.all(1),
              ),
              Divider(),
              CustomListTile(
                title: 'Terms of Service',
                leadingIcon: Icons.menu_book_outlined,
                trailingIcon: Icons.arrow_forward_ios,
                visualDensity: VisualDensity(vertical: -4),
                contentPadding: EdgeInsets.all(1),
              ),
              Divider(),
              CustomListTile(
                title: 'Privacy Policy',
                leadingIcon: Icons.menu_book_outlined,
                trailingIcon: Icons.arrow_forward_ios,
                visualDensity: VisualDensity(vertical: -4),
                contentPadding: EdgeInsets.all(1),
              ),
              Divider(),
              CustomListTile(
                title: 'Open source licences',
                leadingIcon: Icons.menu_book_outlined,
                trailingIcon: Icons.arrow_forward_ios,
                visualDensity: VisualDensity(vertical: -4),
                contentPadding: EdgeInsets.all(1),
              ),
              Divider(),
              SizedBox(height: context.screenHeight * 0.02,),
              Text('Version 25.04 (28007251)'),
              SizedBox(height: context.screenHeight * 0.06,)
            ],
          ),
        ),
      ),
    );
  }
}