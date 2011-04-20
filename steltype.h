#ifndef _STELTYPE_H
#define _STELTYPE_H

typedef struct StellarTypeS StellarType;
struct StellarTypeS
{
  const char *star_class;
  double      temp;
  const char *balmer;
  const char *lines;
  double      mass;
  double      size;
  double      density;
  double      lum;
  double      star_age;
};
 
extern StellarType StarType[];

StellarType *starFindByMass(double mass);
StellarType *starFindByTemp(double temp);
const char *starFindClass(double mass, double temp);

#endif
