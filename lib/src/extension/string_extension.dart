import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import '../global_enum/enum_index.dart';

extension StringExtension on String? {
  // String toBaseUrl() {
  //   switch (this) {
  //     case AGENT:
  //       return AGENT_BASE_URL;
  //     case CUSTOMER:
  //       return CUSTOMER_BASE_URL;
  //     default:
  //       return CUSTOMER_BASE_URL;
  //   }
  // }

  String toBase64() => this != null ? utf8.fuse(base64).encode(this!) : '';

  String toCurrency() => this != null ? "RM ${NumberFormat("#,##0.00", "en_US").format(double.parse(this!))}" : '';

  bool isValidEmail() {
    return RegExp(r'^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$').hasMatch(this ?? '');
  }

  Future<Uint8List> toByte() async => (await NetworkAssetBundle(Uri.parse(this!)).load(this!)).buffer.asUint8List();

  Uri? toUri() => Uri.tryParse(this!);

  MediaType mediaType() {
    final extension = this!.toLowerCase();
    if (extension.endsWith('jpg') || extension.endsWith('png') || extension.endsWith('jpeg')) {
      return MediaType.image;
    } else if (extension.endsWith('mp4') || extension.endsWith('mov')) {
      return MediaType.video;
    } else {
      return MediaType.image;
    }
  }

  String toTitleCase() {
    if (this == null) {
      return '';
    }
    return this!.split(' ').map((word) => word.substring(0, 1).toUpperCase() + word.substring(1)).join(' ');
  }
}
