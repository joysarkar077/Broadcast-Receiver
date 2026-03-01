# Flutter Assignment Implementation Plan

The goal is to implement the "Mobile Application Development Assignment 2" requirements using **Flutter** in the simplest way possible, as requested. Although the original assignment is meant for native Android, we will adapt the concepts to Flutter using popular, easy-to-use packages.

## Proposed Changes / Architecture

We will create a single Flutter application with a main `Scaffold` that features a `Drawer` for navigation, fulfilling the "Drawer Menu" requirement.

### Dependencies to add to `pubspec.yaml`:
- `battery_plus`: To get system battery percentage (fulfills "System battery notification receiver").
- `video_player`: To play a video within the app.
- `audioplayers`: To play an audio file within the app.

### Screens / Flow

#### 1. Main Navigation (Drawer)
- A global `Scaffold` with a `Drawer` widget containing 4 `ListTile` options:
  - Broadcast Receiver
  - Image Scale
  - Video
  - Audio

#### 2. Broadcast Receiver Flow
**Page 1 (Selection):**
- A simple page with a `DropdownButton` (representing the Android Spinner) having two options:
  1. Custom broadcast receiver
  2. System battery notification receiver
- A "Next" `ElevatedButton`.

**Page 2a (Custom Broadcast Input):** *(If option 1 is selected)*
- A `TextField` to take plain text input.
- A "Send Broadcast" button that navigates to the Third Activity.

**Page 3 (Custom Broadcast Receiver):** *(If option 1 is selected)*
- To mimic a "custom broadcast receiver" simply in Flutter, we will use Flutter's built-in `ValueNotifier` or pass the data directly via Navigation arguments to simulate receiving the message and displaying it on screen.

**Page 2b (Battery Receiver):** *(If option 2 is selected)*
- Uses the `battery_plus` package to listen to battery state changes and display the current battery percentage natively.

#### 3. Image Scale Page
- Uses Flutter's built-in `InteractiveViewer` widget wrapping an `Image.network('...')`. This handles the pinch-to-zoom gesture automatically with zero extra math required.

#### 4. Video Page
- Uses the `video_player` package to load and play a sample MP4 video from the internet.

#### 5. Audio Page
- Uses the `audioplayers` package to load and play a sample MP3 audio from the internet.

## User Review Required

> [!CAUTION]
> As this assignment was originally for Native Android (specifically asking for Android `BroadcastReceiver` and Intents), using Flutter means we will be *simulating* the custom broadcast receiver using Flutter state management/navigation, and using plugins for things like Battery. 
> 
> **Are you okay with this adaptation?** If your instructor strictly requires native Android `BroadcastReceiver` code (Java/Kotlin), a Flutter app might not be accepted unless they are okay with cross-platform equivalents.

## Verification Plan

### Automated / Build Verification
- Run `flutter pub get` successfully.
- Ensure the app builds (`flutter build apk`) without errors.

### Manual Verification
- **Drawer:** Open the app and verify the side drawer exists with 4 items.
- **Broadcast Flow 1:** Select "Custom", enter text "Hello", verify the third screen receives and displays "Hello".
- **Broadcast Flow 2:** Select "Battery", verify it shows the device's battery percentage.
- **Image:** Navigate to Image screen and try pinching to zoom.
- **Media:** Navigate to Video and Audio screens to verify playback works.
