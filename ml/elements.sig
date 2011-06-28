signature ELEMENTS =
sig

type element = { num : int
	       , symbol : string
	       , name : string
	       , weight : real
	       , melt : real
	       , boil : real
	       , density : real
	       , abunde : real
	       , abunds : real
	       , reactivity : real
	       }

val elements : element vector

val find_liquid_elements_at_temp : real -> (string * string)
val find_gas_elements_at_temp : real -> (string * string)

val sort_elements_by_melting_point : string list -> string
val sort_elements_by_abundance : string list -> string
val sort_elements_reverse : string -> string

val make_element_vector : string * element vector * int -> int

end
