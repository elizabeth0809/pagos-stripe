part of'helpers.dart';
mostrarLoading (BuildContext context){
  showDialog(context: context, 
  barrierDismissible: false,
  builder: (_) => AlertDialog(
    title: Text('espere...'),
    content: LinearProgressIndicator(),
  ));
}

mostrarAlerta (BuildContext context, String titulo, String mensaje){
  showDialog(context: context, 
  //esto hace que darle click afuera no se cierre
  barrierDismissible: false,
  builder: (_) => AlertDialog(
    title: Text(titulo),
    content: Text(mensaje),
    actions: [
      MaterialButton(onPressed: (){
        Navigator.of(context).pop();
      },
      child: Text('ok'),
      )
    ],
  )
  );
}