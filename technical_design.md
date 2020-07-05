# Design

**Target device**: mobile device

**OS**: Android, possibly IOS in future (therefore cross platform compatible development)

**Framework**: Flutter

**Programming language**: Dart

**Version management**: Git

**Backup Server**: Github

## Packages

| package name       | package description                                              | status    | use case                                                                                         |
| ------------------ | ---------------------------------------------------------------- | --------- | ------------------------------------------------------------------------------------------------ |
| google_fonts       | load and use free fonts from google font library                 | important | dynamic font loading                                                                             |
| liquid_swipe       | liquid swipe animation                                           | optional  | interesting animations                                                                           |
| path_provider      | cross platform common paths                                      | extra     | cross platform development (e.g. when selecting an image for the profile picture)                |
| shared_preferences | save app preferences like theme or notifications turned on / off | extra     | cross platform preference saving for themes or notification settings, etc.                       |
| auto_size_text     | auto fit text to given size and maximal lines                    | important | avoid out of space errors and make application resizable on different resolutions / screen sizes |
| confetti           | confetti animation                                               | optional  | interesting animations and effects                                                               |
| blurhash           | get blur hash of image                                           | optional  | interesting loading animation                                                                    |
| getwidget          | ui and widget library                                            | important | beautiful ui design                                                                              |
| redux              | dart redux architecture implementation                           | important | software architecture                                                                            |
| flutter_redux      | dart reduc architecture implementation extended                  | important | software architecture                                                                            |
| firebase packages  | networking, authentification, database, firestore, etc.          | important | networking, authentification, database, firestore, etc.                                          |

animations, 
simple_animations, 
nice_intro, 
intro_views, 
introduction_screen, 
intro_slider, 
sequence_animations, 
theme_provider,
animated_theme_switcher,
persist_theme,
dynamic_theme,
