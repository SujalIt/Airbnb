import 'package:airbnb/views/test.dart';
import 'package:flutter/material.dart';

import 'explore/start_your_search.dart';

class WishlistsScreen extends StatelessWidget{
  const WishlistsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final wishlistsScreenHeight = MediaQuery.of(context).size.height;
    final wishlistsScreenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body:
      // ExpansionTileExample(), //test.dart
      Padding(
        padding: EdgeInsets.symmetric(horizontal: wishlistsScreenWidth * 0.06),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: wishlistsScreenHeight * 0.07,),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text('Edit',
                style: TextStyle(
                  fontWeight: FontWeight.w600
                ),),
              ],
            ),
            Text('Wishlists',
            style: TextStyle(
              fontSize: wishlistsScreenWidth * 0.08,
              fontWeight: FontWeight.w500
            ),),
            SizedBox(height: wishlistsScreenHeight * 0.04,),
            Text('Log in to view your Wishlists',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: wishlistsScreenWidth * 0.06
            ),),
            SizedBox(height: wishlistsScreenHeight * 0.01,),
            Text('You can create, view, or edit Wishlists once you\'ve logged in.',
            style: TextStyle(
              color: Colors.blueGrey
            ),),
            SizedBox(height: wishlistsScreenHeight * 0.02,),
            ElevatedButton(
              onPressed: (){},
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                minimumSize: Size(wishlistsScreenWidth * 0.04, 52)
              ),
              child: Text('Log in',
              style: TextStyle(
                fontSize: wishlistsScreenWidth * 0.04,
              ),),),
          ],
        ),
      ),
    );
  }
}