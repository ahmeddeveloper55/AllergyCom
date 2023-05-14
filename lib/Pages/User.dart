import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:http/http.dart' as http;
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class User extends StatefulWidget {
  // final age;
  // final height;
  // final weight;
  // final gender;
  // final pref;

  @override
  _UserState createState() => _UserState();
}

class _UserState extends State<User> {
  bool textScanning = false;
  XFile imageFile;
  String statusText = "";
  CroppedFile croppedFile;
  String scannedText = "";

  // static List<Nutrient> _userDetails = [];
  // static List<String> mealType = ["Breakfast","Lunch","Dinner"];
  // final uri = 'https://nin-api.herokuapp.com/19/M/ASH';

  // Future<Null> getUser() async {
  //   final response = await http.get(Uri.parse('https://allergycomm.herokuapp.com/${widget.age}/${widget.gender}/${widget.weight}'));

  //   final responseJson = json.decode(response.body);
  //   setState(() {
  //     for (Map user in responseJson) {
  //       _userDetails.add(Nutrient.fromJson(user));
  //     }
  //   });

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade200,
        body: SingleChildScrollView(
      child: Center(
        child: Container(
          child: Column(
            children: [
              if (textScanning) const CircularProgressIndicator(),
              if (!textScanning && imageFile == null)
                Container(
                  width: 300,
                  height: 300,
                  color: Colors.grey[300],
                ),
              if (imageFile != null) Image.file(File(imageFile.path)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    padding: const EdgeInsets.only(top: 10),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        onPrimary: Colors.grey,
                        shadowColor: Colors.grey[400],
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0)),
                      ),
                      onPressed: () {
                        getImage(ImageSource.gallery);
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 5),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.image,
                              size: 30,
                            ),
                            Text(
                              "Gallery",
                              style: TextStyle(
                                  fontSize: 13, color: Colors.grey[600]),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      padding: const EdgeInsets.only(top: 10),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.grey,
                          backgroundColor: Colors.white,
                          shadowColor: Colors.grey[400],
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0)),
                        ),
                        onPressed: () {
                          getImage(ImageSource.camera);
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 5),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.camera_alt,
                                size: 30,
                              ),
                              Text(
                                "Camera",
                                style: TextStyle(
                                    fontSize: 13, color: Colors.grey[600]),
                              )
                            ],
                          ),
                        ),
                      )),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                child: Text(
                  statusText,
                  style: TextStyle(fontSize: 20),
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }

  void cropImage(XFile image) async {
    CroppedFile cropped = await ImageCropper()
        .cropImage(sourcePath: image.path, aspectRatioPresets: [
      CropAspectRatioPreset.square,
      CropAspectRatioPreset.ratio3x2,
      CropAspectRatioPreset.original,
      CropAspectRatioPreset.ratio4x3,
      CropAspectRatioPreset.ratio16x9
    ], uiSettings: [
      AndroidUiSettings(
          toolbarTitle: 'Cropper',
          toolbarColor: Colors.deepOrange,
          toolbarWidgetColor: Colors.white,
          initAspectRatio: CropAspectRatioPreset.original,
          lockAspectRatio: false),
      IOSUiSettings(
        title: 'Cropper',
      ),
      WebUiSettings(
        context: context,
      ),
    ]);

    if (cropped != null) {
      imageFile = XFile(cropped.path);
      setState(() {});
      getRecognisedText(
          imageFile); // Call the getRecognisedText function with the cropped image
    } else {
      textScanning = false;
      scannedText = "No image selected";
      setState(() {});
    }
  }

  void getImage(ImageSource source) async {
    try {
      final pickedImage = await ImagePicker().pickImage(source: source);
      if (pickedImage != null) {
        textScanning = true;
        setState(() {});
        cropImage(
            pickedImage); // Call the cropImage function with the picked image
      } else {
        textScanning = false;
        scannedText = "No image selected";
        setState(() {});
      }
    } catch (e) {
      textScanning = false;
      imageFile = null;
      scannedText = "Error occured while scanning";
      setState(() {});
    }
  }

  void getRecognisedText(XFile image) async {
    final inputImage = InputImage.fromFilePath(image.path);
    final textDetector = GoogleMlKit.vision.textRecognizer();
    RecognizedText recognisedText = await textDetector.processImage(inputImage);
    await textDetector.close();
    scannedText = "";
    for (TextBlock block in recognisedText.blocks) {
      for (TextLine line in block.lines) {
        scannedText = scannedText + line.text + "\n";
      }
    }
    textScanning = false;
    setState(() {});
    try {
      statusText += await sendTextToServer(scannedText);
      print('Response from server: $statusText');
    } catch (e) {
      print('Error sending text: $e');
    }
  }

  Future<String> sendTextToServer(String scannedText) async {
    final response = await http.post(
        Uri.parse("https://flask-production-a27f.up.railway.app/ingr"),
        headers: {'Content-Type': 'text/plain'},
        body: scannedText);

    if (response.statusCode == 200) {
      print("${response.body}");
      return response.body.toString();
    } else {
      // If the server returns an error, throw an exception
      throw Exception('Failed to send text');
    }
  }
}
