signature STRUCTS =
sig

type planet_s = { a : real
		, e : real
		, mass : real
		, gas_giant : bool
		, orbit_zone : int
		, radius : real
		, density : real
		, orb_period : real
		, day : real
		, resonant_period : bool
		, axial_tilt : int
		, esc_velocity : real
		, surf_accel : real
		, surf_grav : real
		, rms_velocity : real
		, molec_weight : real
		, volatile_gas_inventory : real
		, surf_pressure : real
		, greenhouse_effect : int
		, boil_point : real
		, albedo : real
		, surf_temp : real
		, hydrosphere : real (* these three are percent of surface covered *)
		, cloud_cover : real
		, ice_cover : real
		, first_moon : planet ref
		, next_planet : planet ref
		}

type flags = { make_moon : bool
	     , verbose : bool
	     }

end

