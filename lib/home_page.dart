import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';
import 'package:stripe_flutter/bloc/pagar/pagar_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stripe_flutter/data/tarjetas.dart';
import 'package:stripe_flutter/helpers/helpers.dart';
import 'package:stripe_flutter/tarjeta_page.dart';
import 'package:stripe_flutter/widgets/total_pay_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: 
          Text('pagar'),
          actions: [
            IconButton(onPressed: () async{
              /*mostrarLoading(context);
              await Future.delayed(Duration(seconds: 1));
              Navigator.pop(context);*/
              mostrarAlerta(context, 'hola', 'mundo');
            }, icon: Icon(Icons.add))
          ],
        ),
       
      
       body: Stack(children: [
        Positioned(
          width: size.width,
          height: size.height,
          top: 200,
          child: PageView.builder(
            controller: PageController(
              viewportFraction: 0.9
            ),
            itemCount: tarjetas.length,
            itemBuilder: (_, i){
              final tarjeta = tarjetas[i];
              return GestureDetector(
                onTap: (){
                  //con esto mandamos el evento, al tocar mandas el evento
                  context.read<PagarBloc>().add(OnSeleccionarTarjeta(tarjeta));
                  //este fadein hace una animacion al cambiar de pagina
                 Navigator.push(context, navegarFadeIn(context, TarjetaPage()));
                },
                child: Hero(
                  tag: tarjeta.cardNumber,
                  child: CreditCardWidget(
                    cardNumber: tarjeta.cardNumberHidden, 
                    expiryDate: tarjeta.expiracyDate, 
                    cardHolderName: tarjeta.cardHolderName,
                    cvvCode: tarjeta.cvv, 
                    showBackView: false, 
                    onCreditCardWidgetChange: (brand) {
                  
                           },
                    ),
                ),
              );
            },
          ),
        ),
        Positioned(
          bottom: 0,
          child: TotalPayButton())
       ],)
    );
  }
}