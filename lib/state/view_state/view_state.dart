import 'package:freezed_annotation/freezed_annotation.dart';

part 'view_state.freezed.dart';

@freezed
class ViewState<T> with _$ViewState<T> {
  const factory ViewState.initial() = _InitialViewState<T>;
  const factory ViewState.loading() = _LoadingViewState<T>;
  const factory ViewState.success({required T data}) = _SuccessViewState<T>;
  const factory ViewState.error({String? error}) = _ErrorViewState<T>;
}
