import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/presentations/add_skill/cubit/add_skill_cubit.dart';
import 'package:jobspot/src/presentations/add_skill/domain/use_cases/get_list_skill_use_case.dart';
import 'package:jobspot/src/presentations/add_skill/domain/use_cases/update_skill_use_case.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'add_skill_test.mocks.dart';

@GenerateMocks([GetListSkillUseCase, UpdateSkillUseCase])
void main() {
  late AddSkillCubit addSkillCubit;
  late MockGetListSkillUseCase mockGetListSkillUseCase;
  late MockUpdateSkillUseCase mockUpdateSkillUseCase;

  setUp(() {
    mockGetListSkillUseCase = MockGetListSkillUseCase();
    mockUpdateSkillUseCase = MockUpdateSkillUseCase();
    addSkillCubit =
        AddSkillCubit(mockGetListSkillUseCase, mockUpdateSkillUseCase);
  });

  group("Test Add Skill", () {
    blocTest<AddSkillCubit, AddSkillState>(
      'Test Add Skill',
      setUp: () {
        when(mockUpdateSkillUseCase.call(params: anyNamed('params')))
            .thenAnswer((_) => Future.value(const DataSuccess(true)));
      },
      build: () => addSkillCubit,
      act: (bloc) => bloc.updateListSkill(),
      expect: () => [
        const AddSkillState(
          isFocus: false,
          isLoading: true,
          listSearch: [],
          listSkill: [],
          query: "",
        ),
        const AddSkillState(
          isFocus: false,
          isLoading: false,
          listSearch: [],
          listSkill: [],
          query: "",
        ),
      ],
    );
  });
}
