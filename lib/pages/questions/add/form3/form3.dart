import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jamas_web/pages/questions/dialog/dialog_confirm_question.dart';
import 'form3_controller.dart';

//form để thêm câu hỏi nghe dạng đáp án là hình ảnh
//LIS1: Nghe hiểu chủ đề
class AddForm3 extends StatefulWidget {
  @override
  _AddForm3State createState() => _AddForm3State();
}

class _AddForm3State extends State<AddForm3> {
  final AddForm3Controller form3Ctr = Get.put(AddForm3Controller());
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
                  form3Ctr.form3Model.value.content = text;
                },
                cursorColor: Colors.deepPurpleAccent,
                minLines: 3,
                keyboardType: TextInputType.multiline,
                maxLines: null,
                decoration: InputDecoration(labelText: 'Nhập nội dung câu hỏi'),
              )
            ],
          ),
          //Đáp án 1 và 2
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: new Row(
                  children: <Widget>[
                    Row(
                      children: [
                        Radio(
                            value: 1,
                            groupValue: form3Ctr.answer,
                            onChanged: (dynamic value) {
                              setState(() {
                                form3Ctr.answer = value;
                              });
                            }),
                        SizedBox(
                          height: 20.0,
                        ),
                        Obx(
                          () => form3Ctr.form3Model.value.answer1 == ''
                              ? Placeholder(
                                  fallbackHeight: 200,
                                  fallbackWidth: 300,
                                )
                              : CachedNetworkImage(
                                  width: 300,
                                  height: 200,
                                  imageUrl: form3Ctr.form3Model.value.answer1,
                                  placeholder: (context, url) => Center(
                                      child: new CircularProgressIndicator()),
                                  errorWidget: (context, url, error) =>
                                      new Icon(Icons.error),
                                ),
                        ),
                        // form3Ctr.form3Model.value.answer1 == ''
                        //     ? Placeholder(
                        //         fallbackHeight: 200,
                        //         fallbackWidth: 300,
                        //       )
                        //     : Container(
                        //         height: 200,
                        //         width: 300,
                        //         child: Obx(
                        //           () => Image.network(
                        //             form3Ctr.form3Model.value.answer1,
                        //             fit: BoxFit.contain,
                        //           ),
                        //         )),
                        IconButton(
                          icon: Icon(Icons.upload_file),
                          color: Colors.lightBlue,
                          onPressed: () => form3Ctr.uploadToStorage(1),
                        ),
                      ],
                    ),
                    // đáp án 2
                    Padding(
                      padding: const EdgeInsets.only(left: 32),
                      child: Row(
                        children: [
                          Radio(
                              value: 2,
                              groupValue: form3Ctr.answer,
                              onChanged: (dynamic value) {
                                setState(() {
                                  form3Ctr.answer = value;
                                });
                              }),
                          // (imageUrl != null)
                          //     ? Image.network(imageUrl)
                          //     : Placeholder(
                          //         fallbackHeight: 200.0,
                          //         fallbackWidth: double.infinity),
                          SizedBox(
                            height: 20.0,
                          ),
                          form3Ctr.form3Model.value.answer2 == ''
                              ? Placeholder(
                                  fallbackHeight: 200,
                                  fallbackWidth: 300,
                                )
                              : Container(
                                  height: 200,
                                  width: 300,
                                  child: Image.network(
                                    form3Ctr.form3Model.value.answer2,
                                    fit: BoxFit.contain,
                                  )),
                          IconButton(
                            icon: Icon(Icons.upload_file),
                            color: Colors.lightBlue,
                            onPressed: () => form3Ctr.uploadToStorage(2),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              //đáp án 2
            ],
          ),
          //Đáp án 3 và 4
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: new Row(
                  children: <Widget>[
                    Row(
                      children: [
                        Radio(
                            value: 3,
                            groupValue: form3Ctr.answer,
                            onChanged: (dynamic value) {
                              setState(() {
                                form3Ctr.answer = value;
                              });
                            }),
                        SizedBox(
                          height: 20.0,
                        ),
                        form3Ctr.form3Model.value.answer3 == ''
                            ? Placeholder(
                                fallbackHeight: 200,
                                fallbackWidth: 300,
                              )
                            : Container(
                                height: 200,
                                width: 300,
                                child: Image.network(
                                  form3Ctr.form3Model.value.answer4,
                                  fit: BoxFit.contain,
                                )),
                        IconButton(
                          icon: Icon(Icons.upload_file),
                          color: Colors.lightBlue,
                          onPressed: () => form3Ctr.uploadToStorage(3),
                        ),
                      ],
                    ),
                    // đáp án 2
                    Padding(
                      padding: const EdgeInsets.only(left: 32),
                      child: Row(
                        children: [
                          Radio(
                              value: 4,
                              groupValue: form3Ctr.answer,
                              onChanged: (dynamic value) {
                                setState(() {
                                  form3Ctr.answer = value;
                                });
                              }),
                          SizedBox(
                            height: 20.0,
                          ),
                          form3Ctr.form3Model.value.answer4 == ''
                              ? Placeholder(
                                  fallbackHeight: 200,
                                  fallbackWidth: 300,
                                )
                              : Container(
                                  height: 200,
                                  width: 300,
                                  child: Image.network(
                                    form3Ctr.form3Model.value.answer4,
                                    fit: BoxFit.contain,
                                  )),
                          IconButton(
                            icon: Icon(Icons.upload_file),
                            color: Colors.lightBlue,
                            onPressed: () => form3Ctr.uploadToStorage(4),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              //đáp án 2
            ],
          ),
          // Nhập nội dung phần giải thích
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              TextFormField(
                onChanged: (text) {
                  form3Ctr.form3Model.value.explain = text;
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
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RaisedButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) =>
                                  DialogConfirmQuestion());
                        },
                        color: Colors.green,
                        child: Text(
                          "Lưu câu hỏi",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RaisedButton(
                        onPressed: () {
                          // form3Ctr.clearALl();
                        },
                        color: Colors.red,
                        child: Text("Xóa tất cả",
                            style:
                                TextStyle(fontSize: 20, color: Colors.white)),
                      ),
                    ),
                    Obx(() => Text('${Get.find<AddForm3Controller>().message}'))
                  ],
                ),
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

  // uploadToStorage() {
  //   InputElement input = FileUploadInputElement()..accept = 'image/*';
  //   FirebaseStorage fs = FirebaseStorage.instance;
  //   input.click();
  //   input.onChange.listen((event) {
  //     final file = input.files.first;
  //     final reader = FileReader();
  //     reader.readAsDataUrl(file);
  //     reader.onLoadEnd.listen((event) async {
  //       var snapshot = await fs.ref('n5').child('newfile').putBlob(file);
  //       String downloadUrl = await snapshot.ref.getDownloadURL();
  //       setState(() {
  //         imgUrl = downloadUrl;
  //       });
  //     });
  //   });
  // }
}
