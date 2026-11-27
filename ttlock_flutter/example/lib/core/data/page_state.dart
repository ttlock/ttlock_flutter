import 'package:freezed_annotation/freezed_annotation.dart';

part 'page_state.freezed.dart';

@freezed
abstract class PageState<T> with _$PageState<T> {
  const PageState._();
  const factory PageState({
    @Default([]) List<T> data,
    @Default(1) int currentPage,
    @Default(20) int pageSize,
    @Default(0) int total,
  }) = _PageState<T>;

  bool get hasMore => data.length < total;
}
