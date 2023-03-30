# RemoveBG-App
## _This application is a simple and user-friendly tool for removing backgrounds from images. It uses the Flutter framework for the front-end and the remove.bg API for the background removal functionality._

# Features:

* Remove background from any image with just one click
* Option to save the edited image or share it directly from the app
* View the original and edited images side by side
* You can download the image directly to your phone's Gallery
* Track your usage of the remove.bg API through the app

# Requirements:

- Flutter 2.0 or higher
- Remove.bg API key (can be obtained for free from remove.bg)

# Project Preview: 


# Getting Started:

- Clone the repository or download the source code
- Obtain a remove.bg API key from remove.bg website
- Navigate to the project directory and create a file named `secrets.dart`
- Inside `secrets.dart`, create a variable named `apiKey` and assign it the API key obtained from remove.bg as a string, e.g., `final String apiKey = "YOUR_API_KEY_HERE";`
- Save and close `secrets.dart`
- Run `flutter pub get` to install the dependencies
- Connect a device or start an emulator
- Run `flutter run` to launch the app on the device or emulator

# Usage:

- Open the app on your device or emulator
- Select an image from your device's gallery or take a new photo
- Click the "Remove Background" button to remove the background from the image
- View the original and edited images side by side
- Save or share the edited image as desired

# Limitations:

- The remove.bg API has limitations on the number of requests that can be made for free. If you exceed these limits, you may need to upgrade to a paid account.
- The remove.bg API is optimized for removing backgrounds from human subjects, and may not work as well for other types of images.

# Contributing:

## _Contributions are welcome! Please submit any bug reports, feature requests, or pull requests through GitHub._

# License:

## _This application is licensed under the MIT license. See the LICENSE file for more information._
