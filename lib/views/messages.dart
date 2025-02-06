import 'package:flutter/material.dart';

class MessageScreen extends StatelessWidget {
  const MessageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final messageScreenHeight = MediaQuery.of(context).size.height;
    final messageScreenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: messageScreenWidth * 0.06),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: messageScreenHeight * 0.08),
            Text(
              'Messages',
              style: TextStyle(
                fontSize: 0.07 * messageScreenWidth,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: messageScreenHeight * 0.025,),
            Divider(),
            SizedBox(height: messageScreenHeight * 0.02),
            Text(
              'Log in to read messages',
              style: TextStyle(fontSize: 0.05 * messageScreenWidth,fontWeight: FontWeight.w500),
            ),
            Text(
              'Once you log in, you\'ll find messages from hosts here.',
              style: TextStyle(fontSize: 0.04 * messageScreenWidth,color: Colors.blueGrey),
            ),
            SizedBox(height: messageScreenHeight * 0.02),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pink,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                minimumSize: Size(messageScreenWidth * 0.2, 52),
              ),
              child: Text(
                'Log in',
                style: TextStyle(fontSize: 0.04 * messageScreenWidth),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
