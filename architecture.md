# Bookery software architecture



*REDUX + MVVM (Model-View-ViewModel)*



Project structure:

- actions
  
  - naming: [modelName]_actions.dart
  
  - action classes containing payload and constructor

- config
  
  - naming: [topic]_config.dart
  
  - global static variables

- middleware
  
  - naming: [modelName / featureName]_middleware.dart

- models
  
  - naming: [modelName].dart

- reducers
  
  - naming: [modelName]_reducer.dart

- ui
  
  - subfolder screens
    
    - folder naming: [screenName]
    
    - subfile [screenName]_view.dart
    
    - subfile [screenName]_viewModel.dart
  
  - subfolder shared
    
    - naming: [widgetName].dart

- utils
  
  - naming: [feature]_util.dart
  
  - global helper classes and functions

- app.dart
  
  - containing material app and global app settings

- app_state.dart
  
  - global static immutable app state

- main.dart
  
  - starting point of the application, launching App MaterialApp in app.dart

- router.dart
  
  - helper methods and variables for navigating to different screens
