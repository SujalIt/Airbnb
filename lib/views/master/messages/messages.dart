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
      child: Scaffold(
        backgroundColor: AppColor.white,
        body: FirebaseAuth.instance.currentUser != null
            ? SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                  ),
                  child: Column(
                    spacing: 18,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(),
                      Text(
                        "Messages",
                        style: TextStyle(
                          fontSize: context.screenWidth * 0.08,
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
                                fontSize: context.screenWidth * 0.04,
                              ),
                            ),
                          ),
                          Tab(
                            child: Text(
                              "Notifications",
                              style: TextStyle(
                                fontSize: context.screenWidth * 0.04,
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
                                                    fontSize:
                                                        context.screenWidth *
                                                            0.04,
                                                  ),
                                                ),
                                                Text(
                                                  "22/02",
                                                  style: TextStyle(
                                                    fontSize:
                                                        context.screenWidth *
                                                            0.04,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Text(
                                              "Airbnb: This Conversation is close...",
                                              style: TextStyle(
                                                fontSize:
                                                    context.screenWidth * 0.035,
                                              ),
                                            ),
                                            Text(
                                              "Closed",
                                              style: TextStyle(
                                                fontSize: context.screenWidth * 0.032,
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
                                                    fontSize:
                                                    context.screenWidth *
                                                        0.04,
                                                  ),
                                                ),
                                                Text(
                                                  "22/02",
                                                  style: TextStyle(
                                                    fontSize:
                                                    context.screenWidth *
                                                        0.04,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Text(
                                              "Airbnb: This Conversation is close...",
                                              style: TextStyle(
                                                fontSize:
                                                context.screenWidth * 0.035,
                                              ),
                                            ),
                                            Text(
                                              "Closed",
                                              style: TextStyle(
                                                fontSize: context.screenWidth * 0.032,
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
                                                    fontSize:
                                                    context.screenWidth *
                                                        0.04,
                                                  ),
                                                ),
                                                Text(
                                                  "22/02",
                                                  style: TextStyle(
                                                    fontSize:
                                                    context.screenWidth *
                                                        0.04,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Text(
                                              "Airbnb: This Conversation is close...",
                                              style: TextStyle(
                                                fontSize:
                                                context.screenWidth * 0.035,
                                              ),
                                            ),
                                            Text(
                                              "Closed",
                                              style: TextStyle(
                                                fontSize: context.screenWidth * 0.032,
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
                                spacing: 10,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.message_outlined),
                                  Text(
                                    "You don't have any messages",
                                    style: TextStyle(
                                      fontSize: context.screenHeight * 0.023,
                                    ),
                                  ),
                                  Text(
                                    "When you receive a new messages, it will appear here.",
                                    style: TextStyle(
                                      fontSize :context.screenHeight * 0.017,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            : SafeArea(
              child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: context.screenWidth * 0.06),
                  child: Column(
                    spacing: 18,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(),
                      Text(
                        'Messages',
                        style: TextStyle(
                          fontSize: 0.07 * context.screenWidth,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Divider(),
                      Text(
                        'Log in to read messages',
                        style: TextStyle(
                            fontSize: 0.047 * context.screenWidth,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        'Once you log in, you\'ll find messages from hosts here.',
                        style: TextStyle(
                            fontSize: 0.04 * context.screenWidth,
                            color: Colors.blueGrey),
                      ),
                      CustomButton(
                        onPressed: () {
                          Get.toNamed(
                            Routes.login,
                          );
                        },
                        text: 'Log in',
                        textStyle: TextStyle(
                          fontSize: context.screenWidth * 0.04,
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
