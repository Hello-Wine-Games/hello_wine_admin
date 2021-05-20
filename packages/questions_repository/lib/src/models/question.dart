import '../entities/entities.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
class Question extends Equatable {
  final String? id;
  final double? points;
  final String? question;
  final String? type;
  final List<dynamic>? answers;

  final bool isDeleting;
  final bool isSelected;

  const Question({
    String? id,
    required double? points,
    required String? question,
    required String? type,
    required List<dynamic>? answers,
    this.isDeleting = false,
    this.isSelected = false,
  })  : this.id = id,
        this.points = points,
        this.question = question,
        this.type = type,
        this.answers = answers;

  Question copyWith(
      {String? id,
      double? points,
      String? question,
      String? type,
      List<dynamic>? answers,
      bool? isDeleting,
      bool? isSelected}) {
    return Question(
      id: id ?? this.id,
      points: points ?? this.points,
      question: question ?? this.question,
      type: type ?? this.type,
      answers: answers ?? this.answers,
      isDeleting: isDeleting ?? this.isDeleting,
      isSelected: isSelected ?? this.isSelected,
    );
  }

  @override
  String toString() {
    return 'Question{id: $id}';
  }

  QuestionEntity toEntity() {
    return QuestionEntity(id, points, question, type, answers);
  }

  static Question fromEntity(QuestionEntity entity) {
    return Question(
      id: entity.id,
      points: entity.points,
      question: entity.question,
      type: entity.type,
      answers: entity.answers,
    );
  }

  // @override
  // int compareTo(dynamic other) {
  //   // compare the groups
  //   final gc = points!.compareTo(other.points);

  //   // if there are not equal gc will not be 0
  //   if (gc != 0) return gc;

  //   // if there are equal, then gc will be 0 so will go and compare codes
  //   final cc = question!.compareTo(other.question);

  //   // return code compare result
  //   return cc;
  // }

  @override
  List<Object?> get props =>
      [id, points, question, type, answers, isDeleting, isSelected];
}
