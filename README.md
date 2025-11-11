# Flutter
    - Flutter     v3.35
    - Clean Architecture
    - Presentation impl with MVVM use Bloc
    - Pipline verify code PR
    - Unit test > 90%
    
    codecov: <a href="https://codecov.io/gh/trunghieuvn/flutter-clean-architecture"><img src="https://codecov.io/gh/trunghieuvn/flutter-clean-architecture/branch/develop/graph/badge.svg" alt="codecov"></a>


# Technical architecture components
- MVVM 
- Dart rule analyze: pedantic
- State management: flutter_bloc
- Dependency injection: get_it 
- Network: retrofit 
- Unit test: Mockito 
- CI/CD: pipeline lint use github action 

# Architecture

Apply Clean Architecture + MVVM (with ViewModel used to replace the traditional ViewModel).

```
|-----------------  Layers  ------------------|
| Presentations  |  Doamin     |   Data Layer |
|:-------------------------------------------:|

|--------------------------  Actual  ---------------------------|
| Presentations  |        Doamin          |         Data        |
|:-------------------------------------------------------------:|
|  UI <--> ViewModel <--> UseCase <--> Repository <--> API/Local|
|:-------------------------------------------------------------:|
|:----       Entity         ----|----       Model      --------:|
|:-------------------------------------------------------------:|
```
![diagram-architecture](https://user-images.githubusercontent.com/13028582/192195548-69a082dc-1c78-4407-b36c-66d692cb6aa9.png)


### UI
- This is the main interface of the application. It is classified into 3 main categories as:
   - Screen
   - Epic
   - Shared UI
   - 
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

