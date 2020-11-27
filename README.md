# Chatbot Flutter

 - Flutter     v1.22 stable


# Development 

Visual code Extension: 

* View widgets tree: https://marketplace.visualstudio.com/items?itemName=CoenraadS.bracket-pair-colorizer
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
flutter build appbundle --target-platform android-arm,android-arm64,android-x64
flutter build apk --target-platform android-arm,android-arm64,android-x64 --split-per-abi
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

# How to runn Unit test
```
sh run_test.sh
```

