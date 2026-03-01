# Assignment 2 Walkthrough

I have successfully completed the implementation of the "Mobile Application Development Assignment 2" in Flutter, adhering to your request for a very simple design.

## Changes Made

1. **Project Setup & Dependencies**
   - Added `battery_plus` for system battery states.
   - Added `video_player` for video playback.
   - Added `audioplayers` for audio playback.

2. **Drawer Navigation Shell**
   - Created a main `Scaffold` with a `Drawer` containing 4 menu items to navigate between the assignment features.
   - Used `Theme.of(context).colorScheme.inversePrimary` for a simple, clean Material 3 look.

3. **Broadcast Receiver Flow (`lib/pages/broadcast_receiver_page.dart`)**
   - **Selection Activity:** A screen with a simple dropdown to choose between "Custom broadcast" and "System battery notification".
   - **Custom Broadcast:** Implemented a navigation flow passing a custom text string from a `TextField` input screen to a Receiver screen that displays it.
   - **Battery Notification:** Used `battery_plus` to listen to changes in battery state and display the system's battery percentage and state (charging/discharging).

4. **Image Scale Page (`lib/pages/image_scale_page.dart`)**
   - Used Flutter's built-in `InteractiveViewer` widget to load a sample image from the internet and allow pinch-to-zoom gestures natively with no complicated math required.

5. **Video Playback Page (`lib/pages/video_page.dart`)**
   - Implemented a simple video player using `video_player` that streams a sample MP4 video from the internet, featuring a play/pause floating action button.

6. **Audio Playback Page (`lib/pages/audio_page.dart`)**
   - Implemented an audio player using `audioplayers` that plays a sample MP3 from the internet. It includes a slider (seek bar), duration indicators, and a play/pause button.

## Validation Results

- **Build Verification:** Ran `flutter build apk` successfully, confirming that all plugins and Dart code compile properly without errors for Android.
- **Next Steps:** You can now run the app on your emulator or physical device using your IDE or by running `flutter run` in your terminal. You can test each of the Drawer menu options to verify the behavior!
- **GitHub Repository:** The complete base project, navigation UI, and all features have been successfully pushed to `https://github.com/joysarkar077/Broadcast-Receiver`. I organized the initial push into sensible, logical commits.
