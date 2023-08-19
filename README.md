# Flutter_workshop_all

As a part of the FlutterX Workshop Series organized by the IEEE Computer Society Student Branch Chapter of UCSC, we've built a unique travel guide application. This is a simple and user-friendly app, that functions as a travel guide which is designed to help you explore new places. 

## Technologies used

- Frontend – Flutter
> Flutter is a framework that uses Dart as its programming language to create cross-platform applications with a focus on providing a rich and customizable user interface.
- Backend – PHP 
- Database – MYSQL
  
<br>

### Requirements

- [Android Studio](https://developer.android.com/studio)
- Server Software - [XAMPP](https://www.apachefriends.org/download.html)/ [WampServer](https://www.wampserver.com/en/download-wampserver-64bits/)/ [MAMP](https://www.mamp.info/en/downloads/)

<br>

### Local development

After the above requirements have been met: 

<br>

1. Clone the Repository inside the root directory of your WAMP or XAMPP server. This is typically www for WAMP or htdocs for XAMPP and `cd` into it.

```bash
git clone https://github.com/Buddhikanip/Flutter_workshop_all.git
cd Flutter_workshop_all
```
<br>

2. Import the Database: Using PHPMyAdmin, import the provided database file that corresponds to the app. This will set up the necessary database structure for the application.

<br>

3. Start Server Software: Make sure your WAMP or XAMPP server is up and running. This will ensure that the backend PHP scripts can be executed.

<br>

### Configure API Connection

4.  Update IPV4 Address: 
> Navigate to the lib/api_connection folder within the app directory. Open the [api_connection.dart](https://github.com/LearnCsWithDIR/Flutter_workshop_all/blob/master/Frontend/lib/API_connection/API_connection.dart) file. <br/>
> Inside the [api_connection.dart](https://github.com/LearnCsWithDIR/Flutter_workshop_all/blob/master/Frontend/lib/API_connection/API_connection.dart) file, you'll find a section where the `IPV4` address is specified. Locate the line that mentions the IPv4 address and update it with your computer's actual IPV$ address. This is crucial for the app to communicate with the backend server.
 
 ```dart
 static const host = "http://ADD IPV4 Address/Flutter_workshop_all/Backend/";
 ```
<br>

#### Here's how to find your IPV4 address:

##### Windows: 

1. Press `Win` + `R` to open the Run dialog.

2. Type `cmd` and press `Enter` key to open the Command Prompt.

3. In the Command Prompt, type `ipconfig` and press `Enter`.
```bash
ipconfig
```

4. Under the `Wireless LAN adapter` section, look for the `IPv4 Address`.

##### Mac or Linux:

1.	Open a Terminal window.

2.	Type `ifconfig` (or `ip a` on newer systems) and press Enter.

```bash
ifconfig
```

```bash
ip a
```

3.	Look for the `inet` or `inet addr` field under your active network interface.

<br>

#### Copy the discovered IPV4 address and replace the in the [api_connection.dart](https://github.comLearnCsWithDIR/Flutter_workshop_all/blob/master/Frontend/lib/API_connection/API_connection.dart) file with it.

### How to run

1. Open Project in Android Studio:
> Launch Android Studio and open the `Frontend` Application project.

2. Configure Dependencies:
> In the project explorer, locate and open the [pubspec.yaml](https://github.com/LearnCsWithDIR/Flutter_workshop_all/blob/master/Frontend/pubspec.yaml) file. This file contains the list of dependencies for the app. <br>
> Open your Android Studio terminal and run `flutter pub get`

```bash
flutter pub get
```

3. Select Virtual Device or Connect Device:
> In Android Studio's toolbar, you will find a dropdown menu labeled `Select Device` or `Connected Devices`. From this menu, you can either choose a virtual device (emulator) or connect your physical mobile device to your computer.

4. Explore the App:
> You can now explore the app's features by interacting with the user interface on the virtual device or your connected mobile device.

<br>

- We have inserted some dummy data into the database, you can test the app using them.
> Use : `b@b.com` as the Email and `123` as the Password to sign in to test.<br>
> Use : `d@d.com` as the Email and `123` as the Password to sign in to test.

- Else you can signup through the app and use your own credentials to test.

<br>

*If any of the lines `132` `144` `156` `168` in the [Frontend/lib/Utils/suggestionConstantBox.dart](https://github.com/LearnCsWithDIR/Flutter_workshop_all/blob/master/Frontend/lib/Utils/suggestionConstantBox.dart) give you an error saying that SDK version is old, comment those lines and restart your application.

<br>

<p align="center">
    <a href="https://github.com/LearnCsWithDIR/Flutter_workshop_all">
      <img alt="Hits" src="https://hits.sh/github.com/LearnCsWithDIR/Flutter_workshop_all.svg?label=Views"/>
    </a>
    <a href="https://github.com/LearnCsWithDIR/Flutter_workshop_all/actions">
      <img alt="Tests Passing" src="https://github.com/anuraghazra/github-readme-stats/workflows/Test/badge.svg" />
    </a>
    <a href="https://github.com/LearnCsWithDIR/Flutter_workshop_all/graphs/contributors">
      <img alt="GitHub Contributors" src="https://img.shields.io/github/contributors/LearnCsWithDIR/Flutter_workshop_all" />
    </a>
    <a href="https://github.com/LearnCsWithDIR/Flutter_workshop_all/issues">
      <img alt="Issues" src="https://img.shields.io/github/issues/LearnCsWithDIR/Flutter_workshop_all?color=0088ff" />
    </a>
    <a href="https://github.com/LearnCsWithDIR/Flutter_workshop_all/pulls">
      <img alt="GitHub pull requests" src="https://img.shields.io/github/issues-prLearnCsWithDIR/Flutter_workshop_all?color=0088ff" />
    </a>
  </p>
