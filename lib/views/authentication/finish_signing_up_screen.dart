import 'package:airbnb/airbnb_global_imports.dart';

class FinishSigningUpScreen extends StatefulWidget {
  const FinishSigningUpScreen({super.key});

  @override
  State<FinishSigningUpScreen> createState() => _FinishSigningUpScreenState();
}

class _FinishSigningUpScreenState extends State<FinishSigningUpScreen>{

  late TextEditingController passwordController;
  late TextEditingController emailController;

  late final PasswordLoginController passShowHideControll;
  late final DOBController dateControll;

  String emailFromLoginSignupScreen = Get.arguments;
  @override
  void initState(){
    super.initState();
    passwordController = TextEditingController();
    emailController = TextEditingController();
    emailController.text = emailFromLoginSignupScreen;
    passShowHideControll = Get.find();
    dateControll = Get.find();
  }

  @override
  void dispose(){
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: context.screenWidth * 0.05),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Finish signing up',
                style: TextStyle(
                  fontSize: context.screenWidth * 0.06,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: context.screenHeight * 0.015,
              ),
              Text(
                'Legal name',
              ),
              SizedBox(
                height: context.screenHeight * 0.015,
              ),
              Container(
                height: context.screenHeight * 0.175,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    border: Border.all()),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: context.screenWidth * 0.015,
                          vertical: context.screenHeight * 0.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextField(
                            decoration: InputDecoration(
                              hintText: 'First name on ID',
                              labelText: 'First name on ID',
                              border: InputBorder.none,
                            ),
                          ),
                          Divider(),
                          TextField(
                            decoration: InputDecoration(
                              hintText: 'Surname on ID',
                              labelText: 'Surname on ID',
                              border: InputBorder.none,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: context.screenHeight * 0.015,
              ),
              Text(
                'Make sure this matches the name on your government-issued ID. If you go by another name,you can add a preferred first name.',
              ),
              SizedBox(
                height: context.screenHeight * 0.015,
              ),
              Text(
                'Date of birth',
              ),
              SizedBox(
                height: context.screenHeight * 0.015,
              ),
              Obx(() {
                return TextFormField(
                  readOnly: true,
                  controller: TextEditingController(
                    text: dateControll.selectedDate.value == null
                        ? ''
                        : "${dateControll.selectedDate.value!
                        .day}-${dateControll.selectedDate.value!
                        .month}-${dateControll.selectedDate.value!.year}",
                  ),
                  decoration: InputDecoration(
                    labelText: "Date of Birth",
                    border: OutlineInputBorder(),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.calendar_today),
                      onPressed: () => dateControll.pickDate(context),
                    ),
                  ),
                );
              }),
              SizedBox(
                height: context.screenHeight * 0.015,
              ),
              Text(
                'To sign up, you need to be at least 18. Other peoplw who use Airbnb won\'t see your date of birth.',
              ),
              SizedBox(
                height: context.screenHeight * 0.015,
              ),
              Text(
                'Email',
              ),
              SizedBox(
                height: context.screenHeight * 0.015,
              ),
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(
                height: context.screenHeight * 0.015,
              ),
              Text(
                'We\'ll email you a reservation confirmation.',
              ),
              SizedBox(
                height: context.screenHeight * 0.015,
              ),
              Text(
                'Password',
              ),
              SizedBox(
                height: context.screenHeight * 0.015,
              ),
              Obx(
                    () =>
                    TextField(
                      controller: passwordController,
                      obscureText: !passShowHideControll.isPasswordVisible
                          .value,
                      decoration: InputDecoration(
                          labelText: 'Password',
                          border: OutlineInputBorder(),
                          suffixIcon: TextButton(
                            onPressed: passShowHideControll
                                .togglePasswordVisibility,
                            child: passShowHideControll.isPasswordVisible.value
                                ? Text("Hide")
                                : Text('Show'),
                          )),
                      keyboardType: TextInputType.number,
                    ),
              ),
              SizedBox(
                height: context.screenHeight * 0.015,
              ),
              Text(
                'By selecting Agree and continue, I agree to Airbnb\'s Terms of Service, Payments Terms of Service and Anti-Discrimination Policy, and acknowledge the Privacy Policy.',
              ),
              SizedBox(
                height: context.screenHeight * 0.015,
              ),

              CustomButton(
                onPressed: () {
                  if(dateControll.selectedDate.value == null){
                    Get.snackbar('Error', 'Please enter details');
                  }else {
                    dateControll.signUp(
                      emailController.text.trim(),
                      passwordController.text.trim(),
                    );
                  }
                },
                text: 'Agree and continue',
              ),

              SizedBox(
                height: context.screenHeight * 0.015,
              ),
              Text(
                'Airbnb will send you members-only deals, inspiration, marketing emails, and push notifications. You can opt out of receiving these at any time in your account settings or directly from the marketing notification.',
              ),
              SizedBox(
                height: context.screenHeight * 0.015,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'I don\'t want to receive marketing \nmessages from Airbnb.',
                  ),
                  Text(
                    'switch button',
                  ),
                ],
              ),
              SizedBox(
                height: context.screenHeight * 0.015,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
