import 'package:flutter/material.dart';
import 'package:movies_app/domain/result.dart';
import 'package:movies_app/presentation/core/utils/strings_manager.dart';

void clearFocus() {
  FocusManager.instance.primaryFocus?.unfocus();
}

String extractErrorMessage(ServerError? serverError, Error? error) {
  String errorMessage = StringsManager.somethingWentWrong;
  if (serverError != null) {
    errorMessage =
        serverError.statusMessage ?? StringsManager.somethingWentWrong;
  }
  if (error != null) {
    errorMessage = error.exception.toString();
  }
  return errorMessage;
}
