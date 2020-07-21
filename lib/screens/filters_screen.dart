import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';

  final Function saveFilters;
  final Map<String, bool> filters;

  FiltersScreen(this.filters, this.saveFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  List<Widget> _buildSwitchListTiles() {
    List<Widget> tiles = [];
    for (var key in widget.filters.keys) {
      tiles.add(
        SwitchListTile(
          title: Text(key[0].toUpperCase() + key.substring(1)),
          value: widget.filters[key],
          subtitle: Text('Only include $key meals'),
          onChanged: (newValue) {
            setState(() {
              widget.filters[key] = newValue;
            });
          },
        ),
      );
    }
    return tiles;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filters'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () => widget.saveFilters(widget.filters),
          )
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection.',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
            child: ListView(
              children: _buildSwitchListTiles(),
            ),
          ),
        ],
      ),
    );
  }
}
