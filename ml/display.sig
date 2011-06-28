signature DISPLAY =
sig

(* there's an implicit dependency between these and the arguments
   struct. -DKL *)

val verbose_print : string -> unit
val display_system : stellar_system ref -> unit

end
