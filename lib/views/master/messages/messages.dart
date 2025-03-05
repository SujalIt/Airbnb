import 'package:airbnb/airbnb_global_imports.dart';

class MessageScreen extends StatelessWidget {
  const MessageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: context.screenWidth * 0.06),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: context.screenHeight * 0.08),
            Text(
              'Messages',
              style: TextStyle(
                fontSize: 0.07 * context.screenWidth,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: context.screenHeight * 0.025,),
            Divider(),
            SizedBox(height: context.screenHeight * 0.02),
            Text(
              'Log in to read messages',
              style: TextStyle(fontSize: 0.047 * context.screenWidth,fontWeight: FontWeight.w500),
            ),
            Text(
              'Once you log in, you\'ll find messages from hosts here.',
              style: TextStyle(fontSize: 0.04 * context.screenWidth,color: Colors.blueGrey),
            ),
            SizedBox(height: context.screenHeight * 0.02),
            CustomButton(
              onPressed: (){
                  Get.toNamed(Routes.auth,);
                },
              text: 'Log in',
                textStyle: TextStyle(fontSize: context.screenWidth * 0.04,),
            )
          ],
        ),
      ),
    );
  }
}
