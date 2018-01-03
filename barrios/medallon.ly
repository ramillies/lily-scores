\version "2.18.0"
\language "deutsch"

\header {
  title = "Medallón antíguo"
  subtitle = "(„Starý medailon“)"
  composer = "Agustin Barrios Mangoré (1885 - 1944)"
  arranger = "přepsal Darek Cidlinský (16. IX. 2014)"
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
	       \override TextSpanner.bound-details.right.text = \markup { \draw-line #'(0 . -0.5) }
	       \override TextSpanner.bound-details.right.padding = #-2
               \override TextSpanner.style = #'line
               #music
       #} )
   
tinystems = #(define-music-function (parser location how) (list?) #{ \override Stem.details.beamed-lengths = #how #} )
normstems = \revert Stem.details
extStrum = \override Arpeggio.positions = #'(-4 . 4)
normStrum = \revert Arpeggio.positions
empty = { \once \hide NoteHead \once \override NoteHead.no-ledgers = ##t }
vacuum = { \hide NoteHead \override NoteHead.no-ledgers = ##t }
visible = { \undo \hide NoteHead \revert NoteHead.no-ledgers }
tamb = \markup { T }
flag = \once \override NoteHead.style = #'harmonic

fO = \markup { \italic o }
fA = \markup { \italic a }
fM = \markup { \italic m }
fI = \markup { \italic i }
fP = \markup { \italic p }

sup = \arpeggioArrowUp
sdown = \arpeggioArrowDown
strum = \arpeggio

fleft = \set fingeringOrientations = #'(left)
fright = \set fingeringOrientations = #'(right)
fdown = \set fingeringOrientations = #'(down)

global = {
  \key h \minor
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

	\partial 4 <h-0>8( <d'-2>) \repeat volta 2 { <fis'-1>4 <fis'-1 d'-2> <g'-2 e'-4> | <g' e'> <fis'-1 d'-2>8 <e'-0 cis'-1> \barre "II" { <fis' d'>4 | <fis'-1 d'-2> <e'-0 cis'-2> } <d'-2 h-3> | <d' h-4> <cis'-1 ais-2> h8( d') |
	<fis'-1>4 <fis' d'> <gis'-2 eis'-4> | <a'-1 fis'> q q | \extStrum \fright <a'-1 fis'-4 cis'-2 g-1>\strum \fleft <g'-1 e'-4>8 <fis' dis'> <g'-1 e'-4 g-0>4 | \barre "II" { <fis'-1 d'-2>2 <cis'-1>8( <d'-2>) } | \barre "IV" { e'4 e' e' | }
	\acciaccatura{e'16-2 fis'-4} e'8 dis' <e'-2>4 <fis'-1>8( <g'-2>) | <a'-4>4 a' a' | \barre "IX" { \acciaccatura{a'16-2 h'-4} a'8 <gis'-1> <a'-2>2 } | \barre "VII" { <a'-4>8 <fis'-1> <g'-2>4 \flag e''_\markup{\tiny XII} } | <g'-3>8 <f'-1> <fis'-2>4 \flag g_\markup{\tiny XIX} |
	\barre "II" { \acciaccatura{a'16-4} g'8-2 e'-4 <cis'-1>4 <d'-3> } |}  \alternative{ {<h-0>2_\markup{\small{\italic Konec}} h8( d') } { h2 <fis'-1>8 <g'-2> } } | \acciaccatura{a'16-4} <fis'-1>4 fis' <e'-0 cis'-1> | <d'-1>2 \barre "III" { d'8 <e'-3> } |
	<fis'-3>8( <eis'-1>) fis'4 fis'8 <gis'-4> | \barre "VII" { <a'-4> <h'-1> <cis''-3 a'-4>4 <d''-3 a'-2> } | <h'-3>2 \barre "V" { <h'-3>8 <cis''-4> } | \barre "IV" { <a'-3> <gis'-1> <a'-3>4 <a'-2>8 <h'-4> } |
	<a'-4>4~ a'8 <g'-1> <fis'-1> <e'-0> | fis'2 \barre "I" { <c'-1 fis'-2>8 <g'-4> } | << { \fleft \stemUp <e'-0>4 <e'-0> } \\ { \fleft \stemUp <h-0>2 } >> <e' h>4 | <e'-0 gis-3>2 \barre "I" { <fis' c'>8 g' } | << { \fleft \stemUp <e'-0>4 e' } \\ { \fleft \stemUp <h-0>2 } >> <e' h e>4  |
	<e'-0 b-3>2 r4 | <cis'-4>8( <ais-1>) <h-2>( <g-0>) <e-1>( <d-0>) | <cis-1>( <e-4>) <g-2>4 <fis-1>8( <e-4>) | <d-4>8 <cis-3> <h,-1> <a,-4> <g,-2> <h,-1> | r4 r <fis-3>8 <h-0> |
	\key h \major
	\repeat volta 2 { \barre "II" { <dis'-4 fis-3>4 <fis'-1 ais-2 fis-4> } <e'-0 cis'-2 fis-4> | <e' cis' fis> <dis'-4 h-3> dis' | <dis'-4> cis'8( h) \barre "II" { <ais-2> cis' } | <h-0>( <cis'-3>) <dis'-4> <e'-0> <fis'-1> <gis'-1> |
	<ais'-4>2 <e'' gis'-3>4 | q <fis'-1> <h'-3> | \slurUp <h'-4>4(  <h' e'-1>) \slurDown r | s2 <ais'-1 gis'-4>4 |
	<h'-2 g'-3 cis'-1>4^\markup{VI} <gis' h>2 | \set stringNumberOrientations = #'(up)  <fis'\2-2 dis'-4>4 <e'-2 cis'-3>2 | \barre "IV" { \slurDown <dis' h>8~ \once \override Slur #'direction = #UP \acciaccatura{fis'8-4} q q4 } <cis'-1 ais-2 e-1>^\markup{"II"} } \alternative{ {<c'-1 a-3>^\markup{"I"} <cis' ais>^\markup{"II"} <fis-3>8 <h-0> } { <h-0>2_\markup{\small{\italic{Hrajte od začátku až ke slovu „Konec“.}}} h8( d') } } \bar "|."
}

basses = {
  \global
   \voiceTwo
   \stemDown
   \slurUp

	\partial 4 r4 | \repeat volta 2 { r <h-3> q | h2 h,4 | <d-0> <e-1> <f-1> | <fis-3>2 r4 |
	r h <b-1> | <a-3>2 <as-2>4 | a,2 a,4 | <fis-3 d-4>2 r4 | r <fis-1 b,-3> <fis h,-4> |
	<fis-1 cis-1>2 r4 | r <h-3 dis-1> <h e-1> | <h-1 fis-1>2 r4 | <h-3 e-1>2 r4 | <h-0 d-0>2 r4 |
	<h-3 e-1>4 <ais-2 fis-3> <ais-2 e-1 fis,-1> |} \alternative { {<d-0 h,-2>2 r4} { <d h,>2 r4 } } | r4 <b-2 fis-3> <fis-3> | \slurDown <h-2>8( cis') \slurUp h4 <b-1> |
	<a-2>2 <a-2 d-1>8 r | <a-1 cis-2>4 <g-0> <fis-1> | << { \fleft \stemDown <g'-4>8 <fis'-2> <e'-1>4 } \\ { \fleft <g-1>2 } >> <e'-1 g-1>4 | <e'-2 fis-1>2 <d' h>4 | 
	<< { \fleft \stemDown <h-0>2. | b2 } \\ { \fleft \stemDown <e-1>8 <fis-1> <g-3>2 | \barre "II" { fis4 <fis,-1> } } >> <dis-1 a,-0>4 | <e-2 g,-3>2 q4 | << { \fleft \stemDown <e-2>2 } \\ { \fleft \stemDown <fis,-1>4 <cis-4> } >> <dis a,>4 | <e-2 g,-3>2 q4 |
	<e-2 fis,-1>2 <fis-2>8 <b-1> | s2. | s | s | <fis,-1>2 r4 |
	\key h \major
	\repeat volta 2 { <h,-1>8 <gis,-2> <fis,-1>4 <ais,-1> | \slurDown <h,-1>( <fis-2 h,>) \slurUp <g-0> | <e, gis-1>2 <e fis,>4 | <dis-1 h,-2>2 r4 | 
	<e'-2>8 <dis'-1> <cis'\3-3>4 <h\4-2> | <ais-2>2 <dis'-4 a-2>4 | \slurDown <fis'-3 gis\4-2>( gis8) \slurUp <fis\5-4>( <gis-4>) <h\4-2>( | <b-1> <gis\5-4> <fis-2>4 <e-2> |
	<dis-1>4 \barre "IV" { <gis-3>8 <gis,-1> <ais,-3>4 } | <c-3> <cis-1> <dis-4>8 <e-4> | fis <gis-3> fis4 <fis,-1> | }  \alternative { { <dis-1 fis,-2>4 <e fis,> s } { <dis-1 h,-2>2 r4 } } |
}

\paper
{
    #(define fonts (make-pango-font-tree "Georgia" "Arial" "Courier New" 1 ) )
    system-system-spacing #'basic-distance = #15
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
