// import '../../../airbnb_global_imports.dart';
//
// class MessageNotificationScreen extends StatefulWidget {
//   const MessageNotificationScreen({super.key});
//
//   @override
//   State<MessageNotificationScreen> createState() => _MessageNotificationScreenState();
// }
//
// class _MessageNotificationScreenState extends State<MessageNotificationScreen> {
//   Map payload = {};
//   @override
//   Widget build(BuildContext context) {
//     final data = Get.arguments; // arguments from another screens from main.dart
//     // for background and terminated state
//     if (data is RemoteMessage){
//       payload = data.data;
//     }
//     // for foreground state
//     if(data is NotificationResponse){
//       payload = jsonDecode(data.payload!);
//     }
//     return Scaffold(
//       appBar: AppBar(title: Text("Your Message"),),
//       body: Center(
//         child: Text(payload.toString()),
//       ),
//     );
//   }
// }
