// ignore_for_file: public_member_api_docs, sort_constructors_first
class StepCountry {
  final String country;
  final List<String> cities;

  const StepCountry({required this.country, required this.cities});

  StepCountry copyWith({
    String? country,
    List<String>? cities,
  }) {
    return StepCountry(
      country: country ?? this.country,
      cities: cities ?? this.cities,
    );
  }
}
