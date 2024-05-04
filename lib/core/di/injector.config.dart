// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../networking/api_service.dart' as _i5;
import '../../networking/auth_api_service.dart' as _i8;
import '../../repository/account/app_repository.dart' as _i6;
import '../../repository/account/app_repository_impl.dart' as _i7;
import '../../repository/auth/login_repository.dart' as _i12;
import '../../repository/auth/login_repository_impl.dart' as _i13;
import '../../repository/auth/mock_login_repository_impl.dart' as _i14;
import '../../repository/db/address_db_repository.dart' as _i3;
import '../../repository/db/address_db_repository_impl.dart' as _i4;
import '../../repository/db/db_repository.dart' as _i9;
import '../../repository/db/db_repository_impl.dart' as _i10;
import '../../ui/account/bloc/cubit/add_address_cubit.dart' as _i26;
import '../../ui/account/bloc/cubit/address_cubit.dart' as _i27;
import '../../ui/account/bloc/cubit/faq_cubit.dart' as _i11;
import '../../ui/account/bloc/cubit/location_map_cubit.dart' as _i31;
import '../../ui/account/bloc/cubit/orders_cubit.dart' as _i15;
import '../../ui/account/bloc/cubit/policy_cubit.dart' as _i16;
import '../../ui/account/bloc/cubit/profile_cubit.dart' as _i20;
import '../../ui/account/bloc/cubit/refund_cubit.dart' as _i21;
import '../../ui/dashboard/bloc/cubit/account_cubit.dart' as _i25;
import '../../ui/dashboard/bloc/cubit/cart_cubit.dart' as _i28;
import '../../ui/dashboard/bloc/cubit/category_cubit.dart' as _i29;
import '../../ui/dashboard/bloc/cubit/dashboard_cubit.dart' as _i30;
import '../../ui/login/bloc/cubit/login_cubit.dart' as _i32;
import '../../ui/login/bloc/cubit/otp_verify_cubit.dart' as _i34;
import '../../ui/login/bloc/cubit/update_name_cubit.dart' as _i24;
import '../../ui/order/bloc/cubit/order_cubit.dart' as _i33;
import '../../ui/products/bloc/cubit/product_cubit.dart' as _i19;
import '../../ui/products/bloc/cubit/sub_category_cubit.dart' as _i23;
import '../../ui/splash/bloc/splash_cubit.dart' as _i22;
import '../preference/app_preference.dart' as _i18;
import '../preference/preference.dart' as _i17;

const String _prod = 'prod';
const String _dev = 'dev';

// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt $initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );

  gh.factory<_i3.AddressDbRepository>(
    () => _i4.AddressDbRepositoryImpl(),
    registerFor: {_prod},
  );

  // Modified to use lambda for singleton registration
  gh.singleton<_i5.ApiService>(() => _i5.ApiService.create());

  gh.factory<_i6.AppRepository>(
    () => _i7.AppRepositoryImpl(getIt<_i5.ApiService>()),
    registerFor: {_prod},
  );

  gh.singleton<_i8.AuthApiService>(() => _i8.AuthApiService.create());

  gh.factory<_i9.DbRepository>(
    () => _i10.DbRepositoryImpl(),
    registerFor: {_prod},
  );

  gh.factory<_i11.FaqCubit>(() => _i11.FaqCubit());

  gh.factory<_i12.LoginRepository>(
    () => _i13.LoginRepositoryImpl(getIt<_i8.AuthApiService>()),
    registerFor: {_prod},
  );

  gh.factory<_i12.LoginRepository>(
    () => _i14.MockLoginRepositoryImpl(getIt<_i8.AuthApiService>()),
    registerFor: {_dev},
  );

  gh.factory<_i15.OrdersCubit>(() => _i15.OrdersCubit());
  gh.factory<_i16.PolicyCubit>(() => _i16.PolicyCubit());
  gh.factory<_i17.Preference>(() => _i18.AppPreference());

  gh.factory<_i19.ProductCubit>(() => _i19.ProductCubit(
        getIt<_i17.Preference>(),
        getIt<_i6.AppRepository>(),
        getIt<_i9.DbRepository>(),
      ));

  gh.factory<_i20.ProfileCubit>(() => _i20.ProfileCubit(
        getIt<_i17.Preference>(),
        getIt<_i6.AppRepository>(),
      ));

  gh.factory<_i21.RefundCubit>(() => _i21.RefundCubit());

  gh.factory<_i22.SplashCubit>(
      () => _i22.SplashCubit(getIt<_i17.Preference>()));

  gh.factory<_i23.SubCategoryCubit>(() => _i23.SubCategoryCubit(
        getIt<_i17.Preference>(),
        getIt<_i6.AppRepository>(),
      ));

  gh.factory<_i24.UpdateNameCubit>(() => _i24.UpdateNameCubit(
        getIt<_i17.Preference>(),
        getIt<_i12.LoginRepository>(),
        getIt<_i6.AppRepository>(),
      ));

  gh.factory<_i25.AccountCubit>(() => _i25.AccountCubit(
        getIt<_i17.Preference>(),
        getIt<_i9.DbRepository>(),
        getIt<_i3.AddressDbRepository>(),
      ));

  gh.factory<_i26.AddAddressCubit>(() => _i26.AddAddressCubit(
        getIt<_i17.Preference>(),
        getIt<_i6.AppRepository>(),
      ));

  gh.factory<_i27.AddressCubit>(() => _i27.AddressCubit(
        getIt<_i17.Preference>(),
        getIt<_i6.AppRepository>(),
        getIt<_i3.AddressDbRepository>(),
      ));

  gh.factory<_i28.CartCubit>(() => _i28.CartCubit(
        getIt<_i17.Preference>(),
        getIt<_i6.AppRepository>(),
        getIt<_i9.DbRepository>(),
        getIt<_i3.AddressDbRepository>(),
      ));

  gh.factory<_i29.CategoryCubit>(() => _i29.CategoryCubit(
        getIt<_i17.Preference>(),
        getIt<_i6.AppRepository>(),
      ));

  gh.factory<_i30.DashboardCubit>(
      () => _i30.DashboardCubit(getIt<_i9.DbRepository>()));

  gh.factory<_i31.LocationMapCubit>(
      () => _i31.LocationMapCubit(getIt<_i17.Preference>()));

  gh.factory<_i32.LoginCubit>(() => _i32.LoginCubit(
        getIt<_i12.LoginRepository>(),
        getIt<_i17.Preference>(),
      ));

  gh.factory<_i33.OrderCubit>(() => _i33.OrderCubit(
        getIt<_i17.Preference>(),
        getIt<_i6.AppRepository>(),
        getIt<_i9.DbRepository>(),
        getIt<_i3.AddressDbRepository>(),
      ));

  gh.factory<_i34.OtpVerifyCubit>(() => _i34.OtpVerifyCubit(
        getIt<_i17.Preference>(),
        getIt<_i12.LoginRepository>(),
        getIt<_i9.DbRepository>(),
        getIt<_i3.AddressDbRepository>(),
      ));

  return getIt;
}
