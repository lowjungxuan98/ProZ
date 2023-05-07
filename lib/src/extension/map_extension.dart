extension MapExtension on Map<String, dynamic> {
  List<Map<String, dynamic>> toSeparateMap() {
    List<Map<String, dynamic>> result = [];
    forEach((key, value) {
      result.add({key: value});
    });
    return result;
  }
}
