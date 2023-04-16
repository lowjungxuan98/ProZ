import 'dart:convert';

import 'package:pro_z/pro_z.dart';

class NotificationList implements Serializable {
  List<Notification>? notificationList;

  NotificationList(this.notificationList);

  @override
  factory NotificationList.fromJson(Map<String, dynamic> json) {
    dynamic data;
    if (json['notification'] is String) {
      data = jsonDecode(json['notification']);
    } else {
      data = json['notification'];
    }
    return NotificationList(Notification.shared.listFromJson(data));
  }

  @override
  List<NotificationList> listFromJson(List? json) {
    if (json == null) return [];
    List<NotificationList> list = [];
    for (var item in json) {
      list.add(NotificationList.fromJson(item));
    }
    return list;
  }

  @override
  Map<String, dynamic> toJson() => {
        "notification": jsonEncode(notificationList),
      };

  @override
  fromJson(Map<String, dynamic>? json) {
    if (json == null) return null;
    return NotificationList.fromJson(json);
  }
}

class Notification implements Serializable {
  String? title, message;
  DateTime? receivedTime;
  bool isRead;

  Notification({
    this.title,
    this.message,
    this.receivedTime,
    this.isRead = false,
  });

  static final shared = Notification();

  @override
  factory Notification.fromJson(Map<String, dynamic> json) => Notification(
        title: json["title"],
        message: json["message"],
        receivedTime: json["received_time"] == null ? DateTime.now() : DateTime.parse(json["received_time"]),
        isRead: json["is_read"],
      );

  @override
  List<Notification> listFromJson(List? json) {
    if (json == null) return [];
    List<Notification> list = [];
    for (var item in json) {
      list.add(Notification.fromJson(item));
    }
    return list;
  }

  @override
  Map<String, dynamic> toJson() => {
        "title": title,
        "message": message,
        "received_time": receivedTime?.toIso8601String(),
        "is_read": isRead,
      };

  @override
  fromJson(Map<String, dynamic>? json) {
    if (json == null) return null;
    return Notification.fromJson(json);
  }
}
