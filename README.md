# world_time_app
this deletes your Build folder and
**flutter clean**

and when you run build again it re-builds it
this line creates the apk according to your CPU architecture.
**flutter build apk --release --target-platform android-arm,android-arm64,android-x64**

and also add this line in the 'android/app/src/main/AndroidManifest.xml' file just before the <application> tag
this line make your apk app have the internet permission because what happens without this is 
the app won't have the internet and also there is minimal error handling, so a grey screen appears only
**<uses-permission android:name="android.permission.INTERNET"/>**

app project for world time, this uses 
'timeapi.io' API to fetch the time related details, with location parameter.
and display it cleanly.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
