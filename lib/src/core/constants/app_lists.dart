import 'package:jobspot/src/core/config/localization/app_local.dart';

class AppLists {
  AppLists._();

  static List<String> get listJobType => [
        AppLocal.text.add_job_page_full_time,
        AppLocal.text.add_job_page_part_time,
        AppLocal.text.add_job_page_contract,
        AppLocal.text.add_job_page_temporary,
        AppLocal.text.add_job_page_volunteer,
        AppLocal.text.add_job_page_apprenticeship,
      ];

  static List<Map<String, String>> get listTypeWorkplace => [
        {
          "title": AppLocal.text.add_job_page_on_site,
          "subtitle": AppLocal.text.add_job_page_on_site_explain,
        },
        {
          "title": AppLocal.text.add_job_page_hybrid,
          "subtitle": AppLocal.text.add_job_page_hybrid_explain,
        },
        {
          "title": AppLocal.text.add_job_page_remote,
          "subtitle": AppLocal.text.add_job_page_remote_explain,
        }
      ];
}
