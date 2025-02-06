import 'package:flutter/material.dart';

class TripsScreen extends StatelessWidget{
  const TripsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final tripScreenHeight = MediaQuery.of(context).size.height;
    final tripScreenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: tripScreenWidth * 0.06),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: tripScreenHeight * 0.07,),
            Text("Trips",
              style: TextStyle(
                fontSize: tripScreenWidth * 0.09,
                fontWeight: FontWeight.w500
              ),
            ),
            SizedBox(height: tripScreenHeight * 0.02,),
            Divider(),
            SizedBox(height: tripScreenHeight * 0.03,),
            Text('No trips yet',
              style: TextStyle(
                fontSize: tripScreenWidth * 0.04,
                fontWeight: FontWeight.w500
              ),),
            Text('When you\'re ready to plan your next trip, we\'re here to help.',
            style: TextStyle(
              color: Colors.blueGrey,
              fontSize: tripScreenWidth * 0.04
            ),
            ),
            SizedBox(height: tripScreenHeight * 0.02,),
            ElevatedButton(
              onPressed: (){},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pink,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                minimumSize: Size(tripScreenWidth * 0.2, 52)
              ),
              child: Text('Log in',
                style: TextStyle(
                  fontSize: tripScreenWidth * 0.04,
                ),),),
          ],
        ),
      ),
    );
  }

}