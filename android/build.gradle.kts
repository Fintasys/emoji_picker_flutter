group = "com.fintasys.emoji_picker_flutter"
version = "1.0-SNAPSHOT"


buildscript {
    repositories {
        google()
        mavenCentral()
    }

    dependencies {
        classpath("com.android.tools.build:gradle:9.1.0")
        classpath("org.jetbrains.kotlin:kotlin-gradle-plugin:2.4.0")
    }
}

allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

apply(plugin = "com.android.library")

// AGP 9+ provides Kotlin. Older AGP versions, and Flutter projects that
// explicitly disable built-in Kotlin, still need the Kotlin Gradle plugin.
val agpMajorVersion =
    com.android.Version.ANDROID_GRADLE_PLUGIN_VERSION.substringBefore('.').toInt()
val builtInKotlinDisabled = findProperty("android.builtInKotlin")?.toString() == "false"
val appliesLegacyKotlin = agpMajorVersion < 9 || builtInKotlinDisabled

if (appliesLegacyKotlin) {
    apply(plugin = "kotlin-android")
}

extensions.configure<com.android.build.api.dsl.LibraryExtension> {
    namespace = "com.fintasys.emoji_picker_flutter"

    compileSdk = 35

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }

    sourceSets {
        getByName("main") {
            java.setSrcDirs(listOf("src/main/kotlin"))
        }
    }

    defaultConfig {
        minSdk = 21
    }
}

tasks.withType<org.jetbrains.kotlin.gradle.tasks.KotlinCompile>().configureEach {
    compilerOptions.jvmTarget.set(org.jetbrains.kotlin.gradle.dsl.JvmTarget.JVM_17)
}

dependencies {
    if (appliesLegacyKotlin) {
        add("implementation", "org.jetbrains.kotlin:kotlin-stdlib-jdk7:2.4.0")
    }
}
