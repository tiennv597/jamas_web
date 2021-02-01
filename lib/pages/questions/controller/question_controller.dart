import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:jamas_web/helpers/costants.dart';
import 'package:jamas_web/pages/questions/models/question.dart';
import 'package:jamas_web/pages/questions/models/sub_type.dart';

class QuestionController extends GetxController {
  //
  final questionModel = new QuestionModel().obs;

  updateLevel(String newVal) {
    questionModel.update((val) {
      val.level = newVal;
    });
  }

  //
  String formCode = '1'; //Mã của form thêm câu hỏi
  String selectedLevel = 'N5'; //tên cấp độ đã chọn
  String selectedLevelCode = 'N5'; // mã cấp độ
  String selectedType = 'Từ vựng'; //Chọn thể loại câu hỏi đã chọn
  String selectedTypeCode = 'VO'; // Mã thể loại
  List<SubType> subType = subTypeListVocabulary; // List thể loại con đã chọn
  String selectedSubType = 'Cách đọc kanji'; // Thể loại con đã chọn
  String selectedSubTypeCode = 'C1'; // Mã thể loại con
  String content = ''; // nội dung câu hỏi
  String answerContent1 = ''; // nội dung đáp án 1
  String answerContent2 = ''; // nội dung đáp án 2
  String answerContent3 = ''; // nội dung đáp án 3
  String answerContent4 = ''; // nội dung đáp án 4
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
        selectedSubTypeCode = 'C1';
        subType = subTypeListVocabulary;
        break;
      case 'GR':
        selectedSubTypeCode = 'A1';
        subType = subTypeListGrammar;
        break;
      case 'RE':
        selectedSubTypeCode = 'D1';
        subType = subTypeListReading;
        break;
      case 'LI':
        selectedSubTypeCode = 'S1';
        subType = subTypeListListening;
        break;
      default:
    }
  }

  // thay đổi cấp độ
  void changeForm(String newValue) {
    if (selectedSubTypeCode == 'S4') {
      formCode = '2';
    } else {
      formCode = '1';
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
    questionsCollection =
        selectedLevel + selectedTypeCode + selectedSubTypeCode;
    try {
      createQuestionForm1(
          level: selectedLevel,
          type: selectedType,
          subType: selectedSubType,
          content: content,
          answer1: answerContent1,
          answer2: answerContent2,
          answer3: answerContent3,
          answer4: answerContent4,
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

  clearALl() {
    content = ''; // nội dung câu hỏi
    answerContent1 = ''; // nội dung đáp án 1
    answerContent2 = ''; // nội dung đáp án 2
    answerContent3 = ''; // nội dung đáp án 3
    answerContent4 = ''; // nội dung đáp án 4
    underline = []; // List các từ cần gạch chân
    answer = 0; // radio button group
    explain = ''; // nội dung phần giải thích
    // services Collection
    message.update((val) {
      message.value = '';
    });
  }
}
