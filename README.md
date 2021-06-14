### Objective

Using Dart and Flutter, I build a URL shortening mobile app, integrated with the [shrtcode API](https://app.shrtco.de/docs)

![Landing Screen](https://user-images.githubusercontent.com/24449076/121826341-d224b780-cce9-11eb-8cc7-21af7f49b36b.png)
![Landing page](https://user-images.githubusercontent.com/24449076/121826375-f7b1c100-cce9-11eb-8ecf-0561d70b7522.png)
![History](https://user-images.githubusercontent.com/24449076/121826440-30ea3100-ccea-11eb-8379-97239a983c6f.png)

Reference for design:

- See the designs in Figma here: https://www.figma.com/file/8VvRKh5ui1aGhnqciOIDqN/Flutter-Shorty-Design

#### Project code location

>Entire code available in `design` folder
>
### Brief

URL shortening is a technique on the Web in which a Uniform Resource Locator (URL) may be made substantially shorter and still direct to the required page. This is achieved by using a redirect that links to the web page that has a long URL. For example, the URL "https://example.com/assets/category_B/subcategory_C/Foo/" can be shortened to "https://example.com/Foo", and the URL "http://example.com/about/index.html" can be shortened to "https://goo.gl/aO3Ssc ".

User able to:

-   View the optimal layout for the mobile app depending on their device's screen size
-   Shorten any valid URL
-   See a list of their shortened links ("Link History")
-   Copy the shortened link to their clipboard in a single click
-   Delete a shortened link from their Link History
-   Receive an error message when the `form` is submitted if:
    -   The `input` field is empty

#### Libraries used
- [flutter_bloc: ^6.0.5](https://pub.dev/packages/flutter_bloc)
- [dio: ^3.0.10](https://pub.dev/packages/dio)
- [flutter_dotenv: ^3.1.0](https://pub.dev/packages/flutter_dotenv)
- [flutter_easyloading: ^2.2.2](https://pub.dev/packages/flutter_easyloading)
- [flutter_svg: ^0.19.1](https://pub.dev/packages/flutter_svg)
- [google_fonts: ^0.3.5](https://pub.dev/packages/google_fonts)
- [path_provider: ^1.6.28](https://pub.dev/packages/path_provider)
- [sqflite: ^1.3.1+2](https://pub.dev/packages/sqflite)

Required optimized assets in the `/images` folder.

There is also a `style-guide.md` file containing the information you'll need, such as color palette and fonts.
