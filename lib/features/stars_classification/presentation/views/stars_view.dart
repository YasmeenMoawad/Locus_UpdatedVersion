import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:locus_application/features/stars_classification/presentation/views/widgets/loading.dart';

class StarsView extends StatefulWidget {
  const StarsView({Key? key}) : super(key: key);

  @override
  State<StarsView> createState() => _StarsViewState();
}

class _StarsViewState extends State<StarsView> {

  CameraController? controller;
  late List<CameraDescription> _cameras;
  //late _initializeCameraControllerFuture;

  void camVig() async{
    _cameras = await availableCameras();
  }
  @override
  void initState(){
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
      controller = CameraController(_cameras[0], ResolutionPreset.medium);
      //controller.initialize();
      controller!.initialize().then((_) {
        if (!mounted) {
          return;
        }
        setState(() {});
      }).catchError((Object e) {
        if (e is CameraException) {
          switch (e.code) {
            case 'CameraAccessDenied':
              print('CameraAccessDenied');
              break;
            default:
              print('errorOnCamera');
              break;
          }
        }
      });
    });
    //controller = CameraController(_cameras[0], ResolutionPreset.max);
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (controller == null || !controller!.value.isInitialized) {
      return Container();
    }
    return Scaffold(
      body: CameraPreview(controller!),
      //Loading(),
    );
  }
}
