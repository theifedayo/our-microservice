import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dart:ui';

// Create storage
final storage = new FlutterSecureStorage();

void main(){
  see();
}

void see() async {
  await storage.write(key: 'skey', value: 'svalue');
  String value = await storage.read(key: 'skahsg');

  print(value);

}



