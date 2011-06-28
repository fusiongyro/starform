structure Utils : UTILS =
struct

(*----------------------------------------------------------------------*)
(*  This function returns a random real number between the specified    *)
(* inner and outer bounds.                                              *)
(*----------------------------------------------------------------------*)
val r = Random.rand (1, 1)

fun random_number (inr, out) = (Random.randReal r) * (out - inr) + inr

(*----------------------------------------------------------------------*)
(*   This function returns a value within a certain variation of the    *)
(*   exact value given it in 'value'.                                   *)
(*----------------------------------------------------------------------*)

fun about (v, var) = v + v * random_number(~var, var)

fun random_eccentricity () =
    1.0 - Math.pow(random_number(0.000001, 1.0), Constants.ECCENTRICITY_COEFF)

end
