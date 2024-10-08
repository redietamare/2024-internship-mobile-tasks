import 'package:ecommerce/features/auth/presentation/bloc/authbloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'features/auth/presentation/login.dart';
import 'features/auth/presentation/register.dart';
import 'features/auth/presentation/splash.dart';
import 'features/product/data/data_sources/local_data_source.dart';
import 'features/product/data/model/product_model.dart';
import 'features/product/domain/usecases/getallproduct.dart';
import 'features/product/presentation/bloc/getallproductbloc/bloc/product_bloc.dart';
import 'features/product/presentation/pages/homepage.dart';
import 'service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setup();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ProductBloc>(
          create: (context) => getIt<ProductBloc>(),
        ),
        BlocProvider<UserBloc>(
          create: (context) => getIt<UserBloc>(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Color.fromARGB(255, 255, 255, 255),
          ),
          useMaterial3: true,
        ),
        home: const Register(),
        routes: {
          // Add your routes here
        },
      ),
    );
  }
}
