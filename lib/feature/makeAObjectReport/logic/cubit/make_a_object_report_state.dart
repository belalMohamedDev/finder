part of 'make_a_object_report_cubit.dart';

@freezed
class MakeAObjectReportState<T> with _$MakeAObjectReportState<T> {
  const factory MakeAObjectReportState.initial() = _Initial;
  const factory MakeAObjectReportState.loading(FlowState flowState) = Loading;
  const factory MakeAObjectReportState.success(FlowState flowState) = Success<T>;
  const factory MakeAObjectReportState.error(FlowState flowState) = Error;
  const factory MakeAObjectReportState.imagePath(File imagePath) = ImagePath<T>;
}
