signature ENVIRONMENT =
sig

val luminosity : real -> real
val orbital_zone : stellar_system ref * real -> int
val volume_radius : real * real -> real
val kothari_radius : real * bool * int -> real
val empirical_density : stellar_system ref * real * real * bool -> real
val volume_density : real * real -> real
val period : real * real * real -> real
val day_length : stellar_system ref * real * real * real * real * real * real * bool * real -> real
val inclination : real -> int
val escape_velocity : real * real -> real
val rms_velocity : stellar_system ref * real * real -> real
val molecule_limit : real * real -> real
val acceleration : real * real -> real
val gravity : real -> real
val greenhouse : int * real * real -> int
val vol_inventory : real * real * real * real * int * int -> real
val pressure : real * real * real -> real
val boiling_point : real -> real
val iterate_surface_temp : stellar_system ref * planet ref -> unit
val iterate_surface_temp_moon : stellar_system ref * planet ref * planet ref -> unit

end

