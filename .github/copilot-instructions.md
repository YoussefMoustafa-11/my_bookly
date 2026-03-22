# Project Guidelines

## Code Style
- Language: Dart + Flutter.
- Follow analyzer defaults from `analysis_options.yaml` (`package:flutter_lints/flutter.yaml`).
- Keep existing naming/style patterns in nearby files (for example, current Cubit folder names under `lib/feature/home/presentation/view_model/`).
- Prefer shared constants/utilities over inline literals:
  - Colors/constants from `lib/constant.dart`
  - Text styles from `lib/core/utils/styles.dart`
  - Asset paths from `lib/core/utils/assets.dart`

## Architecture
- This project is feature-first under `lib/feature/` with shared code in `lib/core/`.
- Keep feature boundaries:
  - `data/` for models/repos
  - `presentation/` for views/widgets/view_model (Cubits + states)
- Routing is centralized in `lib/core/routing/router_generation_config.dart` and route names in `lib/core/routing/app_routes.dart`.
- Dependency injection uses GetIt in `lib/core/utils/service_locator.dart`.
- Repositories commonly return `Either<Failure, T>` and map Dio errors through `lib/core/errors/failure.dart`.

## Build and Test
- Install dependencies: `flutter pub get`
- Analyze: `flutter analyze`
- Format: `dart format lib`
- Run app: `flutter run`
- Clean build artifacts when needed: `flutter clean`
- There is currently no committed test suite; if adding tests, place them in `test/` and run with `flutter test`.

## Conventions
- Reuse existing dependencies and architecture before introducing new patterns.
- Register new services/repos in `setupServiceLocator()` before consuming them.
- Add/modify app navigation only via the centralized GoRouter config.
- Avoid editing generated/platform output directly (`build/`, `.dart_tool/`, generated Android/iOS files).
- When adding assets or fonts, update `pubspec.yaml` and keep references in shared asset/constants files.
