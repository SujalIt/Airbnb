import 'package:airbnb/airbnb_global_imports.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({super.key});

  @override
  State<StatefulWidget> createState() => MessageScreenState();
}

class MessageScreenState extends State<MessageScreen> with SingleTickerProviderStateMixin {

  late TabController tabController = TabController(length: 2, vsync: this);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: AppColor.white,
          body: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 25,
              vertical: 40,
            ),
            child: FirebaseAuth.instance.currentUser != null
                ? Column(
                    spacing: 18,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Messages",
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      TabBar(
                        tabAlignment: TabAlignment.start,
                        indicatorColor: AppColor.black,
                        isScrollable: true,
                        labelColor: AppColor.black,
                        controller: tabController,
                        dividerColor: AppColor.grey,
                        unselectedLabelColor: AppColor.grey,
                        tabs: [
                          Tab(
                            child: Text(
                              "Messages",
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ),
                          Tab(
                            child: Text(
                              "Notifications",
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        child: TabBarView(
                          controller: tabController,
                          children: [
                            GestureDetector(
                              onTap: () {},
                              child: Column(
                                spacing: 12,
                                children: [
                                  Row(
                                    children: [
                                      CircleAvatar(
                                        backgroundColor: AppColor.black,
                                        radius: 30,
                                        child: Icon(
                                          Icons.track_changes_outlined,
                                          color: AppColor.white,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 15,
                                      ),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text(
                                                  'Airbnb Support',
                                                  style: TextStyle(
                                                    fontSize: 15.5,
                                                  ),
                                                ),
                                                Text(
                                                  "22/02",
                                                  style: TextStyle(
                                                    fontSize: 15.5,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Text(
                                              "Airbnb: This Conversation is close...",
                                              style: TextStyle(
                                                fontSize: 13.5,
                                              ),
                                            ),
                                            Text(
                                              "Closed",
                                              style: TextStyle(
                                                fontSize: 12.5,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Divider(),
                                  Row(
                                    children: [
                                      CircleAvatar(
                                        backgroundColor: AppColor.black,
                                        radius: 30,
                                        child: Icon(
                                          Icons.track_changes_outlined,
                                          color: AppColor.white,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 15,
                                      ),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text(
                                                  'Airbnb Support',
                                                  style: TextStyle(
                                                    fontSize: 15.5,
                                                  ),
                                                ),
                                                Text(
                                                  "22/02",
                                                  style: TextStyle(
                                                    fontSize: 15.5,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Text(
                                              "Airbnb: This Conversation is close...",
                                              style: TextStyle(
                                                fontSize: 13.5,
                                              ),
                                            ),
                                            Text(
                                              "Closed",
                                              style: TextStyle(
                                                fontSize: 12.5,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Divider(),
                                  Row(
                                    children: [
                                      CircleAvatar(
                                        backgroundColor: AppColor.black,
                                        radius: 30,
                                        child: Icon(
                                          Icons.track_changes_outlined,
                                          color: AppColor.white,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 15,
                                      ),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text(
                                                  'Airbnb Support',
                                                  style: TextStyle(
                                                    fontSize: 15.5,
                                                  ),
                                                ),
                                                Text(
                                                  "22/02",
                                                  style: TextStyle(
                                                    fontSize: 15.5,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Text(
                                              "Airbnb: This Conversation is close...",
                                              style: TextStyle(
                                                fontSize: 13.5,
                                              ),
                                            ),
                                            Text(
                                              "Closed",
                                              style: TextStyle(
                                                fontSize: 12.5,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            GestureDetector(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 10,),
                                  Text(
                                    "You are all caught up",
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: AppColor.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  )
                : Column(
                    spacing: 18,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Messages',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Divider(),
                      Text(
                        'Log in to read messages',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        'Once you log in, you\'ll find messages from hosts here.',
                        style: TextStyle(
                          fontSize: 16,
                          color: AppColor.blueGrey,
                        ),
                      ),
                      CustomButton(
                        type: ButtonTypes.elevated,
                        onPressed: () {
                          Get.toNamed(
                            Routes.login,
                          );
                        },
                        text: 'Log in',
                        textStyle: TextStyle(
                          fontSize: 15,
                        ),
                      )
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
