\version "2.18.0"
\language "deutsch"

\header {
  title = "Soleares"
  composer = "Ramón Montoya"
  poet = "capo: III"
  tagline = ""
}

barre = #(define-music-function (parser location barre music) (string? ly:music?) 
              (let ((elts (extract-named-music music '(NoteEvent EventChord RestEvent))))
                   (if (pair? elts)
                       (let ((first-element (first elts))
                             (last-element (last elts)))
                         (set! (ly:music-property first-element 'articulations)
                               (cons (make-music 'TextSpanEvent 'span-direction -1)
                                     (ly:music-property first-element 'articulations)))
                         (set! (ly:music-property last-element 'articulations)
                               (cons (make-music 'TextSpanEvent 'span-direction 1)
                                     (ly:music-property last-element 'articulations))))))
           #{
               \override TextSpanner.bound-details.left.text = \markup { \upright { #barre } }
               \override TextSpanner.style = #'line
               #music
       #} )
   
tinystems = #(define-music-function (parser location how) (list?) #{ \override Stem.details.beamed-lengths = #how #} )
normstems = \revert Stem.details
extStrum = \override Arpeggio.positions = #'(-2 . 2)
normStrum = \revert Arpeggio.positions
empty = { \once \hide NoteHead \once \override NoteHead.no-ledgers = ##t }
vacuum = { \hide NoteHead \override NoteHead.no-ledgers = ##t }
visible = { \undo \hide NoteHead \revert NoteHead.no-ledgers }
tamb = \markup { T }

fO = \markup { \italic o }
fA = \markup { \italic a }
fM = \markup { \italic m }
fI = \markup { \italic i }
fP = \markup { \italic p }

sup = \arpeggioArrowUp
sdown = \arpeggioArrowDown
strum = \arpeggio

fleft = \set fingeringOrientations = #'(left)
fdown = \set fingeringOrientations = #'(down)

global = {
  \key a \minor
  \time 3/4
  \set fingeringOrientations = #'(left)
  \set stringNumberOrientations = #'(down)
  \mergeDifferentlyHeadedOn
  \mergeDifferentlyDottedOn
}

melody = {  
  \global
  \voiceOne
  \tupletUp
  \slurDown
  \set tupletSpannerDuration = #(ly:make-moment 1 4)
  \override TupletBracket.bracket-visibility = ##f

	\arpeggioArrowUp \extStrum
	<e'-0 h-0 gis-1>2.\strum | q\strum | e16[ gis h e'] <e' h gis e>4\strum <f' c'-1 a-2 f-3>\strum | <e' h gis e>2.\strum | 
	\fdown
	\times 2/3 { <e'-0 c'-1 g-0 d-0>8\strum^\tamb \sdown \empty q\strum( \sup  <a-2 f-3>)	 <e' c' g d>8\strum \sdown \empty q\strum( \sup  <a f>) 	<e' c' g d>8\strum^\tamb \sdown \empty q\strum( \sup  <b-4 e-2>) |
	<c'-1 g-0 d-0 c-3>8\strum \empty \sdown q\strum( \sup <b-4 e-2>)	<c'-1 g-0 d-0 c-3>8\strum \empty \sdown q\strum( \sup <b-4 e-2>) }  <e' c' b e c>\strum^\tamb \empty \sdown q\strum |
	\times 4/5 { \sup \fleft <f'-1 d'-4 a-2 f-3 a,-0>16_\fO\strum \vacuum q\strum_\fA q\strum_\fM q\strum_\fI \sdown q\strum_\fI } \sup q8\strum^\tamb \sdown q\strum \sup q\strum \sdown q\strum | \visible e,^\tamb e' <e-2>^\tamb <gis-1> <h-0> \sdown <e' h a>\strum |
	\times 2/3 { \sup <e'-0 c'-1 g-0 d-0>8\strum^\tamb \sdown \empty q\strum( \sup  <a-2 f-3>)	<e' c' g d>8\strum \sdown \empty q\strum( \sup  <a f>) } <e' c' g f>\strum^\tamb \sdown \empty q\strum |
	\times 4/5 { \sup <e'-0 c'-1 b-4 e-2 c-3>16\strum_\fO \vacuum q\strum_\fA q\strum_\fM q\strum_\fI \sdown q\strum_\fI } \sup q8\strum \sdown q\strum \sup q\strum^\tamb \sdown q\strum |
	\sup c\strum \visible <f-3> <e-2>( <f-3>) <g-0> f | <e'-0 h-0 gis-1>2.\strum |
	<a-2>8 <e'-0> <c'-1>( <d'-3>) <e'-0>( <f'-1>) | <e-2>^\tamb <e'-0> <gis-1> <h-0> <e'-0> <e'-0> | <a-2>^\tamb <h-0> <c'-1> <d'-3> <e'-0> <f'-1> | <e-2>^\tamb <e'-0> <gis-1> <h-0> <e'-0> <e'-0> | \extStrum
	<a-2>^\tamb <h-0> <c'-1> <d'-3> <e'-0> <f'-1>16( e'16) | <d'-3>8^\tamb <e'-0> <c'-1>^\tamb <f'-2> <h-0>^\tamb( <e'-0 c'-1>16 h) | <a-2>8 <c'-1>16 a <g-0>4 <f'-1 c'-1 a-2 f-3>4\strum | <e'-0 h-0 gis-1 e-2>2.\strum |
	gis16 e' h gis a e' c' a r4 | a16 e' c' g f e' c' g e e' c' g | g e' c' g f e' d' a a f' d' a | e,8 <e'-0> <e-2> <gis-1> <h-0> e'( | e') <g'-4> <f'-1>( g) \times 4/5 { <e'-0>16^\tamb( <f'-1> <g'-3> f' e') } |
	<d'-3>8^\tamb <f'-1> <c'-1>^\tamb <e'-0>16 c' <h-0>^\tamb( <c'-1> <e'-0> h) | <a-2> <e'-0> <c'-1> a <g-0>8 <e'-0> <f-3>^\tamb e' | e, <e'-0> <e-2> <gis-1> <h-0> e' | <g'-4>8^\tamb \times 2/3 { g'16( <f'-1> <e'-0>) } <d'-3>8^\tamb <f'-1>16( <e'-0>) <c'-1>8^\tamb e'16 c' | <h-0>^\tamb( <c'-1> <e'-0> h) <a-2>8 <h-0>16 a <gis-1> <e'-0> <h-0> gis |
	<a-2> <e'-0> <c'-1> a <g-0> <f'-1> <c'-1> g <f-3> f' c' <a-2> | e,8 <e'-0> <e-2> <gis-1> <h-0> e' |
	\times 2/3 { <a,-0>8 <e'-0 c'-1> <a-3> <h,-2> <e' c'> a } <d-0>^\tamb <e'-0> | \times 2/3 { <c-3>8 <e'-0 c'-1> <g-0> <d-0> <e' c'> g } <g-0>^\tamb <e'-0> | <f-3>16 <g-0> <c'-1> <e'-0> <e-2>8 c' r4 | e,8 <e'-0> <e-2> <gis-1> <h-0> <e-0> |


	

}

basses = {
  \global
   \voiceTwo
   \stemDown
   \slurUp
	
	e16-2( f-3 e-2 d-0 e f e d e4-2) | e16( f e d e f e d e4) | e4 e f | e2. | s2. | s | s | e, | s | s | s | e-2 |
	s | e | s | e | s | s | r4 r f | e2. | gis8. gis16 a8. a16 \times 4/5 {h^\tamb( c' d' c' h)} | a8. g16 f8. g16 e4 |
	g8. g16 f4 a8. a16 | e,2. | s | s | a8. a16 g4 f | e,2. | s | r4 r gis8. gis16 | a8. a16 g8. g16 f4 | e,2. |
	a,4 h,8( c) d4 | c \times 2/3 { d8( <e-2> \fdown <f-3>) } g4 \fleft | f e8( <f-3>) <g-0> f | e,2.

}

\paper
{
    #(define fonts (make-pango-font-tree "Georgia" "Arial" "Courier New" 1 ) )
    system-system-spacing #'basic-distance = #20
}

\score {
  \new Staff \with {
    midiInstrument = "acoustic guitar (nylon)"
  } {
      <<
          \new Voice { \clef "treble_8" \melody }
          \new Voice { \clef "treble_8" \basses }
      >>
  }
  \layout { }
  \midi {
    \context {
      \Score
      tempoWholesPerMinute = #(ly:make-moment 100 4)
    }
  }
}
