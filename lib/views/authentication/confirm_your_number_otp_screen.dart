import 'package:airbnb/airbnb_global_imports.dart';

class ConfirmYourNumberOtpScreen extends StatelessWidget {
  const ConfirmYourNumberOtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Confirm your number',
            style: TextStyle(
                fontSize: context.screenWidth * 0.044,
                fontWeight: FontWeight.bold),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: context.screenWidth * 0.05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Divider(),
                SizedBox(
                  height: context.screenHeight * 0.02,
                ),
                Text(
                  'Enter the code we\'ve sent by SMS to 918585765421:',
                ),
                SizedBox(
                  height: context.screenHeight * 0.02,
                ),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  maxLength: 6,
                  keyboardType: TextInputType.number,
                ),
                Row(
                  children: [
                    Text(
                      'Haven\'t received a code?',
                    ),
                    SizedBox(
                      width: context.screenWidth * 0.015,
                    ),
                    Text(
                      'Send again',
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                  onPressed: () {
                    showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        useSafeArea: true,
                        builder: (context) {
                          return Scaffold(
                            appBar: AppBar(
                              leading: IconButton(
                                  onPressed: () {
                                    Get.back();
                                  },
                                  icon: Icon(Icons.cancel_outlined)),
                            ),
                            body: SingleChildScrollView(
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: context.screenWidth * 0.05),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'More options',
                                      style: TextStyle(
                                          fontSize: context.screenWidth * 0.09,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    SizedBox(
                                      height: context.screenHeight * 0.03,
                                    ),
                                    Text(
                                      'Choose another way to get a verification code on 91 98798 87654',
                                      style: TextStyle(
                                          fontSize:
                                              context.screenWidth * 0.042),
                                    ),
                                    SizedBox(
                                      height: context.screenHeight * 0.03,
                                    ),
                                    CustomListTile(
                                      leadingIcon: Icons.message_outlined,
                                      title: 'Text message (SMS)',
                                      trailingIcon: Icons.circle_outlined,
                                      contentPadding: EdgeInsets.all(1),
                                    ),
                                    Divider(),
                                    CustomListTile(
                                      leadingIcon: Icons.whatshot_outlined,
                                      title: 'WhatsApp',
                                      trailingIcon: Icons.circle_outlined,
                                      contentPadding: EdgeInsets.all(1),
                                    ),
                                    Divider(),
                                    CustomListTile(
                                      leadingIcon: Icons.phone_android_outlined,
                                      title: 'Phone call',
                                      trailingIcon: Icons.circle_outlined,
                                      contentPadding: EdgeInsets.all(1),
                                    ),
                                    Divider(),
                                    SizedBox(
                                      height: context.screenHeight * 0.1,
                                    )
                                  ],
                                ),
                              ),
                            ),
                            bottomNavigationBar: BottomAppBar(
                              child: CustomButton(
                                onPressed: () {},
                                text: 'Continue',
                                textStyle: TextStyle(
                                  color: Colors.white,
                                ),
                                backgroundColor: Colors.black,
                              ),
                            ),
                          );
                        });
                  },
                  style: ButtonStyle(),
                  child: Text(
                    'More options',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                    ),
                  )),
              CustomButton(
                onPressed: () {},
                text: 'Continue',
              )
            ],
          ),
        ));
  }
}
