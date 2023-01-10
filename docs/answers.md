## Fråga 1

Eftersom att haskell är ett så kallat "lazy" programmeringsspråk så kommer den inte att validera den oändliga listan (och därav krascha, som många andra språk) utan istället endast plocka ut de nummer som behövs. Detta leder till att listan endast i detta fall valideras upp till 1000000.

## Fråga 2

Det innebär inom programmering att en function anroppar sig självt. I min kod har jag flera exempel på detta bl.a. hur min skyffla funktion anroppar sig själv med nya värden. Då appliceras hela funktionen igen och resultatet läggs sedan ihop med det förra resultatet, tills de nya värden är == [] då returnerar den hela den resulterande listan.

Summa summarum: En function som i sin definition har med sig själv är en rekursiv funktion.

## Fråga 3

Rekursionen fungerar i javascript, däremot kan du inte definera samma funktion flera gånger i JS. I haskell kan du definera samma funktion med olika förbestämda värden. Stämmer detta förbestämda värde då överens med det givna värdet kommer funktionen istället att köra koden definerad i den funktionen, i det här fallet returnera (s) om (n) == 0.
