import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:number_converter/src/domain/entities/view.dart';
import 'package:number_converter/src/presentation/blocs/number_converter_bloc.dart';
import 'package:number_converter/src/presentation/widgets/number_input_field.dart';

class NumberConverterScreen extends View<NumberConverterBloc> {
  const NumberConverterScreen({required NumberConverterBloc bloc, Key? key})
      : super(bloc: bloc, key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            colors: [Colors.blue, Colors.blue.shade900],
          )),
          child: Center(
            child: Padding(
                padding: EdgeInsets.all(width * 0.05),
                child: Column(
                  children: [
                    const AutoSizeText(
                      'Number Converter',
                      maxFontSize: 60,
                      minFontSize: 10,
                      style: TextStyle(
                      
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      maxLines: 2,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 30),
                          child: SizedBox(
                            width: width * 0.3,
                            child: CustomNumberField(
                              stream: bloc.number,
                              onChange: bloc.changeNumber,
                              hintText: 'Your number',
                              labelText: 'Number',
                            ),
                          ),
                        ),
                        const AutoSizeText(
                          'The result is:',
                          maxFontSize: 60,
                          minFontSize: 10,
                          style: TextStyle(
                            
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          maxLines: 1,
                        ),
                        StreamBuilder<String>(
                            stream: bloc.converterResult,
                            initialData: bloc.initResultText,
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: width * 0.1),
                                  child: AutoSizeText(
                                    snapshot.data!,
                                    maxFontSize: 60,
                                    minFontSize: 10,
                                    style: const TextStyle(
                                      
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                    maxLines: 5,
                                  ),
                                );
                              } else {
                                return const AutoSizeText(
                                  'Something went bad. Sorry for the inconvenience.',
                                  maxFontSize: 60,
                                  minFontSize: 10,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                  maxLines: 2,
                                );
                              }
                            })
                      ],
                    )
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
