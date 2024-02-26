import 'package:firebase_app/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


typedef OnViewModelBuilder<T> = Widget Function(BuildContext, T, Widget?);
typedef OnViewModelReady<T> = void Function(T);
typedef OnDispose<T> = void Function(T);

enum ViewModelType { withConsumer, withoutConsumer }

class BaseViewModel<T extends ChangeNotifier> extends StatefulWidget {
  const BaseViewModel({
    super.key,
    this.builder,
    required this.onViewModelReady,
    this.onDispose,
    this.viewModelType = ViewModelType.withConsumer,
    this.child,
  });

  final OnViewModelBuilder<T>? builder;
  final OnViewModelReady<T> onViewModelReady;
  final OnDispose<T>? onDispose;
  final ViewModelType viewModelType;
  final Widget? child;

  @override
  State<BaseViewModel<T>> createState() => _BaseViewModelState<T>();
}

class _BaseViewModelState<T extends ChangeNotifier>
    extends State<BaseViewModel<T>> {
  T? model = getIt<T>();
  @override
  void initState() {
    super.initState();
    widget.onViewModelReady(model ?? getIt<T>());
  }

  @override
  void dispose() {
    if (widget.onDispose != null) {
      widget.onDispose!(model ?? getIt<T>());
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _checkType(widget.viewModelType);
  }

  Widget _checkType(ViewModelType type) =>
      type == ViewModelType.withConsumer ? _withConsumer() : _withoutConsumer();

  Widget _withConsumer() => ChangeNotifierProvider<T>(
        create: (context) => model ?? getIt<T>(),
        child: Consumer<T>(
          builder: widget.builder!,
          child: widget.child,
        ),
      );

  Widget _withoutConsumer() => ChangeNotifierProvider<T>(
        create: (context) => model ?? getIt<T>(),
        child: widget.builder!(context, model!, widget.child),
      );
}
