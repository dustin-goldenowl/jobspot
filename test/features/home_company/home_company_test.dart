import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/core/resources/fetch_lazy_data.dart';
import 'package:jobspot/src/presentations/home_company/cubit/home_company_cubit.dart';
import 'package:jobspot/src/presentations/home_company/domain/entities/my_job_entity.dart';
import 'package:jobspot/src/presentations/home_company/domain/use_cases/get_list_my_job_use_case.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'home_company_test.mocks.dart';

@GenerateMocks([GetListMyJobUseCase])
void main() {
  late HomeCompanyCubit homeCompanyCubit;
  late MockGetListMyJobUseCase mockGetListMyJobUseCase;

  setUp(() {
    mockGetListMyJobUseCase = MockGetListMyJobUseCase();
    homeCompanyCubit = HomeCompanyCubit(mockGetListMyJobUseCase);
  });

  group("Test Home Company", () {
    blocTest<HomeCompanyCubit, HomeCompanyState>(
      'Test Get Job',
      setUp: () {
        when(mockGetListMyJobUseCase.call(params: anyNamed('params')))
            .thenAnswer((_) => Future.value(DataSuccess(
                FetchLazyData<MyJobEntity>(
                    isMore: true, limit: 15, listData: []))));
      },
      build: () => homeCompanyCubit,
      act: (bloc) => bloc.getListMyJob(),
      expect: () => [
        const HomeCompanyState(isMore: true),
        const HomeCompanyState(isMore: true, jobs: []),
      ],
    );
  });
}
