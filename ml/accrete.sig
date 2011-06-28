structure Accrete =
struct

datatype dust_s = DUST of { inner_edge : real
			  , outer_edge : real
			  , has_dust   : bool
			  , has_gas    : bool
			  , next_band  : dust_s ref
			  }

datatype accretion = ACCRETION of { planet_head : planet ref
				  , dust_left : int
				  , r_inner : real
				  , r_outer : real
				  , reduced_mass : real
				  , dust_density : real
				  , cloud_eccen : real
				  , dust_head : dust ref
				  }

(* If these are our entry points, they should probably look more like
   entry points than random functions. -DKL *)

val stellar_dust_limit : double -> double

val distribute_planetary_masses : (stellar_system ref) * real * real -> (planet ref)

val do_dist_moon_masses : real * real -> (planet ref)

end
