import 'package:airbnb/airbnb_global_imports.dart';

class SplashScreen extends GetView<SplashController> {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primary,
      body: controller.obx((value) {
        return _bodyWidget();
      },
          onEmpty: _bodyWidget(),
          onLoading: _bodyWidget(),
          onError: (v) => _bodyWidget()),
    );
  }

  Widget _bodyWidget() {
    return Stack(
      children: [
        Center(
          child: CustomImage(
            path: AppImages.logo,
            height: 180,
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 25.0),
            child: CircularProgressIndicator(
              color: AppColor.white,
            ),
          ),
        )
      ],
    );
  }
}
