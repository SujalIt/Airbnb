import 'package:flutter/material.dart';

class ParticularHome extends StatelessWidget{
  const ParticularHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Particular image data'),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network('https://w0.peakpx.com/wallpaper/240/377/HD-wallpaper-bedroom-hotel-room-light-design-modern-apartment-interior-idea-modern-design.jpg',
            ),
            Text('Experience Authentic Peru! Spacious Country House'),
            Text('Entire cottage in Cusco, Peru'),
            Text('12 guests - 3 bedrooms - 11 beds - 2.5 bathrooms'),
            Row(
              children: [
                Text('stars'),
                Text('Guest favourite'),
                Text('Reviews')
              ],
            ),
            ListTile(
              title: Text('Hosted by Denise'),
              subtitle: Text('Superhost - 6 years hosting'),
            ),
            Divider(),
            ListTile(
              title: Text('Top 5% of homes'),
              subtitle: Text('This home is highly ranked based on ratings, reviews and reliability.'),
            ),
            ListTile(
              title: Text('Amazing outdoor space'),
              subtitle: Text('Guests mention the garden, outdoor area and grill as highlights.'),
            ),
            ListTile(
              title: Text('Self check-in'),
              subtitle: Text('You can check in with the building staff.'),
            ),
            Divider(),
            Text('Immerse We’ve been so immersed in this world of drinking, and a lot of us have felt like there was nowhere to go...'),
            Text('Show more >'),
            Divider(),
            Text('Where you\'ll sleep'),
            Row(
              children: [
                Text('Images bedrooms details')
              ],
            ),
            Divider(),
            Text('What this place offers'),
            SizedBox(height: 10,),
            ListTile(
              title: Text('Courtyard view'),
            ),
            ListTile(
              title: Text('Garden view'),
            ),
            ListTile(
              title: Text('Lake access'),
            ),
            ListTile(
              title: Text('Kitchen'),
            ),
            ListTile(
              title: Text('Wifi'),
            ),
            ListTile(
              title: Text('Carbon monoxide alarm'),
            ),
            ListTile(
              title: Text('Smoke alarm'),
            ),
            ElevatedButton(
                onPressed: (){},
                child: Text('Show all 61 amenities')),
          ],
        ),
      ),
    );
  }

}