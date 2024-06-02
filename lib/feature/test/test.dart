import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

class TestWeidget extends StatelessWidget {
  const TestWeidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () => googleSignIn(context),
                child: const Text("SIGN IN WITH GOOGLE")),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () => signOut(), child: const Text("SIGN out"))
          ],
        ),
      ),
    );
  }
}

/////////////////////////   google sign in code /////////

final GoogleSignIn _googleSignIn = GoogleSignIn();
final FirebaseAuth _auth = FirebaseAuth.instance;

Future<void> googleSignIn(BuildContext context) async {
  try {
    GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();

    if (googleSignInAccount == null) {
      return;
    }

    GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

    AuthCredential authCredential = GoogleAuthProvider.credential(
      idToken: googleSignInAuthentication.idToken,
      accessToken: googleSignInAuthentication.accessToken,
    );

    UserCredential userCredential =
        await _auth.signInWithCredential(authCredential);

    print(userCredential.user?.email);
    print(userCredential.user?.photoURL);
  } catch (e) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('error'),
          content: Text('$e'),
          actions: <Widget>[
            TextButton(
              child: const Text('ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

Future<void> signOut() async {
  await _googleSignIn.signOut().then((value) {
     print('logout');
     print(value);
  },);
 
}





/*

 اول خطوة تستخدم الكومنت ده 

keytool -genkey -v -keystore "C:\Users\YourUsername\my-release-key.keystore" -keyalg RSA -keysize 2048 -validity 10000 -alias my-key-alias



هدخل البيانات بتاعتك بعد كده تدخل البيانات دى بسى مراعه ازاله اليوزر نيم والباسورد 

keytool -list -v -keystore "C:\Users\YourUsername\my-release-key.keystore" -alias my-key-alias -storepass my-store-password -keypass my-key-password



3 خطوة هتحط البيانات فى firebase finger print

رابع خطوة هتخش على ملف build.gridle

buildscript {
    repositories {
        google()  
        mavenCentral()  
    }

    dependencies {
        classpath 'com.android.tools.build:gradle:8.0.2' 
        classpath 'com.google.gms:google-services:4.4.1'
    }
}



allprojects {
    repositories {
        google()
        mavenCentral()
    }
}





خامس خطوة تخش على ملف  build.gridle الموجود فى app

plugins {
    id "com.android.application"
    id 'com.google.gms.google-services'  // لإعداد FlutterFire
    id "kotlin-android"
    id "dev.flutter.flutter-gradle-plugin"
}

def localProperties = new Properties()
def localPropertiesFile = rootProject.file('local.properties')
if (localPropertiesFile.exists()) {
    localPropertiesFile.withReader('UTF-8') { reader ->
        localProperties.load(reader)
    }
}

def flutterVersionCode = localProperties.getProperty('flutter.versionCode') ?: '1'
def flutterVersionName = localProperties.getProperty('flutter.versionName') ?: '1.0'

android {
    namespace "com.example.finder"
    compileSdk flutter.compileSdkVersion
    ndkVersion flutter.ndkVersion

    compileOptions {
        sourceCompatibility JavaVersion.VERSION_1_8
        targetCompatibility JavaVersion.VERSION_1_8
    }

    kotlinOptions {
        jvmTarget = '1.8'
    }

    sourceSets {
        main.java.srcDirs += 'src/main/kotlin'
    }

    defaultConfig {
        applicationId "com.example.finder"
        minSdkVersion 21
        targetSdkVersion 33
        versionCode flutterVersionCode.toInteger()
        versionName flutterVersionName
    }

    signingConfigs {
        release {
            keyAlias 'my-key-alias'
            keyPassword 'باسورد'
            storeFile file('C:/Users/belal mohamed ali/my-release-key.keystore')
            storePassword 'باسورد'
        }
    }

    buildTypes {
        release {
            signingConfig signingConfigs.release
            minifyEnabled false
            proguardFiles getDefaultProguardFile('proguard-android-optimize.txt')
        }
    }
}

flutter {
    source '../..'
}

dependencies {
    implementation fileTree(dir: 'libs', include: ['*.jar'])
    implementation 'androidx.appcompat:appcompat:1.4.1'
    implementation 'com.google.firebase:firebase-auth:21.0.6'
    implementation 'com.google.android.gms:play-services-auth:20.2.0'
}



وتراعى انك محدث ملف google-services


**/