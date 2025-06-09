import 'package:airbnb/airbnb_global_imports.dart';

class WishlistsScreen extends StatelessWidget {
  const WishlistsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.white,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: context.screenWidth * 0.06),
          child: FirebaseAuth.instance.currentUser != null
              ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 20,
                    children: [
                      SizedBox(height: context.screenWidth * 0.06,),
                      Text(
                        "Wishlist",
                        style: TextStyle(
                          fontSize: context.screenWidth * 0.08,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 2,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: EdgeInsets.symmetric(vertical: context.screenHeight * 0.01),
                            child: GestureDetector(
                              onTap: (){
                                Get.toNamed(Routes.particularWish);
                              },
                              child: Row(
                                spacing: context.screenWidth * 0.035,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: CustomImage(
                                      width: context.screenWidth * 0.17,
                                      height: context.screenHeight * 0.08,
                                      path: "https://static.vecteezy.com/system/resources/thumbnails/007/950/886/small/small-plant-growing-in-morning-light-at-garden-concept-earth-day-free-photo.jpg",
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Nice",
                                      ),
                                      Text(
                                        "May 14-19,2023",
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      )
                    ],
                  )
              : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: context.screenHeight * 0.07,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'Edit',
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                      Text(
                        'Wishlists',
                        style: TextStyle(
                            fontSize: context.screenWidth * 0.08,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: context.screenHeight * 0.04,
                      ),
                      Text(
                        'Log in to view your Wishlists',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: context.screenWidth * 0.06),
                      ),
                      SizedBox(
                        height: context.screenHeight * 0.01,
                      ),
                      Text(
                        'You can create, view, or edit Wishlists once you\'ve logged in.',
                        style: TextStyle(color: Colors.blueGrey),
                      ),
                      SizedBox(
                        height: context.screenHeight * 0.02,
                      ),
                      CustomButton(
                        onPressed: () {
                          Get.toNamed(
                            Routes.login,
                          );
                        },
                        width: context.screenWidth * 0.23,
                        text: 'Log in',
                        textStyle: TextStyle(
                          fontSize: context.screenWidth * 0.04,
                        ),
                      ),
                    ],
                  ),
        ),
      ),
    );

    // image component/.....

    // SafeArea(
    //   child: SingleChildScrollView(
    //     scrollDirection: Axis.vertical,
    //     child: Padding(
    //       padding: const EdgeInsets.all(18.0),
    //       child: Column(
    //         spacing: 20,
    //         mainAxisAlignment: MainAxisAlignment.start,
    //         crossAxisAlignment: CrossAxisAlignment.start,
    //         children: [
    //           Text("Assets Images", style: Theme.of(context).textTheme.bodyMedium,),
    //           ClipRRect(
    //             borderRadius: BorderRadius.circular(20),
    //             child: CustomImage(
    //               path: 'assets/images/3.jpeg',
    //             ),
    //           ),
    //           Text("Network Images", style: Theme.of(context).textTheme.bodyMedium,),
    //           CustomImage(
    //             path: 'https://img1.hscicdn.com/image/upload/f_auto,t_ds_w_960,q_50/lsci/db/PICTURES/CMS/382500/382506.jpg',
    //             height: context.screenHeight * 0.4,
    //             width: context.screenWidth * 0.7,
    //             fit: BoxFit.fill,
    //           ),
    //           // Text("SVG Images", style: Theme.of(context).textTheme.bodyMedium,),
    //           // ImagePickerDemo(
    //           //    path: "https://dev.w3.org/SVG/tools/svgweb/samples/svg-files/gaussian2.svg",
    //           // ),
    //           Text("File Images", style: Theme.of(context).textTheme.bodyMedium,),
    //           CustomImage(
    //             path: '',
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    // ),
  }
}
