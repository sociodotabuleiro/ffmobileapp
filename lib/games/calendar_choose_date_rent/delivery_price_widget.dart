import 'package:flutter/material.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:google_fonts/google_fonts.dart';

export 'delivery_price_widget.dart';
    
class DeliveryPriceWidget extends StatelessWidget {
  final double price;
  final bool isLoaded;
  final bool quotationSuccess;
  final String? additionalInfo;

  const DeliveryPriceWidget({
    Key? key,
    required this.price,
    required this.isLoaded,
    required this.quotationSuccess,
    this.additionalInfo,
  }) : super(key: key);

 @override
Widget build(BuildContext context) {
  if (!isLoaded) {
    return const Center(child: CircularProgressIndicator());
  }

  if (!quotationSuccess) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Não foi possível quotar a entrega',
          style: FlutterFlowTheme.of(context).bodyMedium.override(
                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                color: FlutterFlowTheme.of(context).error,
                fontWeight: FontWeight.bold,
                useGoogleFonts: GoogleFonts.asMap().containsKey(
                    FlutterFlowTheme.of(context).bodyMediumFamily),
              ),
        ),
        Text(
          'Tente novamente mais tarde',
          style: FlutterFlowTheme.of(context).bodyMedium.override(
                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                color: FlutterFlowTheme.of(context).error,
                fontWeight: FontWeight.bold,
                useGoogleFonts: GoogleFonts.asMap().containsKey(
                    FlutterFlowTheme.of(context).bodyMediumFamily),
              ),
        ),
      ],
    );
  }

  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Row(
        children: [
          const Icon(Icons.motorcycle_sharp, color: Color(0xFF0E9E43)),
          Text(
            'R\$${price.toStringAsFixed(2)}',
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                  color: const Color(0xFF0E9E43),
                  fontWeight: FontWeight.w600,
                  useGoogleFonts: GoogleFonts.asMap().containsKey(
                      FlutterFlowTheme.of(context).bodyMediumFamily),
                ),
          ),
        ],
      ),
      if (additionalInfo != null)
        IconButton(
          icon: const Icon(Icons.info_outline, color: Colors.red, size: 16.0),
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text('Informação sobre o preço'),
                  content: Text(additionalInfo!),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text('OK'),
                    ),
                  ],
                );
              },
            );
          },
        ),
      ],
    );
  }
}