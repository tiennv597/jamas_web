import 'dart:async';
// ignore: avoid_web_libraries_in_flutter
import 'dart:html';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jamas_web/pages/questions/controller/question_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase/firebase.dart' as fb;

class AddForm2 extends StatefulWidget {
  @override
  _AddForm2State createState() => _AddForm2State();
}

class _AddForm2State extends State<AddForm2> {
  final QuestionController questionCtr = Get.find();
  String _uploadedFileURL;
  final _picker = ImagePicker();
  PickedFile image;
  String imgUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          // Nhập nội dung của câu hỏi
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              TextFormField(
                onChanged: (text) {
                  questionCtr.questionModel.value.content = text;
                },
                cursorColor: Colors.deepPurpleAccent,
                minLines: 3,
                keyboardType: TextInputType.multiline,
                maxLines: null,
                decoration: InputDecoration(labelText: 'Nhập nội dung câu hỏi'),
              )
            ],
          ),
          //Đáp án 1
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              new Row(
                children: <Widget>[
                  Padding(
                      padding: const EdgeInsets.only(top: 14, right: 8),
                      child: Radio(
                          value: 1,
                          groupValue: questionCtr.answer,
                          onChanged: (dynamic value) {
                            setState(() {
                              questionCtr.answer = value;
                            });
                          })),
                  // (imageUrl != null)
                  //     ? Image.network(imageUrl)
                  //     : Placeholder(
                  //         fallbackHeight: 200.0,
                  //         fallbackWidth: double.infinity),
                  SizedBox(
                    height: 20.0,
                  ),
                  RaisedButton(
                    child: Text('Upload Image'),
                    color: Colors.lightBlue,
                    onPressed: () => uploadToStorage(),
                  ),
                ],
              ),
            ],
          ),
          //Đáp án 2
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              new Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 14, right: 8),
                    child: Radio(
                        value: 2,
                        groupValue: questionCtr.answer,
                        onChanged: (dynamic value) {
                          setState(() {
                            questionCtr.answer = value;
                          });
                        }),
                  ),
                  new Flexible(
                    child: new TextField(
                      onChanged: (text) {
                        questionCtr.questionModel.value.answer2 = text;
                      },
                      decoration: InputDecoration(labelText: 'Nhập đáp án 2'),
                    ),
                  ),
                ],
              ),
            ],
          ),
          //Đáp án 3
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              new Row(
                children: <Widget>[
                  Padding(

                    padding: const EdgeInsets.only(top: 14, right: 8),
                    child: Radio(
                        value: 3,
                        groupValue: questionCtr.answer,
                        onChanged: (dynamic value) {
                          setState(() {
                            questionCtr.answer = value;
                          });
                        }),
                  ),
                  new Flexible(
                    child: new TextField(
                      onChanged: (text) {
                        questionCtr.questionModel.value.answer3 = text;
                      },
                      decoration: InputDecoration(labelText: 'Nhập đáp án 3'),
                    ),
                  ),
                ],
              ),
            ],
          ),
          //Đáp án 4
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              new Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 14, right: 8),
                    child: Radio(
                        value: 4,
                        groupValue: questionCtr.answer,
                        onChanged: (dynamic value) {
                          setState(() {
                            questionCtr.answer = value;
                          });
                        }),
                  ),
                  new Flexible(
                    child: new TextField(
                      onChanged: (text) {
                        questionCtr.questionModel.value.answer4 = text;
                      },
                      decoration: InputDecoration(labelText: 'Nhập đáp án 4'),
                    ),
                  ),
                ],
              ),
            ],
          ),
          // Nhập nội dung phần giải thích
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              TextFormField(
                onChanged: (text) {
                  questionCtr.explain = text;
                },
                cursorColor: Colors.deepPurpleAccent,
                minLines: 2,
                keyboardType: TextInputType.multiline,
                maxLines: null,
                decoration:
                    InputDecoration(labelText: 'Nhập nội dung phần giải thích'),
              )
            ],
          ),
        ],
      ),
    );
  }

  // Future<Uri> uploadImageFile({@required Function(File file) onSelected}) {
  //   InputElement uploadInput = FileUploadInputElement()..accept = 'image/*';
  //   uploadInput.click();
  //   uploadInput.onChange.listen((event) {
  //     final file = uploadInput.files.first;
  //     final reader = FileReader();
  //     reader.readAsDataUrl(file);
  //     reader.onLoadEnd.listen((event) {
  //       onSelected(file);
  //     });
  //   });
  // }

  // void uploadTOStorage() {
  //   final dateTime = DateTime.now();
  //   final path = 'tien/$dateTime';
  //   uploadImageFile(onSelected: (file) {
  //     fb
  //         .storage()
  //         .refFromURL('gs://japanese-master.appspot.com')
  //         .child(path)
  //         .put(file);
  //   });
  // }

  uploadToStorage() {
    InputElement input = FileUploadInputElement()..accept = 'image/*';
    FirebaseStorage fs = FirebaseStorage.instance;
    input.click();
    input.onChange.listen((event) {
      final file = input.files.first;
      final reader = FileReader();
      reader.readAsDataUrl(file);
      reader.onLoadEnd.listen((event) async {
        var snapshot = await fs.ref('n5').child('newfile').putBlob(file);
        String downloadUrl = await snapshot.ref.getDownloadURL();
        setState(() {
          imgUrl = downloadUrl;
        });
      });
    });
  }
}
