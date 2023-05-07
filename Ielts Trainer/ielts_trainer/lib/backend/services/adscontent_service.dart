import 'package:cloud_firestore/cloud_firestore.dart';

class AdsContentService {
  final _adsContentDoc = FirebaseFirestore.instance.collection('adscontent');

  Future<List<AdsModel>> getAdsContents() async {
    List<AdsModel> ads = [];
    await _adsContentDoc.get().then((data) {
      for (var ad in data.docs) {
        ads.add(AdsModel(image: ad['image'], linkto: ad['linkto']));
      }
    });
    return ads;
  }
}

class AdsModel {
  final String image;
  final String linkto;

  AdsModel({required this.image, required this.linkto});
}
