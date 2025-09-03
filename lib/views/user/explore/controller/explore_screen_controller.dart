import 'package:airbnb/airbnb_global_imports.dart';

class ExploreScreenController extends GetxController {

  var currentIndexPropertyDetail = 0.obs;
  late TabController tabController;

  // review screen
  TextEditingController searchController = TextEditingController();

  Future<dynamic> getDataByPlace(String placeName) async{
    QuerySnapshot querySnapshot = await FirebaseFirestore
        .instance
        .collection('properties')
        .where('category',isEqualTo: placeName)
        .get();

    Map<String, Map<String, dynamic>> documents = {};
    for (var doc in querySnapshot.docs) {
      documents[doc.id] = doc.data() as Map<String, dynamic>;
    }
    return documents;
  }

  // property detail screen
  Future<dynamic> getDocumentById(String documentId,) async {
    try {
      DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
          .collection('properties')
          .doc(documentId)
          .get();
      if (documentSnapshot.exists) {
        final documentData = {
          'id': documentSnapshot.id,
          ...documentSnapshot.data() as Map<String, dynamic>
        };
        return documentData;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<dynamic> getPropertyOwnerDetails(String ownerId) async{
    try{
      var ownerDetails = await FirebaseFirestore.instance.collection('users').doc(ownerId).get();
      return ownerDetails.data();
    } on FirebaseFirestore catch (e){
      SmartAlert.customSnackBar(title: 'Something went wrong $e', desc: 'Try again');
    }
  }
}
