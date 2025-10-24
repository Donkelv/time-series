#!/bin/bash


# Function to convert snake_case to PascalCase
to_pascal_case() {
  echo "$1" | perl -pe 's/(^|_)([a-zA-Z])/\U\2/g'
}

# Function to convert snake_case to camelCase
to_camel_case() {
  local pascal_case=$(to_pascal_case $1)
  local camel_case=$(echo "${pascal_case:0:1}" | tr '[:upper:]' '[:lower:]')$(echo "${pascal_case:1}")
  echo "$camel_case"
}

# Function to create folder and files for a feature
create_feature() {
  feature_name=$1
  feature_name_pascal=$(to_pascal_case $feature_name)
  feature_name_camel=$(to_camel_case $feature_name)

  # Create the feature folder
  mkdir -p $feature_name

  # Create the provider file with boilerplate code
  cat <<EOL > $feature_name/${feature_name}_provider.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '${feature_name}_notifier.dart';
import '${feature_name}_state.dart';

final ${feature_name_camel}Provider = StateNotifierProvider<${feature_name_pascal}Notifier, ${feature_name_pascal}State>(
  (ref) => ${feature_name_pascal}Notifier(
    ${feature_name_camel}: ${feature_name_pascal}(),
    ref: ref,
  ),
);
EOL

  # Create the state file with your provided template
  cat <<EOL > $feature_name/${feature_name}_state.dart
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:menufinder_new/features/auth/data/models/${feature_name}_response.dart';

import '../../../../core/exceptions/exceptions.dart';

part '${feature_name}_state.freezed.dart';

extension ${feature_name_pascal}StateGetters on ${feature_name_pascal}State {
  bool get isSuccessful => this is ${feature_name_pascal}SuccessfulState;
  bool get isInit => this is ${feature_name_pascal}InitialState;
  bool get isLoading => this is ${feature_name_pascal}LoadingState;
  bool get isError => this is ${feature_name_pascal}ErrorState;

  String? get error =>
      maybeWhen(error: (error) => error.toString(), orElse: () => null);
  ${feature_name_pascal}Response? get data =>
      maybeWhen(successful: (response) => response, orElse: () => null);
}

@freezed
class ${feature_name_pascal}State with _\$${feature_name_pascal}State {
  /// Data is present state
  const factory ${feature_name_pascal}State.successful(${feature_name_pascal}Response response) =
      ${feature_name_pascal}SuccessfulState;

  /// Initial/default state
  const factory ${feature_name_pascal}State.initial() = ${feature_name_pascal}InitialState;

  /// Data is loading state
  const factory ${feature_name_pascal}State.loading() = ${feature_name_pascal}LoadingState;

  /// Error when loading data state
  const factory ${feature_name_pascal}State.error([Failure? error]) =
      ${feature_name_pascal}ErrorState;
}
EOL

  # Create the notifier file with your provided template
  cat <<EOL > $feature_name/${feature_name}_notifier.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '${feature_name}_state.dart';

class ${feature_name_pascal}Notifier extends StateNotifier<${feature_name_pascal}State> {
  ${feature_name_pascal}Notifier({
    required ${feature_name_pascal} ${feature_name_camel},
    required Ref ref,
  })  : _${feature_name_camel} = ${feature_name_camel},
        _ref = ref,
        super(const ${feature_name_pascal}State.initial());

  final ${feature_name_pascal} _${feature_name_camel};
  final Ref _ref;

  Future<void> ${feature_name_camel}(${feature_name_pascal}FormData ${feature_name_camel}FormData) async {
    state = const ${feature_name_pascal}State.loading();
    final result = await _${feature_name_camel}(${feature_name_camel}FormData);
    result.fold(
      (error) {
        state = ${feature_name_pascal}State.error(error);
      },
      (data) async {
        state = ${feature_name_pascal}State.successful(data);
      },
    );
  }
}
EOL
}

# Feature name as a command-line argument
feature_name=$1

# Check if the feature name is provided
if [ -z "$feature_name" ]; then
  echo "Please provide a feature name"
  exit 1
fi

# Create the feature folder and files
create_feature $feature_name

echo "Feature '$feature_name' created with provider, state, and notifier files."