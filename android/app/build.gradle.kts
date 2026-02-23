//Firebase code********************
plugins {
    id("com.android.application")
    id("kotlin-android")
    // Flutter Gradle Plugin (must be last)
    id("dev.flutter.flutter-gradle-plugin")
    id("com.google.gms.google-services")
}
//Firebase code********************

android {
    namespace = "com.tuhin.chatapp"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = flutter.ndkVersion

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    kotlinOptions {
        jvmTarget = "11"
    }

    defaultConfig {
        applicationId = "com.tuhin.chatapp"

        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion

        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    buildTypes {
        release {
            // Debug signing for now (OK for testing)
            signingConfig = signingConfigs.getByName("debug")
            isMinifyEnabled = false
            isShrinkResources = false
        }
    }
}


flutter {
    source = "../.."
}

//Firebase code*****************************************
dependencies {
    // Firebase BoM (Recommended)
    implementation(platform("com.google.firebase:firebase-bom:34.9.0"))

    // Firebase Analytics
    implementation("com.google.firebase:firebase-analytics")

    // 👉 Future use (uncomment when needed)
    // implementation("com.google.firebase:firebase-auth")
    // implementation("com.google.firebase:firebase-firestore")
}
//Firebase code******************************************