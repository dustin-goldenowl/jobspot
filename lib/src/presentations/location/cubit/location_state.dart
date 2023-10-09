part of 'location_cubit.dart';

class LocationState extends Equatable {
  const LocationState({required this.provinces, required this.text});

  final List<Map<String, dynamic>> provinces;
  final String text;

  LocationState copyWith({
    List<Map<String, dynamic>>? provinces,
    String? text,
  }) {
    return LocationState(
      provinces: provinces ?? this.provinces,
      text: text ?? this.text,
    );
  }

  @override
  List<Object> get props => [provinces, text];
}
