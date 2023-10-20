part of 'add_skill_cubit.dart';

class AddSkillState extends Equatable {
  const AddSkillState({
    required this.isFocus,
    required this.isLoading,
    required this.listSearch,
    required this.listSkill,
    required this.query,
    this.error,
  });

  final bool isFocus;
  final bool isLoading;
  final List<SkillEntity> listSearch;
  final List<SkillEntity> listSkill;
  final String query;
  final String? error;

  factory AddSkillState.ds() {
    return const AddSkillState(
      isFocus: false,
      isLoading: false,
      listSearch: [],
      listSkill: [],
      query: "",
    );
  }

  AddSkillState copyWith({
    bool? isFocus,
    bool isLoading = false,
    List<SkillEntity>? listSearch,
    List<SkillEntity>? listSkill,
    String? query,
    String? error,
  }) {
    return AddSkillState(
      isLoading: isLoading,
      isFocus: isFocus ?? this.isFocus,
      listSearch: listSearch ?? this.listSearch,
      listSkill: listSkill ?? this.listSkill,
      query: query ?? this.query,
      error: error,
    );
  }

  @override
  List<Object> get props => [listSearch, listSkill, isFocus, query, isLoading];
}
