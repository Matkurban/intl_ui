# Intl UI Components

一套支持国际化布局的 Flutter UI 组件库，提供完整的 LTR/RTL 双向布局适配能力，助力高效构建多语言应用。

| 常规组件                                      |                     Ltr布局                     |                                         Rtl布局 |
|:------------------------------------------|:---------------------------------------------:|----------------------------------------------:|
| ![常规组建](doc/images/generalComponents.jpg) | ![常规组建](doc/images/generalComponents-ltr.jpg) | ![常规组建](doc/images/generalComponents-rtl.jpg) |
| ![常规组建](doc/images/JsonViewer.png)        |     ![常规组建](doc/images/IntlWrap-ltr.jpg)      |          ![常规组建](doc/images/IntlWrap-rtl.jpg) |


## ✨ 核心特性

- **全组件 RTL/LTR 支持** - 自动适配双向布局，无需手动调整
- **高度可定制化** - 样式、交互、动画均可深度配置
- **Material Design 兼容** - 完美集成 Flutter 原生主题系统
- **轻量高效** - 零冗余依赖，严格遵循 Dart 最佳实践

## 📦 安装

在 `pubspec.yaml` 中添加依赖：

```yaml
dependencies:
  intl_ui: ^latest_version
```

运行命令：
```bash
flutter pub get
```

---

## 🧩 组件列表

### 导航组件

#### 1. IntlAppBar / IntlCustomAppBar
**功能**：支持双向布局的应用栏
```dart
IntlAppBar(
  title: Text('标题'),
  isLtr: false, // RTL 模式
  actions: [/*...*/],
  systemOverlayStyle: SystemUiOverlayStyle.dark,
)
```

#### 2. IntlBackButton
**功能**：智能方向返回按钮
```dart
IntlBackButton(
  isLtr: context.isRTL ? false : true,
  color: Colors.white,
)
```

---

### 表单组件

#### 1. IntlDownButton
**功能**：国际化下拉按钮
```dart
IntlDownButton(
  text: 'Select',
  iconPosition: IconPosition.start,
  borderRadius: BorderRadius.circular(12),
)
```

#### 2. ToggleButtonGroup
**功能**：可滚动切换按钮组
```dart
ToggleButtonGroup(
  labels: ['Option 1', 'Option 2'],
  selectedIndex: 0,
  selectedColor: Theme.of(context).primaryColor,
)
```

---

### 布局组件

#### 1. IntlRow / IntlWrap
**功能**：智能流式布局
```dart
IntlRow(
  isLtr: false,
  spacing: 8,
  children: [/*...*/],
)

IntlWrap(
  step: 3, // 每行3元素
  runSpacing: 12,
)
```

#### 2. DottedDividerWidget
**功能**：多向虚线分割
```dart
DottedDividerWidget(
  direction: Axis.vertical,
  pattern: [5, 3], // 5px实线+3px间隔
)
```

---

### 展示组件

#### 1. UniversalCard
**功能**：超级卡片容器
```dart
UniversalCard(
  gradient: LinearGradient(/*...*/),
  onPress: () => print('Card tapped'),
  child: YourContent(),
)
```

#### 2. RadiusImage
**功能**：智能圆形/圆角图片
```dart
RadiusImage(
  image: NetworkImage(url),
  shape: BoxShape.circle,
  borderWidth: 2,
)
```

#### 3. JsonViewer
**功能**：JSON 数据可视化
```dart
JsonViewer(
  jsonData: yourJsonData,
)
```

---

## 📚 通用配置

### 布局方向控制
所有组件均支持 `isLtr` 参数：
```dart
isLtr: true // 默认LTR布局
```

---

## 🤝 贡献指南

欢迎通过以下方式参与贡献：
1. 提交 [GitHub Issue](https://github.com/yourrepo/issues) 报告问题
2. Fork 项目并提交 Pull Request
3. 完善组件单元测试
4. 补充文档示例

请确保代码：
- 通过所有静态分析 (`flutter analyze`)
- 包含完整的测试用例
- 更新相关文档

---

## 📜 许可证

本项目采用 [MIT License](LICENSE)，如需商业授权请联系 3496354336@qq.com
