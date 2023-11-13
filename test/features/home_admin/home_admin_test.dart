import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jobspot/src/core/enum/verify_status.dart';
import 'package:jobspot/src/core/resources/data_state.dart';
import 'package:jobspot/src/core/resources/fetch_lazy_data.dart';
import 'package:jobspot/src/presentations/home_admin/cubit/home_admin_cubit.dart';
import 'package:jobspot/src/presentations/home_admin/domain/entities/consider_company.dart';
import 'package:jobspot/src/presentations/home_admin/domain/entities/verify_company_entity.dart';
import 'package:jobspot/src/presentations/home_admin/domain/use_cases/consider_company_use_case.dart';
import 'package:jobspot/src/presentations/home_admin/domain/use_cases/get_list_company_pending_use_case.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'home_admin_test.mocks.dart';

@GenerateMocks([GetListCompanyPendingUseCase, ConsiderCompanyUseCase])
void main() {
  late HomeAdminCubit homeAdminCubit;
  late MockGetListCompanyPendingUseCase mockGetListCompanyPendingUseCase;
  late MockConsiderCompanyUseCase mockConsiderCompanyUseCase;

  setUp(() {
    mockConsiderCompanyUseCase = MockConsiderCompanyUseCase();
    mockGetListCompanyPendingUseCase = MockGetListCompanyPendingUseCase();
    homeAdminCubit = HomeAdminCubit(
        mockGetListCompanyPendingUseCase, mockConsiderCompanyUseCase);
  });

  group("Test Home Admin", () {
    blocTest<HomeAdminCubit, HomeAdminState>(
      'Test Get List',
      setUp: () {
        when(mockGetListCompanyPendingUseCase.call(params: anyNamed('params')))
            .thenAnswer((_) => Future.value(DataSuccess(
                FetchLazyData<VerifyCompanyEntity>(
                    isMore: true, limit: 15, listData: []))));
      },
      build: () => homeAdminCubit,
      act: (bloc) => bloc.getListCompany(),
      expect: () => [
        const HomeAdminState(isMore: true),
        const HomeAdminState(isMore: true, listVerify: []),
      ],
    );

    blocTest<HomeAdminCubit, HomeAdminState>(
      'Test Consider Company',
      setUp: () {
        when(mockConsiderCompanyUseCase.call(params: anyNamed('params')))
            .thenAnswer((_) => Future.value(const DataSuccess(true)));
      },
      build: () => homeAdminCubit,
      act: (bloc) => bloc.considerCompany(
          ConsiderCompany(status: VerifyStatus.accept, toUserID: "toUserID")),
      expect: () => [const HomeAdminState(isMore: true, listVerify: [])],
    );
  });
}
