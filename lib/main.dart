import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stripe_flutter/bloc/pagar/pagar_bloc.dart';
import 'package:stripe_flutter/home_page.dart';
import 'package:stripe_flutter/pago_completo.dart';
void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => PagarBloc())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'stripeapp',
        initialRoute: 'home',
        routes: {
          'home' : (_) => HomePage(),
          'pago_completo' : (_) => PagoCompleto()
        },
        theme: ThemeData.light().copyWith(
          primaryColor: Color(0xff284879),
          scaffoldBackgroundColor: Color(0xff21232A)
        ),
      ),
    );
  }
}