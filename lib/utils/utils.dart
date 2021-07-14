import 'package:image_picker/image_picker.dart';

//for picking up image
Future<PickedFile?> getImage() async {
  final ImagePicker _picker = ImagePicker();
  final pickedFile = await _picker.getImage(source: ImageSource.gallery);

  if (pickedFile != null) {
    return pickedFile;
  }

  return pickedFile;
}
