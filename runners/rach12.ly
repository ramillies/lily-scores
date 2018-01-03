
%% LilyPond file generated hy Denemo version 2.0.13

%%http://www.gnu.org/software/denemo/

\include "custom.ly"

\header {
	tagline = ""
	copyright = ""
}

global = {
	\key gis \minor
	\time 12/8
	\globalstyle
	\override Score.BarNumber.break-visibility = ##(#t #t #t)
	\set Score.barNumberVisibility = #(every-nth-bar-number-visible 5)
}

% The music follows

MvmntIVoiceI = {
	\tempo\markup\main-tempo "Allegro." 4 = 120
         gis''16(\p dis'' gis'\< dis'' gis'' dis'' gis''() dis'' gis' dis'' gis'' dis'') gis''( dis'' gis' dis'' gis'' dis'') gis''( dis'' gis' dis'' gis'' dis'') |
         gis''(\f dis''\> gis' dis'' gis'' dis'') gis''( dis'' gis' dis'' gis'' dis'') gis''( dis'' gis' dis'' gis'' dis'') gis''( dis'' gis' dis'' gis'' dis'') |
         gis''(\p dis'' gis' dis'' gis'' dis'') \rit gis''( dis'' gis' dis'' gis'' dis'') gis''( dis'' gis' dis'' gis'' dis'') ais''( dis'' gis' dis'' gis'' dis'') |
         gis''( dis'' gis' dis'' gis'' dis'') gis''( dis'' gis' dis'' gis'' dis'') gis''( dis'' gis' dis'' gis'' dis'') a''( e'' a' e'' a'' e'') |
%5
         \accel gis''( dis'' gis' dis'' gis'' e'') dis''( gis' dis' gis' dis'' gis') dis''(_\markup\italic "dim." gis' dis' gis' dis'' gis'() dis'' fisis' cis' fisis' dis'' fisis') |
         \a-tempo dis''\pp\< gis'( dis' gis' dis'' gis') dis''( gis' dis' gis' dis'' gis') dis''(\sf\> gis' dis' gis' dis'' gis') \rit dis''( gis' dis' gis' dis'' gis') |
         dis''( gis' dis' gis' dis'' gis') dis''( gis' dis' gis' e'' gis')\p e''( a' e' a' e'' a') dis''( fisis' cis' fisis' dis'' fisis') |
         \accel dis''( gis' dis' gis' dis'' gis') dis''(\< gis' dis' gis' dis'' gis') gis''( dis'' gis' dis'' gis'' dis'') gis''( dis'' gis' dis'' gis'' dis'') |
         \a-tempo gis''(\f dis'' gis' dis'' gis'' dis'') gis''( dis'' gis' dis'' gis'' dis'') gis''( dis'' gis' dis'' gis'' dis'') gis''( dis'' gis' dis'' gis'' dis'') |
%10
         gis''(_\markup\italic "dim." dis'' gis' dis'' gis'' dis'') gis''( dis'' gis' dis'' gis'' dis'') \rit gis''( dis'' gis' dis'' gis'' dis'') gis''( dis'' gis' dis'' gis'' dis'') |
         gis''\p( dis'' gis' dis'' gis'' dis'') gis''( dis'' gis' dis'' gis'' dis'') gis''( dis'' gis' dis'' gis'' dis'') g''( h' g' h' g'' h') |
         fis''( h' fis' h' fis'' e'') dis''( fis' dis' fis' dis'' fis') dis''( fis' dis' fis' dis'' fis') dis''( fisis' cis' fisis' dis'' fisis') |
         \time 6/8  dis''( gis' dis' gis' dis'' gis') dis''( gis' dis' gis' dis'' gis') |
         \time 12/8  dis''( g' dis' g' dis'' g') dis''( g' dis' g' dis'' g') dis''( gis' dis' gis' dis'' gis') dis''( gis' dis' gis' dis'' gis') |
%15
         dis''(\p ais' dis' ais' dis'' ais') dis''( ais' dis' ais' dis'' ais') r h'( dis'' h' dis' h') r h'( cisis'' h' cisis' h') |
         \stemUp <ais' dis''>8 \oneVoice dis''16([ ais'' dis''' ais'')] dis'''( ais'' dis'' ais'' dis''' ais'') dis'''( ais'' dis'' ais'' dis''' ais''16) <dis'' h'' dis'''>4\f-- <fis'' fis'''>8 |
         <dis'' ais'' dis'''>2.-- dis'''16( ais'' dis'' ais'' dis''' ais'') <dis'' a'' dis'''>4--\f( <fis'' fis'''>8) |
         <dis'' gis'' dis'''>2.-- dis'''16( gis'' dis'' gis'' dis''' gis'') <dis'' fisis'' dis'''>4--( <fis'' fis'''>8) |
         r dis''16( fis'' dis''' fis'') dis'''( fis'' dis'' fis'' dis''' fis'') dis'''(_\markup\italic "dim." fis'' dis'' fis'' dis''' fis'') \rit <dis'' dis'''>4( <fis'' fis'''>8) |
%20
        <dis'' dis'''>4.\p \a-tempo dis'''~\mf ( dis'''4 cis'''8 \priraz {h''16 cis'''}  h''8 ais'' gis'' |
         fis''4.) ais''~-- ( ais''4 gis''8 \priraz {fis''16 gis''}  fis''8 e'' dis'') |
         cis''4. gis''~-> ( gis''4 fis''8 \priraz {e''16 fis''}  e''8 dis'' cis'' |
         h'4.) e''~ (_\markup\italic "dim." e''4 \rit dis''8 cis'' h' ais'~ ) |
         \a-tempo <ais' dis''>4.\pp r8_\markup\italic "poco a poco cresc." \skip 4 r8 \skip 8 \skip 8 r8 \skip 4 |
%25
         r8 <dis'' fisis'' cis'''>16( cis'' <dis'' fisis'' cis'''> cis'') r8 <fisis'' ais''>16( dis'' <fisis'' ais''> ais') r8 <fisis'' ais''>16( dis'' <fisis'' ais''> ais') r8 <fisis'' h''>16( dis'' <fisis'' h''> h') |
         r8 <dis'' fisis'' cis'''>16( cis'' <dis'' fisis'' cis'''> cis'') r8 <fisis'' h''>16( e'' <fisis'' h''> h') r8 <fisis'' h''>16( e'' <fisis'' h''> h') r8 <h'' cis'''>16( fisis'' <h'' cis'''> cis'') |
         r8 <fisis'' h'' dis'''>16( dis'' <fisis'' h'' dis'''> dis'') r8 <fisis'' h''>16( e'' <fisis'' h''> h') r8 <fisis'' h''>16( e'' <fisis'' h''> h') r8 <h'' cis'''>16( fisis'' <h'' cis'''> cis'') |
         r8 <fisis'' h'' dis'''>16( dis'' <fisis'' h'' dis'''> dis'') r8 <h'' cis'''>16( fisis'' <h'' cis'''> cis'') r8 <h'' cis'''>16( fisis'' <h'' cis'''> cis'') r8 <fisis'' h'' dis'''>16( dis'' <fisis'' h'' dis'''> dis'') |
         r8 <fisis'' h'' e'''>16( e'' <fisis'' h'' e'''> e'') r8 <fisis'' h'' cis'''>16( cis'' <fisis'' h'' cis'''> cis'') r8 <fisis'' h'' cis'''>16( cis'' <fisis'' h'' cis'''> cis'') r8 <fisis'' h'' dis'''>16( dis'' <fisis'' h'' dis'''> dis'') |
%30
         r8 <fisis'' h'' e'''>16( e'' <fisis'' h'' e'''> e'') r8 <cis''' dis''' fis'''>16( fis'' <cis''' dis''' fis'''> fis'') r8 <cis''' dis''' fis'''>16( fis'' <cis''' dis''' fis'''> fis'') <g'' cis''' e''' g'''>8\< <gis'' cis''' e''' gis'''> <a'' cis''' e''' a'''> |
         <ais'' dis''' ais'''>\sff dis''16( cis'' dis'' ais' dis'' cis'' dis'' ais' dis'' cis'') dis''( cis'' dis'' cis'' dis'' cis'' dis'' cis'' dis'' cis'' dis'' cis'') |
         dis''( cis'' dis'' ais' dis'' cis'' dis'' ais' dis'' cis'' dis'' ais' ) dis'''16(-> dis''16 dis''16 cis''16) dis'''16(-> dis'' dis'' cis'' ) dis'''(-> dis'' dis'' cis'') |
         dis''(->\> cis'' dis'' ais') r8 r\p dis'16( cis' dis' cis')\< r8 dis''16( cis'' dis'' cis''16 dis''16 cis''16 dis''16 cis''16 dis''16 cis''16) |
	 <h' dis''>4.->\ff gis''16( dis'' gis'  dis'' gis'' dis'' ) gis''( dis'' gis' dis'' gis'' dis'') gis''( dis'' gis' dis'' gis'' dis'') |
%35
         gis''( dis'' gis' dis'' gis'' dis'') gis''( dis''\> gis' dis'' gis'' dis'') gis''( dis'' gis' dis'' gis'' dis'') gis''( dis'' gis' dis'' gis'' dis'' )\p |
         \tempo\markup\sans\bold "Meno mosso" gis''( dis'' gis' dis'' gis'' dis'') gis''( dis'' gis' dis'' gis'' dis'') gis''( dis'' gis' dis'' gis'' dis'') gis''( dis'' gis' dis'' gis'' dis'') |
         gis''( dis'' gis' dis'' gis'' dis'') gis''( dis'' gis' dis'' gis'' dis'') gis''( dis'' gis' dis'' gis'' dis'') \stemUp \slurUp <h' e'' dis'''>4(\mf\strum <cis'' cis'''>8) |
         \tieUp <h' h''>2.~  h''4 <cis'' cis'''>8( <ais' ais''>4\> h''8 |
         gis''4)\p \oneVoice r8 h'16( dis' h dis' h' dis') h'( e' cis' e' cis'' e') cis''( e' cis' e' cis'' e') |
%40
         cis''( fis' dis' fis' dis'' fis') dis''( fis' dis' fis' dis'' fis') dis''( gis' e' gis' e'' gis') e''(_\markup\italic "rit." gis' e' gis' e'' gis'() |
         <dis' gis' dis''>4)\p dis'8( gis'4.~ ) gis'4 gis'8( h'4.~ ) |
         h'4 h'8( <dis' h' dis''>4.--\strum~ ) <dis' h' dis''>4\< dis''8( \rit <gis' dis'' gis''>4)\strum <gis' dis'' gis''>8 |
         <g' h' e'' g'' h''>2.\f\strum fisis'16 e' fisis' fisis( fisis' <fisis cis' dis'>4.\p\>) \skip 16 |
         \a-tempo <gis' dis'' gis''>8\pp gis'16( dis'' gis'' dis'' gis'' dis'' gis' dis'' gis'' dis'') gis''( dis'' gis' dis'' gis'' dis'' gis'' dis'' gis' dis'' gis'' dis'') |
%45
         gis''( dis'' gis' dis'' gis'' dis'' gis'' dis'' gis' dis'' gis'' dis'') gis''( dis'' gis' dis'' gis'' dis'' gis'' dis'' gis' dis'' gis'' dis'') |
         gis''8 dis'''16( e''' dis''' e''' dis''' e''' dis''' e''' dis''' e''' dis''' e''' dis''' e''' dis''' e''' dis''' e''' dis''' e''' dis''' e''' |
         dis'''8) \ottava #1 \osm \transpose c c' { fis''16(_\markup\italic "perdendo" dis''( fisis'') dis'' gis'' dis'' a'' dis'' ais'' dis'' h'' dis'' cis''' dis'' cisis''' dis'' dis''' dis'' eis''' dis'' fisis''' dis'') |
         gis'''4-\staccato gis''4-\staccato} \ottava #0 r1 \bar "|."}


MvmntIVoiceII = {
	\shiftOn
         s2.*29 |
         \stemDown dis'2. \skip 4 \skip 2 |
         r8 dis''16( ais'' dis''' ais'') dis'''( ais'' dis'' ais'' dis''' ais'') \skip 4 \skip 2 |
         r8 dis''16( gis''16 dis'''16 gis'' dis'''() gis'' dis'' gis'' dis''' gis'') \skip 4 \skip 2 |
         <dis'' fis'' dis'''>2. \skip 4 \skip 2 |
%20
         s1.*4|
         r8 <fisis'' ais''>16( dis'' <fisis'' ais''> ais') r8 <fisis'' ais''>16( dis'' <fisis'' ais''> ais') r8 <fisis'' ais''>16( dis'' <fisis'' ais''> ais') r8 <fisis'' h''>16( dis'' <fisis'' h''> h') |
%25
         s1.*12 |
         \skip 2 \skip 2 \skip 8 \slurDown h''16( e'' h' e'' a'' e'') |
         gis''( dis'' gis' dis'' gis'' dis'') gis''( dis'' gis' dis'' gis'' dis'') gis''( dis'' gis' dis'' gis'' dis'') fisis''( dis'' ais' dis'' h' dis''~ ) |
         <gis' dis''>4 r8 \skip 8 \skip 2 \skip 2 |
%40
         s1.*3 |
         r16 g'( e' g' h g') r \skip 16 \skip 2 \skip 16 r16 \priraz {fisis cis' dis' h' cis'' dis'' }  h''4 dis''8~  |
         s1.*5 \bar "|."
}


MvmntIVoiceIII = {
	 \slurDown
         r1.  |
         r2. r4. r8 r e'~\mf  |
         dis'2.~--  dis'4 cis'8( dis'4_\markup\italic "dim." h8 |
         dis'4\p ais8 gis2.) <cis a dis'>4(\strum--\> cis'8)\! |
%5
         <dis h>2.~  \slurUp <dis h>4( cis'8 ais4 h8 |
         gis4.~ )\slurDown gis8. fis( e2.~ ) |
         e4.~  e4 d8( cis4 e8) <dis, ais, fisis>4\strum( ais8) |
         <gis, dis h>4\strum( gis8 dis2.) r4. |
         r2. r4. r8 r e'( |
%10
         dis'4.~ ) dis'4 fis'8( dis' e' cis' dis'4 h8) |
         dis'4(-- ais8 gis2.) <e g dis'>4--( cis'8) |
         <fis dis'>2.--~  <fis dis'>4 cis'8( <dis h>4 ais8) |
         \time 6/8  <gis, dis h>4\strum( gis8) cisis4( dis8) |
         \time 12/8  e4.~  e4 g8 eis4.~  eis4 h8( |
%15
         fisis4.~ ) fisis4 ais8 gis4 h8 cisis'4 \skip 8 |
	 \slurUp
         <dis, ais, fisis>4 \clef treble <dis' fisis' ais'>8 <dis' fisis' ais'>[ r <dis' fisis' ais'>] <dis' fisis' ais'>[ r <dis' fisis' ais'>] <dis' fisis' h'>4.~  \clef bass |
         r8 r \clef treble <dis' fisis' ais'> <dis' fisis' ais'>[ r <dis' fisis' ais'>] <dis' fisis' ais'>[ r <dis' fisis' ais'>] <cis' dis' fis' a'>4.-\staccato \clef bass |
         r8 r \clef treble <his dis' gis'> <his dis' gis'>[ r <his dis' gis'>] <his dis' gis'>[ r <his dis' gis'>] <his dis' fisis'>4. \clef bass |
         r8 r \clef treble <ais dis' fis'> <ais dis' fis'>[ r <ais dis' fis'>] <ais dis' fis'>[ r <ais dis' fis'>]( \clef bass <gis h e'>4.~ ) |
%20
	\slurDown
         \priraz {ais,16 dis fisis}  dis'4. \clef treble dis'16( ais' dis'' gisis' ais' dis'') e'( ais' dis'' gisis' ais' dis'') eis'( h' dis'' ais' h' dis'') |
         fis'( h' dis'' ais' h' dis'') fisis'( h' dis'' ais' h' dis'') gis'( h' dis'' ais' h' dis'') h( gis' h' fisis' gis' h') |
         cis'( gis' h' fisis' gis' h') cisis'( gis' h' fisis' gis' h') dis'( gis' h' fisis' gis' h') gis( e' gis' dis' e' gis') |
         a( e' gis' dis' e' gis') ais( e' gis' dis' e' gis') \slurUp h( e' gis' dis' e' gis') cis'( e' gis' cisis' e' gis') \slurDown |
         dis'8( fisis'4) dis'8( fisis'4) cis'8( <dis' fisis'>4) h8( <dis' fisis'>4) |
%25
         ais8( <dis' fisis'>4) dis'8( fisis'4) cis'8( <dis' fisis'>4) h8( <dis' fisis'>4) |
         ais8( <dis' fisis'>4) e'8( fisis'4) dis'8( <e' fisis'>4) cis'8( <e' fisis' h'>4) |
         h8( <e' fisis' h'>4) e'8( fisis'4) dis'8( <e' fisis'>4) cis'8( <e' fisis' h'>4) |
         h8( <e' fisis' h'>4) fis'8( <fisis' h'>4) e'8( <fisis' h'>4) dis'8( <e' fisis' h'>4) |
         cis'8( <e' fisis' h'>4) fis'8( <fisis' h'>4) e'8( <fisis' h'>4) dis'8( <e' fisis' h'>4) |
%30
         cis'8( <e' fisis' h'>4) h8( <cis' e' g'>4) \clef bass h8( <cis' e' g'>4) \skip 8 \skip 4 |
         <dis, ais, fisis>8 \slurUp r r r4. \clef treble a'4-> gis'-> fisis'-> \clef bass |
         \slurDown dis'8( ais-\staccato dis8-\staccato) r4. \clef treble a'4-> gis'-> fisis'-> \clef bass |
         dis'8( ais-\staccato dis8-\staccato) eis8-\staccato fisis8-\staccato gis8-\staccato ais8-\staccato h8-\staccato cis'8-\staccato dis'8-\staccato eis'8-\staccato fisis'8-\staccato |
         <dis' gis'>4 <gis, dis>8 \clef treble <dis' h'>[ r  <dis' h'>] <dis' h'>[ r  <dis' h'>] <dis' h'>[ r  <dis' h'>] |
%35
         <dis' h'>4 r8 r4. r \clef bass r8 r <e, gis, e>-\staccato |
         <dis, gis, dis>2.~ ( <dis, gis, dis>4 <cis, gis, cis>8-\staccato <dis, gis, dis>4-\staccato <h,, dis, h,>8-\staccato |
         <dis, gis, dis>4-\staccato() <ais,, dis, ais,>8-\staccato <gis,, dis, gis,>2.) <cis, e>8\strum( a <cis' e' a'>) |
         r4. <dis, h>\strum r  <dis fisis cis'>4( dis'8) |
         <gis, dis h>4 fis8( e4.~ ) e4 gis8( fis4.~ ) |
%40
         fis4 a8( gis4.~ ) gis4 h8( ais4) cis'8( |
         h4) \skip 8 dis16( h dis' ais h dis') e( h dis' ais h dis') eis( h dis' ais h dis') |
         fis( h dis' ais h dis') \clef treble fisis( dis' h' cisis' dis' h') gis( dis' h' cisis' dis' h') a( dis' h' cisis' dis' h') \clef bass |
         \slurDown \priraz {e,,8 e, h, e g}  h4. cis' s \priraz {dis,16 dis fisis cis' dis' \clef treble fisis'} dis''4. \clef bass |
         <gis, dis h>4. r r2. |
%45
         \clef treble r8 r <h'' dis'''>-\staccato <h'' dis'''>8-.[ r8 <h'' dis'''>-.] <h'' dis'''>8-\staccato[ r8 <h'' dis'''>-\staccato] <h'' dis'''>8-\staccato[ r8 <h'' dis'''>-\staccato] |
         <h'' dis'''>8-\staccato <gis''' h'''>8-\staccato q8-\staccato <gis''' h'''>8-\staccato <gis''' h'''>8-\staccato <gis''' h'''>8-\staccato <gis''' h'''>8-\staccato <gis''' h'''>8-\staccato <gis''' h'''>8-\staccato <gis''' h'''>8-\staccato <gis''' h'''>8-\staccato <gis''' h'''>8-\staccato |
         <gis''' h'''>8-\staccato dis''16( h'' gis'' h'') r8 dis''16( h'' gis'' h'') r8 dis''16( h'' gis'' h'' dis'' h'' gis'' h'' dis'' h'' |
         gis''4-\staccato) gis'4-\staccato r1 \bar "|."}


MvmntIVoiceIV = {
         \skip 1 \skip 2 |
         \skip 1 \skip 2 |
         \skip 1 \skip 2 |
         \skip 1 \skip 2 |
%5
         r4. dis,2. dis4. |
         \skip 2 \skip 2 \skip 2 |
         \skip 1 \skip 2 |
         \skip 1 \skip 2 |
         \skip 1 \skip 2 |
%10
         \skip 1 \skip 2 |
         \skip 2 \skip 2 \skip 2 |
         r4 h,,2. \skip 8 r4. |
         \time 6/8  \skip 2 \skip 4 |
         \time 12/8 r8 r h,( e,4) r8 r r gis, cis,4 r8 |
%15
         \slurUp r r ais,( dis,4) r8 gis( <gis, dis> h cisis' <g h> fisis') |
         \skip 4 \skip 4 \skip 2 \skip 8 r8 \clef bass h16( dis h, dis,) |
         \skip 4 \skip 4 \skip 2 \skip 8 r8 \clef bass a16( dis cis dis, |
         <his, dis gis>2.) \skip 4 \skip 8 r8 \clef bass fisis16( cis h, dis, |
         <ais, dis fis>2.) \skip 4 \skip 8 r8 \clef bass e16( cis h, dis,) |
%20
         \clef treble \skip 4 \skip 8 dis'4. e' eis' |
         fis' fisis' gis' h |
         cis'4. cisis' dis' gis |
         a ais h8. his cis' cisis' |
         dis'4. dis' cis' h |
%25
         <dis ais> dis' cis' h |
         dis4. e'4. dis'4. cis' |
         dis4. e' dis' cis' |
         <dis h> fis' e' dis' |
         <dis cis'> fis' e' dis' |
%30
         dis2. <a, e> |
         \slurUp \clef treble \clef bass \skip 8 r8 r r4.  a'8( fis') gis'( eis') fisis'( e') |
         \clef treble \clef bass \skip 4 \skip 8 r4. a'8( fis') gis'( eis') fisis'( e') |
         \skip 2 \skip 2 \skip 2 |
         \skip 1 \skip 2 |
%35
         \clef bass \skip 1 \skip 2 |
         \skip 1 \skip 2 |
         \skip 1 \skip 2 |
         <h dis' gis'>2. \skip 4 \skip 2 |
         \skip 4 \skip 8 gis,4. a, ais, |
%40
         h, his, cis cisis |
         dis8 gis16 h ais h dis4. e eis) |
         \clef treble \clef bass fis fisis gis a4 ais8-\staccato |
         \clef treble \clef bass \skip 2 \skip 2 \skip 2 |
         \skip 1 \skip 2 |
%45
         \clef treble \skip 1 \skip 2 |
         \skip 1 \skip 2 |
         \skip 1 \skip 2 |
         \skip 1 \skip 2 \bar "|."
}


MvmntIVoiceV = {
         \skip 1 \skip 2 |
         \skip 1 \skip 2 |
         \skip 1 \skip 2 |
         \skip 1 \skip 2 |
%5
         \skip 1 \skip 2 |
         \skip 1 \skip 2 |
         \skip 1 \skip 2 |
         \skip 1 \skip 2 |
         \skip 1 \skip 2 |
%10
         \skip 1 \skip 2 |
         \skip 1 \skip 2 |
         \skip 1 \skip 2 |
         \time 6/8  \skip 2 \skip 4 |
         \time 12/8 \skip 1 \skip 2 |
%15
         \skip 1 \skip 2 |
         \clef treble \clef bass \skip 4 \skip 4 \skip 2 \skip 4 \skip 4 |
         \clef treble \clef bass <ais, dis ais>2. \skip 4 \skip 4 \skip 4 |
         \clef treble \clef bass \skip 1 \skip 2 |
         \clef treble \clef bass \skip 1 \skip 2 |
%20
         \clef treble \skip 1 \skip 2 |
         \skip 1 \skip 2 |
         \skip 1 \skip 2 |
         \skip 1 \skip 2 |
         \skip 2 \skip 2 \skip 2 |
%25
         \skip 2 \skip 2 \skip 2 |
         \skip 2 \skip 2 \skip 2 |
         \skip 2 \skip 2 \skip 2 |
         \skip 2 \skip 2 \skip 2 |
         \skip 2 \skip 2 \skip 2 |
%30
         \stemDown \force-merge cis'4. h \clef bass \force-merge h a4( gis8) |
	s1.*18 \bar "|."
}

\paper
{
	page-breaking = #ly:one-line-auto-height-breaking
}

\score { %Start of Movement
          <<

%Start of Staff
\new PianoStaff \with {
	midiMinimumVolume = 1
	midiMaximumVolume = 1
} <<
	\set PianoStaff.connectArpeggios = ##t
  \new Staff = "voice 1"  << 
   \new Voice = "VoiceIMvmntI"  { 
    \clef treble    \global \MvmntIVoiceI
			  } %End of voice
   \new Voice = "VoiceIIMvmntI"  { 
    \MvmntIVoiceII
			  } %End of voice

			  >> %End of Staff

  %Start of Staff
  \new Staff = "Part 3"  << 
   \new Voice = "VoiceIIIMvmntI"  { 
    \global \clef bass \voiceOne \MvmntIVoiceIII
			  } %End of voice
   \new Voice = "VoiceIVMvmntI"  { 
    \global \voiceTwo \MvmntIVoiceIV
			  } %End of voice
   \new Voice = "VoiceVMvmntI"  { 
    \global \voiceThree \MvmntIVoiceV
			  } %End of voice

			  >> %End of Staff

	    >>
>>

\layout { }
\midi { }
       } %End of Movement



