import 'package:airbnb/airbnb_global_imports.dart';

class ReportListingScreen extends GetView<ExploreScreenController> {
  const ReportListingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0,vertical: 20),
        child: CustomButton(
          type: ButtonTypes.elevated,
          onPressed: (){},
          text: 'Next',
          textStyle: TextStyle(
            fontSize: 17,
          ),
          backgroundColor: AppColor.black,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0,vertical: 20),
        child: SingleChildScrollView(
          child: Column(
            spacing: 10,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Why are you reporting this listing?",
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  Icon(Icons.lock,),
                  Text("This won’t be shared with the Host.")
                ],
              ),
              Divider(),
              _differentReports("It’s inaccurate or incorrect"),
              _differentReports("It’s not a real place to stay"),
              _differentReports("It’s a scam"),
              _differentReports("It’s offensive"),
              _differentReports("It’s something else"),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _differentReports(String reportName){
  return Column(
    spacing: 10,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            reportName,
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          Radio(
            activeColor: AppColor.black,
            value: true,
            groupValue: true,
            onChanged: (value){},
          ),
        ],
      ),
      Divider(),
    ],
  );
}
