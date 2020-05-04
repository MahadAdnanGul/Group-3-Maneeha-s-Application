import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';
import 'dart:convert';

class ProductService{
final CollectionReference orders = Firestore.instance.collection('Products');
//  name of our collection
  String ref = 'Products';

  void uploadProducts(String productName, String productCat, String url, String productPrice, String productDesc) {
//    giving each new product an id
    var id = Uuid();
    String ProductId = id.v1();
//    details holds details of our product that we'll upload. we're gonna get details from addProduct page
    /*_firestore.collection(ref).document(ProductId).setData({
//      where you will upload the data
      'name': productName,
      //'image':images,
      'category':productCat,
      'price':productPrice,
      'Desc':productDesc,
      'shortDesc': productName,
      'searchKey': productName,
      'TotalStock': int.parse(productPrice)
    });*/
                      Future updateOrders() async {
                    return await orders.document(ProductId).setData({
                      'name' : productName,
                      'price' : productPrice,
                      'Desc' : productDesc,
                      //'status' : 'in-progress',
                      //'size' : 'M',
                      'quantity' : 1,
                      'image' : url
                    });
                  }
                  updateOrders();
  }
}
