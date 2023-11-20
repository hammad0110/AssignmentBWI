import 'package:firebase_storage/firebase_storage.dart';

class FirebaseStorageService {
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Future<List<String>> getImageUrls(List<String> imageNames) async {
    List<String> urls = [];

    for (String imageName in imageNames) {
      try {
        Reference storageReference = _storage.ref().child('images/$imageName');
        String url = await storageReference.getDownloadURL();
        urls.add(url);
      } catch (e) {
        print('Error fetching image: $e');
      }
    }

    return urls;
  }
}
