// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:jamas_web/helpers/costants.dart';
// import 'package:jamas_web/models/Question.dart';
//
// class QuestionServices {
//   String QuestionForm1Collection = "questionform1";
//   String QuestionsCollection = "Questions";
// // dùng khi tạo các câu hỏi 4 đáp án
//   void createQuestionForm1({
//     String id,
//     String level,
//     String type,
//     String subType,
//     String question,
//     String explain,
//     String answer,
//     String result,
//     DateTime date,
//     String comments,
//     List bold,
//     List italic,
//     List underline
//   }) {
//     firebaseFiretore.collection(QuestionForm1Collection).doc(id).set({
//     "id":id,
//     "level":level,
//     "type":type,
//     "subType":subType,
//     "question":question,
//     "explain":explain,
//     "answer":answer,
//     "result":result,
//     "date":date,
//     "comments":comments,
//     "bold":bold,
//     "italic":italic,
//     "underline":underline,
//     });
//   }
//
//   void updateQuestionData(Map<String, dynamic> values) {
//     firebaseFiretore
//         .collection(QuestionForm1Collection)
//         .doc(values['id'])
//         .update(values);
//   }
//
//   Future<QuestionModel> getQuestionForm1ById(String id) =>
//       firebaseFiretore.collection(QuestionForm1Collection).doc(id).get().then((doc) {
//         return QuestionModel.fromSnapshot(doc);
//       });
//
//   Future<List<QuestionModel>> getAllQuestions() async =>
//       firebaseFiretore.collection(QuestionsCollection).get().then((result) {
//         List<QuestionModel> Questions = [];
//         for (DocumentSnapshot Question in result.docs) {
//           Questions.add(QuestionModel.fromSnapshot(Question));
//         }
//         return Questions;
//       });
// }
