import 'package:airbnb/airbnb_global_imports.dart';

class CustomCardParticularHome extends StatelessWidget {
  const CustomCardParticularHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.screenHeight * 0.33,
      width: context.screenWidth * 0.7,
      child: Card(
          color: Colors.white,
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: context.screenWidth * 0.045,
                vertical: context.screenHeight * 0.025),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      size: context.screenWidth * 0.04,
                    ),
                    Icon(
                      Icons.star,
                      size: context.screenWidth * 0.04,
                    ),
                    Icon(
                      Icons.star,
                      size: context.screenWidth * 0.04,
                    ),
                    Icon(
                      Icons.star,
                      size: context.screenWidth * 0.04,
                    ),
                    Icon(
                      Icons.star,
                      size: context.screenWidth * 0.04,
                    ),
                    Text('.'),
                    Text(
                      '1 weeks ago',
                      style: TextStyle(
                        fontSize: context.screenWidth * 0.03,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: context.screenHeight * 0.01,
                ),
                Text(
                    'Sara and her family are great, she went above and beyond to make our stay wonderful. She was very welcoming and...'),
                SizedBox(
                  height: context.screenHeight * 0.01,
                ),
                Text(
                  'Show more',
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
                SizedBox(
                  height: context.screenHeight * 0.02,
                ),
                Row(
                  children: [
                    CircleAvatar(
                        radius: context.screenWidth * 0.065,
                        child: Icon(
                          Icons.account_circle_outlined,
                          size: context.screenWidth * 0.1,
                        )),
                    SizedBox(
                      width: context.screenWidth * 0.035,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Daniver',
                          style: TextStyle(
                              fontSize: context.screenWidth * 0.035,
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          'Santiago, Chille',
                          style: TextStyle(
                              fontSize: context.screenWidth * 0.03,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          )),
    );
  }
}
