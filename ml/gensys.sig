signature GENSYS =
sig

type stellar_system = { star_mass_r : real
		      , star_lum_r : real
		      , star_radius_r : real
		      , star_temp : real
		      , main_seq_life : real
		      , star_age : real
		      , r_ecosphere : real
		      , r_greenhouse : real
		      , star_class : string
		      , resonance : int
		      , random_seed : int
		      , first_planet : planet ref
		      }

val init : unit -> unit
val generate_stellar_system : int -> stellar_system ref
val free_stellar_system : stellar_system ref -> unit

end
