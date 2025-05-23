import 'package:airbnb/airbnb_global_imports.dart';

class WishlistsScreen extends StatelessWidget {
  const WishlistsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return
      Padding(
        padding: EdgeInsets.symmetric(horizontal: context.screenWidth * 0.06),
        child: Column(
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
                  Routes.auth,
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
