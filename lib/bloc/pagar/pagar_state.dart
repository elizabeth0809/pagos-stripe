part of 'pagar_bloc.dart';

class PagarState {
  final double montoPagar;
  final String moneda;
  final bool tarjetaActiva;
  final TarjetaCredito? tarjeta;

  PagarState(
      {this.montoPagar = 300.2,
      this.moneda = 'USD',
      this.tarjetaActiva = false,
      this.tarjeta});

  PagarState copyWith({
    double? montoPagar,
    String? moneda,
    bool? tarjetaActiva,
    TarjetaCredito? tarjeta,
  }) =>
      PagarState(
          montoPagar: montoPagar ?? this.montoPagar,
          moneda: moneda ?? this.moneda,
          tarjeta: tarjeta ?? this.tarjeta,
          tarjetaActiva: tarjetaActiva ?? this.tarjetaActiva);
}
