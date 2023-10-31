class UpdateCompanyInfoEntity {
  final String avatar;
  final String name;
  final String address;
  final String description;
  final String website;
  final String industry;
  final String type;
  final String employeeSize;
  final String specialization;
  final List<String> images;
  final List<String> removeImages;
  final DateTime since;

  UpdateCompanyInfoEntity({
    required this.avatar,
    required this.name,
    required this.address,
    required this.since,
    required this.description,
    required this.employeeSize,
    required this.industry,
    required this.specialization,
    required this.type,
    required this.website,
    required this.images,
    required this.removeImages,
  });
}
