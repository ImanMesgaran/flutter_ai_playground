import 'package:flutter/material.dart';
import 'package:flutter_ai_playground/core/global/colors.dart';
import 'package:flutter_ai_playground/features/cat_vs_dog/presentation/cubit/cat_vs_dog_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tflite/tflite.dart';

class CatVsDogPageRoute extends StatefulWidget {
  CatVsDogPageRoute({Key key}) : super(key: key);

  @override
  _CatVsDogPageRouteState createState() => _CatVsDogPageRouteState();
}

class _CatVsDogPageRouteState extends State<CatVsDogPageRoute> {
  final CatVsDogCubit _catVsDogCubit = CatVsDogCubit();

  @override
  void initState() {
    super.initState();

    _catVsDogCubit.loadModel();
    //loadModel().then((value) => setState(() {}));
  }

  @override
  void dispose() {
    super.dispose();

    _catVsDogCubit.disposeModel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: defaultColor.withOpacity(0.5),
      body: BlocConsumer<CatVsDogCubit, CatVsDogState>(
        cubit: _catVsDogCubit,
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 50),
                  Container(
                    height: MediaQuery.of(context).size.height - 180,
                    width: MediaQuery.of(context).size.width - 70,
                    decoration: BoxDecoration(
                      color: borderColor,
                      border: Border.all(
                        color: backgroundThreeColor,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: state.hasImage
                        ? Image.file(state.pickedImage)
                        : Center(
                            child: Text('no Image has been picked yet.'),
                          ),
                  ),
                  SizedBox(height: 20),
                  state.analyseResult != null
                      ? Text(
                          state.analyseResult[0]['label'],
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        )
                      : Container(),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () async {
                      await _catVsDogCubit.pickImageFromGallery();
                    },
                    child: Text("Pick from gallery"),
                  ),
                  SizedBox(height: 8),
                  ElevatedButton(
                    onPressed: () async {
                      await _catVsDogCubit.takeImageFromCamera();
                    },
                    child: Text("Take Photo"),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  // Future<void> loadModel() async {
  //   await Tflite.loadModel(
  //     model: 'assets/model_unquant.tflite',
  //     labels: 'assets/labels.txt',
  //   );
  // }
}
