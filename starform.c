
#include <stddef.h>
#include <stdlib.h>
#include <stdio.h>
#include <float.h>
#include <math.h>
#include <sys/types.h>
#include <sys/timeb.h>
         
#include "const.h"
#include "structs.h"

#include "gensys.h"
#include "accrete.h"
#include "enviro.h"
#include "display.h"
#include "utils.h"
#include "steltype.h"
#include "propert.h"
#include "data.h"

flags args;

int main(int argc, char **argv)
{
  unsigned long random_seed = 0;
  
  char       *c,
             *prognam;
  int         skip;
  int         nstars = 1;

  prognam = argv[0];
  while (--argc > 0 && (*++argv)[0] == '-')
  {
    for (c = argv[0] + 1, skip = false; (*c != '\0') && (!(skip)); c++)
      switch (*c)
      {
      case 'm':         /* set moon output */
        args.make_moon = true;
        break;
      case 'l':         /* set lisp output */
        args.display_lisp = true;
        break;
      case 'g':         /* display graphically */
        args.display_graphics = true;
        break;
      case 's':         /* set random seed */
        random_seed = strtoul(&(*++c), NULL, 0);
        skip = true;
        break;
      case 'v':         /* increment verbosity */
        args.verbose = true;
        break;
      case 'n':
        nstars = strtoul(&(*++c), NULL, 0);
        skip = true;
        break;
      default:
      case '?':
        fprintf(stderr, "%s: Usage: %s [-l] [-g] [-s#] [-v] [-m]\n",
                prognam, prognam);
        return (1);
      }
  }
  while (nstars-- > 0)
  {
    stellar_system system;
    planet_pointer first_planet;
    first_planet = generate_stellar_system(&system, random_seed);
    display_system(&system, first_planet);
  }
  return (0);
}
