import 'dart:convert';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';

/// Use this at everywhere where you need to store/get data to device's local storage
/// ex.
/// To Save Something: localStorage.save("Key","Value")
/// To Read Something: localStorage.read("Key")
/// To Remove Something: localStorage.remove("Key")
/// To Remove All : localStorage.removeAll()

final localStorage = LocalStorage();
late GetStorage getStorageInstance;

class LocalStorage extends GetxService{

  Future<LocalStorage> init() async {
    getStorageInstance = GetStorage();
    // await getStorageInstance.writeIfNull(reviewsKey, []);
    return this;
  }
  ///This will Reads a value in your container with the given key.
  read(String key){
    return json.decode(getStorageInstance.read(key).toString());
  }

  ///This will Write data on your container
  save(String key, value) async {
    getStorageInstance.write(key, json.encode(value));
  }

  ///This will remove data from container by key
  remove(String key) async {
    getStorageInstance.remove(key);
  }

  ///This will clear all the data in app container
  removeAll(){
    getStorageInstance.erase();
    // remove(AdminDefault.admin);
  }
}