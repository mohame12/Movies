import 'package:movies_app/features/detailes_feature/data/models/details_model/DetailsModel.dart';

class FireModel {
  String? docID;
  DetailsModel? details;
  bool isFav;


  FireModel({this.docID, this.details, this.isFav = false});


  FireModel.fromJson(Map<String, dynamic> json)
      : docID = json['docID'],
        isFav = json['isFav'] ?? false,
        details = json['details'] != null ? DetailsModel.fromJson(json['details']) : null;


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['docID'] = docID;
    data['isFav'] = isFav;
    if (details != null) {
      data['details'] = details?.toJson();
    }
    return data;
  }
}
