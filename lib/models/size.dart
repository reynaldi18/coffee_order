import '../ui/common/app_images.dart';

class Size {
  final int id;
  final String image;
  final String title;
  final String desc;
  bool isSelected;

  Size({
    required this.id,
    required this.title,
    required this.image,
    required this.desc,
    this.isSelected = false,
  });
}

List<Size> listSize = [
  Size(
    id: 1,
    title: 'Short',
    image: AppImages.iconSizeShort,
    desc: '8 fl oz',
  ),
  Size(
    id: 2,
    title: 'Tall',
    image: AppImages.iconSizeTall,
    desc: '12 fl oz',
    // isSelected: true,
  ),
  Size(
    id: 3,
    title: 'Grande',
    image: AppImages.iconSizeGrande,
    desc: '16 fl oz',
  ),
  Size(
    id: 4,
    title: 'Venti',
    image: AppImages.iconSizeVenti,
    desc: '20 fl oz',
  ),
];
