import 'package:airbnb/airbnb_global_imports.dart';

class CustomImage extends GetView<ImagePickerController> {
  final String path; // path identify
  final double? height;
  final double? width;
  final BoxFit fit;

  const CustomImage({
    super.key,
    required this.path,
    this.height,
    this.width,
    this.fit = BoxFit.cover,
  });

  ImageTypes identifyImageType(String path) {
    if (path.startsWith('https') || path.startsWith('http')) {
      return ImageTypes.network;
    } else if (path.startsWith('assets')) {
      return ImageTypes.asset;
    } else if (path.isEmpty) {
      return ImageTypes.file;
    } else {
      return ImageTypes.asset;
    }
  }

  @override
  Widget build(BuildContext context) {
    switch (identifyImageType(path)) {
      case ImageTypes.network:
        return path.endsWith('.svg')
            ? SvgPicture.network(
                path,
                height: height,
                width: width,
                fit: fit,
                errorBuilder: (context, error, stacktrace) {
                  return Icon(
                    Icons.network_check,
                  );
                },
                placeholderBuilder: (context) => CircularProgressIndicator(),
              )
            : Image.network(
                path,
                height: height,
                width: width,
                fit: fit,
                errorBuilder: (context, error, stacktrace) {
                  return Icon(
                    Icons.network_check,
                  );
                },
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                },
              );
      case ImageTypes.asset:
        return (path.endsWith('.svg')
            ? SvgPicture.asset(
                path,
                height: height,
                width: width,
                fit: fit,
                errorBuilder: (context, error, stacktrace) {
                  return Icon(
                    Icons.error_outline,
                  );
                },
              )
            : Image.asset(
                path,
                height: height,
                width: width,
                fit: fit,
                errorBuilder: (context, error, stacktrace) {
                  return Icon(
                    Icons.error_outline,
                  );
                },
              ));
      case ImageTypes.file:
        return Column(
          children: [
            Obx(() {
              if (controller.svgString.value != null) {
                return SvgPicture.string(
                  controller.svgString.value ?? '',
                  height: height,
                  width: width,
                  fit: fit,
                  placeholderBuilder: (context) => CircularProgressIndicator(),
                );
              } else if (kIsWeb) {
                return controller.imageBytes.value == null
                    ? Text('No image selected.',
                        style: TextStyle(
                          fontSize: 16,
                        ))
                    : Image.memory(
                        controller.imageBytes.value!,
                        height: height,
                        width: width,
                        fit: fit,
                        errorBuilder: (context, error, stacktrace) {
                          return Icon(
                            Icons.broken_image,
                          );
                        },
                      );
              } else {
                return controller.imageFile.value == null
                    ? Text('No image selected.',
                        style: TextStyle(
                          fontSize: 16,
                        ))
                    : Image.file(
                        controller.imageFile.value!,
                        height: height,
                        width: width,
                        fit: fit,
                        errorBuilder: (context, error, stacktrace) {
                          return Icon(
                            Icons.broken_image,
                          );
                        },
                      );
              }
            }),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => controller.pickImage(),
              child: Text('Pick Image'),
            ),
          ],
        );
    }
  }
}
