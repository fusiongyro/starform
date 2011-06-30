structure StellarType =
struct

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

val star_types = map (fn (class,temp,balmer,lines,mass,size,density,lum,age) => 
			 {star_class = class, temp = temp, balmer = balmer, lines = lines,
			  mass = mass, size = size, density = density, lum = lum, star_age = age})
		     [
(*  Type  Tsurf   Balmer     Other Lines        Mrel   Rrel  rho     Lrel     MS Age *)
(*         max    lines                                                        years *)
  ("O",  1.0e10,  "weak",    "He+ O-II He-II", 40.0,  17.8, 0.01, 405000.0,    1e6),
  ("B", 30000.0,  "medium",  "He",             18.0,   7.4, 0.1,   13000.0,   11e6),
  ("A", 12000.0,  "strong",  "",                3.5,   2.5, 0.3,      80.0,  440e6),
  ("F",  7500.0,  "medium",  "",                1.7,   1.4, 1.0,       6.4,    3e9),
  ("G",  6000.0,  "weak",    "Ca++ Fe++",       1.1,   1.0, 1.4,       1.4,    8e9),
  ("K",  5000.0,  "v. weak", "Ca++ Fe++",       0.8,   0.8, 1.8,       0.46,  17e9),
  ("M",  3500.0,  "v. weak", "Ca++ TiO2",       0.5,   0.6, 2.5,       0.08,  56e9),
  ("D",  1500.0,  "none",    "",                0.0,   0.0, 2.5,       0.00,  56e9)]

(* This seems overly convoluted. *)
fun findStarClass temperature = let
    val temperatures = map #temp star_types
    val ranges = ListPair.zip ([Real.posInf] @ temperatures, temperatures)

    fun rangeOffsetToDigit (high, low) v = let 
        val result = floor(10.0 * (high - v) / (high - low))
      in if result = 10 then 9 else result end

    val (SOME (high, low)) = List.find (fn (high, low) => temperature < high andalso temperature >= low) ranges
    val (SOME starType) = List.find (fn ({temp=t : real, ...}) => high <= t andalso t <= high) star_types

  in (#star_class starType) ^ (Int.toString (rangeOffsetToDigit (high, low) temperature)) end


fun main () = let
    val (SOME line) = TextIO.inputLine TextIO.stdIn
  in case Real.fromString line of
    SOME temp => (print (findStarClass temp ^ "\n"); main ())
  | NONE      => ()
  end

end
