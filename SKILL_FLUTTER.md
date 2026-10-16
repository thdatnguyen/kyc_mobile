# SKILL — Flutter DDD App Blueprint

> **Purpose**: Blueprint for building new Flutter apps following Domain-Driven Design (DDD) with Riverpod, GoRouter, Hive CE, and proven engineering patterns. Distilled from the Landlord App production codebase.
> 
> **Usage**: Copy this file to `.opencode/skills/` of any new Flutter project to enable AI-assisted scaffolding. Load via `/skill flutter-ddd-app`.

---

## 1. Architecture Overview

### 1.1 Tech Stack

| Category | Technology | Purpose |
|----------|-----------|---------|
| Framework | Flutter 3.x, Dart | Cross-platform (iOS/Android) |
| State | Riverpod + riverpod_annotation + code-gen | Reactive state management |
| DI | GetIt | Service locator |
| Local DB | Hive CE | Offline-first storage |
| Config | SharedPreferences | Key-value config |
| Routing | GoRouter | Declarative navigation |
| Auth | Firebase Auth / JWT | Authentication |
| Push | Firebase FCM | Push notifications |
| IAP | in_app_purchase | In-app purchases |

### 1.2 Core Package Dependencies (pubspec.yaml)

Install these as the foundation for any new Flutter DDD app.

#### State Management & DI

| Package | Version | Type | Purpose |
|---------|---------|------|---------|
| `flutter_riverpod` | `^3.3.1` | deps | Reactive state management |
| `riverpod_annotation` | `^4.0.2` | deps | Riverpod code-gen annotations |
| `riverpod_generator` | `^4.0.3` | dev | Riverpod code generator |
| `get_it` | `^9.2.1` | deps | Service locator for DI |

#### Entities & Models (Code Gen)

| Package | Version | Type | Purpose |
|---------|---------|------|---------|
| `dartz` | `^0.10.1` | deps | `Either<Failure, T>` functional types |
| `freezed_annotation` | `^3.1.0` | deps | Immutable class annotations |
| `freezed` | `^3.2.5` | dev | Immutable class code generator |
| `json_annotation` | `^4.12.0` | deps | JSON serialization annotations |
| `json_serializable` | `^6.14.0` | dev | JSON serialization code generator |
| `build_runner` | `^2.15.0` | dev | Code generation runner |

#### Routing

| Package | Version | Type | Purpose |
|---------|---------|------|---------|
| `go_router` | `^17.2.3` | deps | Declarative router with deep linking |

#### Local Storage

| Package | Version | Type | Purpose |
|---------|---------|------|---------|
| `hive_ce` | `^2.19.3` | deps | Local NoSQL database (Community Edition) |
| `hive_ce_flutter` | `^2.3.4` | deps | Flutter-specific Hive initializer |
| `hive_ce_generator` | `^1.11.2` | dev | Hive type adapter generator |
| `shared_preferences` | `^2.5.5` | deps | Key-value config storage |
| `flutter_secure_storage` | `^10.3.0` | deps | Encrypted token storage |

#### Network & API

| Package | Version | Type | Purpose |
|---------|---------|------|---------|
| `http` | `^1.6.0` | deps | HTTP client |
| `connectivity_plus` | `^7.1.1` | deps | Network connectivity detection |

#### UI & Theming

| Package | Version | Type | Purpose |
|---------|---------|------|---------|
| `google_fonts` | `^8.1.0` | deps | Font management |
| `gap` | `^3.0.1` | deps | Declarative spacing widgets |
| `flutter_animate` | `^4.5.2` | deps | Declarative animations |
| `cached_network_image` | `^3.4.1` | deps | Network image caching |
| `smooth_page_indicator` | `^2.0.1` | deps | Page indicators |
| `flutter_launcher_icons` | `^0.14.4` | dev | App icon generation |

#### Media & Files

| Package | Version | Type | Purpose |
|---------|---------|------|---------|
| `image_picker` | `^1.2.2` | deps | Camera/gallery image selection |
| `file_picker` | `^11.0.2` | deps | File system picker |
| `path_provider` | `^2.1.5` | deps | Platform file paths |

#### Navigation & Sharing

| Package | Version | Type | Purpose |
|---------|---------|------|---------|
| `url_launcher` | `^6.3.2` | deps | Open external URLs |
| `share_plus` | `^13.1.0` | deps | Share content to other apps |

#### Firebase

| Package | Version | Type | Purpose |
|---------|---------|------|---------|
| `firebase_core` | `^4.9.0` | deps | Firebase initialization |
| `firebase_messaging` | `^16.2.2` | deps | FCM push notifications |
| `firebase_auth` | `^6.5.1` | deps | Firebase authentication |
| `firebase_crashlytics` | `^5.2.2` | deps | Crash reporting |

#### Payments & Security

| Package | Version | Type | Purpose |
|---------|---------|------|---------|
| `in_app_purchase` | `^3.2.3` | deps | In-app purchases (Apple/Google) |
| `local_auth` | `^3.0.1` | deps | Biometric authentication |
| `crypto` | `^3.0.7` | deps | SHA/hash utilities |

#### PDF, Printing & Export

| Package | Version | Type | Purpose |
|---------|---------|------|---------|
| `pdf` | `^3.12.0` | deps | PDF generation |
| `printing` | `^5.14.3` | deps | Print/preview PDF documents |
| `excel` | `^5.0.3` | deps | Excel spreadsheet generation |

#### Utilities

| Package | Version | Type | Purpose |
|---------|---------|------|---------|
| `uuid` | `^4.5.3` | deps | UUID generation |
| `intl` | `^0.20.2` | deps | i18n & date/number formatting |
| `timeago` | `^3.7.1` | deps | Relative timestamps ("3 min ago") |
| `package_info_plus` | `^10.1.0` | deps | App version/build info |
| `pin_code_fields` | `^9.4.0` | deps | OTP/pin input UI |
| `qr_flutter` | `^4.1.0` | deps | QR code generation |

#### Testing

| Package | Version | Type | Purpose |
|---------|---------|------|---------|
| `mocktail` | `^1.0.5` | dev | Mocking for tests |
| `very_good_analysis` | `^10.2.0` | dev | Strict lint rules |

#### Quick Install

```bash
# Core deps (one-liner)
flutter pub add flutter_riverpod riverpod_annotation get_it dartz freezed_annotation json_annotation go_router hive_ce hive_ce_flutter shared_preferences flutter_secure_storage http connectivity_plus google_fonts gap flutter_animate cached_network_image smooth_page_indicator image_picker file_picker path_provider url_launcher share_plus firebase_core firebase_messaging firebase_auth firebase_crashlytics in_app_purchase local_auth crypto pdf printing excel uuid intl timeago package_info_plus pin_code_fields qr_flutter

# Dev deps
flutter pub add -d riverpod_generator freezed json_serializable build_runner hive_ce_generator flutter_launcher_icons mocktail very_good_analysis
```

### 1.3 DDD Layer Architecture

```
lib/src/<feature>/
├── data/
│   ├── datasources/
│   │   ├── <feature>_remote_data_src.dart      # Abstract interface
│   │   └── <feature>_remote_data_src_impl.dart  # HTTP / API implementation
│   ├── models/
│   │   └── <feature>.model.dart                 # fromJson / toMap extensions
│   └── repositories/
│       └── <feature>_impl_repository.dart       # Connects interface → datasources
├── domain/
│   ├── entities/
│   │   └── <feature>.entity.dart                # Pure data class with @freezed
│   ├── repositories/
│   │   └── <feature>_repository.dart            # Abstract interface
│   └── usecases/
│       └── <usecase_name>.usecase.dart          # Single-responsibility operation
└── presentation/
    ├── views/
    │   └── <feature>_view.dart                  # Screen / Page
    ├── widgets/
    │   └── <feature>_widget.dart                # Reusable UI components
    └── adapter/
        ├── <feature>.adapter.dart               # Riverpod notifier (state management)
        └── <feature>.state.dart                 # State class hierarchy
```

### 1.3.1 Entity Pattern (Freezed)

Entities are pure data classes using `@freezed`. Freezed auto-generates `==`, `hashCode`, `toString`, `copyWith`:

```dart
// domain/entities/motel.entity.dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'motel.entity.freezed.dart';
part 'motel.entity.g.dart';

@freezed
sealed class MotelEntity with _$MotelEntity {
  const factory MotelEntity({
    required String id,
    required String name,
    required String address,
    String? description,
    List<String>? amenities,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _MotelEntity;

  factory MotelEntity.fromJson(Map<String, dynamic> json) =>
      _$MotelEntityFromJson(json);
}
```

### 1.4 Layer Rules

| Layer | Responsibility | Must NOT do |
|-------|---------------|-------------|
| Entity | Immutable data class with `@freezed` | Business logic, serialization details |
| Model | `fromJson` / `toMap` / `copyWith` | Business logic |
| Repository Interface | Contract for data access | Implementation |
| Repository Impl | Wire interface to datasources | Business logic |
| UseCase | Single business operation | Access UI, manage state |
| DataSource | Raw API calls / DB queries | Business logic, UI |
| Adapter | State management, orchestration | UI rendering |
| View | UI rendering, user interaction | Business logic, direct API calls |

---

## 2. Feature Scaffolding Workflow

When creating a new feature, follow these steps in order:

### 2.1 Create Directory Structure

```bash
mkdir -p lib/src/<feature>/data/datasources
mkdir -p lib/src/<feature>/data/models
mkdir -p lib/src/<feature>/data/repositories
mkdir -p lib/src/<feature>/domain/entities
mkdir -p lib/src/<feature>/domain/repositories
mkdir -p lib/src/<feature>/domain/usecases
mkdir -p lib/src/<feature>/presentation/views
mkdir -p lib/src/<feature>/presentation/widgets
mkdir -p lib/src/<feature>/presentation/adapter
```

### 2.2 Implementation Order (CRITICAL)

1. **Entity** (`domain/entities/`) — Define `@freezed` immutable class
2. **Repository Interface** (`domain/repositories/`) — Abstract class with method signatures returning `Either<Failure, T>`
3. **UseCase** (`domain/usecases/`) — Single `call()` method, injects repository
4. **Model** (`data/models/`) — Implements `fromJson`, `toMap`, `copyWith`
5. **DataSource** (`data/datasources/`) — Abstract interface + implementation
6. **Repository Impl** (`data/repositories/`) — Connects interface to datasource
7. **State** (`presentation/adapter/`) — State class hierarchy using `@freezed` sealed classes
8. **Adapter** (`presentation/adapter/`) — Riverpod `@riverpod` notifier
9. **View** (`presentation/views/`) — Screen widget
10. **DI Registration** — Register UseCase → Repository → DataSource in `injection_container.dart`

### 2.3 DI Registration (injection_container.dart)

```dart
// REGISTRATION ORDER IS CRITICAL: UseCase first → Repository → DataSource
sl.registerLazySingleton(() => GetMotelsUseCase(sl()));           // UseCase
sl.registerLazySingleton<MotelRepository>(() => MotelImplRepository(sl())); // Repo Impl
sl.registerLazySingleton<MotelRemoteDataSource>(() => MotelRemoteDataSourceImpl(sl())); // DataSource
```

---

## 3. State Management (Riverpod)

### 3.1 State Class Hierarchy

Use `@freezed` sealed class hierarchy (Freezed auto-generates `==`, `hashCode`, `toString`, `copyWith` — no need for Equatable):

```dart
// <feature>.state.dart

@freezed
sealed class FeatureState with _$FeatureState {
  const factory FeatureState.initial() = FeatureInitial;
  const factory FeatureState.loading() = FeatureLoading;
  const factory FeatureState.loaded(List<Entity> items) = FeatureLoaded;
  const factory FeatureState.error(String message) = FeatureError;
}
```

**Naming Convention:**
- `initial` — Starting state
- `loading` / `fetching...` or `...ing` suffix — In progress
- `loaded` / `fetched...` or `...ed` suffix — Success
- `error` — Failure

**Pattern matching usage in UI:**

```dart
final state = ref.watch(featureAdapterProvider);

return switch (state) {
  FeatureInitial() => const SizedBox.shrink(),
  FeatureLoading() => const CircularProgressIndicator(),
  FeatureLoaded(:final items) => ListView(
    children: items.map((e) => Text(e.name)).toList(),
  ),
  FeatureError(:final message) => Text('Error: $message'),
};
```

### 3.2 Riverpod Adapter

```dart
// <feature>.adapter.dart
// Uses @riverpod annotation (code-gen)

@riverpod
class FeatureAdapter extends _$FeatureAdapter {
  @override
  FeatureState build() => const FeatureState.initial();

  Future<void> loadItems() async {
    state = const FeatureState.loading();
    final result = await ref.read(getItemsUseCaseProvider).call();
    result.fold(
      (failure) => state = FeatureState.error(failure.message),
      (items) => state = FeatureState.loaded(items),
    );
  }
}
```

### 3.3 Async State Safety (IMPORTANT)

After any `await` call, **always** guard state updates:

```dart
Future<void> loadItems() async {
  state = const FeatureState.loading();
  final result = await ref.read(getItemsUseCaseProvider).call();
  if (!state.mounted) return; // Prevent UnmountedRefException
  result.fold(
    (failure) => state = FeatureState.error(failure.message),
    (items) => state = FeatureState.loaded(items),
  );
}
```

---

## 4. Navigation (GoRouter)

### 4.1 Router Setup

```dart
// router.main.dart
final rootNavigatorKey = GlobalKey<NavigatorState>();
final shellNavigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  navigatorKey: rootNavigatorKey,
  initialLocation: '/splash',
  routes: [
    GoRoute(
      path: '/splash',
      builder: (_, __) => const SplashScreen(),
    ),
    GoRoute(
      path: '/login',
      builder: (_, __) => const LoginScreen(),
      routes: [
        GoRoute(
          path: 'register',
          builder: (_, __) => const RegisterScreen(),
        ),
      ],
    ),
    ShellRoute(
      navigatorKey: shellNavigatorKey,
      builder: (_, __, child) => MainShell(child: child),
      routes: [
        GoRoute(
          path: '/dashboard',
          builder: (_, __) => const DashboardScreen(),
        ),
        GoRoute(
          path: '/rooms',
          builder: (_, __) => const RoomsScreen(),
        ),
      ],
    ),
    GoRoute(
      parentNavigatorKey: rootNavigatorKey,
      path: '/detail/:id',
      builder: (_, state) => DetailScreen(id: state.pathParameters['id']!),
    ),
  ],
);
```

### 4.2 Routing Rules

| Key | Purpose |
|-----|---------|
| `rootNavigatorKey` | Full-screen routes (Auth, Detail modals, Full-screen pages) |
| `shellNavigatorKey` | Routes keeping bottom navigation bar (Dashboard tabs) |

### 4.3 Route Guards (Redirect)

```dart
redirect: (context, state) {
  final isLoggedIn = Cache.instance.sessionToken != null;
  final isFirstTime = Cache.instance.isFirstTime;
  final isAuthRoute = state.matchedLocation.startsWith('/login');
  final isOnboarding = state.matchedLocation == '/on-boarding';

  if (isFirstTime && !isOnboarding) return '/on-boarding';
  if (!isLoggedIn && !isAuthRoute) return '/login';
  if (isLoggedIn && isAuthRoute) return '/dashboard';
  return null; // Allow navigation
},
```

### 4.4 Screen Path Convention

Every screen must expose a static `path` property:

```dart
class DetailScreen extends ConsumerWidget {
  static const path = '/detail/:id';
  // ...
}
```

---

## 5. Local Storage

### 5.1 Storage Strategy

| Store | Technology | Purpose | Pattern |
|-------|-----------|---------|---------|
| Entity Data | Hive CE | Motels, Rooms, Tenants, etc. | Type-adapted boxes |
| Config | SharedPreferences | Tokens, flags, theme, locale | Key-value |
| Secure | flutter_secure_storage | Sensitive tokens (planned) | Encrypted |

### 5.2 Hive CE Setup

```dart
// Register type adapters before opening boxes
Hive.registerAdapter(MotelEntityAdapter());
Hive.registerAdapter(RoomEntityAdapter());

// Open box
final motelBox = await Hive.openBox<MotelEntity>('motels');
```

### 5.3 Cache Singleton Pattern

Use a `Cache` singleton for frequently accessed values:

```dart
// core/common/singletons/cache.dart
class Cache {
  static final Cache instance = Cache._();
  Cache._();

  String? sessionToken;
  String? refreshToken;
  bool? isPro;
  ValueNotifier<ThemeMode> themeModeNotifier = ValueNotifier(ThemeMode.system);
}
```

---

## 6. Theming & UI

### 6.1 Color System

**NEVER use generic colors** (`Colors.red`, `Colors.blue`). Always use the `Colours` class:

```dart
// core/res/styles.dart
class Colours {
  static const lightThemePrimaryColour = Color(0xFF...);
  static const darkThemeBGDark = Color(0xFF...);
  static const lightThemeBackground = Color(0xFF...);
  static const darkThemeCard = Color(0xFF...);
}
```

### 6.2 Typography

- **Font Family**: Bundle locally (e.g., `Switzer`) — do NOT rely on network fonts
- **Font Declaration** in `pubspec.yaml`:
  ```yaml
  fonts:
    - family: Switzer
      fonts:
        - asset: assets/fonts/Switzer-Regular.ttf
        - asset: assets/fonts/Switzer-Bold.ttf
          weight: 700
  ```

### 6.3 Theme Switching

Reactive via `ValueListenableBuilder`:

```dart
ValueListenableBuilder<ThemeMode>(
  valueListenable: Cache.instance.themeModeNotifier,
  builder: (context, mode, _) => MaterialApp(
    themeMode: mode,
    theme: AppTheme.lightTheme,
    darkTheme: AppTheme.darkTheme,
    // ...
  ),
);
```

### 6.4 UI Polish Rules

- Border radius: 12–20px (consistent)
- Both Light and Dark modes must look flawless
- Use `Text.rich` + `WidgetSpan` for inline icons within text
- Avoid hardcoded padding/margin — prefer responsive layouts

---

## 7. Core Business Logic Patterns

### 7.1 Monetary & Number Formatting

All monetary values and utility readings MUST be displayed as **integers** (no decimals):

```dart
Text('${amount.toInt()} VND')  // ✅
Text('${amount.toStringAsFixed(0)}') // ✅
Text('$amount VND')  // ❌ Shows decimals
```

### 7.2 Free/Pro Feature Gating

```dart
// ProGateHelper.guardAction() pattern
// Checks if user is Pro; if not, shows upgrade popup
ProGateHelper.guardAction(
  context,
  action: () {
    // Execute gated feature
    router.push('/create-motel');
  },
);
```

### 7.3 Offline-First Repository Pattern

```dart
class MotelImplRepository implements MotelRepository {
  final MotelRemoteDataSource remote;
  final Box<MotelEntity> localBox;

  @override
  Future<Either<Failure, List<MotelEntity>>> getMotels() async {
    try {
      if (await isConnected && Cache.instance.isPro) {
        final remoteData = await remote.getMotels();
        await localBox.clear();
        await localBox.addAll(remoteData);
        return Right(remoteData);
      }
      return Right(localBox.values.toList());
    } catch (e) {
      return Right(localBox.values.toList()); // Fallback to local
    }
  }
}
```

### 7.4 Deduplication (Idempotency)

For recurring operations (billing, sync), always use idempotency keys:

```dart
// Hash-based dedup key
final dedupKey = sha256.convert(utf8.encode('${contractId}_${month}_${year}')).toString();
if (await alreadyProcessed(dedupKey)) return;
await processBilling(dedupKey);
```

### 7.5 OCR / Scan Integration

Use `mobile_scanner` for barcode scanning, `image_picker` for document capture.

---

## 8. Backend Integration

### 8.1 API Client Pattern

Centralized HTTP client with automatic JWT injection:

```dart
// AuthenticatedHttpClient
class AuthenticatedHttpClient {
  final String baseUrl;

  Future<http.Response> get(String path) async {
    final token = Cache.instance.sessionToken;
    return http.get(
      Uri.parse('$baseUrl$path'),
      headers: {'Authorization': 'Bearer $token'},
    );
  }
}
```

### 8.2 API Error Handling

Map HTTP status codes to domain failures:

| HTTP Status | Failure Type | UI Action |
|-------------|-------------|-----------|
| 400 | ValidationFailure | Show field errors |
| 401 | AuthFailure | Redirect to login |
| 403 | PermissionFailure | Show upgrade prompt |
| 404 | NotFoundFailure | Show "not found" message |
| 409 | ConflictFailure | Show conflict message |
| 500 | ServerFailure | Show generic error |

### 8.3 JWT Token Flow

```
Login → Receive accessToken + refreshToken
       → Cache both in SharedPreferences
       → Include accessToken in all API headers
       → On 401: call /refresh-token with refreshToken
       → On refresh failure: redirect to /login
```

---

## 9. Localization

### 9.1 Setup

```yaml
# l10n.yaml
arb-dir: lib/l10n
template-arb-file: app_en.arb
output-localization-file: app_localizations.dart
synthetic-package: false
nullable-getter: false
```

### 9.2 ARB Files

Create one file per language in `lib/l10n/`:

- `app_en.arb` — English (template)
- `app_vi.arb` — Vietnamese
- `app_zh.arb` — Chinese

**Rules:**
- Add semantic keys only (e.g., `"loginTitle": "Sign In"`)
- **NEVER use raw strings in UI code** — always use `AppLocalizations.of(context)!.keyName`
- **NEVER use code or parameters in ARB files** — keep them pure JSON
- After editing ARB files, compile: `flutter gen-l10n`

### 9.3 Usage

```dart
import 'package:.../l10n/app_localizations.dart';

Text(AppLocalizations.of(context)!.loginTitle)
```

---

## 10. Coding Conventions

### 10.1 Strict Rules

| Rule | Detail |
|------|--------|
| No raw strings in UI | All user-facing strings via L10n |
| No generic colors | Use `Colours` class only |
| No comments (unless critical) | Self-documenting code preferred |
| Riverpod safety | Guard all state updates after `await` |
| Null safety | Use `?` and `??` judiciously |
| Use `dartz` Either | For repository returns: `Either<Failure, T>` |
| Use `@freezed` | All entities and states use Freezed sealed classes |

### 10.2 Code Quality Gates

All Dart files must pass:

```bash
flutter analyze  # 0 issues
flutter test     # All tests pass
```

### 10.3 Import Organization

```dart
// 1. Dart SDK
import 'dart:convert';

// 2. Flutter SDK
import 'package:flutter/material.dart';

// 3. Third-party packages
import 'package:riverpod_annotation/riverpod_annotation.dart';

// 4. Project internal (absolute paths)
import 'package:landloard_app/src/motel/domain/entities/motel.entity.dart';
```

---

## 11. Commands & Scripts

| Command | Description |
|---------|-------------|
| `flutter pub get` | Install dependencies |
| `flutter gen-l10n` | Generate localization files |
| `flutter analyze` | Static analysis |
| `flutter test` | Run unit/widget tests |
| `flutter run` | Run app on connected device |
| `flutter build apk` | Build Android APK |
| `flutter build ios` | Build iOS IPA |
| `dart run build_runner build` | Generate Riverpod code |
| `dart run build_runner watch` | Watch & auto-gen Riverpod code |

---

## 12. Feature Checklist

When building a new feature, verify:

- [ ] Entity exists in `domain/entities/` using `@freezed` annotation
- [ ] Model exists in `data/models/` with `fromJson` / `toMap`
- [ ] Repository interface in `domain/repositories/` returning `Either<Failure, T>`
- [ ] Repository impl in `data/repositories/` wiring interface to datasource
- [ ] UseCase in `domain/usecases/` with single `call()` method
- [ ] DataSource interface + impl in `data/datasources/`
- [ ] State hierarchy in `presentation/adapter/` with 4 states
- [ ] Riverpod adapter in `presentation/adapter/` with `@riverpod`
- [ ] View screen in `presentation/views/`
- [ ] DI registration in `injection_container.dart` (correct order)
- [ ] Route added to `router.main.dart`
- [ ] L10n keys added to ALL ARB files + `flutter gen-l10n` run
- [ ] `flutter analyze` passes with 0 issues
- [ ] Both Light and Dark modes tested
- [ ] Free/Pro gating applied if premium feature
