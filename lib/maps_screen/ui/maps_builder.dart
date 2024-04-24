import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:location/location.dart';
import 'package:mapbox_gl/mapbox_gl.dart';
import 'package:proyecto_progra_movil/maps_screen/bloc/maps_bloc.dart';
import 'package:proyecto_progra_movil/maps_screen/bloc/maps_event.dart';
import 'package:proyecto_progra_movil/maps_screen/bloc/maps_state.dart';
import 'package:proyecto_progra_movil/shared_preferences/shared_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MapsBuilder extends StatefulWidget {
  const MapsBuilder({super.key});

  @override
  State<MapsBuilder> createState() => _MapsBuilderState();
}

class _MapsBuilderState extends State<MapsBuilder> {
  late MapboxMapController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: BlocBuilder<MapBloc, MapState>(builder: (context, state) {
        if (state is MapLoading) {
          return Container(
            child: const Text("Espere el mapa esta cargando"),
          );
        } else if (state is MapLoadedUser) {
          dynamic _initialCameraPosition =
              CameraPosition(target: state.latLng, zoom: 15);
          return SizedBox(
              height: MediaQuery.of(context).size.height * 0.8,
              child: MapboxMap(
                accessToken: dotenv.env['MAPBOX_ACCESS_TOKEN'],
                initialCameraPosition: _initialCameraPosition,
                onMapCreated: _onMapCreated,
                myLocationEnabled: true,
                myLocationTrackingMode: MyLocationTrackingMode.TrackingGPS,
                minMaxZoomPreference: const MinMaxZoomPreference(14, 17),
              ));
        } else if (state is MapFailedToLoad) {
          return Container(
            child: const Text(
                "No se pudo cargar el mapa por un error desconocido"),
          );
        }
        return Container();
      }),
    );
  }

  _onMapCreated(MapboxMapController controller) async {
    this.controller = controller;
  }
}
