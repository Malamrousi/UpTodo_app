import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';

class SimpleBlocObserver extends BlocObserver {
  final Logger logger = Logger();

  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    logger.t('onCreate(${bloc.runtimeType})');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    logger.d('onChange(${bloc.runtimeType}, $change)');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    logger.d('onTransition(${bloc.runtimeType}, $transition)');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    logger.e('onError(${bloc.runtimeType}, $error, $stackTrace)');
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    logger.w('onClose(${bloc.runtimeType})');
  }
}
