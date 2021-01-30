import 'package:cloud_firestore/cloud_firestore.dart';

class QuestionModel {
  static const ID = "id";
  static const LEVEL = "level";
  static const TYPE = "type";
  static const SUB_TYPE = "subType";
  static const QUESTION = "question";
  static const EXPLAIN = "explain";
  static const ANSWER = "answer";
  static const RESULT = "result";
  static const DATE = "date";
  static const COMMENTS = "comments";
  static const BOLD = "bold";
  static const ITALIC = "italic";
  static const UNDERLINE = "underline";

  String _id;
  String _level;
  String _type;
  String _subType;
  String _question;
  String _explain;
  String _answer;
  String _result;
  DateTime _date;
  String _comments;
  List _bold;
  List _italic;
  List _underline;

//  getters
  String get id => _id;

  String get level => _level;

  String get type => _type;

  String get subType => _subType;

  String get question => _question;

  String get explain => _explain;

  String get result => _result;

  String get answer => _answer;

  DateTime get date => _date;

  String get comments => _comments;

  List get bold => _bold;

  List get italic => _italic;

  List get underline => _underline;

  QuestionModel.fromSnapshot(DocumentSnapshot snapshot) {
    _id = snapshot.data()[ID];
    _level = snapshot.data()[LEVEL];
    _type = snapshot.data()[TYPE];

    _subType = snapshot.data()[SUB_TYPE];

    _question = snapshot.data()[QUESTION];

    _explain = snapshot.data()[EXPLAIN];

    _result = snapshot.data()[ANSWER];

    _answer = snapshot.data()[RESULT];

    _date = snapshot.data()[DATE];

    _comments = snapshot.data()[COMMENTS];

    _bold = snapshot.data()[BOLD];

    _italic = snapshot.data()[ITALIC];

    _underline = snapshot.data()[UNDERLINE];
  }
}
