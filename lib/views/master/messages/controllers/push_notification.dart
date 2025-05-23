import 'package:airbnb/airbnb_global_imports.dart';
import 'package:flutter/foundation.dart';
import 'dart:io';

class PushNotifications {

  // mobile
  static final _firebaseMessaging = FirebaseMessaging.instance;
  static final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  // request notification permission
  static Future init() async {
    // try {
    //   NotificationSettings settings = await _firebaseMessaging
    //       .requestPermission(
    //     alert: true,
    //     announcement: true,
    //     badge: true,
    //     carPlay: false,
    //     criticalAlert: true,
    //     provisional: false,
    //     sound: true,
    //   );
    //   if(settings.authorizationStatus == AuthorizationStatus.denied){
    //     print('permission is granted');
    //   }
    //   //web handling for block
    //   if(settings.authorizationStatus == AuthorizationStatus.denied){
    //     print("permission denied from user in web");
    //   }
    //
    // } catch (e){
    //   print(e);
    // }


    try {
      final token = await _firebaseMessaging.getToken();
      print(('Device tokenn :----> $token'));
      print("okay done");
    }catch (e){
      print(e);
      print('blocked');
    }

    const AndroidInitializationSettings initializationSettingsAndroid = AndroidInitializationSettings('@mipmap/launcher_icon');
    final DarwinInitializationSettings initializationSettingsDarwin = DarwinInitializationSettings();

    final InitializationSettings initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsDarwin,
    );

    // request notification permissions for android 13 or above
    if (!kIsWeb && Platform.isAndroid) {
      _flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()?.requestNotificationsPermission();
    }

    _flutterLocalNotificationsPlugin.initialize(initializationSettings,
      onDidReceiveBackgroundNotificationResponse: onNotificationTap,
      onDidReceiveNotificationResponse: onNotificationTap,
    );

    // on background notification tapped
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message){
      if(message.notification != null){
        navigatorKey.currentState!.pushNamed('/messageNotification',arguments: message);
      }
    });

    // to handle foreground notifications
    FirebaseMessaging.onMessage.listen((RemoteMessage message){
      String payloadData = jsonEncode(message.data);
      if(message.notification != null){
        PushNotifications.showSimpleNotification(
          title: message.notification!.title!,
          body: message.notification!.body!,
          payload: payloadData,
        );
      }
    });


    // for handling in terminated state
    final RemoteMessage? message = await FirebaseMessaging.instance.getInitialMessage();
    if(message != null){
      Future.delayed(Duration(seconds: 1),(){
        navigatorKey.currentState!.pushNamed('/messageNotification',arguments: message);
      });
    }

  }


  // on tap local notification
  static void onNotificationTap(NotificationResponse notificationResponse){
    navigatorKey.currentState!.pushNamed('/messageNotification',arguments: notificationResponse);
  }
    // show a simple notification
    static Future showSimpleNotification({
      required String title,
      required String body,
      required String payload,
    }) async{
      const AndroidNotificationDetails androidNotificationDetails = AndroidNotificationDetails('your channel id', 'your channel name',
        channelDescription: 'your channel description',
        importance: Importance.max,
        priority: Priority.high,
        ticker: 'ticker');
      const NotificationDetails notificationDetails = NotificationDetails(android: androidNotificationDetails);
      await _flutterLocalNotificationsPlugin.show(0, title, body, notificationDetails,payload: payload);
    }
  }