import 'package:design/repository/repository.dart';
import 'package:design/repository/repository_interface.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart' as DotEnv;

import 'bloc/bloc.dart';
import 'repository/network_call/data_provider.dart';
import 'repository/network_call/network_call.dart';
import 'routes/route_generator.dart';
import 'routes/routes.dart';
import 'simple_bloc_delegate.dart';

void main() async {
  await DotEnv.load(fileName: '.env');
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent, // transparent status bar
  ));

  Bloc.observer = SimpleBlocDelegate();

  final _dio = new Dio();
  _dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
  _dio.interceptors.add(LoggingInterceptors());

  final dataProviderClient = DataProviderClient(dio: _dio);

  final repository = UserRepository(dataProviderClient: dataProviderClient);
  runApp(Shortly(repository: repository));
}

class Shortly extends StatelessWidget {
  final RepositoryInterface repository;
  final int primaryColor = 0xFF2ACFCF;
  final int secondaryColor = 0xFF3B3054;

  ThemeData theme;
  TextTheme textTheme;

  Shortly({Key key, @required this.repository}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    configLoading(context);
    theme = Theme.of(context);
    textTheme = theme.textTheme;

    TextTheme appTextTheme = GoogleFonts.latoTextTheme(textTheme).copyWith(
      bodyText1: GoogleFonts.poppins(textStyle: textTheme.bodyText1),
      bodyText2: GoogleFonts.poppins(textStyle: textTheme.bodyText2),
      headline6: GoogleFonts.poppins(textStyle: textTheme.headline6),
      headline5: GoogleFonts.poppins(textStyle: textTheme.headline5),
      headline4: GoogleFonts.poppins(textStyle: textTheme.headline4),
      headline3: GoogleFonts.poppins(textStyle: textTheme.headline3),
      headline2: GoogleFonts.poppins(textStyle: textTheme.headline2),
      headline1: GoogleFonts.poppins(textStyle: textTheme.headline1),
      caption: GoogleFonts.poppins(textStyle: textTheme.caption),
    );

    return BlocProvider<ShortlyBloc>(
      create: (_) => ShortlyBloc(repository: repository),
      child: MaterialApp(
        title: 'Assignment',
        builder: EasyLoading.init(),
        theme: ThemeData(
          primaryColor: Color(primaryColor),
          secondaryHeaderColor: Color(secondaryColor),
          primaryColorLight: Color(primaryColor).withOpacity(0.5),
          backgroundColor: Color(0xFFF0F1F6),
          buttonColor: Color(primaryColor),
          visualDensity: VisualDensity.adaptivePlatformDensity,
          textTheme: appTextTheme,
          scaffoldBackgroundColor: Color(0xFFF0F1F6),
        ),
        debugShowCheckedModeBanner: true,
        initialRoute: Routes.initial,
        onGenerateRoute: RouteGenerator.generateRoute,
      ),
    );
  }

  void configLoading(BuildContext context) {
    EasyLoading.instance
      ..loadingStyle = EasyLoadingStyle.custom
      ..indicatorSize = 45.0
      ..radius = 10.0
      ..progressColor = Colors.white
      ..indicatorColor = Colors.white
      ..textColor = Colors.white
      ..maskColor = Colors.black.withOpacity(0.5)
      ..userInteractions = false
      ..dismissOnTap = false
      ..toastPosition = EasyLoadingToastPosition.bottom;
  }
}
