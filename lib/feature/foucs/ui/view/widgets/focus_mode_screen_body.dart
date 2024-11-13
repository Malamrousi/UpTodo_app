import 'package:flutter/material.dart';
import 'package:uptodo/core/helper/spacing.dart';
import 'package:uptodo/core/theming/app_styles.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:uptodo/core/theming/colors_manger.dart';

class FocusModeScreenBody extends StatefulWidget {
  const FocusModeScreenBody({super.key});

  @override
  State<FocusModeScreenBody> createState() => _FocusModeScreenBodyState();
}

class _FocusModeScreenBodyState extends State<FocusModeScreenBody> {
  final CountDownController _controller = CountDownController();
  bool isStarted = false;

  // 30 minutes in seconds
  final int _duration = 3600;

  void _handleTimerButton() {
    setState(() {
      if (isStarted) {
        _controller.pause();
        isStarted = false;
      } else {
        _controller.start();
        isStarted = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        children: [
          Center(
            child: Text(
              'Focus Mode',
              style: AppStyles.font20WhiteColorBold,
            ),
          ),
          verticalSpacing(50),
          Center(
            child: CircularCountDownTimer(
              duration: _duration,
              initialDuration: 0,
              controller: _controller,
              width: MediaQuery.of(context).size.width * 0.55,
              height: MediaQuery.of(context).size.height * 0.42,
              ringColor: ColorsManger.darkGray,
              fillColor: ColorsManger.primaryColor,
              backgroundColor: Colors.transparent,
              strokeWidth: 15,
              strokeCap: StrokeCap.round,
              textStyle: AppStyles.font20WhiteColorBold,
              textFormat: CountdownTextFormat.HH_MM_SS,
              isReverse: true,
              isReverseAnimation: false,
              isTimerTextShown: true,
              autoStart: false,
              onStart: () {
                setState(() {
                  isStarted = true;
                });
                _showSnackBar('Countdown Started');
              },
              onComplete: () {
                setState(() {
                  isStarted = false;
                });
                _showSnackBar('Countdown Completed');
              },
              onChange: (String timeStamp) {
                debugPrint('Countdown Changed $timeStamp');
              },
            ),
          ),
          verticalSpacing(30),
          Text(
            'While your focus mode is on, all of your\nnotifications will be off',
            textAlign: TextAlign.center,
            style: AppStyles.font16WhiteRegular.copyWith(
              color: Colors.white.withOpacity(0.87),
            ),
          ),
          verticalSpacing(30),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: _handleTimerButton,
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorsManger.primaryColor,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                isStarted ? 'Stop Focusing' : 'Start Focusing',
                style: AppStyles.font16WhiteRegular,
              ),
            ),
          ),
          verticalSpacing(30),
        ],
      ),
    );
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        
        width: double.infinity,
        content: Text(
          message,
          style: AppStyles.font16WhiteRegular,
        ),
        backgroundColor: ColorsManger.darkGray,
        duration: const Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        
      ),
    );
  }
}
