class SubType {
  String subTypeCode;
  String subTypeName;

  SubType({
    this.subTypeCode,
    this.subTypeName,
  });
}

final subTypeListVocabulary = [
  SubType(
    subTypeCode: 'C1',
    subTypeName: 'Cách đọc kanji',
  ),
  SubType(
    subTypeCode: 'C2',
    subTypeName: 'Cách đọc hiragane',
  ),
  SubType(
    subTypeCode: 'C3',
    subTypeName: 'Cấu tạo từ',
  ),
  SubType(
    subTypeCode: 'C4',
    subTypeName: 'Từ đồng nghĩa',
  ),
  SubType(
    subTypeCode: 'C5',
    subTypeName: 'Biểu hiện từ',
  ),
  SubType(
    subTypeCode: 'C6',
    subTypeName: 'Cách dùng từ',
  ),
];

final subTypeListGrammar = [
  SubType(
    subTypeCode: 'A1',
    subTypeName: 'Dạng ngữ pháp',
  ),
  SubType(
    subTypeCode: 'A2',
    subTypeName: 'Ngữ pháp theo đoạn văn',
  ),
  SubType(
    subTypeCode: 'A3',
    subTypeName: 'Thành lập câu',
  )
];

final subTypeListReading = [
  SubType(
    subTypeCode: 'D1',
    subTypeName: 'Đoạn văn ngắn',
  ),
  SubType(
    subTypeCode: 'D2',
    subTypeName: 'Đoạn văn trung bình',
  ),
  SubType(
    subTypeCode: 'D3',
    subTypeName: 'Đọc hiểu tổng hợp',
  ),
  SubType(
    subTypeCode: 'D4',
    subTypeName: 'Đọc hiểu chủ đề',
  ),
  SubType(
    subTypeCode: 'D5',
    subTypeName: 'Tìm kiếm thông tin',
  ),
];

final subTypeListListening = [
  SubType(
    subTypeCode: 'S1',
    subTypeName: 'Nghe hiểu chủ đề',
  ),
  SubType(
    subTypeCode: 'S2',
    subTypeName: 'Nghe hiểu điểm chính',
  ),
  SubType(
    subTypeCode: 'S3',
    subTypeName: 'Nghe hiểu khái quát',
  ),
  SubType(
    subTypeCode: 'S4',
    subTypeName: 'Trả lời nhanh',
  ),
];
