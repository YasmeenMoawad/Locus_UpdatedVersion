import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/cupertino.dart';
import 'package:locus_application/features/chatbot_and_AI_generator/presentation/logic/image_gen_logic/image_gen_cubit.dart';

class ImageGenRepo {
  Uint8List? imageData; var str;

  Future<dynamic> textToImage(String prompt, context) async {

    final dio = Dio();
    String apiKey = 'sk-EQ84p7SrwQAlRUvUfnDOGjl3rF9qEAeJSnUaIPGasUivNhOf';

    final formData = FormData.fromMap({
      'prompt': prompt,
      'mode': 'text-to-image',
      'output_format': 'png',
      'cfg_scale': 7,
      'width': 1024,
      'height': 1024,
      'steps': 30,
    });

    try {
      final response = await dio.post(
        'https://api.stability.ai/v2beta/stable-image/generate/ultra',
        data: formData,
        options: Options(
          headers: {
            'Authorization': 'Bearer $apiKey',
            'Accept': 'application/json',
          },
          contentType: 'multipart/form-data',
          responseType: ResponseType.json,
        ),
      );


      if (response.statusCode == 200 && response.data['image'] != null) {
        final base64Image = response.data['image'];

        final Uint8List imageData = base64Decode(base64Image);
        //final base64Image = response.data['image']; // <- decode from here
        //final Uint8List imageData = base64Decode(base64Image);

        //Uint8List imageData = response.data['image'];
        print(response.headers['content-type']);
        print(utf8.decode(response.data));
        BlocProvider.of<GenCubit>(context).loadingChange(true);
        BlocProvider.of<GenCubit>(context).searchingChange(false);
        BlocProvider.of<GenCubit>(context).getImage(imageData);
      } else {
        print('Failed with code ${response.statusCode}');
        print('Not an image. Status: ${response.statusCode}');
        print('Content-Type: ${response.headers.value('content-type')}');
        print('📝 Body: ${utf8.decode(response.data)}');
      }
    } catch (e) {
      print('Error: $e');
    }




    /*//String engineId = "stable-diffusion-v1-6";
    //String apiHost = 'https://api.stability.ai';
    String apiKey = 'sk-S4R88oUeX8hqrZnoRQ6iBXSo5oQjA3U6kdq9a49tSWrKnreb';
    debugPrint(prompt);
    final response = await http.post(
        Uri.parse('https://api.stability.ai/v2beta/stable-image/generate/ultra'),
        headers: {
          'Authorization': 'Bearer $apiKey',
          'Accept': 'image/png',
          'Content-Type': 'multipart/form-data',
        },
        body: jsonEncode({
          "prompt": prompt,
          "output_format": "png",
          "mode": "text-to-image",
          "steps": 30,
          "cfg_scale": 7,
          "width": 1024,
          "height": 1024
        }),);

    if (response.statusCode == 200) {
      try {
        debugPrint(response.statusCode.toString());
        imageData = response.bodyBytes;
        str = 'hahahahaaaahhhh';
        debugPrint(response.statusCode.toString());
        //debugPrint(response.body.toString());
        debugPrint(str);
        debugPrint(imageData.toString());
        debugPrint(response.bodyBytes.toString());
        //Uint8List? imageData = response.bodyBytes;
        BlocProvider.of<GenCubit>(context).loadingChange(true);
        BlocProvider.of<GenCubit>(context).searchingChange(false);
        BlocProvider.of<GenCubit>(context).getImage(imageData!);
        //genCubit.loadingChange(true);
        //genCubit.searchingChange(false);
      } on Exception {
        debugPrint("failed to generate image");
      }
    } else {
      debugPrint("Failed to generate image");
      debugPrint("Status code: ${response.statusCode}");
      debugPrint("Response body: ${response.body}");
    }*/
  }
}