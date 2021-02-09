import 'dart:html';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:jamas_web/helpers/costants.dart';
import 'package:jamas_web/pages/questions/add/form3/form3_model.dart';
import 'package:jamas_web/pages/questions/controller/question_controller.dart';
import 'package:jamas_web/pages/questions/models/question.dart';
import 'package:jamas_web/pages/questions/models/sub_type.dart';

class AddForm3Controller extends GetxController {
  final QuestionController questionCtr = Get.find(); //
  String imgUrl; // đường dẫn của file đã lưu

  var form3Model = new Form3Model().obs;
  var answer = 0.obs(); // radio button group
  var message = ''.obs;
// *******các function ******//

  bool saveQuestion() {
    try {
      createQuestionForm3(
          content: form3Model.value.content,
          answer1: form3Model.value.answer1,
          answer2: form3Model.value.answer2,
          answer3: form3Model.value.answer3,
          answer4: form3Model.value.answer4,
          explain: form3Model.value.explain,
          result: form3Model.value.result,
          comments: form3Model.value.comments);
      return true;
    } catch (e) {
      print(e.toString());
      return false;
    }
  }

  void createQuestionForm3({
    String id,
    String content,
    String answer1,
    String answer2,
    String answer3,
    String answer4,
    String explain,
    String result,
    DateTime date,
    String comments,
  }) {
    firebaseFiretore.collection(questionCtr.questionsCollection).doc(id).set({
      "content": content,
      "answer1": answer1,
      "answer2": answer2,
      "answer3": answer3,
      "answer4": answer4,
      "explain": explain,
      "result": result,
      "date": date,
      "comments": comments,
    });
  }

  updateMessage(bool check) {
    if (check) {
      message.update((val) {
        message.value = 'Thêm câu hỏi thành công';
      });
    } else {
      message.update((val) {
        message.value = 'Thêm câu hỏi thất bại';
      });
    }
  }

  uploadToStorage(int number) {
    InputElement input = FileUploadInputElement()..accept = 'image/*';
    FirebaseStorage fs = FirebaseStorage.instance;
    input.click();
    input.onChange.listen((event) {
      final file = input.files.first;
      String fileName = DateTime.now().millisecondsSinceEpoch.toString();
      final reader = FileReader();
      reader.readAsDataUrl(file);
      reader.onLoadEnd.listen((event) async {
        var snapshot = await fs
            .ref(questionCtr.renderQuestionCode())
            .child(fileName)
            .putBlob(file);
        String downloadUrl = await snapshot.ref.getDownloadURL();
        imgUrl = downloadUrl;
        switch (number) {
          case 1:
            {
              form3Model.update((val) {
                val.answer1 = downloadUrl;
              });
            }
            break;

          case 2:
            {
              form3Model.update((val) {
                val.answer2 = downloadUrl;
              });
            }
            break;
          case 3:
            {
              form3Model.update((val) {
                val.answer3 = downloadUrl;
              });
            }
            break;
          case 4:
            {
              form3Model.update((val) {
                val.answer4 = downloadUrl;
              });
            }
            break;

          default:
            {
              //statements;
            }
            break;
        }
      });
    });
  }

// xóa toàn bộ form
//   clearALl() {
//     Form3Model.update((val) {
//       contentController.text = '';
//       answer1Controller.text = '';
//       answer2Controller.text = '';
//       answer3Controller.text = '';
//       answer4Controller.text = '';
//       explainController.text = '';
//       resultController.text = '';
//       commentsController.text = '';
//       underlineController.text = '';
//       val.bold = [];
//       val.italic = [];
//       val.underline = [];
//     });
//     answer = '';
//     message.update((val) {
//       message.value = '';
//     });
//   }
}
