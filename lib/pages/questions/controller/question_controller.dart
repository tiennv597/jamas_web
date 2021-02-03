import 'dart:html';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jamas_web/helpers/costants.dart';
import 'package:jamas_web/pages/questions/models/question.dart';
import 'package:jamas_web/pages/questions/models/sub_type.dart';

class QuestionController extends GetxController {
  //

  final contentController = TextEditingController();
  final answer1Controller = TextEditingController();
  final answer2Controller = TextEditingController();
  final answer3Controller = TextEditingController();
  final answer4Controller = TextEditingController();
  final explainController = TextEditingController();
  final resultController = TextEditingController();
  final commentsController = TextEditingController();
  final underlineController = TextEditingController();

  var questionModel = new QuestionModel().obs;
  List<SubType> subType = subTypeListVocabulary; // List thể loại con đã chọn
  String selectedSubType = 'Cách đọc kanji'; // Thể loại con đã chọn

  updateLevel(String newVal) {
    questionModel.update((val) {
      val.level = newVal;
    });
  }

  updateType(String newVal) {
    questionModel.update((val) {
      val.type = newVal;
      changeListSubType(newVal);
    });
  }

  updateSubType(String newVal) {
    questionModel.update((val) {
      val.subType = newVal;
      updateFormCode(newVal);
    });
  }

  updateFormCode(String newVal) {
    if (newVal == 'S4') {
      questionModel.update((val) {
        val.formCode = '2';
      });
    } else {
      questionModel.update((val) {
        val.formCode = '1';
      });
    }
  }

  //

//  String answerContent1 = ''; // nội dung đáp án 1
//  String answerContent2 = ''; // nội dung đáp án 2
//  String answerContent3 = ''; // nội dung đáp án 3
//  String answerContent4 = ''; // nội dung đáp án 4
  List<String> underline = []; // List các từ cần gạch chân
  var answer; // radio button group
  String explain = ''; // nội dung phần giải thích
  // services Collection
  String questionsCollection = "Questions";
  var message = ''.obs;
// *******các function ******//
  //
// thay đổi cấp độ

// thay đổi thể loại
  void changeListSubType(String newValue) {
    // Thiết định thể loại con theo thể loại
    switch (newValue) {
      case 'VO':
        updateSubType('C1');
        subType = subTypeListVocabulary;
        break;
      case 'GR':
        updateSubType('A1');
        subType = subTypeListGrammar;
        break;
      case 'RE':
        updateSubType('D1');
        subType = subTypeListReading;
        break;
      case 'LI':
        updateSubType('S1');
        subType = subTypeListListening;
        break;
      default:
    }
  }

  void addUnderline(String value) {
    underline.add(value);
  }

  // Lưu câu hỏi
//  void save() {
//    questionsCollection =
//        selectedLevel + selectedTypeCode + selectedSubTypeCode;
//    if (saveQuestion()) {
//      message = 'Lưu câu hỏi thành công'.obs;
//    } else {
//      message = 'Lưu câu hỏi thất bại';
//    }
//  }

  bool saveQuestion() {
    questionsCollection = questionModel.value.level +
        questionModel.value.type +
        questionModel.value.subType;
    try {
      createQuestionForm1(
          level: questionModel.value.level,
          type: questionModel.value.type,
          subType: questionModel.value.subType,
          content: questionModel.value.content,
          answer1: questionModel.value.answer1,
          answer2: questionModel.value.answer2,
          answer3: questionModel.value.answer3,
          answer4: questionModel.value.answer4,
          explain: explain,
          result: answer.toString(),
          underline: underline);
      return true;
    } catch (e) {
      print(e.toString());
      return false;
    }
  }

  void createQuestionForm1(
      {String id,
      String level,
      String type,
      String subType,
      String content,
      String answer1,
      String answer2,
      String answer3,
      String answer4,
      String explain,
      String result,
      DateTime date,
      String comments,
      List bold,
      List italic,
      List underline}) {
    firebaseFiretore.collection(questionsCollection).doc(id).set({
      "id": id,
      "level": level,
      "type": type,
      "subType": subType,
      "content": content,
      "answer1": answer1,
      "answer2": answer2,
      "answer3": answer3,
      "answer4": answer4,
      "explain": explain,
      "result": result,
      "date": date,
      "comments": comments,
      "bold": bold,
      "italic": italic,
      "underline": underline,
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

// uploadImage
//   uploadImage() async {
//     final _storage = FirebaseStorage.instance;
//     final _picker = ImagePicker();
//     PickedFile image;
//
//     //Check Permissions
//     await Permission.photos.request();
//
//     var permissionStatus = await Permission.photos.status;
//
//     if (permissionStatus.isGranted) {
//       //Select Image
//       image = await _picker.getImage(source: ImageSource.gallery);
//       var file = File(image.path);
//
//       if (image != null) {
//         //Upload to Firebase
//         var snapshot = await _storage
//             .ref()
//             .child('folderName/imageName')
//             .putFile(file)
//             .onComplete;
//
//         var downloadUrl = await snapshot.ref.getDownloadURL();
//
//         setState(() {
//           imageUrl = downloadUrl;
//         });
//       } else {
//         print('No Path Received');
//       }
//     } else {
//       print('Grant Permissions and try again');
//     }
//   }

// xóa toàn bộ form
  clearALl() {
    questionModel.update((val) {
      contentController.text = '';
      answer1Controller.text = '';
      answer2Controller.text = '';
      answer3Controller.text = '';
      answer4Controller.text = '';
      explainController.text = '';
      resultController.text = '';
      commentsController.text = '';
      underlineController.text = '';
      val.bold = [];
      val.italic = [];
      val.underline = [];
    });
    answer = '';
    message.update((val) {
      message.value = '';
    });
  }
}
