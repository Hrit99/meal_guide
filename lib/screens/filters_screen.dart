import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';
  final Function saveFilters;
  final Map<String, bool> currentFilters;

  FiltersScreen(this.currentFilters, this.saveFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _gluteneFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  initState() {
    _gluteneFree = widget.currentFilters['glutene'];
    _vegetarian = widget.currentFilters['vegetarian'];
    _vegan = widget.currentFilters['vegan'];
    _lactoseFree = widget.currentFilters['lactose'];
    super.initState();
  }

  Widget _buildSwitchListTile(String title, String description,
      bool currentValue, Function updateValue) {
    return SwitchListTile(
        title: Text(title),
        subtitle: Text(description),
        value: currentValue,
        onChanged: updateValue);
  }

  void _saveFiltersOnTap() {
    final selectedFilters = {
      'glutene': _gluteneFree,
      'lactose': _lactoseFree,
      'vegan': _vegan,
      'vegetarian': _vegetarian,
    };
    widget.saveFilters(selectedFilters);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Fiters'),
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection',
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              _buildSwitchListTile("Glutene Free",
                  'Only includes glutene free meals', _gluteneFree, (newValue) {
                setState(() {
                  _gluteneFree = newValue;
                  _saveFiltersOnTap();
                });
              }),
              _buildSwitchListTile(
                  "Vegtarian", 'Only includes vegetarian meals', _vegetarian,
                  (newValue) {
                setState(() {
                  _vegetarian = newValue;
                  _saveFiltersOnTap();
                });
              }),
              _buildSwitchListTile("Vegan", 'Only includes Vegan meals', _vegan,
                  (newValue) {
                setState(() {
                  _vegan = newValue;
                  _saveFiltersOnTap();
                });
              }),
              _buildSwitchListTile("Lactose Free",
                  'Only includes lactose free meals', _lactoseFree, (newValue) {
                setState(() {
                  _lactoseFree = newValue;
                  _saveFiltersOnTap();
                });
              }),
            ],
          ))
        ],
      ),
    );
  }
}
