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
(*  Type  Tsurf   Balmer     Other Lines     Mrel  Rrel  rho   Lrel   MS Age *)
(*         max    lines                                                years *)
  ("O0",  1.0e10,  "weak",    "He+ O-II He-II", 40.0,  17.8, 0.01, 405000.0,  1e6),
  ("B0", 30000.0,  "medium",  "He",             18.0,   7.4, 0.1,  13000.0,  11e6),
  ("A0", 12000.0,  "strong",  "",               3.5,    2.5, 0.3,  80.0,    440e6),
  ("F0",  7500.0,  "medium",  "",               1.7,    1.4, 1.0,  6.4,       3e9),
  ("G0",  6000.0,  "weak",    "Ca++ Fe++",      1.1,    1.0, 1.4,  1.4,       8e9),
  ("K0",  5000.0,  "v. weak", "Ca++ Fe++",      0.8,    0.8, 1.8,  0.46,     17e9),
  ("M0",  3500.0,  "v. weak", "Ca++ TiO2",      0.5,    0.6, 2.5,  0.08,     56e9),
  ("D0",  1500.0,  "none",    "",               0.0,    0.0, 2.5,  0.00,     56e9)]

(*
- val temperatures = map #temp StellarType.star_types;
val temperatures =
  [10000000000.0,30000.0,12000.0,7500.0,6000.0,5000.0,3500.0,1500.0]
  : real list
- val ranges = ListPair.zip ([Real.posInf] @ temperatures, temperatures);
val ranges =
  [(inf,10000000000.0),(10000000000.0,30000.0),(30000.0,12000.0),
   (12000.0,7500.0),(7500.0,6000.0),(6000.0,5000.0),(5000.0,3500.0),
   (3500.0,1500.0)] : (real * real) list
*)

fun rangeOffsetToDigit (high, low) v = floor(10.0 * (high - v) / (high - low))

(*
const char* find_star_class(double temperature)
{
  static char star_class[16];
  double      dm;
  int         sub;
  stellar_type *p = find_stellar_type_by_temp(temperature);

  if (!p)
    return NULL;
  
  if (p == STAR_TYPES)
    return p->star_class;

  --p;
  
  /* p -> smallest star with more mass than wanted */
  dm = p->temp - p[1].temp;
  sub = (int)(10 * (p->temp - temperature) / dm);

  sprintf(star_class, "%c%d", p->star_class[0], sub);
  return star_class;
}
*)

end
