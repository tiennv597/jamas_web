//List mã cấp độ
const List<String> LEVEL_CODE = ['N5', 'N4', 'N3', 'N2', 'N1'];
const List<String> TYPES = ['Từ vựng', 'Ngữ pháp', 'Đọc', 'Nghe'];
// List mã thể loại
const List<String> TYPES_CODE = ['VO', 'GR', 'RE', 'LI'];
//List mã thể loại con của từ vựng
const List<String> SUBTYPES_CODE_VOCABULARY = [
  'C1', //Cách đọc kanji
  'C2', //Cách đọc hiragane
  'C3', //Cấu tạo từ
  'C4', //Từ đồng nghĩa
  'C5', //Biểu hiện từ
  'C6' // Cách dùng từ
];
const List<String> SUBTYPES_OF_VOCABULARY = [
  'Cách đọc kanji',
  'Cách đọc hiragane',
  'Cấu tạo từ',
  'Từ đồng nghĩa',
  'Biểu hiện từ',
  'Cách dùng từ'
];
// List mã thể loại con từ ngữ pháp
const List<String> SUBTYPES_CODE_GRAMMAR = [
  'A1', // Dạng ngữ pháp
  'A2', //Ngữ pháp theo đoạn văn
  'A3' //Thành lập câu
];
const List<String> SUBTYPES_OF_GRAMMAR = [
  'Dạng ngữ pháp',
  'Ngữ pháp theo đoạn văn',
  'Thành lập câu',
];
// Mã thể loại con của đọc hiểu
const List<String> SUBTYPES_CODE_READING = [
  'A1', //Đoạn văn ngắn
  'A2', //Đoạn văn trung bình
  'A3', //Đọc hiểu tổng hợp
  'A4', //Đọc hiểu chủ đề
  'A5' //Tìm kiếm thông tin
];
const List<String> SUBTYPES_OF_READING = [
  'Đoạn văn ngắn',
  'Đoạn văn trung bình',
  'Đọc hiểu tổng hợp',
  'Đọc hiểu chủ đề',
  'Tìm kiếm thông tin',
];
//Mã thể loại con cửa nghe hiểu
const List<String> SUBTYPES_CODE_LISTENING = [
  'S1', //Nghe hiểu chủ đề
  'S2', //Nghe hiểu điểm chính
  'S3', //Nghe hiểu khái quát
  'S4', //Trả lời nhanh
];

const List<String> SUBTYPES_OF_LISTENING = [
  'Nghe hiểu chủ đề',
  'Nghe hiểu điểm chính',
  'Nghe hiểu khái quát',
  'Trả lời nhanh',
];
