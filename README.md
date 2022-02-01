<p align="center">
<img src="https://github.com/Grrravity/NewsPaperApp/blob/78b8ac90d4a42a1b5f9d43eeae0efb1ae5319493/assets/logo/newsapp_logo.png" height="100" alt="NewsPaperApp" />
</p>

---
# NewsPaperApp

NewsPaperApp is a flutter project to show how great it is to build cross plateforme apps.
This app is an easy-to-use digital news feed.

## Architecture
This project use a custom MVC pattern with some addition of my liking.
Model : Contains entities / sqlite database to store data
View: Contains pages and widgets to display in the UI
Controller : Contains the business logic for each view
Core : Contains utils and core functions like constants, env, error management system, navigation management...
Infrastructure : ContainsAPI connection and repository implementations

### In this project:

- Core folder contains global utility class or functions like
  - Handeling errors & exceptions
  - Handeling navigation system
  - Constants
  - Env file

- Infrastructure contains API connection and repository implementationsContainsAPI connection and repository implementations
  - Handle http rest method
  - Overcharge calls with required headers
  - Convert api returns in object

- Model contains the data objects 
  - SQLite database
  - Object entities (model)

- Views contains the UI
  - Pages displayed
  - Reusable widgets with Factory
  

| Implementations      | status |
| :----------- | :----:  |
| Android support   | ✔️        |
| iOS support   | ✔️        |
| Tablet support   | :hourglass_flowing_sand:        |
| Web support   | :hourglass_flowing_sand:        |
| Desktop support   | :x:        |
| Testing   | :hourglass_flowing_sand:   |

## Android Installation *(require at least Flutter SDK)*

* Ensure your Android device has developer mode and usb debugging enabled

* Ensure your device is connected to your computer with usb 

1. Open in a terminal the targeted folder you wish to clone the project to

```bash
git clone https://github.com/Grrravity/NewsPaperApp.git
```

2. Get into the folder then install the apk on your phone

```bash
cd NewsPaperApp
flutter build apk
flutter install
```

## iOS Installation *(require at least Flutter SDK and XCode)*

* Ensure your iOS is connected and has given authorization to Xcode

1. Open in a terminal the targeted folder you wish to clone the project to in a terminal

```bash
git clone https://github.com/Grrravity/NewsPaperApp.git
```

2. Get into the folder then build the iOS app

```bash
cd NewsPaperApp
flutter build ios
```

3. Now in Xcode, open Runner.xcworkspace in your NewsPaperApp app's ios folder

4. Select your device in the list next to the runner and press Run icon

## APK Installation
* Check that your phone accept unknown source apk

1. Download the apk from [available soon]

2. Paste the apk in your Android's storage

4. Then open the apk from your Android file explorer, install it and launch it.
