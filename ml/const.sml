structure Constants =
struct

(*#ifndef RAND_MAX
#ifdef LONG_RAND
#define RAND_MAX        2147483647.0
#else
#define RAND_MAX        32767.0
#endif
#endif
*)

val RADIANS_PER_ROTATION          =      2.0 * Math.pi
val ECCENTRICITY_COEFF            =      0.077
val PROTOPLANET_MASS              =      1.0E~15          (* Units of solar masses      *)
val CHANGE_IN_EARTH_ANG_VEL       =     ~1.3E~15          (* Units of radians/sec/year  *)
val SOLAR_MASS_IN_GRAMS           =      1.989E33         (* Units of grams             *)
val SOLAR_RADIUS_IN_METRES        =      6.96e8           (* units of metres            *)
val EARTH_MASS_IN_GRAMS           =      5.977E27         (* Units of grams             *)
val EARTH_RADIUS                  =      6.378E8          (* Units of cm                *)
val EARTH_DENSITY                 =      5.52             (* Units of g/cc              *)
val KM_EARTH_RADIUS               =   6378.0              (* Units of km              *)
val EARTH_ACCELERATION            =    981.0              (* Units of cm/sec2         *)
val EARTH_AXIAL_TILT              =     23.4              (* Units of degrees         *)
val EARTH_EXOSPHERE_TEMP          =   1273.0              (* Units of degrees Kelvin  *)
val SUN_MASS_IN_EARTH_MASSES      = 332775.64             
val EARTH_EFFECTIVE_TEMP          =    255.0              (* Units of degrees Kelvin  *)
val EARTH_ALBEDO                  =      0.3              
val CLOUD_COVERAGE_FACTOR         =      1.839E~8         (* Km2/kg                   *)
val EARTH_WATER_MASS_PER_AREA     =      3.83E15          (* grams per square km     *)
val EARTH_SURF_PRES_IN_MILLIBARS  =   1000.0              
val EARTH_CONVECTION_FACTOR       =      0.43             (* from Hart, eq.20         *)
val FREEZING_POINT_OF_WATER       =    273.0              (* Units of degrees Kelvin  *)
val DAYS_IN_A_YEAR                =    365.256            (* Earth days per Earth year *)
val GAS_RETENTION_THRESHOLD       =      5.0              (* ratio of esc vel to RMS vel *)
val GAS_GIANT_ALBEDO              =      0.5              (* albedo of a gas giant    *)
val CLOUD_ALBEDO                  =      0.52
val AIRLESS_ROCKY_ALBEDO          =      0.07
val ROCKY_ALBEDO                  =      0.15
val WATER_ALBEDO                  =      0.04
val AIRLESS_ICE_ALBEDO            =      0.5
val ICE_ALBEDO                    =      0.7
val SECONDS_PER_HOUR              =   3600.0
val CM_PER_AU                     =      1.495978707E13   (* number of cm in an AU    *)
val CM_PER_KM                     =      1.0E5            (* number of cm in a km     *)
val KM_PER_AU                     = CM_PER_AU / CM_PER_KM 
val CM_PER_METER                  =    100.0              
val MILLIBARS_PER_BAR             =   1000.0              
val KELVIN_CELCIUS_DIFFERENCE     =    273.0              
val GRAV_CONSTANT                 =      6.672E~8         (* units of dyne cm2/gram2  *)
val GREENHOUSE_EFFECT_CONST       =      0.93             (* affects inner radius..   *)
val MOLAR_GAS_CONST               =   8314.41             (* units: g*m2/sec2*K*mol *)
val K                             =     50.0              (* K = gas/dust ratio       *)
val B                             =      1.2E~5           (* Used in Crit_mass calc   *)
val DUST_DENSITY_COEFF            =      2.0E~3           (* A in Dole's paper        *)
val ALPHA                         =      5.0              (* Used in density calcs    *)
val N                             =      3.0              (* Used in density calcs    *)
val J                             =      1.46E~19         (* Used in day~length calcs cm2/sec2 g *)
val INCREDIBLY_LARGE_NUMBER       =      9.9999E37        (* ??? *)

(*  Now for a few molecular weights used for RMS velocity calcs:     *)
(*  This table is from Dole's book "Habitable Planets for Man", p. 38  *)

val ATOMIC_HYDROGEN   =   1.0  (* H   *)
val MOL_HYDROGEN      =   2.0  (* H2  *)
val HELIUM            =   4.0  (* He  *)
val ATOMIC_NITROGEN   =  14.0  (* N   *)
val ATOMIC_OXYGEN     =  16.0  (* O   *)
val METHANE           =  16.0  (* CH4 *)
val AMMONIA           =  17.0  (* NH3 *)
val WATER_VAPOR       =  18.0  (* H2O *)
val NEON              =  20.2  (* Ne  *)
val MOL_NITROGEN      =  28.0  (* N2  *)
val CARBON_MONOXIDE   =  28.0  (* CO  *)
val NITRIC_OXIDE      =  30.0  (* NO  *)
val MOL_OXYGEN        =  32.0  (* O2  *)
val HYDROGEN_SULPHIDE =  34.1  (* H2S *)
val ARGON             =  39.9  (* Ar  *)
val CARBON_DIOXIDE    =  44.0  (* CO2 *)
val NITROUS_OXIDE     =  44.0  (* N2O *)
val NITROGEN_DIOXIDE  =  46.0  (* NO2 *)
val OZONE             =  48.0  (* O3  *)
val SULPH_DIOXIDE     =  64.1  (* SO2 *)
val SULPH_TRIOXIDE    =  80.1  (* SO3 *)
val KRYPTON           =  83.8  (* Kr  *)
val XENON             = 131.3  (* Xe  *)

(*  The following defines are used in the kothari_radius function in    *)
(*  file enviro.c.                                                      *)
val A1_20   = 6.485E12      (* All units are in cgs system.  *)
val A2_20   = 4.0032E~8     (*   ie: cm, g, dynes, etc.      *)
val BETA_20 = 5.71E12

(*   The following defines are used in determining the fraction of a planet  *)
(*  covered with clouds in function cloud_fraction in file enviro.c.         *)
val Q1_36 = 1.258E19      (* grams    *)
val Q2_36 = 0.0698        (* 1/Kelvin *)

end
