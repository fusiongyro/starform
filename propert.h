#ifndef _PROPERT_H
#define _PROPERT_H

typedef struct
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
} element;

extern element elements[];

char *find_liquid_elements_at_temp(char *out, double temp);
char *propSortByMelt(char *list);
int  propMakeVector(char *str, element ** vec, int max);
char *propFindGasAtTemp(char *out, double temp);
char *propSortByAbundance(char *list);
char *propSortReverse(char *list);

#endif
