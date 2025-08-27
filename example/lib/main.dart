import 'package:flutter/material.dart';
import 'package:tabbed_view/tabbed_view.dart';

void main() {
  runApp(TabbedViewExample());
}

class TabbedViewExample extends StatelessWidget {
  const TabbedViewExample({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false, home: TabbedViewExamplePage());
  }
}

class TabbedViewExamplePage extends StatefulWidget {
  const TabbedViewExamplePage({super.key});

  @override
  TabbedViewExamplePageState createState() => TabbedViewExamplePageState();
}

class TabbedViewExamplePageState extends State<TabbedViewExamplePage> {
  late TabbedViewController _controller;
  TabBarPosition _position = TabBarPosition.top;
  ThemeName _themeName = ThemeName.mobile;
  SideTabsLayout _sideTabsLayout = SideTabsLayout.rotated;
  bool _modifyThemeColors = false;
  bool _maxMainSizeEnabled = false;
  bool _trailingWidgetEnabled = false;

  @override
  void initState() {
    super.initState();
    List<TabData> tabs = [];

    tabs.add(TabData(
        text: 'Tab 1',
        leading: (context, status) => Icon(Icons.star, size: 16),
        content: Padding(padding: EdgeInsets.all(8), child: Text('Hello')),
        // All TabData properties with default values or examples
        buttons: [
          TabButton(
              icon: IconProvider.data(Icons.info),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Info button clicked!')));
              })
        ]));
    tabs.add(TabData(
        text: 'Tab 2',
        content:
            Padding(padding: EdgeInsets.all(8), child: Text('Hello again'))));
    tabs.add(TabData(
        closable: false,
        text: 'TextField',
        content: Padding(
            padding: EdgeInsets.all(8),
            child: TextField(
                decoration: InputDecoration(
                    isDense: true, border: OutlineInputBorder()))),
        keepAlive: true));
    tabs.add(TabData(
        text: 'This is a very long tab title that should be truncated',
        content: Padding(
            padding: EdgeInsets.all(8),
            child: Text('Content for the long tab'))));

    _controller = TabbedViewController(tabs);
  }

  TabbedViewThemeData _getTheme() {
    TabbedViewThemeData theme;
    switch (_themeName) {
      case ThemeName.classic:
        theme = _modifyThemeColors
            ? TabbedViewThemeData.classic(
                colorSet: Colors.blueGrey, borderColor: Colors.black)
            : TabbedViewThemeData.classic();
        break;
      case ThemeName.dark:
        theme = _modifyThemeColors
            ? TabbedViewThemeData.dark(colorSet: Colors.brown)
            : TabbedViewThemeData.dark();
        break;
      case ThemeName.minimalist:
        theme = _modifyThemeColors
            ? TabbedViewThemeData.minimalist(colorSet: Colors.blueGrey)
            : TabbedViewThemeData.minimalist();
        break;
      case ThemeName.mobile:
        theme = _modifyThemeColors
            ? TabbedViewThemeData.mobile(
                colorSet: Colors.brown, accentColor: Colors.brown)
            : TabbedViewThemeData.mobile();
        break;
    }
    theme.tab.sideTabsLayout = _sideTabsLayout;
    if (_maxMainSizeEnabled) {
      theme.tab.maxMainSize = 200;
    }
    return theme;
  }

  @override
  Widget build(BuildContext context) {
    // Configuring the [TabbedView] with all available properties.
    TabbedView tabbedView = TabbedView(
      trailing: _trailingWidgetEnabled
          ? Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
              child: Text('Trailing text'),
            )
          : null,
      controller: _controller,
      onTabSecondaryTap: (index, tabData, details) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('Right-clicked on tab #$index: "${tabData.text}"')));
      },
      tabBarPosition: _position,
      contentBuilder: null,
      onTabSelection: (tabData) {},
      onTabClose: (index, tabData) {},
      tabCloseInterceptor: (index, tabData) {
        if (tabData.text == 'Tab 1') {
          return false;
        }
        return true;
      },
      tabSelectInterceptor: (newIndex) {
        return true;
      },
      tabsAreaButtonsBuilder: (context, tabsCount) {
        return [
          TabButton(
              icon: IconProvider.data(Icons.add),
              onPressed: () {
                _controller.addTab(TabData(
                    text: 'New Tab',
                    content: Center(child: Text('Content of New Tab'))));
              })
        ];
      },
      onDraggableBuild: (controller, tabIndex, tab) {
        return DraggableConfig(
          canDrag: true,
          feedback: null,
          feedbackOffset: Offset.zero,
          dragAnchorStrategy: childDragAnchorStrategy,
          onDragStarted: null,
          onDragUpdate: null,
          onDraggableCanceled: null,
          onDragEnd: null,
          onDragCompleted: null,
        );
      },
      hiddenTabsMenuItemBuilder: (context, tabIndex, tabData) {
        // Example of a custom menu item.
        // The default menu item is in:
        // lib/src/internal/tabs_area/hidden_tabs_menu_widget.dart
        final brightness = Theme.of(context).brightness;
        final theme = TabbedViewTheme.of(context);
        final brightnessMenuTheme =
            theme.menu.getBrightnessMenuTheme(brightness);
        return Padding(
          padding: theme.menu.menuItemPadding,
          child: Row(
            children: [
              Icon(Icons.tab,
                  size: 16, color: brightnessMenuTheme.textStyle?.color),
              SizedBox(width: 8),
              Expanded(
                child: Text('${tabData.text} (index $tabIndex)',
                    style: brightnessMenuTheme.textStyle,
                    overflow: TextOverflow.ellipsis),
              ),
            ],
          ),
        );
      },
      closeButtonTooltip: 'Close this tab',
      tabsAreaVisible: true,
      contentClip: true,
      dragScope: null,
    );

    return Scaffold(
        appBar: AppBar(title: Text('TabbedView Example (All properties)')),
        backgroundColor: Colors.white,
        body: Row(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          _buildSettings(),
          Expanded(
              child: Padding(
                  padding: EdgeInsets.all(16),
                  child: TabbedViewTheme(data: _getTheme(), child: tabbedView)))
        ]));
  }

  void _onPositionSelected(TabBarPosition newPosition) {
    setState(() {
      _position = newPosition;
    });
  }

  void _onSideTabsLayoutSelected(SideTabsLayout newLayout) {
    setState(() {
      _sideTabsLayout = newLayout;
    });
  }

  void _onThemeSelected(ThemeName? themeName) {
    if (themeName != null) {
      setState(() {
        _themeName = themeName;
      });
    }
  }

  Widget _buildSettings() {
    return Container(
        decoration: BoxDecoration(
            border: Border(right: BorderSide(color: Colors.grey))),
        child: SingleChildScrollView(
            child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('TabBarPosition'),
                      PositionsChooser(
                          position: _position, onSelected: _onPositionSelected),
                      SizedBox(height: 16),
                      Text('SideTabsLayout'),
                      SideTabsLayoutChooser(
                          layout: _sideTabsLayout,
                          onSelected: _onSideTabsLayoutSelected,
                          enabled: _position.isVertical),
                      SizedBox(height: 16),
                      Text('Theme'),
                      ThemeChooser(
                          themeName: _themeName, onSelected: _onThemeSelected),
                      SizedBox(height: 16),
                      _buildTrailingWidgetSelector(),
                      _buildModifyThemeColorsSelector(),
                      _buildMaxMainSizeSelector()
                    ]))));
  }

  Widget _buildModifyThemeColorsSelector() {
    return _buildSelector(
        value: _modifyThemeColors,
        text: 'Modify theme colors',
        setter: (v) => _modifyThemeColors = v);
  }

  Widget _buildTrailingWidgetSelector() {
    return _buildSelector(
        value: _trailingWidgetEnabled,
        text: 'Trailing widget',
        setter: (v) => _trailingWidgetEnabled = v);
  }

  Widget _buildMaxMainSizeSelector() {
    return _buildSelector(
        value: _maxMainSizeEnabled,
        text: 'Max tab main size',
        setter: (v) => _maxMainSizeEnabled = v);
  }

  Widget _buildSelector(
      {required bool value,
      required String text,
      required Function(bool value) setter}) {
    return Row(children: [
      Checkbox(
          value: value,
          onChanged: (v) {
            if (v != null) {
              setState(() {
                setter(v);
              });
            }
          }),
      Text(text)
    ]);
  }
}

class PositionsChooser extends StatelessWidget {
  const PositionsChooser(
      {super.key, required this.position, required this.onSelected});

  final TabBarPosition position;
  final Function(TabBarPosition newPosition) onSelected;

  @override
  Widget build(BuildContext context) {
    List<Widget> children = TabBarPosition.values.map<Widget>((value) {
      return ChoiceChip(
          label: Text(value.name),
          selected: position == value,
          onSelected: (selected) => onSelected(value));
    }).toList();

    return Wrap(spacing: 8, runSpacing: 4, children: children);
  }
}

class SideTabsLayoutChooser extends StatelessWidget {
  const SideTabsLayoutChooser(
      {super.key,
      required this.layout,
      required this.onSelected,
      required this.enabled});

  final SideTabsLayout layout;
  final bool enabled;
  final Function(SideTabsLayout newLayout) onSelected;

  @override
  Widget build(BuildContext context) {
    List<Widget> children = SideTabsLayout.values.map<Widget>((value) {
      return ChoiceChip(
          label: Text(value.name),
          selected: layout == value,
          onSelected: enabled ? (selected) => onSelected(value) : null);
    }).toList();

    return Wrap(spacing: 8, runSpacing: 4, children: children);
  }
}

enum ThemeName { mobile, classic, dark, minimalist }

class ThemeChooser extends StatelessWidget {
  const ThemeChooser(
      {super.key, required this.themeName, required this.onSelected});

  final ThemeName themeName;
  final Function(ThemeName? themeName) onSelected;

  @override
  Widget build(BuildContext context) {
    List<DropdownMenuItem<ThemeName>> items =
        ThemeName.values.map<DropdownMenuItem<ThemeName>>((themeName) {
      return DropdownMenuItem<ThemeName>(
          value: themeName, child: Text(themeName.name));
    }).toList();
    return DropdownButton<ThemeName>(
        value: themeName, isDense: true, items: items, onChanged: onSelected);
  }
}
