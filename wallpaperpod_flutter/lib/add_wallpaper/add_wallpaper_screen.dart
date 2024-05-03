import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wallpaperpod_client/wallpaperpod_client.dart';
import 'package:wallpaperpod_flutter/main.dart';
class AddWallpaperScreen extends StatefulWidget {
  const AddWallpaperScreen({super.key});

  @override
  State<AddWallpaperScreen> createState() => _AddWallpaperScreenState();
}

class _AddWallpaperScreenState extends State<AddWallpaperScreen> {

  DateTime? selectedDate;

  final _textEditingController = TextEditingController();
  final _imageTextEditingController = TextEditingController();

  XFile? _pickedImage;

  Future<void> _storeWallpaper() async {
    try {
      if(_pickedImage != null) {

        final file = File(_pickedImage!.path.toString());
        final uploadDescription = await client.wallpaper.getUploadDescription(file.readAsBytes().asStream().toString());
        if (uploadDescription != null) {
          final uploader = FileUploader(uploadDescription);
          await uploader.upload(file.readAsBytes().asStream(), 1);
          final success = await client.wallpaper.verifyUpload(file.readAsBytes().asStream().toString());
          print('=========uploaded : $success');
        }

        // await client.wallpaper.createWallpaper(Wallpaper(
        //     name: _textEditingController.text,
        //     image: file.readAsBytes().asStream().toString(),
        //     date: DateTime.now()),
        // );

      }
      // var uploadDescription = await client.wallpaper.getUploadDescription('myfile');
      //  if (uploadDescription != null) {
      //    var uploader = FileUploader(uploadDescription);
      //    await uploader.upload(myStream);
      //    var success = await client.myEndpoint.verifyUpload('myfile');
      //  }

    } catch (e) {
      print('-------> $e');
    }
  }



  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: TextField(
                  controller: _textEditingController,
                  decoration: const InputDecoration(
                    hintText: 'Enter your name',
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: TextField(
                  controller: _imageTextEditingController,
                  decoration: const InputDecoration(
                    hintText: 'Enter your image',
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Theme.of(context).cardColor,
                    border: Border.all(color: Theme.of(context).primaryColor),
                  ),
                  child: Row(children: [
                    const Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Text(''),
                      ),
                    ),

                    IconButton(
                      onPressed: (){
                        showDialogPicker(context);
                      },
                      icon: const Icon(Icons.date_range_sharp),
                    ),
                  ],),
                ),
              ),

              Stack(clipBehavior: Clip.none, children: [
                Builder(
                  builder: (context) {
                    print('=======check : ${_pickedImage?.path}');
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: _pickedImage != null ? Image.file(
                        File(_pickedImage!.path), width: 150, height: 140, fit: BoxFit.cover,
                      ) : SizedBox(
                        width: 150, height: 140,
                        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                      
                          Icon(CupertinoIcons.camera_fill, size: 40, color: Theme.of(context).disabledColor.withOpacity(0.7)),
                          const SizedBox(height: 10),
                      
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Text('Upload profile picture'),
                          ),
                        ],),
                      ),
                    );
                  },
                ),

                Positioned(
                  bottom: 0, right: 0, top: 0, left: 0,
                  child: InkWell(
                    onTap: () => pickDmImage(false),
                    child: Container(
                      color: Colors.transparent,
                    ),
                  ),
                ),

                if (_pickedImage != null) Positioned(
                  bottom: -10, right: -10,
                  child: InkWell(
                    onTap: () => pickDmImage(true),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Theme.of(context).cardColor, width: 2),
                        shape: BoxShape.circle, color: Theme.of(context).colorScheme.error,
                      ),
                      padding: const EdgeInsets.all(5),
                      child:  Icon(Icons.remove, size: 18, color: Theme.of(context).cardColor,),
                    ),
                  ),

                ) else const SizedBox(),
              ],),

              Padding(
                padding: const EdgeInsets.only(bottom: 16, top: 20),
                child: ElevatedButton(
                  onPressed: _storeWallpaper,
                  child: const Text('Send to Server'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showDialogPicker(BuildContext context){
    selectedDate = showDatePicker(
      context: context,
      helpText: 'Your Date of Birth',
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2050),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme:  ColorScheme.light(
              // primary: MyColors.primary,
              primary: Theme.of(context).colorScheme.primary,
            ),
            //.dialogBackgroundColor:Colors.blue[900],
          ),
          child: child!,
        );
      },
    ) as DateTime?;
    // selectedDate.then((value) {
    //   setState(() {
    //     if(value == null) return;
    //     date = value.toString();
    //   });
    // },
    //     onError: (error) {
    //   if (kDebugMode) {
    //     print(error);
    //   }
    // });
  }

  Future<void> pickDmImage(bool isRemove) async {
    if(isRemove) {
      _pickedImage = null;
    }else {
      final pickLogo = await ImagePicker().pickImage(source: ImageSource.gallery);
      if(pickLogo != null) {
        _pickedImage = pickLogo;
      }
    }
    setState(() {});
  }

}
