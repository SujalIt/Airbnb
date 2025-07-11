import 'package:airbnb/airbnb_global_imports.dart';

class ReviewScreen extends GetView<ExploreScreenController> {
  const ReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: AppColor.white,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0,vertical: 25),
        child: SingleChildScrollView(
          child: Column(
            spacing: 25,
            children: [
              Row(
                spacing: 5,
                children: [
                  Icon(Icons.star,size: 20,),
                  Text(
                    "4.95 ∙ 22 reviews",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              TextField(
                controller: controller.searchController,
                decoration: InputDecoration(
                  hintText: 'Search reviews',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  prefixIcon: CustomButton(
                    type: ButtonTypes.icon,
                    onPressed: () {},
                    leadingIcon: Icons.search,
                  ),
                  suffixIcon: CustomButton(
                    type: ButtonTypes.icon,
                    onPressed: () {
                      controller.searchController.clear();
                    },
                    leadingIcon: Icons.cancel_outlined,
                  ),
                ),
              ),
              Column(
                children: [
                  _typesOfReviews("Cleanliness"),
                  _typesOfReviews("Accuracy"),
                  _typesOfReviews("Communication"),
                  _typesOfReviews("Location"),
                  _typesOfReviews("Check-in"),
                  _typesOfReviews("Value"),
                ],
              ),
              _usersReview("Emma","May 2023"),
              _usersReview("Tanya","June 2024"),
              _usersReview("Putin","Feb 2025"),
              _usersReview("King","Jan 2022"),
              Text(
                "Reviews translated from another language will not appear. You can search in the original language.",
                style: TextStyle(
                  color: AppColor.black38,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _typesOfReviews(String reviewTypeName,){
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        reviewTypeName,
        style: TextStyle(
          fontSize: 17,
        ),
      ),
      Row(
        children: [
          SliderTheme(
            data: SliderThemeData(
              trackHeight: 5.0,
              thumbShape: SliderComponentShape.noThumb,
              activeTrackColor: AppColor.black,
            ),
            child: Slider(
              value: 5,
              divisions: 4,
              min: 0,
              max: 5,
              onChanged: (newValue) {},
            ),
          ),
          Text("5.0"),
        ],
      )
    ],
  );
}

Widget _usersReview(String userName,String postDate,){
  return Column(
    spacing: 10,
    children: [
      Row(
        spacing: 10,
        children: [
          CustomImage(
            clipBehaviour: Clip.antiAlias,
            boxDecoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
            ),
            width: 50,
            height: 50,
            path: "https://w0.peakpx.com/wallpaper/107/46/HD-wallpaper-best-pose-for-profile-for-men-profile-pose-men-best-glasses.jpg",
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                userName,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                ),
              ),
              Text(
                postDate,
                style: TextStyle(
                  color: AppColor.black38,
                  fontSize: 12,
                ),
              ),
            ],
          )
        ],
      ),
      Text(
        "We were only sad not to stay longer. We hope to be back to explore Nantes some more and would love to stay at Golwen’s place again, if they’ll have us! :)",
      ),
    ],
  );
}
