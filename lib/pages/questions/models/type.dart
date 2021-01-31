class Type {
  String typeCode;
  String typeName;

  Type({
    this.typeCode,
    this.typeName,
  });
}

final typeList = [
  Type(
    typeCode: 'VO',
    typeName: 'Từ vựng',
  ),
  Type(
    typeCode: 'GR',
    typeName: 'Ngữ pháp',
  ),
  Type(
    typeCode: 'RE',
    typeName: 'Đọc hiểu',
  ),
  Type(
    typeCode: 'LI',
    typeName: 'Nghe hiểu',
  ),
];
