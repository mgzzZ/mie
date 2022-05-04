///
/// Created by zgm on 2022/3/7
/// Describe:
///

mixin MRadioAble<T> {
  late T selectedValue;

  void selectedAction(T value) {
    selectedValue = value;
  }

  void initSelectedAction(T value) {
    selectedValue = value;
  }
}
