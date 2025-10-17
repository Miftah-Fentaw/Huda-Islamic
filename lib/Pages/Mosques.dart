import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_map_mbtiles/flutter_map_mbtiles.dart';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

class Mosques extends StatefulWidget {
  @override
  _MosquesState createState() => _MosquesState();
}

class _MosquesState extends State<Mosques> {

  Future<String> copyMBTilesToDevice() async {
  final data = await rootBundle.load('assets/Tiles/addis-abeba.mbtiles');
  final bytes = data.buffer.asUint8List();
  final dir = await getApplicationDocumentsDirectory();
  final file = File('${dir.path}/addis-abeba.mbtiles');
  await file.writeAsBytes(bytes, flush: true);
  return file.path;
}

  MbTilesTileProvider? _tileProvider;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadTileProvider();
  }

  Future<void> _loadTileProvider() async {
    try {
      final path = await copyMBTilesToDevice();
      final provider = await MbTilesTileProvider.fromPath(path: path);
      setState(() {
        _tileProvider = provider;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to load map tiles: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF04173A),
      appBar: AppBar(
        title: Text('Nearby mosques', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.transparent,
        leading: GestureDetector(
          child: Icon(Icons.keyboard_return, color: Colors.white, size: 20),
          onTap: () => Navigator.pop(context),
        ),
        actions: [
          Align(
            alignment: AlignmentGeometry.centerRight,
            child: GestureDetector(child: Icon(Icons.help_outline_rounded,color: Colors.white,),
            onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return Dialog(
                          backgroundColor: Colors.transparent,
                          child: Text(
                            'the map is not not working curently '
                            'it will be solved soon',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        );
                      },
                    );
                  },
            ),
          )
        ],
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : _tileProvider == null
              ? Center(child: Text('Failed to load map tiles'))
              : FlutterMap(
                  options: MapOptions(
                    initialCenter: LatLng(9.03, 38.74),
                    initialZoom: 14.0,
                    minZoom: 12.0,
                    maxZoom: 16.0,
                    interactionOptions: InteractionOptions(
                      flags: InteractiveFlag.all,
                    ),
                  ),
                  children: [
                    TileLayer(
                      tileProvider: _tileProvider!,
                      urlTemplate: '{z}/{x}/{y}',
                      maxZoom: 16.0,
                      minZoom: 6.0,
                    ),
                  ],
                ),
    );
  }
}
