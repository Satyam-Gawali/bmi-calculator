# BMI Calculator

A simple Flutter app that calculates Body Mass Index (BMI) based on user input. The app supports multiple weight and height units and provides BMI categories with color-coded indicators.

## Features

- Input weight in **Kilograms (kg)** or **Pounds (lbs)**.

- Input height in **Centimeters (cm)**, **Meters (m)**, **Feet (ft)**, or **Inches (in)**.

- Calculates BMI based on the formula:

  \(BMI = \frac{Weight (kg)}{Height (m)^2}\)

- Automatically converts weight and height into the appropriate metric units for accurate BMI calculation.

- Displays BMI value along with a categorized result.

- Uses color-coded indicators to show BMI range visually.

- Responsive and user-friendly UI with input validation.

- Supports touch-friendly controls for easy unit selection.

## Installation

### Prerequisites

Ensure you have Flutter installed on your system. If not, install it by following the official guide: [Flutter Installation Guide](https://flutter.dev/docs/get-started/install)

### Steps to Install and Run

1. Clone this repository:
   ```sh
   git https://github.com/Satyam-Gawali/bmi-calculator.git
   ```
2. Navigate to the project directory:
   ```sh
   cd bmi-calculator
   ```
3. Install dependencies:
   ```sh
   flutter pub get
   ```
4. Connect a physical device or start an emulator.
5. Run the app using:
   ```sh
   flutter run
   ```

## Usage

1. Open the app on your device or emulator.
2. Enter your **weight** in the provided text field.
3. Select the appropriate weight unit (Kilograms or Pounds) from the dropdown.
4. Enter your **height** in the corresponding text field.
5. Select the appropriate height unit (Centimeters, Meters, Feet, or Inches) from the dropdown.
6. Tap on the **Check BMI** button.
7. View your **BMI value** and **category** displayed below the button.
8. Observe the **color-coded progress bar**, which visually represents your BMI category.

## BMI Categories

BMI values are classified into different categories as per health standards:

| BMI Range       | Category      | Color Indicator |
|-----------------|---------------|-----------------|
| BMI < 18.5      | Underweight   | Blue            |
| 18.5 ≤ BMI < 25 | Normal weight | Green           |
| 25 ≤ BMI < 30   | Overweight    | Orange          |
| BMI ≥ 30        | Obese         | Red             |

### Color Code Meaning:

- **Blue**: Underweight (Consider increasing nutritional intake and consulting a doctor if necessary.)
- **Green**: Normal weight (You are within a healthy weight range.)
- **Orange**: Overweight (Consider lifestyle changes such as balanced diet and exercise.)
- **Red**: Obese (It is recommended to seek medical advice for a healthier lifestyle.)

## Screenshots

![Screenshot Description]([https://your-image-url.com/screenshot.png](https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTgqqXrahkoxTFYwrXLFetc0QgtC4KgFN81xQ&s))

## Technologies Used

- **Flutter**: Front-end framework
- **Dart**: Programming language
- **Material Design**: UI components and styling

## Future Enhancements

- Add BMI history tracking feature.
- Introduce graphical charts to visualize BMI trends.
- Implement personalized health tips based on BMI category.
- Include a dark mode option.

## License

This project is open-source and licensed under the MIT License. Feel free to use, modify, and distribute it in accordance with the license terms.

---

Developed with ❤️ using Flutter.

#

