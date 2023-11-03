part of 'view_pdf_cubit.dart';

class ViewPDFState extends Equatable {
  const ViewPDFState({required this.isLoading, this.error, this.summary});

  final bool isLoading;
  final String? error;
  final String? summary;

  ViewPDFState copyWith({
    bool isLoading = false,
    String? error,
    String? summary,
  }) =>
      ViewPDFState(isLoading: isLoading, error: error, summary: summary);

  @override
  List<Object?> get props => [isLoading, error, summary];
}
