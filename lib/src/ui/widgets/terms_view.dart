import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TermsView extends StatefulWidget {
  const TermsView({Key? key, required this.filePath}) : super(key: key);

  final String filePath;

  @override
  State<TermsView> createState() => _TermsViewState();
}

class _TermsViewState extends State<TermsView> {
  late Future<String>? _readStatement;

  @override
  void initState() {
    _readStatement = rootBundle.loadString(widget.filePath);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        initialData: 'Loading',
        future: _readStatement,
        builder: (context, snapshot) {
          final bool snapHasError = snapshot.hasError;
          ConnectionState connection = snapshot.connectionState;
          if (connection == ConnectionState.done && !snapHasError) {
            return _buildContent(context, snapshot);
          }
          if (snapHasError) {
            return const Center(child: CircularProgressIndicator.adaptive());
          }
          return const Center(child: CircularProgressIndicator.adaptive());
        });
  }

  Widget _buildContent(BuildContext context, AsyncSnapshot<String> snapshot) {
    String txt = 'The information is not available at the moment';
    if (snapshot.data != null && snapshot.data!.isNotEmpty) {
      txt = snapshot.data!;
    }
    return DraggableScrollableSheet(
        expand: false,
        maxChildSize: 0.9,
        minChildSize: 0.4,
        builder: (context, controller) {
          return SafeArea(
            top: false,
            child: ListView(
                padding: const EdgeInsets.fromLTRB(16, 2, 16, 8),
                shrinkWrap: true,
                controller: controller,
                children: [
                  Text(txt),
                ]),
          );
        });
  }
}
