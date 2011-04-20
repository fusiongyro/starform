#ifndef _PROPERT_H
#define _PROPERT_H

typedef struct PropertyS Property;
struct PropertyS
{
  int         num;
  char       *symbol;
  char       *name;
  double      weight;
  double      melt;
  double      boil;
  double      density;
  double      abunde;
  double      abunds;
  double      reactivity;
};

extern Property property[];

int  propMakeVector(char *str, Property ** vec, int max);
char *propSortByWeight(char *list);
char *propSortByMelt(char *list);
char *propSortByBoil(char *list);
char *propSortByAbundance(char *list);
char *propSortReverse(char *list);
char *propFindGasAtTemp(char *out, double temp);
char *propFindLiquidAtTemp(char *out, double temp);
char *propFindSolidAtTemp(char *out, double temp);

#endif
