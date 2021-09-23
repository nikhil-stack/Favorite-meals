import 'package:flutter/material.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  // const FiltersScreen({Key? key}) : super(key: key);

  final Function saveFilters;
  //final Map<String, bool?> currentFilters;

  FiltersScreen(this.saveFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  // @override
  // void initState() {
  //   _glutenFree = widget.currentFilters['gluten'];
  //   _lactoseFree = widget.currentFilters['lactose'];
  //   _vegan = widget.currentFilters['vegan'];
  //   _vegetarian = widget.currentFilters['vegetarian'];
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
        actions: [
          IconButton(
              onPressed: () {
                final selectedFilters = {
                  'gluten': _glutenFree,
                  'lactose': _lactoseFree,
                  'vegan': _vegan,
                  'vegetarian': _vegetarian,
                };
                widget.saveFilters(selectedFilters);
              },
              icon: Icon(Icons.save))
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection.',
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              SwitchListTile(
                title: Text('Gluten-free'),
                value: _glutenFree,
                subtitle: Text(
                  'Only include gluten-free meals',
                ),
                onChanged: (newValue) {
                  setState(() {
                    _glutenFree = newValue;
                  });
                },
              ),
              SwitchListTile(
                title: Text('Lactose-free'),
                value: _lactoseFree,
                subtitle: Text(
                  'Only include lactose-free meals',
                ),
                onChanged: (newValue) {
                  setState(() {
                    _lactoseFree = newValue;
                  });
                },
              ),
              SwitchListTile(
                title: Text('Vegetarian'),
                value: _vegetarian,
                subtitle: Text(
                  'Only include vegetarian meals',
                ),
                onChanged: (newValue) {
                  setState(() {
                    _vegetarian = newValue;
                  });
                },
              ),
              SwitchListTile(
                title: Text('Vegan'),
                value: _vegan,
                subtitle: Text(
                  'Only include vegan meals',
                ),
                onChanged: (newValue) {
                  setState(() {
                    _vegan = newValue;
                  });
                },
              ),
            ],
          ))
        ],
      ),
    );
  }
}
