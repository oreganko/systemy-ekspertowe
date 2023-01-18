:- module(roslinka, [wykonaj/0]).
:- dynamic([xprawda/1, xfalsz/1, xkolor/1]).



roslinka(storczyk) :- masz(duze_naslonecznienie), potrzebujesz(duzo_wody), masz(wysoka_wilgotnosc), potrzebujesz(wymagajaca_pielegnacja),
    potrzebujesz(duzo_nawozenia), potrzebujesz(bezpieczna), potrzebujesz(mala_roslinka), potrzebujesz(kwitnienie_caly_rok), (potrzebujesz(rozowe); potrzebujesz(biale)).
roslinka(grudnik) :- masz(male_naslonecznienie), potrzebujesz(malo_wody), potrzebujesz(malo_nawozenia), potrzebujesz(mala_roslinka),
    potrzebujesz(malo_przesadzania), potrzebujesz(niewymagajaca_pielegnacja), potrzebujesz(kwitnienie_sezonowe),
    potrzebujesz(rozowe), potrzebujesz(biale), masz(niska_wilgotnosc).
roslinka(wezownica) :- masz(male_naslonecznienie), potrzebujesz(malo_wody), potrzebujesz(trujaca), potrzebujesz(niewymagajaca_pielegnacja), masz(niska_wilgotnosc).
roslinka(paproc) :- masz(male_naslonecznienie), potrzebujesz(duzo_nawozenia), potrzebujesz(malo_przesadzania),
    potrzebujesz(mala_roslinka), potrzebujesz(duzo_wody), potrzebujesz(duza_wilgotnosc), potrzebujesz(brak_kwitnienia), potrzebujesz(bezpieczna).
roslinka(dracena) :- masz(duze_naslonecznienie), potrzebujesz(duzo_wody), potrzebujesz(duza_roslinka),
    potrzebujesz(malo_nawozenia), potrzebujesz(przesadzanie), potrzebujesz(niewymagajaca_pielegnacja),potrzebujesz(brak_kwitnienia), masz(niska_wilgotnosc).
roslinka(monstera) :- (masz(male_naslonecznienie); masz(duze_naslonecznienie)), potrzebujesz(malo_wody),
    potrzebujesz(duza_roslinka), potrzebujesz(malo_nawozenia), potrzebujesz(bezpieczna), potrzebujesz(przesadzanie),
    potrzebujesz(niewymagajaca_pielegnacja), potrzebujesz(brak_kwitnienia), potrzebujesz(niska_wilgotnosc).
roslinka(skrzydlokwiat) :- masz(male_naslonecznienie), potrzebujesz(malo_wody), potrzebujesz(mala_roslinka),
    potrzebujesz(malo_nawozenia), potrzebujesz(trujaca), potrzebujesz(malo_przesadzania), potrzebujesz(niewymagajaca_pielegnacja),
    potrzebujesz(kwitnienie_caly_rok), potrzebujesz(biale), (masz(niska_wilgotnosc); masz(wysoka_wilgotnosc)).
roslinka(aloes) :- potrzebujesz(mala_roslinka), potrzebujesz(malo_wody), masz(duze_naslonecznienie), potrzebujesz(malo_nawozenia),
    potrzebujesz(bezpieczna), potrzebujesz(uzytkowa), potrzebujesz(malo_przesadzania), potrzebujesz(niewymagajaca_pielegnacja),
    potrzebujesz(brak_kwitnienia), potrzebujesz(niska_wilgotnosc).
roslinka(fikus) :- masz(duze_naslonecznienie), potrzebujesz(duzo_wody), potrzebujesz(duza_roslinka), potrzebujesz(malo_nawozenia),
    potrzebujesz(przesadzanie), potrzebujesz(niewymagajaca_pielegnacja), potrzebujesz(brak_kwitnienia),
    (masz(niska_wilgotnosc); masz(wysoka_wilgotnosc)), potrzebujesz(trujaca).
roslinka(fiolek_afrykanski) :- masz(male_naslonecznienie), potrzebujesz(malo_wody), potrzebujesz(mala_roslinka),
    potrzebujesz(duzo_nawozenia), potrzebujesz(bezpieczna), potrzebujesz(przesadzanie), potrzebujesz(niewymagajaca_pielegnacja),
    potrzebujesz(kwitnienie_caly_rok), potrzebujesz(rozowe), potrzebujesz(biale), masz(wysoka_wilgotnosc).
roslinka(kaktus) :- potrzebujesz(mala_roslinka), potrzebujesz(malo_wody), masz(duze_naslonecznienie), potrzebujesz(malo_nawozenia),
                    potrzebujesz(malo_przesadzania), potrzebujesz(niewymagajaca_pielegnacja),
                    potrzebujesz(brak_kwitnienia), potrzebujesz(niska_wilgotnosc).
roslinka(mieta) :- masz(male_naslonecznienie), potrzebujesz(duzo_wody), potrzebujesz(mala_roslinka), potrzebujesz(malo_nawozenia),
    potrzebujesz(bezpieczna), potrzebujesz(uzytkowa), potrzebujesz(malo_przesadzania), potrzebujesz(niewymagajaca_pielegnacja),
    (potrzebujesz(biale); potrzebujesz(brak_kwitnienia)).


% o roślinkach - fakty pośrednie
potrzebujesz(duzo_wody) :- prawda('lubie podlewac'), prawda('mam duzo czasu'), prawda('jestem obowiazkowy').
potrzebujesz(malo_wody) :- (falsz('lubie podlewac'); falsz('mam duzo czasu'); falsz('jestem obowiazkowy')), !.
potrzebujesz(duza_roslinka) :- falsz('parapet'), (prawda('podloga'); prawda('balkon')), !.
potrzebujesz(mala_roslinka) :- (prawda('parapet'); prawda('balkon')), !.
potrzebujesz(duzo_nawozenia) :- (prawda('lubie podlewac'); prawda('mam duzo czasu'); prawda('jestem obowiazkowy')), !.
potrzebujesz(malo_nawozenia) :- (falsz('lubie podlewac'); falsz('mam duzo czasu'); falsz('jestem obowiazkowy'); prawda('mam zwierze wolnochodzace')), !.
potrzebujesz(trujaca) :- falsz('mam zwierze wolnochodzace'), falsz('mam dziecko').
potrzebujesz(bezpieczna):- (prawda('mam zwierze wolnochodzace'); prawda('mam dziecko')), !.
potrzebujesz(uzytkowa) :- (prawda('ma byc jadana'); prawda('lubie naturalna pielegnacje ciala')), !.
potrzebujesz(przesadzanie) :- prawda('lubie babrac sie w ziemi'), prawda('mam duzo czasu'), (prawda('balkon'); prawda('podloga')), !.
potrzebujesz(malo_przesadzania) :- (falsz('lubie babrac sie w ziemi'); falsz('mam duzo czasu')), !.
potrzebujesz(wymagajaca_pielegnacja) :- prawda('lubie babrac sie w ziemi'), prawda('mam duzo czasu'), prawda('jestem obowiazkowy').
potrzebujesz(niewymagajaca_pielegnacja) :- (falsz('lubie babrac sie w ziemi'); falsz('mam duzo czasu'); falsz('jestem obowiazkowy')), !.
potrzebujesz(kwitnienie_caly_rok) :- prawda('ma kwitnac cay rok'), (lubie_kolor('wszystkie'); lubie_kolor('bialy'); lubie_kolor('rozowy')), !.
potrzebujesz(kwitnienie_sezonowe) :- falsz('ma kwitnac caly rok'), (lubie_kolor('wszystkie'); lubie_kolor('bialy'); lubie_kolor('rozowy')), !.
potrzebujesz(brak_kwitnienia) :- prawda('jestem alergikiem'), falsz('ma kwitnac caly rok'), lubie_kolor('zielony').
potrzebujesz(rozowe) :- (lubie_kolor('rozowy'); lubie_kolor('wszystkie')), !.
potrzebujesz(biale) :- (lubie_kolor('bialy'); lubie_kolor('wszystkie')), !.
masz(duze_naslonecznienie) :- (prawda('okno od poludnia'); prawda('okno od polnocy')), !.
masz(male_naslonecznienie) :- (prawda('okno od wschodu'); prawda('okno od zachodu')), !.
masz(wysoka_wilgotnosc) :- (prawda('mam wysoka wilgotnosc powietrza'); prawda('mam nawilzacz powietrza')), !.
masz(niska_wilgotnosc) :- falsz('mam wysoka wilgotnosc powietrza'), falsz('mam nawilzacz powietrza').


prawda(X) :-
    xprawda(X), !.

prawda(X) :-
    not(xfalsz(X)),
    pytaj(X, tak).

falsz(X) :-
    xfalsz(X), !.

falsz(X) :-
    not(xprawda(X)),
    pytaj(X, nie).

wczesniej_kolor(OczekiwanyKolor, PoprzedniKolor):-
    xkolor(PoprzedniKolor),
    sub_string(PoprzedniKolor, 0, _, _, OczekiwanyKolor).

wczesniej_kolor_istnieje(PoprzedniKolor) :-
    xkolor(PoprzedniKolor).

lubie_kolor(X) :-
    (wczesniej_kolor_istnieje(_); pytaj_kolor(X)), !,
    wczesniej_kolor(X, _).

pytaj_kolor(X) :-
    write('Jaki kolor lubisz? [bialy, rozowy, zielony, wszystkie]'), nl,
    readln([Response]),
    assertz(xkolor(Response)), !,
    sub_string(Response, 0, _, _, X).

pytaj(X, tak) :-
    !, write(X), write(' '),
    readln([Response]),
    zapisz(X, Response),
    odpowiedziano(Response, tak).

pytaj(X, nie) :-
    !, write(X), write(' '),
    readln([Response]),
    zapisz(X, Response),
    odpowiedziano(Response, nie).

zapisz(X, Response) :-
	odpowiedziano(Response, tak), !,
	assertz(xprawda(X)).

zapisz(X, Response) :-
	odpowiedziano(Response, nie), !,
	assertz(xfalsz(X)).

odpowiedziano(Response, tak) :-
    sub_string(Response, 0, _, _, 't').

odpowiedziano(Response, nie) :-
    sub_string(Response, 0, _, _, 'n').

resetuj :-
	write('\n\nNacisnij enter aby zakonczyc\n'),
	retractall(xprawda(_)),
	retractall(xfalsz(_)),
	retract(xkolor(_)),
	readln(_).

wykonaj :-
    write('hello\n'),
    roslinka(X), !,
    write('Roślinka dla Ciebie to: '), write(X), nl,
    resetuj.

wykonaj :-
    write('\nChyba nie powinieneś mieć roślinki :('), nl,
    write('Kup oczyszczacz powietrza :D\n'),
    resetuj.

