
class ImageItem {
  String? imagePath, imageName, imageDate, imageTime, docId;

  ImageItem(
      {required this.imagePath,
      required this.imageName,
      required this.imageDate,
      required this.imageTime,
      this.docId});

  ImageItem.fromJson(Map<String, dynamic> map) {
    imagePath = map['imagePath'];
    imageName = map['imageName'];
    imageDate = map['imageDate'];
    imageTime = map['imageTime'];
    docId = map['docId'];
  }

  Map<String, dynamic> toMap() {
    return {
      'imagePath': imagePath,
      'imageName': imageName,
      'imageDate': imageDate,
      'imageTime': imageTime,
      'docId': docId,
    };
  }
}
