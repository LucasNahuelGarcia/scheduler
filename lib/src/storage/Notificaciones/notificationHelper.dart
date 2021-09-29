import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:scheduler/src/storage/Evento/Evento.dart';
import 'package:timezone/timezone.dart' as tz;
import 'dart:io' show Platform;

class NotificationHandler {
  FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin;
  static NotificationHandler _instancia = NotificationHandler._();

  static NotificationHandler get instancia => _instancia;

  NotificationHandler._() {
    init();
  }

  Future<void> init() async {
    _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    if (Platform.isIOS) _requestIOSNotificationPermission();

    _initializePlatformSpecifics();
  }

  void _requestIOSNotificationPermission() {
    _flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin>()
        .requestPermissions(
          alert: false,
          badge: false,
          sound: true,
        );
  }

  void _initializePlatformSpecifics() {
    var initSettingsAndroid = AndroidInitializationSettings('notif_img');
    var initSettingsIOS = IOSInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
    );

    var initSettings = InitializationSettings(
      android: initSettingsAndroid,
      iOS: initSettingsIOS,
    );

    _flutterLocalNotificationsPlugin.initialize(
      initSettings,
      onSelectNotification: (p) {},
    );
  }

  /// Agenda una notificacion para un evento en una fecha dada.
  /// La fecha debe ser UTC.
  Future<void> scheduleNotificationEventoAtDate(Evento e, DateTime fechaUTC) async {
    var androidChanSpecifics = AndroidNotificationDetails(
      "CHANNEL_ID",
      "CHANNEL_NAME",
      "CHANNEL_DESCRIPTION",
      priority: Priority.max,
      playSound: true,
      styleInformation: DefaultStyleInformation(true, true),
      enableVibration: true,
    );
    var iosChannelSpecifics = IOSNotificationDetails();

    var platformChannelSpecific = NotificationDetails(
        android: androidChanSpecifics, iOS: iosChannelSpecifics);

    await _flutterLocalNotificationsPlugin.zonedSchedule(
      e.id,
      e.titulo,
      "",
      tz.TZDateTime.from(fechaUTC,tz.UTC),
      platformChannelSpecific,
      androidAllowWhileIdle: true,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
    );
  }
}

class NotificacionEvento {
  final int id;
  final String titulo;
  final String body;
  final String payload;
  NotificacionEvento({
    this.id,
    this.titulo,
    this.body,
    this.payload,
  });
}
