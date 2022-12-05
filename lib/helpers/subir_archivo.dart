import 'dart:io';
import 'package:dio/dio.dart';
import 'package:luxe/config.dart';

Future<void> subir_imagen(
    {required Dio dio,
    required File imagen,
    required String id,
    required String query}) async {
  try {
    String filename = imagen.path.split('/').last;
    print('========================');
    print(filename);
    print('========================');

    FormData formData = FormData.fromMap({
      'file': await MultipartFile.fromFile(imagen.path, filename: filename)
    });
    await dio
        .putUri(
            Uri.https(ConfigLuxe.url, '/api/uploads/items/$id', {'img': query}),
            data: formData)
        .then((value) {
      print(value);
    });
  } catch (e) {
    print(e.toString());
  }
}
