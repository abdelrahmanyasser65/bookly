import 'VolumeInfo.dart';
import 'SaleInfo.dart';
import 'AccessInfo.dart';

class BooksModel {
  BooksModel({
      this.kind, 
      this.id, 
      this.etag, 
      this.selfLink, 
      this.volumeInfo, 
      this.saleInfo, 
      this.accessInfo,});

  BooksModel.fromJson(dynamic json) {
    kind = json['kind'];
    id = json['id'];
    etag = json['etag'];
    selfLink = json['selfLink'];
    volumeInfo = json['volumeInfo'] != null ? VolumeInfo.fromJson(json['volumeInfo']) : null;
    saleInfo = json['saleInfo'] != null ? SaleInfo.fromJson(json['saleInfo']) : null;
    accessInfo = json['accessInfo'] != null ? AccessInfo.fromJson(json['accessInfo']) : null;
  }
  String? kind;
  String ?id;
  String ?etag;
  String ?selfLink;
  VolumeInfo? volumeInfo;
  SaleInfo ?saleInfo;
  AccessInfo? accessInfo;



}