import 'package:get/get.dart';

class QuestionController extends GetxController {
  //Mã của form thêm câu hỏi
  String formCode = '1';
  // Chọn level
  String selectedLevel = 'N5';
  List<String> level = ['N5', 'N4', 'N3', 'N2', 'N1'];
//Chọn thể loại câu hỏi
  String selectedType = 'Từ vựng';
  List<String> type = ['Từ vựng', 'Ngữ pháp', 'Đọc', 'Nghe'];
  //Chọn sub type
  String selectedSubType = 'Cách đọc kanji';
  List<String> subType = [
    'Cách đọc kanji',
    'Cách đọc hiragane',
    'Cấu tạo từ',
    'Từ đồng nghĩa',
    'Biểu hiện từ',
    'Cách dùng từ'
  ];
  String content = ''; // câu hỏi
  String answerContent1 = '';
  String answerContent2 = '';
  String answerContent3 = '';
  String answerContent4 = '';
  List<String> underline = [];
  var answer;
  String explain = ''; // giải thích
  var count = 0.obs;
  void increment() {
    count++;
    print(count);
    // update();
  }

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
        subType = [
          'Cách đọc kanji',
          'Cách đọc hiragane',
          'Cấu tạo từ',
          'Từ đồng nghĩa',
          'Biểu hiện từ',
          'Cách dùng từ'
        ];
        selectedSubType = 'Cách đọc kanji';
        break;
      case 'Ngữ pháp':
        subType = [
          'Dạng ngữ pháp',
          'Ngữ pháp theo đoạn văn',
          'Thành lập câu',
        ];
        selectedSubType = 'Dạng ngữ pháp';
        break;
      case 'Đọc':
        subType = [
          'Đoạn văn ngắn',
          'Đoạn văn trung bình',
          'Đọc hiểu tổng hợp',
          'Đọc hiểu chủ đề',
          'Tìm kiếm thôn tin',
        ];
        selectedSubType = 'Đoạn văn ngắn';
        break;
      case 'Nghe':
        subType = [
          'Nghe hiểu chủ đề',
          'Nghe hiểu điểm chính',
          'Nghe hiểu khái quát',
          'Trả lời nhanh',
        ];
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
