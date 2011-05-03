#ifndef _STARFORM_H
#define _STARFORM_H

#include "const.h"
#include "structs.h"

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

void init(void);
planet* generate_stellar_system(stellar_system* system, unsigned long random_seed);

#endif
