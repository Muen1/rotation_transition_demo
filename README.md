# Refresh Quote App

This is a Flutter app demonstrating the **RotationTransition** widget to animate a refresh icon while displaying random motivational quotes.

## Getting Started

### 1. Clone the Repository
```bash
git clone https://github.com/Muen1/rotation_transition_demo
cd rotation_transition_demo
```

### 2. Install Dependencies
```bash
flutter pub get
```

### 3. Run the app
```bash
flutter run
```

### 4. Try it out
Tap the New Quote button, the refresh icon will rotate for 3 seconds then a new motivational quote appears, and a SnackBar confirms the refresh.

## Rotation Transition Attributes
This demo highlights the three main attributes of the RotationTransition widget:

### 1. Turns – Controls how much the widget rotates, using an Animation<double> from an AnimationController.

### 2. Alignment – Sets the pivot point of rotation. Here, it’s Alignment.center, so the icon spins around its center.

### 3. Child – The widget being rotated. In this app, it’s the refresh icon, but any widget can be used.


