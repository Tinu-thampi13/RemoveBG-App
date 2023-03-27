// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:before_after/before_after.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:screenshot/screenshot.dart';

import 'apikey.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var loaded = false;
  var removedbg = false;
  var isLoading = false;
  Uint8List? image;
  String imagePath = "";

  ScreenshotController screenshotController = ScreenshotController();

  pickImage() async {
    final img = await ImagePicker()
        .pickImage(source: ImageSource.gallery, imageQuality: 100);

    if (img != null) {
      imagePath = img.path;
      loaded = true;

      setState(() {});
    } else {}
  }

  downloadImage() async {
    var perm = await Permission.storage.request();

    if (perm.isGranted) {
      ImageGallerySaver.saveImage(image!);
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Downloaded to Gallery")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                downloadImage();
              },
              icon: const Icon(Icons.download))
        ],
        leading: const Icon(Icons.sort_rounded),
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'AI Background Remover',
          style: TextStyle(fontSize: 20),
        ),
      ),
      body: Center(
        child: removedbg
            ? BeforeAfter(
                beforeImage: Image.file(File(imagePath)),
                afterImage: Screenshot(
                    controller: screenshotController,
                    child: Image.memory(image!)))
            : loaded
                ? GestureDetector(
                    onTap: () {
                      pickImage();
                    },
                    child: Image.file(
                      File(imagePath),
                    ),
                  )
                : Container(
                    padding: const EdgeInsets.all(40),
                    child: SizedBox(
                      width: 300,
                      height: 60,
                      child: ElevatedButton(
                        onPressed: () {
                          pickImage();
                        },
                        child: const Text(
                          "Choose Image",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                  ),
      ),
      bottomNavigationBar: SizedBox(
        height: 56,
        child: ElevatedButton(
          onPressed: loaded
              ? () async {
                  setState(() {
                    isLoading = true;
                  });
                  image = await Api.removebg(imagePath);
                  if (image != null) {
                    removedbg = true;
                    isLoading = false;

                    setState(() {});
                  }
                }
              : null,
          child: isLoading
              ? const CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(Colors.white),
                )
              : const Text("Remove Background"),
        ),
      ),
    );
  }
}
