This is the link to the homework's details : https://gitlab.cs.pub.ro/iocla/tema-2-2025

Task1 - Numbers

Cu registrul ecx iterez actualizez offset-ul elementelor vectorului initial,
iar in edx actualizez numarul de elemente al vectorului final. Cat timp inca am
elemente in vectorul initial, verific daca elementul curent este putere a lui 2
inmultind in mod repetitiv registrul eax (initial el este 1) pana cand 2^eax >=
elementul curent. Daca este egal, trec peste el, iar daca este mai mare verific
daca este numar impar folosind operatii pe biti. In caz afirmativ, trec la
urmatorul element, iar in caz contrar il adaug in vectorul final. La final,
adaug 1 la registrul edx intrucat am inceput numararea de la 0.


Task 2 - Events

Subtask 1

Initializez cele 2 structuri din cerinta si cat timp mai am elemente in input,
verific pentru fiecare zi daca este intre 1 si numarul de zile corespunzatoare
lunii din numar_zile, pentru luna daca este intre 1 si 12 si pentru an daca
este intre 1990 si 2030 si actualizez variabila valid din elementul structurii
respective.


Subtask 2

In esi pun primul iterator din cele 2 for-uri, iar in edi il pun cel de-al
doilea. De acum incolo, ma voi referi la primul element ca fiind elementul
curent din primul for iar al doilea element ca fiind elementul curent din al
doilea for. In continuare, compar valid-ul celor doua element si daca sunt
ambele 0, verific datele din ele, comparand eventual numele lor, si facand
interschimbare daca este cazul. Voi face direct interschimbare daca valid-ul
primului element este 0 si al celui de-al doilea este 1, iar daca primul este 1
si al doilea este 0 trec la urmatorul element din al doilea for. Daca ambele
sunt 1, verific datele intre ele (anul, luna, ziua si numele elementului) si
fac interschimbare daca este cazul. Label-ul str_cmp compara caracter cu
caracter numele celor 2 elemente.


Task 3 - Base64

Cu registrul ecx actualizez numarul final de elemente iar cu edx iterez prin
vectorul initial de elemente. Cat timp inca exista caractere in acesta,
realizez impartirea bitilor astfel : acestia sunt deja in binar, asa ca pun
primele 3 caractere (de la fiecare iteratie), alcatuite din 8 biti fiecare, in
3 registre diferite si imediat dupa le mut pe toate in registrul eax. Dupa
aceea, construiesc primul numar format din primii 6 biti, al doilea din
urmatorii 6 biti s.a.m.d., folosindu-ma de alfabet-ul din sectiunea data. La
final, pun numarul de elemente la adresa corespunzatoare, neuitand inainte sa
actualizez numarul de elemente dar si numarul de elemente reprezentat de
registrul care itereaza prin vectorul initial.


Task 4 - Sudoku

Label-ul check_row determina mai intai ultimul index al randului si itereaza
prin cele 9 elemente de pe fiecare linie. Astfel, folosind 2 loop-uri compar
elementul din primul loop cu toate elementele din loop-ul al 2-lea, care
porneste de la index-ul primului + 1. La fiecare loop verific daca cele
2 elemente sunt intre 1 si 9 si apoi le compar intre ele. Daca sunt egale sau
daca nu sunt intre 1 si 9, eax va fi 0 si ies din loop-uri, iar daca am ajuns
pana la finalul randului eax va fi 1.

Analog ca la label-ul check_row, label-ul check_col determina mai intai ultimul
index al coloanei si itereaza prin cele 9 elemente de pe fiecare coloana. 
Astfel, folosind 2 loop-uri compar elementul din primul loop cu toate elementele
din loop-ul al 2-lea, care porneste de la index-ul primului + 1. La fiecare 
loop verific daca cele 2 elemente sunt intre 1 si 9 si apoi le compar intre 
ele. Daca sunt egale sau daca nu sunt intre 1 si 9, eax va fi 0 si ies din 
loop-uri, iar daca am ajuns pana la finalul randului eax va fi 1.

In label-ul check_box, pun in eax indexul de inceput al cutiei la care ma aflu
si in ecx cutia la care sunt, actualizand eax corespunzator. In registrul cl
pun cate un element de pe cele 9 pozitii din cutie, verific daca este intre 1
si 9 si in ebx shiftez la stanga cu valoarea elementului pozitii. Dupa aceea,
adun toate valorile in registrul edx si daca nu am duplicate, in final ultimele
valori ale lui edx ar trebui sa fie 1111111110, adica 1022 si pun in eax
rezultatul dorit.