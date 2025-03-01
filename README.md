---

# **NIC Decoder** 🆔

![Flutter](https://img.shields.io/badge/Flutter-%2302569B.svg?style=for-the-badge&logo=Flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-%230175C2.svg?style=for-the-badge&logo=Dart&logoColor=white)
![GetX](https://img.shields.io/badge/GetX-%2302569B.svg?style=for-the-badge&logo=GetX&logoColor=white)

A Flutter application to decode Sri Lankan National Identity Card (NIC) numbers. This app can extract information such as **date of birth**, **gender**, **age**, **weekday**, and **voting eligibility** from both old (9-digit) and new (12-digit) NIC formats.

---

## **Features** ✨

- **Decode Old NIC Format:**
  - Extract birth year, date of birth, gender, and voting eligibility.
  - Example: `853400937V` → Born on **December 5, 1985**, **Male**, **Eligible to Vote**.
- **Decode New NIC Format:**
  - Extract birth year, date of birth, and gender.
  - Example: `198534000937` → Born on **December 5, 1985**, **Male**.
- **User-Friendly Interface:**
  - Simple input screen to enter NIC number.
  - Detailed result screen with decoded information.
- **Built with Modern Tools:**
  - **Flutter** for cross-platform development.
  - **GetX** for state management and navigation.

Screenshots 📸
Input Screen	Result Screen
Input Screen	Result Screen



## **How to Use** 🚀

1. **Enter NIC Number:**
   - Open the app and enter your NIC number in the input field.
   - Example: `853400937V` (old format) or `198534000937` (new format).

2. **Decode NIC:**
   - Click the **Decode NIC** button to process the input.

3. **View Results:**
   - The app will display:
     - **Date of Birth**
     - **Gender**
     - **Age**
     - **Weekday**
     - **Voting Eligibility** (for old NIC format).

---

## **Installation** 📥

### **Prerequisites**
- Flutter SDK installed on your machine.
- Android Studio or VS Code for development.

### **Steps**
1. Clone the repository:
   ```bash
   git clone https://github.com/your-username/nic-decoder.git
   ```
2. Navigate to the project directory:
   ```bash
   cd nic-decoder
   ```
3. Install dependencies:
   ```bash
   flutter pub get
   ```
4. Run the app:
   ```bash
   flutter run
   ```

---

## **Technologies Used** 🛠️

- **Flutter**: For building the cross-platform application.
- **GetX**: For state management and navigation.
- **Dart**: The programming language used for development.
- **Material UI**: For designing the user interface.

---

## **Testing** �

The app includes unit tests for the NIC decoding logic. To run the tests, use the following command:

```bash
flutter test test/nic_decoder_test.dart
```

---

## **Contributing** 🤝

Contributions are welcome! If you'd like to contribute to this project, please follow these steps:

1. Fork the repository.
2. Create a new branch:
   ```bash
   git checkout -b feature/your-feature-name
   ```
3. Commit your changes:
   ```bash
   git commit -m "Add your feature"
   ```
4. Push to the branch:
   ```bash
   git push origin feature/your-feature-name
   ```
5. Open a pull request.
