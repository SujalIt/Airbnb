import 'package:airbnb/airbnb_global_imports.dart';

class TripsScreen extends StatelessWidget {
  const TripsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 25,
            vertical: 40,
          ),
          child: FirebaseAuth.instance.currentUser != null
              ? Column(
                  spacing: 35,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Trips",
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 25,
                      children: [
                        Text(
                          "Upcoming reservations",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Container(
                          height: 373,
                          width: Get.width,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: AppColor.grey,
                                offset: Offset(0.0, 5.0),
                                blurRadius: 20,
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20),
                                  bottomLeft: Radius.circular(0),
                                  bottomRight: Radius.circular(0),
                                ),
                                child: CustomImage(
                                  path: "https://c1.wallpaperflare.com/preview/854/104/23/room-beach-view-beach-view-room-beach-thailand-beach.jpg",
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 25,
                                  vertical: 20,
                                ),
                                child: Column(
                                  spacing: 0.25,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Yonkers",
                                      style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Text(
                                      "Private room in home hosted by Craig",
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    Divider(),
                                    IntrinsicHeight(
                                      child: Row(
                                        children: [
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Feb",
                                                style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                              Text(
                                                "13-14",
                                                style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                              Text(
                                                "2023",
                                                style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ],
                                          ),
                                          VerticalDivider(
                                            color: Colors.grey,
                                            thickness: 1,
                                          ),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                "Yonkers, New York",
                                                style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                              Text(
                                                "United States",
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Column(
                      spacing: 25,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Explore things to do near Yonkers",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            spacing: 120,
                            children: [
                              Row(
                                spacing: 10,
                                children: [
                                  SizedBox(
                                    width: 50,
                                    height: 50,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(6),
                                      child: CustomImage(
                                        path:
                                            "https://cdn.prod.website-files.com/661f56b3f7ac96857e9ff9e7/6663036fcf1efa382b903de0_AD_4nXeQkK6Z8lsCzaofj0GQI25yCAxLK2liMT44eBWY3BY8Tj1XHSiOzPKC-VDCH2MS4k7ZyLEO80wbb3s7kBTuPgeTnkzntSXUFNuzFvvDHGJZAgFu9RXbmSDsqbwC6jO1Ev7WMRSsNFT3YqyUkRJbBdlyUXQ.png",
                                      ),
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Just for you",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Text(
                                        "18 experiences",
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              Row(
                                spacing: 10,
                                children: [
                                  SizedBox(
                                    width: 50,
                                    height: 50,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(6),
                                      child: CustomImage(
                                        path:
                                            "https://cdn.prod.website-files.com/661f56b3f7ac96857e9ff9e7/6663036fcf1efa382b903de0_AD_4nXeQkK6Z8lsCzaofj0GQI25yCAxLK2liMT44eBWY3BY8Tj1XHSiOzPKC-VDCH2MS4k7ZyLEO80wbb3s7kBTuPgeTnkzntSXUFNuzFvvDHGJZAgFu9RXbmSDsqbwC6jO1Ev7WMRSsNFT3YqyUkRJbBdlyUXQ.png",
                                      ),
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Just for you",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Text(
                                        "18 experiences",
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              Row(
                                spacing: 10,
                                children: [
                                  SizedBox(
                                    width: 50,
                                    height: 50,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(6),
                                      child: CustomImage(
                                        path:
                                            "https://cdn.prod.website-files.com/661f56b3f7ac96857e9ff9e7/6663036fcf1efa382b903de0_AD_4nXeQkK6Z8lsCzaofj0GQI25yCAxLK2liMT44eBWY3BY8Tj1XHSiOzPKC-VDCH2MS4k7ZyLEO80wbb3s7kBTuPgeTnkzntSXUFNuzFvvDHGJZAgFu9RXbmSDsqbwC6jO1Ev7WMRSsNFT3YqyUkRJbBdlyUXQ.png",
                                      ),
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Just for you",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Text(
                                        "18 experiences",
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                )
              : Column(
                  spacing: 18,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Trips",
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Divider(),
                    Text(
                      'No trips yet',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      'When you\'re ready to plan your next trip, we\'re here to help.',
                      style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 16,
                      ),
                    ),
                    CustomButton(
                      onPressed: () {
                        Get.toNamed(
                          Routes.login,
                        );
                      },
                      text: 'Log in',
                      textStyle: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
