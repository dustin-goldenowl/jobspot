generate_language_l10n:
	flutter gen-l10n

generate_project_delete_conflict:
	dart run build_runner build --delete-conflicting-outputs
	dart run build_runner build -d

generate_sha:
	keytool -list -v -keystore "C:\Users\yourusernamehere\.android\debug.keystore" -alias androiddebugkey -storepass android -keypass android

generate_icon:
	flutter pub run flutter_launcher_icons