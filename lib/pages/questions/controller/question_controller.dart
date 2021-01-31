import 'package:get/get.dart';
import 'package:jamas_web/pages/questions/constants/constants.dart';

class QuestionController extends GetxController {
  String formCode = '1'; //Mã của form thêm câu hỏi
  String selectedLevel = 'N5'; //tên cấp độ đã chọn
  String selectedLevelCode = 'N5'; // mã cấp độ
  String selectedType = 'Từ vựng'; //Chọn thể loại câu hỏi đã chọn
  String selectedTypeCode = 'VO'; // Mã thể loại
  List<String> subType = SUBTYPES_OF_VOCABULARY; // List thể loại con đã chọn
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
  void changeType(String newValue) {
    selectedType = newValue;
    // Thiết định thể loại con theo thể loại
    switch (selectedType) {
      case 'Từ vựng':
        subType = SUBTYPES_OF_VOCABULARY;
        selectedSubType = 'Cách đọc kanji';
        break;
      case 'Ngữ pháp':
        subType = SUBTYPES_OF_GRAMMAR;
        selectedSubType = 'Dạng ngữ pháp';
        break;
      case 'Đọc':
        subType = SUBTYPES_OF_READING;
        selectedSubType = 'Đoạn văn ngắn';
        break;
      case 'Nghe':
        subType = SUBTYPES_OF_LISTENING;
        selectedSubType = 'Nghe hiểu chủ đề';
        break;
      default:
    }
  }

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
