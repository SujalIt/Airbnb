import 'package:airbnb/airbnb_global_imports.dart';

class OwnerPropertyScreen extends GetView<OwnerPropertyController> {
  const OwnerPropertyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColor.pink,
        foregroundColor: AppColor.white,
        onPressed: controller.addNewPropertyForm,
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 20,
          children: [
            Text(
              "Your properties",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w500,
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: FutureBuilder<dynamic>(
                  future: controller.getDocumentById(FirebaseAuth.instance.currentUser!.uid.toString()),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return SizedBox(
                        height: 350,
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    }
                    if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    }
                    if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return Center(child: Text('No documents found'));
                    }
                    return Column(
                      spacing: 15,
                      children: [
                        Stack(
                          children: [
                            InkWell(
                              onTap: () {
                                // Get.toNamed(
                                //   '${Routes.propertyDetail}?id=$documentId',
                                // );
                              },
                              child: ClipRRect(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                                child: CustomImage(
                                  height: 330,
                                  path: snapshot.data['images'][0],
                                  fit: BoxFit.cover,
                                  width: Get.width,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          spacing: 1,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  snapshot.data["name"] ?? "name",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Row(
                                  spacing: 1,
                                  children: [
                                    Icon(
                                      Icons.star,
                                      size: 18,
                                    ),
                                    Text(
                                      snapshot.data["rating"] ?? "rating",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Text(
                              snapshot.data["distance"] ?? "distance",
                              style: TextStyle(
                                color: AppColor.blueGrey,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              snapshot.data["available_dates"] ?? "availableDates",
                              style: TextStyle(
                                color: AppColor.blueGrey,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Row(
                              spacing: 3,
                              children: [
                                Text(
                                  '₹${snapshot.data["price"] ?? "price"}',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: AppColor.black,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                                Text(
                                  'night',
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
