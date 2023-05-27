# job_thing_technical_test

A Technical Test Project

**1. Architecture**

The application is built using the **clean architecture** with the **Bloc pattern**. This architecture promotes separation of concerns and maintainability by dividing the codebase into different layers such as Presentation (UI), Domain (Business Logic), and Data (Repository and Data Sources).

**2. Libraries**

The following libraries were added to the app and serve the following purposes:

- flutter_bloc: ^8.1.3 - Implements the Bloc pattern for state management, making it easier to handle and update the application state.
- cached_network_image: ^3.2.3 - Provides image caching and efficient loading of images from network sources.
- equatable: ^2.0.5 - Simplifies equality comparisons between Dart objects by automatically generating equality and hashcode methods.
- google_fonts: ^4.0.4 - Allows easy integration of Google Fonts in Flutter applications, providing a wide range of font choices.
- auto_route: ^7.2.0 - Simplifies the navigation process by generating route management code based on annotations.
- lottie: ^2.3.2 - Enables the usage of Lottie animations in the application, adding visually appealing animations.
- logger: ^1.3.0 - Provides a simple logger for debugging and logging application events during development.
- dio: ^5.1.2 - A powerful HTTP client for Dart that supports various request and response interceptors.
- pretty_dio_logger: ^1.3.1 - Enhances Dio's logging capabilities by formatting and displaying HTTP logs in a readable manner.
- retrofit: ^4.0.1 - A type-safe HTTP client generator that simplifies API integration by generating code based on annotated interfaces.
- flutter_screenutil: ^5.8.2 - Offers a convenient way to adapt UI dimensions based on the device's screen size and pixel density.
- json_annotation: ^4.8.1 - Provides annotations for automatically generating JSON serialization/deserialization code.
- dartz: ^0.10.1 - Implements functional programming concepts in Dart, including Option and Either types for handling errors and nullability.
- get_it: ^7.6.0 - A lightweight service locator that allows the registration and retrieval of dependencies throughout the application.
- intl: ^0.18.1 - Offers internationalization and localization support for displaying translated text and formatting dates, numbers, and currencies.
- bot_toast: ^4.0.4 - Enables the display of toast notifications in the application.
- font_awesome_flutter: ^10.4.0 - Allows the usage of Font Awesome icons in Flutter applications.
- url_launcher: ^6.1.11 - Provides a simple way to launch URLs, making it easier to navigate to external resources.

The above libraries were chosen based on their respective functionalities, which helped in achieving desired features and reducing development time. The decision to rely on these libraries was made to leverage the existing solutions available in the Flutter ecosystem, promoting code reuse and avoiding reinventing the wheel.

**3. Time Spent**

The test was completed within a time frame of 1 day.

**4. Further Improvements and New Features**

Given more time, the following improvements and new features could be considered for the application:

- Enhancing the filter functionality on the homepage: Although the Bloc pattern was successfully implemented for handling filters, further improvements can be made to optimize the filtering logic and provide a more intuitive user experience.
- Implementing a favorites feature: Adding the ability for users to mark items as favorites and saving them for quick access.
- Implementing pagination or infinite scrolling: If the app deals with a large amount of data, implementing pagination or infinite scrolling can improve performance and user experience.
- Enhancing error handling and feedback: Providing better error handling and informative error messages to guide users when something goes wrong.
- Adding unit tests and integration tests: Increasing test coverage to ensure the reliability and stability of the application.

**5. Proud Aspect**

One aspect of the submission that stands out is the successful implementation of the Bloc pattern for handling filters on the homepage. This implementation required careful consideration of managing state, handling user interactions, and updating the UI accordingly. It demonstrates the ability to separate concerns and maintain a clean and organized codebase.

**6. Time Allocation and Challenges**

The majority of the time was spent on designing and implementing the user interface. As there was no clear visual direction initially, it required exploration and decision-making to create an appealing and intuitive UI that aligns with the application's purpose.

The most challenging part was handling the filter logic within the Bloc pattern. The complexity arose from managing different filter options, combining multiple filters, and ensuring the UI reflects the selected filters accurately. It required thorough testing and debugging to ensure the desired functionality was achieved.

**7. Quality or Quantity**

When it comes to software development, quality is paramount. While quantity may imply delivering more features, it is essential to prioritize the quality of the features being implemented. A high-quality application ensures reliability, maintainability, and a positive user experience. Therefore, focusing on quality over quantity is crucial for the success of any project.
