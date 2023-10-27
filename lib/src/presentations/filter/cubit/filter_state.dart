part of 'filter_cubit.dart';

class FilterState extends Equatable {
  const FilterState({
    required this.isExpandedLastUpdate,
    required this.isExpandedJobType,
    required this.isExpandedLevel,
    required this.isExpandedSalary,
    required this.isExpandedTypeWorkplace,
    required this.isFilterSalary,
    required this.salary,
    required this.indexLastUpdate,
    this.indexTypeWorkplace,
    this.indexJobType,
    this.indexLevel,
  });

  final bool isExpandedLastUpdate;
  final bool isExpandedTypeWorkplace;
  final bool isExpandedJobType;
  final bool isExpandedLevel;
  final bool isExpandedSalary;
  final bool isFilterSalary;
  final int indexLastUpdate;
  final int? indexTypeWorkplace;
  final int? indexJobType;
  final int? indexLevel;
  final RangeValues salary;

  factory FilterState.ds() {
    return const FilterState(
      indexLastUpdate: 3,
      isExpandedLastUpdate: true,
      isExpandedJobType: true,
      isExpandedLevel: true,
      isExpandedSalary: true,
      isExpandedTypeWorkplace: true,
      isFilterSalary: false,
      salary: RangeValues(10, 10),
    );
  }

  FilterState copyWith(
      {bool? isExpandedLastUpdate,
      bool? isExpandedTypeWorkplace,
      bool? isExpandedJobType,
      bool? isExpandedLevel,
      bool? isExpandedSalary,
      int? indexLastUpdate,
      int? indexTypeWorkplace,
      int? indexJobType,
      int? indexLevel,
      RangeValues? salary,
      bool? isFilterSalary}) {
    return FilterState(
      isExpandedLastUpdate: isExpandedLastUpdate ?? this.isExpandedLastUpdate,
      isExpandedJobType: isExpandedJobType ?? this.isExpandedJobType,
      isExpandedLevel: isExpandedLevel ?? this.isExpandedLevel,
      isExpandedSalary: isExpandedSalary ?? this.isExpandedSalary,
      isExpandedTypeWorkplace:
          isExpandedTypeWorkplace ?? this.isExpandedTypeWorkplace,
      indexLastUpdate: indexLastUpdate ?? this.indexLastUpdate,
      indexTypeWorkplace: indexTypeWorkplace ?? this.indexTypeWorkplace,
      indexJobType: indexJobType ?? this.indexJobType,
      indexLevel: indexLevel ?? this.indexLevel,
      salary: salary ?? this.salary,
      isFilterSalary: isFilterSalary ?? this.isFilterSalary,
    );
  }

  @override
  List<Object?> get props => [
        isExpandedLastUpdate,
        isExpandedJobType,
        isExpandedLevel,
        isExpandedSalary,
        isExpandedTypeWorkplace,
        indexLastUpdate,
        indexTypeWorkplace,
        indexJobType,
        indexLevel,
        salary,
      ];
}
