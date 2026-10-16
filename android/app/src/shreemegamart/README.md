# shreemegamart flavor — JustPress Store

This flavor builds the **JustPress Store** app (project RET2690). Its
`applicationId` is `com.justpress.store`, registered in the Firebase project
`ecommerce-eroc`; `google-services.json` in this directory is that app's config.
The app reads it at startup on Android (see `_firebaseOptions` in `lib/main.dart`).

If the package name and `google-services.json` ever disagree,
`flutter build ... --flavor shreemegamart` fails at the
`com.google.gms.google-services` step with "No matching client found for
package name".

The backend sends push notifications with this project's service account,
stored per tenant (admin panel > Integrations > Firebase). Never commit that
key file.

Also needed before a signed release build: `android/key.shreemegamart.properties`
pointing at a keystore (see `android/key.myneedmart.properties` for the
expected shape). Until then, release builds for this flavor fall back to the
debug signing key.

App icons for this flavor live in `android/app/src/shreemegamart/res/mipmap-*`.
