import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mat2414/src/localization/locale_extension.dart';
import 'package:mat2414/src/ui/onboarding/terms_view.dart';
import 'package:mat2414/src/ui/theme/theme.dart';
import 'package:mat2414/utils/show_confirmation_dialog.dart' as utils_cd;
import 'package:mat2414/utils/show_custom_bottom_sheet.dart' as utils_bs;
import 'package:provider/provider.dart';
import 'add_activity_demo.dart';
import 'onboarding_state.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<OnboardingState>(
        create: (_) => OnboardingState(),
        builder: (context, _) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            body: Container(
              width: double.maxFinite,
              height: double.maxFinite,
              color: context.colors.tertiaryContainer.withOpacity(0.4),
              child: SafeArea(
                child: Selector<OnboardingState, OnboardingStatus>(
                    selector: (_, state) => state.status,
                    shouldRebuild: (OnboardingStatus pre, OnboardingStatus next) {
                      return pre != next;
                    },
                    builder: (BuildContext context, status, __) {
                      if (status == OnboardingStatus.loading) {
                        return _buildLoadingWidget();
                      }
                      // BuildContext is essential for Provider! context.read<OnboardingState>().skipUsername()
                      return _buildOnboardingView(context);
                    }),
              ),
            ),
          );
        });
  }

  Widget _buildOnboardingView(BuildContext context) {
    final isNotLow = MediaQuery.of(context).size.height > 600;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 1),
      child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        _buildTopSection(),
        _buildMiddleSection(context),
        _buildBottomSection(),
      ]),
    );
  }

  Widget _buildParagraph(String text, [bool isBig = false]) {
    final style = isBig ? context.bodyLarge : context.bodySmall;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 20),
      child: Text(text, style: style, textAlign: TextAlign.center),
    );
  }

  Widget _buildTopSection() {
    final isNotLow = MediaQuery.of(context).size.height > 600;
    return Expanded(
      flex: 2,
      child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(context.loc.appTitle, style: context.headlineMedium), // app title
        _buildParagraph(context.loc.onBoardingInfo), // application purpose
        if (isNotLow) const AddActivityDemo(), // interactive demo
        _buildParagraph(context.loc.onBoardingVisitHelp), // more info in Help
      ]),
    );
  }

  Widget _buildMiddleSection(BuildContext context) {
    return Expanded(
      child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        _buildParagraph('${context.loc.onBoardingRateApp}  😍', true), // rate the app
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          _buildSkipButton(context),
          _buildUpdateUsernameButton(context),
        ]),
      ]),
    );
  }

  Widget _buildBottomSection() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 6.0),
        child: SizedBox(
          height: 26,
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            _buildTermsLink(),
            const SizedBox(width: 20),
            _buildPrivacyLink(),
          ]),
        ),
      ),
    );
  }

  Widget _buildPrivacyLink() {
    return _buildLinkBtn('Privacy statement', AssetPath.txtPrivacy);
  }

  Widget _buildTermsLink() {
    return _buildLinkBtn('Terms of service', AssetPath.txtTermsOfUse);
  }

  Widget _buildLinkBtn(String label, String path) {
    return SizedBox(
      height: 20,
      child: TextButton(
          style: const ButtonStyle(
              padding: MaterialStatePropertyAll<EdgeInsetsGeometry>(EdgeInsets.zero)),
          onPressed: () => _showTermsOrPrivacy(context, path),
          child: Text(label,
              style: context.labelSmall?.copyWith(decoration: TextDecoration.underline))),
    );
  }

  Widget _buildUpdateUsernameButton(BuildContext context) {
    const color = MaterialStatePropertyAll<Color>(Colors.white70);
    const padding =
        MaterialStatePropertyAll<EdgeInsetsGeometry>(EdgeInsets.symmetric(horizontal: 8));
    return TextButton(
        style: const ButtonStyle(backgroundColor: color, padding: padding),
        onPressed: () => _handleSetUsernameBth(context),
        child: Text(context.loc.onBoardingYourName, style: context.labelLarge));
  }

  Widget _buildSkipButton(BuildContext context) {
    const padding = MaterialStatePropertyAll<EdgeInsetsGeometry>(EdgeInsets.zero);
    return TextButton(
        style: const ButtonStyle(padding: padding),
        onPressed: () => _handleSkipBtn(context),
        child: Text(context.loc.generalSkip, style: context.labelMedium));
  }

  void _handleSkipBtn(BuildContext context) {
    final content = context.loc.onBoardingCanAddNameLater;
    final title = Text(context.loc.onBoardingContinueWithoutName);
    // ask do user want to continue without giving name
    utils_cd.showConfirmationDialog(context, content, title: title).then((res) {
      // continue without username
      if (res != null && res) context.read<OnboardingState>().skipUsername();
    });
  }

  Future<void> _showTermsOrPrivacy(BuildContext context, String path) async {
    return await _openAddBottomSheet<void>(context, TermsView(filePath: path));
  }

  Future<void> _handleSetUsernameBth(BuildContext context) async {
    // open Text input to type the name
    // input has also its own submit button.
    await _getUsernameFromInput(context).then((name) {
      // user has dismiss bottom sheet. If input is not empty, ask to save?
      if (name != null && name.isNotEmpty) {
        utils_cd.showConfirmationDialog(context, context.loc.dialogWantToSave).then((res) {
          if (res != null && res) {
            // user confirmed saving
            context.read<OnboardingState>().setUsername(name);
          }
        });
      }
    });
  }

  Future<String?> _getUsernameFromInput(BuildContext context) async {
    final titleStyle = context.bodyMedium;
    String? name;
    await utils_bs.showCustomBottomSheet<String>(
      context,
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(children: [
          Expanded(
            flex: 3,
            child: TextFormField(
                style: titleStyle,
                decoration: InputDecoration(labelText: '${context.loc.onBoardingYourName}:'),
                keyboardType: TextInputType.multiline,
                autofocus: true,
                maxLength: 20,
                onChanged: (v) => name = v),
          ),
          Expanded(
            child: TextButton(
              style: const ButtonStyle(
                  padding: MaterialStatePropertyAll<EdgeInsetsGeometry>(EdgeInsets.zero)),
              onPressed: () {
                if (name == null || name!.isEmpty) {
                  final content = context.loc.onBoardingCanAddNameLater;
                  final title = Text(context.loc.onBoardingContinueWithoutName);
                  utils_cd.showConfirmationDialog(context, content, title: title).then((res) {
                    // continue without username
                    if (res != null && res) context.read<OnboardingState>().skipUsername();
                  });
                } else {
                  Navigator.pop<bool>(context);
                  context.read<OnboardingState>().setUsername(name!);
                }
              },
              child: Text(context.loc.generalSave, style: context.labelMedium),
            ),
          ),
        ]),
      ),
    );
    return name;
  }

  Future<T?> _openAddBottomSheet<T>(BuildContext context, Widget content) async {
    return await utils_bs.showCustomBottomSheet<T>(context, content);
  }

  Widget _buildLoadingWidget() {
    return Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: const [
        CircularProgressIndicator.adaptive(),
        SizedBox(height: 20),
        Text('Preparing. Please wait...'),
      ]),
    );
  }
}
