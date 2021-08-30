# Flutter
    - Flutter     v2.2.3
    - Clean Architecture
    - Presentation impl with MVVM use Bloc
    - Pipline verify code PR
    - Unit test > 90%
    
# Technical architecture components
- MVVM 
- Dart rule analyze: pedantic
- State management: flutter_bloc
- Dependency injection: get_it 
- Network: retrofit 
- Unit test: Mockito 
- CI/CD: pipeline lint use github action 


## TODO 
- flavor native 
- localization


# Development 

Visual code Extension: 

* Bloc: https://marketplace.visualstudio.com/items?itemName=FelixAngelov.bloc

## Run

```
    flutter run
```

## Build

```
    flutter build apk
    flutter build ios
    flutter build appbundle 

```

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
# Unit test
![Unit Test](https://github.com/trunghieuvn/flutter-clean-architecture/blob/develop/screenshot/unit-test.png?raw=true)

# How to run Unit test
```
sh run_test.sh
```

