import 'package:airbnb/airbnb_global_imports.dart';

class ParticularWishMapScreen extends StatelessWidget {
  const ParticularWishMapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: AppBar(
        backgroundColor: AppColor.white,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.ios_share,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 15.0),
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.more_vert,
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Stack(
          children: [
            GoogleMap(
              initialCameraPosition: CameraPosition(
                target: LatLng(23.014509, 72.591759),
                zoom: 12,
              ),
              zoomControlsEnabled: false,
            ),
            Positioned(
              top: 12,
              right: 15,
              child: Container(
                width: 45,
                height: 45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: AppColor.black26,
                ),
                child: IconButton(
                  iconSize: 28,
                  icon: Icon(
                    Icons.add_circle,
                    color: AppColor.black,
                  ),
                  onPressed: () {},
                ),
              ),
            ),
          ],
        ),
      ),
      bottomSheet: Container(
        height: 90,
        width: Get.width,
        decoration: BoxDecoration(
          color: AppColor.white,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(50),
          ),
        ),
        child: Column(
          spacing: 20,
          children: [
            Divider(
              indent: 170,
              endIndent: 170,
              thickness: 3,
              radius: BorderRadiusGeometry.circular(10),
            ),
            Text(
              "Nice",
              style: TextStyle(
                color: AppColor.black,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
