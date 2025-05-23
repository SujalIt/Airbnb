import 'package:airbnb/airbnb_global_imports.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({super.key});

  @override
  State<StatefulWidget> createState() => MessageScreenState();
}
class MessageScreenState extends State<MessageScreen> with SingleTickerProviderStateMixin{

  late TabController tabController = TabController(length: 4, vsync: this);
  @override
  void initState(){
    super.initState();
    // tabController = new TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: user != null
            ? SafeArea(
              child: Column(
                  children: [
                    SizedBox(height: context.screenHeight * 0.018,),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: context.screenWidth * 0.06),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.lime,
                                child: IconButton(
                                  color: Colors.transparent,
                                  onPressed: (){},
                                  icon: Icon(
                                    color: Colors.black,
                                    Icons.search_rounded,
                                  ),
                                ),
                              ),
                              SizedBox(width: context.screenWidth * 0.02,),
                              CircleAvatar(
                                backgroundColor: Colors.lime,
                                child: IconButton(
                                    onPressed: (){},
                                    icon: Icon(
                                      Icons.filter_alt_outlined,
                                      color: Colors.black,
                                    ),
                                ),
                              ),
                            ],
                          ),
                          Text(
                            "Messages",
                            style: TextStyle(
                              fontSize: context.screenWidth * 0.07,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: context.screenHeight * 0.016,),
                    TabBar(
                      labelColor: Colors.white,
                      indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(context.screenWidth * 0.06),
                        color: Colors.black,
                      ),
                      labelPadding: EdgeInsets.zero,
                      controller: tabController,
                      dividerColor: Colors.white,
                        tabs: [
                          Container(
                            width: context.screenWidth * 0.14,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(context.screenWidth * 0.06),
                            ),
                            child: Tab(
                              child: Text(
                                "All",
                                style: TextStyle(
                                  fontSize: context.screenWidth * 0.032,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: context.screenWidth * 0.22,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(context.screenWidth * 0.06),
                            ),
                            child: Tab(
                              child: Text(
                                "Hosting",
                                style: TextStyle(
                                  fontSize: context.screenWidth * 0.032,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: context.screenWidth * 0.23,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(context.screenWidth * 0.06),
                            ),
                            child: Tab(
                              child: Text(
                                'Travelling',
                                style: TextStyle(
                                  fontSize: context.screenWidth * 0.032,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: context.screenWidth * 0.21,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(context.screenWidth * 0.06),
                            ),
                            child: Tab(
                              child: Text(
                                'Support',
                                style: TextStyle(
                                  fontSize: context.screenWidth * 0.032,
                                ),
                              ),
                            ),
                          ),
                        ],
                    ),
                    SizedBox(height: context.screenHeight * 0.01,),
                    Expanded(
                      child: TabBarView(
                        controller: tabController,
                        children: [
                          Column(
                            children: [
                              ListTile(
                                leading: CircleAvatar(
                                  backgroundColor: Colors.black,
                                  radius: context.screenHeight * 0.039,
                                  child: IconButton(
                                    onPressed: () {  },
                                    icon: Icon(
                                      Icons.track_changes,
                                      color: Colors.white,
                                      size: context.screenHeight * 0.04,
                                    ),
                                  ),
                                ),
                                title: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Airbnb Support',
                                          style: TextStyle(
                                            fontSize: context.screenWidth * 0.036,
                                          ),
                                        ),
                                        Text(
                                          "22/02",
                                          style: TextStyle(
                                            fontSize: context.screenWidth * 0.036,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      "Airbnb: This Conversation is close...",
                                      style: TextStyle(
                                        fontSize: context.screenWidth * 0.033,
                                      ),
                                    ),
                                    Text(
                                      "Closed",
                                      style: TextStyle(
                                        fontSize: context.screenWidth * 0.035,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                          Center(child: Text("Hosting",)),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.message_outlined),
                              SizedBox(height: context.screenHeight * 0.02,),
                              Text(
                                "You don't have any messages",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: context.screenHeight * 0.01,),
                              Text("When you receive a new messages, it will appear here."),
                              SizedBox(height: context.screenHeight * 0.03,),
                              CustomButton(
                                backgroundColor: Colors.white,
                                onPressed: (){},
                                text: 'Show all messages',
                                textStyle: TextStyle(
                                  color: Colors.black,
                                ),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              ListTile(
                                leading: CircleAvatar(
                                  backgroundColor: Colors.black,
                                  radius: context.screenHeight * 0.039,
                                  child: IconButton(
                                    onPressed: () {  },
                                    icon: Icon(
                                      Icons.track_changes,
                                      color: Colors.white,
                                      size: context.screenHeight * 0.04,
                                    ),
                                  ),
                                ),
                                title: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Airbnb Support',
                                          style: TextStyle(
                                            fontSize: context.screenWidth * 0.036,
                                          ),
                                        ),
                                        Text(
                                          "22/02",
                                          style: TextStyle(
                                            fontSize: context.screenWidth * 0.036,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      "Airbnb: This Conversation is close...",
                                      style: TextStyle(
                                        fontSize: context.screenWidth * 0.033,
                                      ),
                                    ),
                                    Text(
                                      "Closed",
                                      style: TextStyle(
                                        fontSize: context.screenWidth * 0.035,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
            )
            : Padding(
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
                    SizedBox(
                      height: context.screenHeight * 0.025,
                    ),
                    Divider(),
                    SizedBox(height: context.screenHeight * 0.02),
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
                    SizedBox(height: context.screenHeight * 0.02),
                    CustomButton(
                      onPressed: () {
                        Get.toNamed(
                          Routes.auth,
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
    );
  }
}
