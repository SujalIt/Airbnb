import 'package:airbnb/airbnb_global_imports.dart';

class TripsScreen extends StatelessWidget{
  const TripsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: context.screenWidth * 0.06),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: context.screenHeight * 0.08,),
            Text(
              "Trips",
              style: TextStyle(
                fontSize: context.screenWidth * 0.09,
                fontWeight: FontWeight.w500
              ),
            ),
            SizedBox(height: context.screenHeight * 0.02,),
            Divider(),
            SizedBox(height: context.screenHeight * 0.033,),
            Text('No trips yet',
              style: TextStyle(
                fontSize: context.screenWidth * 0.047,
                fontWeight: FontWeight.w500
              ),),
            Text('When you\'re ready to plan your next trip, we\'re here to help.',
            style: TextStyle(
              color: Colors.blueGrey,
              fontSize: context.screenWidth * 0.04
            ),
            ),
            SizedBox(height: context.screenHeight * 0.02,),
            CustomButton(
                onPressed: (){
                  Get.toNamed(Routes.login,);
                },
                text: 'Log in',
                  textStyle: TextStyle(fontSize: context.screenWidth * 0.04,),
            ),
          ],
        ),
      ),
    );
  }
}