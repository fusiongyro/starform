signature STELLAR_TYPE =
sig

type stellar_type = { star_class : string
		    , temp : real
		    , balmer : string
		    , lines : string
		    , mass : real
		    , size : real
		    , density : real
		    , lum : real
		    , star_age : real
		    }

val star_types : stellar_type list

val find_star_class : real -> string

end

