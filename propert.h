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

char *propFindLiquidAtTemp(char *out, double temp);
char *propSortByMelt(char *list);
int  propMakeVector(char *str, Property ** vec, int max);
char *propFindGasAtTemp(char *out, double temp);
char *propSortByAbundance(char *list);
char *propSortReverse(char *list);

#endif
