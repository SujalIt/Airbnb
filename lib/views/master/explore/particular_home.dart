import 'package:airbnb/airbnb_global_imports.dart';

class ParticularHome extends StatelessWidget {
  const ParticularHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              'https://w0.peakpx.com/wallpaper/240/377/HD-wallpaper-bedroom-hotel-room-light-design-modern-apartment-interior-idea-modern-design.jpg',
            ),
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: context.screenWidth * 0.04),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: context.screenHeight * 0.03,),
                  Text(
                    'Experience Authentic Peru! Spacious Country House',
                    style: TextStyle(
                        fontSize: context.screenWidth * 0.07,
                        fontWeight: FontWeight.w700),
                  ),
                  SizedBox(height: context.screenHeight * 0.01,),
                  Text('Entire cottage in Cusco, Peru'),
                  Text('12 guests - 3 bedrooms - 11 beds - 2.5 bathrooms'),
                  SizedBox(height: context.screenHeight * 0.01,),
                  SizedBox(
                    height: context.screenHeight * 0.12,
                    child: Card(
                      color: Colors.white,
                      child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Row(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('4.91'),
                                Row(
                                  children: [
                                    Icon(Icons.star),
                                    Icon(Icons.star),
                                    Icon(Icons.star),
                                  ],
                                ),
                              ],
                            ),
                            VerticalDivider(
                              color: Colors.black12,
                            ),
                            Row(
                              children: [
                                Icon(Icons.local_attraction_outlined),
                                Text('Guest favourite'),
                                Icon(Icons.local_attraction_outlined)
                              ],
                            ),
                            VerticalDivider(
                              color: Colors.black12,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('206'),
                                Text('Reviews'),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.account_circle_outlined),
                    title: Text('Hosted by Denise'),
                    subtitle: Text('Superhost - 6 years hosting'),
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.wine_bar_sharp),
                    title: Text('Top 5% of homes'),
                    subtitle: Text(
                        'This home is highly ranked based on ratings, reviews and reliability.'),
                  ),
                  ListTile(
                    leading: Icon(Icons.lock_clock),
                    title: Text('Amazing outdoor space'),
                    subtitle: Text(
                        'Guests mention the garden, outdoor area and grill as highlights.'),
                  ),
                  ListTile(
                    leading: Icon(Icons.place_outlined),
                    title: Text('Self check-in'),
                    subtitle: Text('You can check in with the building staff.'),
                  ),
                  Divider(),
                  Text('Immerse We’ve been so immersed in this world of drinking, and a lot of us have felt like there was nowhere to go...'),
                  SizedBox(height: context.screenHeight * 0.015,),
                  Row(
                    children: [
                      Text('Show more',style: TextStyle(
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.w600,
                        fontSize: context.screenWidth * 0.04,
                      ),),
                      Icon(Icons.arrow_forward_ios,size: context.screenWidth * 0.04,)
                    ],
                  ),
                  SizedBox(height: context.screenHeight * 0.015,),
                  Divider(),
                  SizedBox(),
                  Text(
                    'Where you\'ll sleep',
                    style: TextStyle(
                        fontSize: context.screenWidth * 0.06,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: context.screenHeight * 0.02,),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        CustomCliprrectBedroomParticularHome(),
                        SizedBox(width: context.screenWidth * 0.05,),
                        CustomCliprrectBedroomParticularHome(),
                      ],
                    ),
                  ),
                  SizedBox(height: context.screenHeight * 0.02,),
                  Divider(),
                  SizedBox(height: context.screenHeight * 0.02,),
                  Text('What this place offers',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: context.screenWidth * 0.05),
                  ),
                  SizedBox(
                    height: context.screenHeight * 0.01,
                  ),
                  ListTile(
                    leading: Icon(Icons.location_city),
                    title: Text('Courtyard view'),
                  ),
                  ListTile(
                    leading: Icon(Icons.gradient_rounded),
                    title: Text('Garden view'),
                  ),
                  ListTile(
                    leading: Icon(Icons.leak_add),
                    title: Text('Lake access'),
                  ),
                  ListTile(
                    leading: Icon(Icons.kitchen),
                    title: Text('Kitchen'),
                  ),
                  ListTile(
                    leading: Icon(Icons.wifi),
                    title: Text('Wifi'),
                  ),
                  ListTile(
                    leading: Icon(Icons.alarm),
                    title: Text('Carbon monoxide alarm'),
                  ),
                  ListTile(
                    leading: Icon(Icons.smoke_free),
                    title: Text('Smoke alarm'),
                  ),
                  CustomButton(
                    onPressed: (){},
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    text: 'Show all 61 amenities',
                      textStyle: TextStyle(fontSize: context.screenWidth * 0.04,),
                  ),
                  Divider(),
                  SizedBox(),
                  Text(
                    'Where you\'ll be',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: context.screenWidth * 0.06),
                  ),
                  SizedBox(),
                  Text('Mapp'),

                  SizedBox(height: context.screenHeight * 0.015,),
                  Text('Cusco, Cuzco, Peru',style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: context.screenWidth * 0.04
                  ),),
                  SizedBox(height: context.screenHeight * 0.015,),
                  Text('The house is located very close to the neighborhood of san blas, in a quiet, relaxing area, with enough...',
                  style: TextStyle(
                    fontSize: context.screenWidth * 0.04,
                  ),),
                  SizedBox(height: context.screenHeight * 0.025,),
                  Row(
                    children: [
                      Text('Show more',style: TextStyle(
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.w600,
                        fontSize: context.screenWidth * 0.04,
                      ),),
                      Icon(Icons.arrow_forward_ios,size: context.screenWidth * 0.04,)
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: context.screenHeight * 0.036,
            ),
            Container(
              color: Colors.black12,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: context.screenWidth * 0.05),
                child: Column(children: [
                  SizedBox(height: context.screenHeight * 0.025,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.local_play_outlined,
                        size: context.screenWidth * 0.1,
                      ),
                      Text(
                        '4.91',
                        style: TextStyle(
                          fontSize: context.screenWidth * 0.1,
                        ),
                      ),
                      Icon(
                        Icons.local_play_outlined,
                        size: context.screenWidth * 0.1,
                      ),
                    ],
                  ),
                  SizedBox(),
                  Text(
                    'Guest favourite',
                    style: TextStyle(
                      fontSize: context.screenWidth * 0.04,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(),
                  Text('This home is in the top 10% of eligible listings based on ratings, reviews and reliability'),
                  SizedBox(),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        CustomCardParticularHome(),
                        CustomCardParticularHome(),
                        CustomCardParticularHome(),
                        CustomCardParticularHome(),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: context.screenHeight * 0.03,
                  ),
                  CustomButton(
                    onPressed: (){},
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    width: context.screenWidth * 1,
                    text: 'Show all 206 reviews',
                      textStyle: TextStyle(fontSize: context.screenWidth * 0.04,),
                  ),
                  SizedBox(
                    height: context.screenHeight * 0.03,
                  ),
                  Text('Learn how reviews work',style: TextStyle(decoration: TextDecoration.underline),),
                  SizedBox(
                    height: context.screenHeight * 0.03,
                  ),
                ]),
              ),
            ),
            SizedBox(height: context.screenHeight * 0.03,),
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: context.screenWidth * 0.04),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Meet your host',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: context.screenWidth * 0.063,
                    ),
                  ),
                  SizedBox(height: context.screenHeight * 0.02,),
                  SizedBox(
                    width: context.screenWidth * 0.9,
                    height: context.screenHeight * 0.3,
                      child: Card(
                        elevation: 7,
                        color: Colors.white,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: context.screenWidth * 0.05,vertical: context.screenHeight * 0.03,),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                children: [
                                  CircleAvatar(
                                    radius: context.screenWidth * 0.12,
                                      child: Icon(Icons.account_circle_outlined,size: context.screenWidth * 0.15,)),
                                  Text('Sara Sadith',style: TextStyle(
                                    fontSize: context.screenWidth * 0.06,
                                    fontWeight: FontWeight.w800
                                  ),),
                                  Row(
                                    children: [
                                      Icon(Icons.hdr_weak_rounded),
                                      Text('Superhost',style: TextStyle(
                                        fontWeight: FontWeight.bold
                                      ),)
                                    ],
                                  )
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('517'),
                                  Text('Reviews'),
                                  Divider(color: Colors.black,),
                                  Row(
                                    children: [
                                      Text('4.93'),
                                      Icon(Icons.star),
                                    ],
                                  ),
                                  Text('Rating'),
                                  Divider(color: Colors.black),
                                  Text('8'),
                                  Text('Years hosting')
                                ],
                              )
                            ],
                          ),
                        ),
                      )),
                  SizedBox(height: context.screenHeight * 0.03,),
                  Row(
                    children: [
                      Icon(Icons.gesture_rounded),
                      SizedBox(width: context.screenWidth * 0.04,),
                      Text('Speaks Italian and Spanish',style: TextStyle(fontSize: context.screenWidth * 0.038),),
                    ],
                  ),
                  SizedBox(height: context.screenHeight * 0.01,),
                  Row(
                    children: [
                      Icon(Icons.location_on_outlined),
                      SizedBox(width: context.screenWidth * 0.04,),
                      Text('Lives in Cusco, Peru',style: TextStyle(fontSize: context.screenWidth * 0.038),),
                    ],
                  ),
                  SizedBox(height: context.screenHeight * 0.02,),
                  Text('Born at Lima and raised in the Cusco region, I decided to return to my homel...',
                  style: TextStyle(
                    fontSize: context.screenWidth * 0.042,
                    color: Colors.blueGrey,
                  ),),
                  SizedBox(height: context.screenHeight * 0.02,),
                  Row(
                    children: [
                      Text('Show more',style: TextStyle(
                          decoration: TextDecoration.underline,
                        fontWeight: FontWeight.w600,
                        fontSize: context.screenWidth * 0.04,
                      ),),
                      Icon(Icons.arrow_forward_ios,size: context.screenWidth * 0.04,)
                    ],
                  ),
                  SizedBox(height: context.screenHeight * 0.04,),
                  Text('Sara Sadith is a Superhost',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: context.screenWidth * 0.045,
                    ),
                  ),
                  SizedBox(height: context.screenHeight * 0.02,),
                  Text('Superhosts are experienced, highly rated hosts who are committed to providing great stays for guests.'),
                  SizedBox(height: context.screenHeight * 0.035,),
                  Text(
                    'Co-Hosts',
                    style: TextStyle(
                        fontSize: context.screenWidth * 0.05,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(),
                  Row(
                    children: [
                      Icon(Icons.account_box,size: context.screenWidth * 0.15,),
                      SizedBox(width: context.screenWidth * 0.02,),
                      Text('Wilber',style: TextStyle(fontSize: context.screenWidth * 0.04),),
                    ],
                  ),
                  SizedBox(height: context.screenHeight * 0.02,),
                  Text(
                    'Host Details',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: context.screenWidth * 0.05,
                    ),
                  ),
                  SizedBox(height: context.screenHeight * 0.015,),
                  Text('Response rate: 100%'),
                  SizedBox(),
                  Text('Responds within an hour'),
                  SizedBox(height: context.screenHeight * 0.03,),
                  CustomButton(
                    onPressed: (){},
                    backgroundColor: Colors.black,
                    text: 'Message Host',
                      textStyle: TextStyle(fontSize: context.screenWidth * 0.04,),
                  ),
                  SizedBox(height: context.screenHeight * 0.02,),
                  ListTile(
                    title: Text('To help protect your payment, always use Airbnb to send money and communicate with hosts.',
                    style: TextStyle(fontSize: context.screenWidth * 0.03),),
                    leading: Icon(Icons.pentagon_outlined),
                  ),
                  SizedBox(),
                  Divider(),
                  SizedBox(),
                  CustomListTile(
                    title: "Availability",
                      titleTextStyle: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: context.screenWidth * 0.063,
                      ),
                    trailingIcon: Icons.arrow_forward_ios,
                    subtitle: '25 Feb - 2 Mar',
                    ),
                  SizedBox(),
                  Divider(),
                  CustomListTile(
                    title: 'Cancellation policy',
                      titleTextStyle: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: context.screenWidth * 0.063,
                      ),
                    subtitle: 'Free cancellation before 20 Feb. Cancel before check-in on 25 Feb for a partial refund.\nReview this Host\' full policy for details.',
                    trailingIcon: Icons.arrow_forward_ios,
                  ),
                  Divider(),
                  ListTile(
                    title: Text(
                      'House rules',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: context.screenWidth * 0.063,
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Flexible check-in'),
                        Text('Checkout before 10:00 am'),
                        Text('4 guests maximum'),
                        SizedBox(height: context.screenHeight * 0.01,),
                        Text('Show more',style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontSize: context.screenWidth * 0.04,
                            fontWeight: FontWeight.w600
                        ),)
                      ],
                    ),
                  ),
                  Divider(),
                  ListTile(
                    title: Text(
                      'Safety & property',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: context.screenWidth * 0.063,
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('No carbon monoxide alarm \nNo smoke alarm\nNearby lake, river, other body of water'),
                        SizedBox(height: context.screenHeight * 0.01,),
                        Text('Show more',style: TextStyle(
                          decoration: TextDecoration.underline,
                          fontSize: context.screenWidth * 0.04,
                          fontWeight: FontWeight.w600
                        ),)
                      ],
                    ),
                  ),
                  SizedBox(),
                  Divider(),
                  SizedBox(),
                  ListTile(
                    leading: Icon(Icons.flag),
                    title: Text('Report this listing',style: TextStyle(
                        decoration: TextDecoration.underline
                    ),),
                  ),
                  Divider(),
                  SizedBox(
                    height: context.screenHeight * 0.11,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomSheet: ListTile(
        tileColor: Colors.white,
        title: Text(
          'Add dates for prices',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Row(
          children: [
            Icon(Icons.star),
            Text('4.91'),
          ],
        ),
        trailing:
            CustomButton(
              onPressed: (){},
              text: 'Check availability',
                textStyle: TextStyle(fontSize: context.screenWidth * 0.04,),
            )
      ),
    );
  }
}
