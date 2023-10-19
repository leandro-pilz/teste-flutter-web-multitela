import '../../core/entities/entity.dart';

base class ItemListData<T extends Entity> {
  final T data;
  final String description;

  ItemListData({required this.data, required this.description});
}
