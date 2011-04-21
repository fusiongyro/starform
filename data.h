#ifndef _DATA_H
#define _DATA_H

#include <stdbool.h>
#include "const.h"

typedef struct 
{
  double        star_mass_r;
  double        star_lum_r;
  double        star_radius_r;
  double        star_temp;
  double        main_seq_life;
  double        star_age;
  double        r_ecosphere;
  double        r_greenhouse;
  char          star_class[17];
  int           resonance;
  unsigned long random_seed;
} stellar_system;

#endif
