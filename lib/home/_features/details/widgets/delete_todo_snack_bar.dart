import 'package:flutter/material.dart';
import 'package:questions_repository/questions_repository.dart';

class DeleteTodoSnackBar extends SnackBar {
  DeleteTodoSnackBar({
    Key? key,
    required Question question,
    required VoidCallback onUndo,
  }) : super(
          key: key,
          content: Text(
            'Deleted ${question.question}',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          duration: const Duration(seconds: 2),
          action: SnackBarAction(
            label: 'Undo',
            onPressed: onUndo,
          ),
        );
}
