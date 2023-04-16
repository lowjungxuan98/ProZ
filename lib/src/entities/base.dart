import 'entities_index.dart';

class BaseResponse<T extends Serializable> {
  bool? status;
  String? message;
  T? data;
  List<T>? datas;

  BaseResponse({
    this.message,
    this.status,
    this.data,
    this.datas,
  });

  factory BaseResponse.fromJson(T item, Map<String, dynamic> json) {
    var jsonData = json['data'];
    if (jsonData is List && jsonData.isEmpty) jsonData = [];
    // if the "status" is string then convert to boolean
    // bool returnStatus = json.containsKey('status')
    //     ? json['status']
    //     : json.containsKey('success')
    //         ? json['success']
    //         : true;
    final status = json['status'];
    T? mItem;
    List<T>? mItemList;
    if (status) {
      if (jsonData is List) {
        mItemList = item.listFromJson(jsonData);
      } else {
        mItem = item.fromJson(jsonData);
      }
    }
    return BaseResponse<T>(
      status: json['status'],
      message: json.containsKey('message') ? json['message'] : '',
      data: mItem,
      datas: mItemList,
    );
  }
}