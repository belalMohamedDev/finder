part of 'ai_cubit.dart';

@freezed
class AiState<T> with _$AiState<T> {
  const factory AiState.initial() = _Initial;
    const factory AiState.loading(FlowState flowState) = Loading;
  const factory AiState.success(FlowState flowState) = Success<T>;
  const factory AiState.error(FlowState flowState) = Error;
  const factory AiState.imagePath(File imagePath) = ImagePath<T>;
}
