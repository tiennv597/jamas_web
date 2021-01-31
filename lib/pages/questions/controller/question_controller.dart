import 'package:get/get.dart';
import 'package:jamas_web/pages/questions/constants/constants.dart';
import 'package:jamas_web/pages/questions/models/sub_type.dart';

class QuestionController extends GetxController {
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

// *******các function ******//
  //
// thay đổi cấp độ
  void changeLevel(String newValue) {
    selectedLevel = newValue;
  }

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

  //set list thể loại
//  String changeListType(String newValue) {
//    selectedType = newValue;
//    // Thiết định thể loại con theo thể loại
//    switch (selectedTypeCode) {
//      case 'VO':
//        return 'VO (Từ vựng)';
//        break;
//      case 'GR':
//        return 'GR (Ngữ pháp)';
//        break;
//      case 'RE':
//        return 'RE (Đọc hiểu)';
//        break;
//      case 'LI':
//        return 'LI (Nghe hiểu)';
//        break;
//      default:
//    }
//  }

  // thay đổi cấp độ
  void changeSubType(String newValue) {
    selectedSubType = newValue;
    if (selectedSubType == 'Trả lời nhanh') {
      formCode = '2';
    } else {
      formCode = '1';
    }
  }

  void addUnderline(String value) {
    underline.add(value);
  }

  // Lưu câu hỏi
  void save() {
    print(content);
  }
}
