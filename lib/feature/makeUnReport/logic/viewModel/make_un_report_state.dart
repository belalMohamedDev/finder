part of 'make_un_report_cubit.dart';

@freezed
class MakeUnReportState<T> with _$MakeUnReportState<T> {
  const factory MakeUnReportState.initial() = _Initial;
  const factory MakeUnReportState.loading(FlowState flowState) = Loading;
  const factory MakeUnReportState.success(FlowState flowState) = Success<T>;
  const factory MakeUnReportState.error(FlowState flowState) = Error;
  const factory MakeUnReportState.imagePath(File imagePath) = ImagePath<T>;
}
