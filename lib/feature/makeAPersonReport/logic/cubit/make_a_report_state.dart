part of 'make_a_report_cubit.dart';

@freezed
class MakeAReportState<T> with _$MakeAReportState<T> {
  const factory MakeAReportState.initial() = _Initial;

  const factory MakeAReportState.loading(FlowState flowState) = Loading;
  const factory MakeAReportState.success(FlowState flowState) = Success<T>;
  const factory MakeAReportState.error(FlowState flowState) = Error;
  const factory MakeAReportState.imagePath(File imagePath) = ImagePath<T>;
}
