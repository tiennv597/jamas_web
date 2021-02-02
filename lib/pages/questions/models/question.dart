import 'package:cloud_firestore/cloud_firestore.dart';

class QuestionModel {
  static const ID = "id";
  static const LEVEL = "level";
  static const TYPE = "type";
  static const SUB_TYPE = "subType";
  static const CONTENT = "content";
  static const EXPLAIN = "explain";
  static const ANSWER1 = "answer1";
  static const ANSWER2 = "answer2";
  static const ANSWER3 = "answer3";
  static const ANSWER4 = "answer4";
  static const RESULT = "result";
  static const DATE = "date";
  static const COMMENTS = "comments";
  static const BOLD = "bold";
  static const ITALIC = "italic";
  static const UNDERLINE = "underline";

  String _id;
  String formCode = '1'; //Mã của form thêm câu hỏi
  String _level = 'N5'; // cấp độ
  String _type = 'VO';
  String _subType = 'C1';
  String _content;
  String _explain;
  String _answer1;
  String _answer2;
  String _answer3;
  String _answer4;
  String _result;
  DateTime _date;
  String _comments;
  List _bold;
  List _italic;
  List _underline;
//  getters
//  String get id => _id;
//  String get level => _level;
//  String get type => _type;
//  String get subType => _subType;
//  String get content => _content;
//  String get explain => _explain;
//  String get result => _result;
//  String get answer1 => _answer1;
//  String get answer2 => _answer2;
//  String get answer3 => _answer3;
//  String get answer4 => _answer4;
//  DateTime get date => _date;
//  String get comments => _comments;
//  List get bold => _bold;
//  List get italic => _italic;
//  List get underline => _underline;
  QuestionModel.fromSnapshot(DocumentSnapshot snapshot) {
    _id = snapshot.data()[ID];
    _level = snapshot.data()[LEVEL];
    _type = snapshot.data()[TYPE];
    _subType = snapshot.data()[SUB_TYPE];
    _content = snapshot.data()[CONTENT];
    _explain = snapshot.data()[EXPLAIN];
    _result = snapshot.data()[RESULT];
    _answer1 = snapshot.data()[ANSWER1];
    _answer2 = snapshot.data()[ANSWER2];
    _answer3 = snapshot.data()[ANSWER3];
    _answer4 = snapshot.data()[ANSWER4];
    _date = snapshot.data()[DATE];
    _comments = snapshot.data()[COMMENTS];
    _bold = snapshot.data()[BOLD];
    _italic = snapshot.data()[ITALIC];
    _underline = snapshot.data()[UNDERLINE];
  }

  String get id => _id;

  QuestionModel();

  set underline(List value) {
    _underline = value;
  }

  set italic(List value) {
    _italic = value;
  }

  set bold(List value) {
    _bold = value;
  }

  set comments(String value) {
    _comments = value;
  }

  set date(DateTime value) {
    _date = value;
  }

  set result(String value) {
    _result = value;
  }

  set answer4(String value) {
    _answer4 = value;
  }

  set answer3(String value) {
    _answer3 = value;
  }

  set answer2(String value) {
    _answer2 = value;
  }

  set answer1(String value) {
    _answer1 = value;
  }

  set explain(String value) {
    _explain = value;
  }

  set content(String value) {
    _content = value;
  }

  // ignore: unnecessary_getters_setters
  set subType(String value) {
    _subType = value;
  }

  // ignore: unnecessary_getters_setters
  set type(String value) {
    _type = value;
  }

  set level(String value) {
    _level = value;
  }

  set id(String value) {
    _id = value;
  }

  String get level => _level;

  String get type => _type;

  String get subType => _subType;

  String get content => _content;

  String get explain => _explain;

  String get answer1 => _answer1;

  String get answer2 => _answer2;

  String get answer3 => _answer3;

  String get answer4 => _answer4;

  String get result => _result;

  DateTime get date => _date;

  String get comments => _comments;

  List get bold => _bold;

  List get italic => _italic;

  List get underline => _underline;
}
