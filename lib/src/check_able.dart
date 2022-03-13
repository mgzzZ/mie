///
/// Created by zgm on 2022/3/7
/// Describe:
///

mixin MCheckAble<T> {
  List<T> selectedList = [];

  void initAction(List<T> value) {
    if (value.length != 0) {
      selectedList = value;
    }
  }

  List<T> selectedAction(T value) {
    if (selectedList.contains(value)) {
      selectedList.remove(value);
    } else {
      selectedList.add(value);
    }
    return selectedList;
  }
}
