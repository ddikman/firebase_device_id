# firebase_device_id

Helper package to get the firebase device ID in Flutter to use for remote config testing. Exposes this functionality which is otherwise missing in the [FlutterFire](https://firebase.flutter.dev/docs/overview/) packages. 

![Auth token in example app](https://github.com/ddikman/firebase_device_id/blob/main/app-example.png)

## Why use this project?

Quite probably, if you have come so far as to begin using AB tests in your Firebase setup, likely, you have also got Firebase messaging set up.

If this is the case and you want to try your AB tests using specific device tokens, go ahead and [FCM token](https://flutteragency.com/how-to-get-firebase-token-in-flutter/) to identify your device for testing.

![Test devices in firebase console](https://github.com/ddikman/firebase_device_id/blob/main/test-devices.png)

If you want to get this token without relying on cloud messaging however, you can do so using the `Firebase installation` package which comes bundled with [firebase_core](https://pub.dev/packages/firebase_core).

This project packages a solution, even if crude, and shows a practical example of how to get this token.

## Usage

```dart
final token = await getDeviceToken();
```

Then for how to actually use it? I would recommend getting the device token with the method above and copying it to clipboard. Then you can send it to slack or something to add into Firebase AB test to use. 

## Source usage

The code to get the token and setup, is taken from the official documentation for [Firebase installations](https://firebase.google.com/docs/projects/manage-installations).