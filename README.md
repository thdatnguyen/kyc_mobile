# PPAC Mobile — Construction Workforce Compliance App (Flutter)

Flutter (iOS + Android) app for **PPAC** (PPAC Solutions Limited) that walks workforce applicants through identity verification and gives
admins a review queue. Talks to the `kyc_be` backend (a separate repository). See
[`CONTEXT.md`](CONTEXT.md) and [`docs/assumptions.md`](docs/assumptions.md) for the shared
domain model and every decision's rationale.

## Stack

- **Framework:** Flutter 3.x, Dart 3.x
- **State:** Riverpod 3 + `riverpod_annotation`/`riverpod_generator` (codegen)
- **Models:** `freezed` + `json_serializable` (immutable entities, sealed states)
- **Routing:** `go_router` with role-based redirect (Applicant vs Admin)
- **HTTP:** `dio` + interceptors (JWT injection, auto-refresh on 401, correlation/device headers)
- **Storage:** `flutter_secure_storage` (encrypted tokens + PII draft)
- **ML (on-device):** `google_mlkit_face_detection` (liveness), `google_mlkit_text_recognition` (OCR)
- **Camera:** `camera`

## Run

```bash
flutter pub get
dart run build_runner build --delete-conflicting-outputs

# Point at your backend (defaults: Android emulator → 10.0.2.2:5001, iOS sim → localhost:5001)
flutter run --dart-define=API_BASE_URL=http://localhost:5001
```

- Start the `kyc_be` backend first (see its own README).
- Camera/ML need a real device or simulator (ML Kit and the camera won't run in a plain `flutter test`).

## Architecture

DDD layers per feature (`lib/src/features/<feature>/`), matching `SKILL_FLUTTER.md`:

```
lib/src/
├── core/                  # shared infra: config, network (dio), storage, router, theme, failure
├── features/
│   ├── auth/              # login / register / logout / session restore
│   ├── application/       # the KYC journey (personal → document → selfie → review → submit)
│   ├── admin/             # review queue (list → detail → approve/reject)
│   └── splash/
└── (each feature)/
    ├── domain/            # entities (@freezed), repositories, usecases
    ├── data/              # datasources, repository impls (dio)
    └── presentation/      # state, adapters (Riverpod), views, widgets
```

- **Repositories** return `Either<Failure, T>` (dartz); **usecases** wrap a single operation.
- **Adapters** are `@riverpod` notifiers; views `watch` them and `switch` over sealed `@freezed` states.
- **Routing** is a `@riverpod` GoRouter whose `redirect` watches auth state and routes by role.

## Key decisions (mobile-specific)

- **`dio` interceptors** (not hand-rolled) handle JWT injection, single-flight refresh on 401, and
  the `X-Request-Id` / `X-App-Version` / `X-Device-Id` / `X-Device-OS` headers the backend logs.
- **Liveness is on-device** (ML Kit face detection at capture time); the backend re-checks the face
  match authoritatively. The on-device result is a *hint*, never trusted.
- **OCR auto-fill + manual fallback**: ML Kit extracts text and best-effort fills the document
  number; the user always confirms/corrects every field.
- **PII is encrypted at rest**: the resume draft and tokens live in `flutter_secure_storage`
  (Keychain/Keystore), never plain preferences.
- **Resume**: the draft is persisted server-side (`POST /applications/me/step`) *and* cached
  on-device; on start the app restores the session and re-fetches the draft, resuming at the right
  step with fields pre-filled.

## Security

- Tokens and PII draft in encrypted storage; cleared on logout.
- No client-trusted verification: the backend recomputes the face match.
- Media displayed through the authenticated `/api/media` endpoint (owner- or admin-authorized,
  signed/redirected) — never via public URLs.

## Trade-offs & what I'd do with more time

- **Liveness is a single-frame face-presence check**, not a full blink challenge over video frames
  (the backend records `method: 'face-presence'`). A real multi-frame blink/liveness check is the
  natural next step.
- **OCR field extraction is best-effort** (longest alphanumeric token for the document number); full
  MRZ parsing per document type would improve auto-fill.
- **Images in review** are fetched by `publicId` through the media endpoint; caching (e.g.
  `cached_network_image` with auth) would improve the UX.
- **No integration/widget tests yet** — the pure logic (API error mapping) is covered; adapter and
  repository unit tests (with mocked `dio`) and a golden/widget test for the flow would round it out.

## Testing

```bash
flutter analyze   # 0 issues
flutter test      # unit tests
```
