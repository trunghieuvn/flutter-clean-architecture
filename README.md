# Flutter

 - Flutter     v2.0.3


# Development 

Visual code Extension: 

* Bloc: https://marketplace.visualstudio.com/items?itemName=FelixAngelov.bloc

## Run

```
    flutter run --flavor dev
    flutter run --flavor prod
```

## Build

```
    flutter build apk --flavor dev
    flutter build ios --flavor dev
```

## Prod
```
    flutter build apk --flavor prod
    flutter build ios --flavor prod
```
flutter build appbundle 
flutter build apk
## Android SignKey 

```
    ./gradlew signingReport
```

## Generate

### Icon
```
    flutter pub run flutter_launcher_icons:main
```

### Model, api retrofit
```
    flutter packages pub run build_runner build --delete-conflicting-outputs
```

# How to run Unit test
```
sh run_test.sh
```

