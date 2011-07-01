structure StellarType =
struct

type stellar_type = 
  { starClass : string
  , maxTemp : real
  , minTemp : real
  , balmer : string
  , lines : string
  , mass : real
  , size : real
  , density : real
  , luminosity : real
  , starAge : real }

val starTypes = map (fn (class,maxTemp, minTemp,balmer,lines,mass,size,density,lum,age) => 
			 {starClass = class, maxTemp = maxTemp, minTemp = minTemp, balmer = balmer, lines = lines,
			  mass = mass, size = size, density = density, luminosity = lum, starAge = age})
		     [
(* Type  Tsurf    Tsurf   Balmer     Other Lines        Mrel   Rrel rho     Lrel     MS Age *)
(*         max     min    lines                                                      years  *)
  ("O", 66000.0, 33000.0, "weak",    "He+ O-II He-II", 40.0,  17.8, 0.01, 405000.0,    1e6),
  ("B", 33000.0, 10000.0, "medium",  "He",             18.0,   7.4, 0.1,   13000.0,   11e6),
  ("A", 10000.0,  7500.0, "strong",  "",                3.5,   2.5, 0.3,      80.0,  440e6),
  ("F",  7500.0,  6000.0, "medium",  "",                1.7,   1.4, 1.0,       6.4,    3e9),
  ("G",  6000.0,  5200.0, "weak",    "Ca++ Fe++",       1.1,   1.0, 1.4,       1.4,    8e9),
  ("K",  5200.0,  3700.0, "v. weak", "Ca++ Fe++",       0.8,   0.8, 1.8,       0.46,  17e9),
  ("M",  3700.0,  1500.0, "v. weak", "Ca++ TiO2",       0.5,   0.6, 2.5,       0.08,  56e9),
  ("D",  1500.0,     0.0, "none",    "",                0.0,   0.0, 2.5,       0.00,  56e9)]

(* This seems overly convoluted. *)
fun findStarClass temperature = 
  let
    fun rangeDigit (high, low) v = let 
        val result = floor(10.0 * (high - v) / (high - low))
      in if result = 10 then "9" else Int.toString(result) end 
      handle Domain => "0"
    
    fun show (NONE : stellar_type option) = "--"
      | show (SOME {starClass, maxTemp, minTemp, ...}) = 
        starClass ^ (rangeDigit (maxTemp, minTemp) temperature)
    
  in show (List.find (fn {minTemp, ...} => temperature >= minTemp) starTypes) end

fun main () = 
  let
    val (SOME line) = TextIO.inputLine TextIO.stdIn
  in case Real.fromString line 
    of SOME temp => (print (findStarClass temp ^ "\n"); main ())
     | NONE      => ()
  end
end
