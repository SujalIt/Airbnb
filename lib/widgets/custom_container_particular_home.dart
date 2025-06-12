import 'package:airbnb/airbnb_global_imports.dart';

class CustomContainerParticularHome extends StatelessWidget {
  const CustomContainerParticularHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      width: 280,
      child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: BoxBorder.all(color: AppColor.black12,),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 13,
            ),
            child: Column(
              spacing: 10,
              crossAxisAlignment: CrossAxisAlignment.start,
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
                        Text('Blair',),
                        Text('2 weeks ago',),
                      ],
                    )
                  ],
                ),
                Text(
                  'Sara and her family are great, she went above and beyond to make our stay wonderful. She was very welcoming and...',
                ),

              ],
            ),
          )),
    );
  }
}
