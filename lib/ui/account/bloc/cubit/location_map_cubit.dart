import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/preference/preference.dart';
import '../state/location_map_state.dart';

@injectable
class LocationMapCubit extends Cubit<LocationMapState> {
  final Preference appPreference;
  LocationMapCubit(this.appPreference) : super(LocationMapInitial());
}
