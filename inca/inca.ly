\version "2.18.0"
\language "deutsch"

\header {
	title = "Fantasia Inca"
%	subtitle = ""
	composer = "Sabicas"
	arranger = \markup\tiny "revise a prstoklady: Darek (II/2015)"
	poet = "6a muta in D"
	meter = "capo I"
	tagline = \markup\line{\raise #0.8 \musicglyph #"noteheads.s2cross" \italic " — Tambora"}
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
sp = #(define-music-function (parser location how) (pair?) #{ \override Arpeggio.positions = #how #} )
priraz = #(define-music-function (parser location music) (ly:music?) #{ \acciaccatura #music #} )
normstems = \revert Stem.details
extStrum = \override Arpeggio.positions = #'(-4 . 4)
normStrum = \revert Arpeggio.positions
empty = { \once \hide NoteHead \once \override NoteHead.no-ledgers = ##t }
vacuum = { \hide NoteHead \override NoteHead.no-ledgers = ##t }
visible = { \undo \hide NoteHead \revert NoteHead.no-ledgers }
tamb = \markup { T }
coda = \mark\markup\musicglyph #"scripts.coda"
segno = \mark\markup\musicglyph #"scripts.segno"
flag = \once \override NoteHead.style = #'harmonic-mixed
flagsOn = \override NoteHead.style = #'harmonic-mixed
flagsOff = \revert NoteHead.style

cross = \override NoteHead.style = #'cross
norm = \revert NoteHead.style

ffXII = \markup{\tiny XII}
ffVII = \markup{\tiny VII}
ffV = \markup{\tiny V}
ffIV = \markup{\tiny IX}
ffIX = \markup{\tiny IX}

osm = \set Staff.ottavation = #"8"

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

tadam = { d,8[ a, d, a,] } 
global = {
	\key a \minor
	\once\omit Score.TimeSignature
	\time 14/4
	\set fingeringOrientations = #'(left)
	\set stringNumberOrientations = #'(down)
	\mergeDifferentlyHeadedOn
	\mergeDifferentlyDottedOn
	\override Score.BarNumber.self-alignment-X = #LEFT
	\override Glissando.breakable = ##t
	\override Glissando.after-line-breaking = ##t
	\set Score.tempoHideNote = ##t
	\override TupletBracket.bracket-visibility = #'if-no-beam
	\override Staff.TimeSignature.break-visibility = ##(#f #t #t)
}

lining = {
	\global
	s1 s s s2 | \break
	\repeat unfold 9 { s \noBreak | } s\break |
	\repeat unfold 4 { s1 s4 \noBreak | } s2 \break |
	\repeat unfold 10 { s \noBreak | } s\break |
	\repeat unfold 9 { s \noBreak | } s\break |
	\repeat unfold 9 { s \noBreak | } s\break |
	\repeat unfold 8 { s \noBreak | } s\break |
}

melody = {	
	\global
	\voiceOne
	\tupletUp
	\slurDown

	\sup
	\tempo "Úvod (Andante)"
	\repeat volta 2 { \sp #'(-7 . 4.5) <a'-1 f'-2 d'-3>2\strum \sp #'(-3 . 3.5) <g'-2 d'-3 b-4>4\strum \sp #'(-7 . 4.5) <a' f' d'>2 \strum } \grace { <g'-4>16 g' g' g' }
	\sp #'(-4 . 4 ) <g'-4 cis'-3 g-0>8[\strum \times 2/3 {<f'-1>16( g' f')] } \sp #'(-7 . 2.5) <d'-3 a-2 d>4\strum \priraz{c'16-1 d'-3} c'8 <a-2> <f-3>16 <a-2> <c'-1> <d'-4>( <f'-4>4) <d'-2>8 <c'-1>
	\sp #'(-2.5 . .5) <a-2 f-3>4\strum \sp #'(-3 . 0) <g-0 e-2>\strum \sp #'(-7 . -1) <d-0 a,-0 d,-0>\strum 

	\tempo "Fantasia"
	\time 2/4 
	\repeat percent 3 { r4^\tamb r8^\tamb r^\tamb | } \repeat volta 2 { d4-0 c8-2 a,-0 | f,-2 a,16( c) f,8 \times 2/3 { a,16-2( c-2 a,) } | a,8 a,16 a, g,8 f, | }
	\alternative { { d,8-0 a,16-0 d-0 d,8 a, | } { \fleft \repeat volta 2 { \sp #'(-7 . 2) <d'-3 a-2 d>8\strum \vacuum q16\strum \sdown q\strum \sup q8\strum \sp #'(-4 . 1.5) \visible <c'-1 g e-2>\strum | } } }
	\sp #'(-7 . 3) <f'-1 d'-2 a-3 d>8\strum \vacuum q16\strum \sdown q\strum \sup q8\strum \sp #'(-4 . 2.5) \visible <e'-0 c'-1 g e-2>\strum | \sp #'(-7 . 3) <f'-1 d'-2 a-3 d>4^\fermata\strum
	<c''-1 g'-1 es'-1 c'-3>8^\markup{VIII} \empty q \bar "||" 

	\time 5/4 \segno
	<d''-1 a'-1 f'-1 d'-3>^\markup{X} \empty q <a'-1 e'-1 c'-1 a-3>4^\markup{V} s2 <c''-1 g'-1 es'-1 c'-3>8^\markup{VIII} \empty q | 
	<d'' a' f' d'>^\markup{X} \empty q <a' e' c' a>4^\markup{V} s2 <c'-1 g-0 c-3>8  \empty q | <d'-4 a-2 d-0> \empty q <a-2 e-1 a,-0>4 s2 <c' g c>8 \empty q | <d' a d> \empty q <a e a,>4 s2 <a'-1>8^\markup{V} a' |

	\time 2/4
	<d''-1>^\markup{X} d'' <c''-1>16(^\markup{VIII} <d''-3> c''8) | <a'-1>4^\markup{V} s | s <f'-1>8 f' | <a'-1>8.^\markup{V} a'16 <g'-1>16(^\markup{III} <a'-3> g'8) | <d'-4>4 s | s <f-4>8 f |
	<a-2> a <g-2>16( <a-4> g8) | <d-0>2^\fermata | \times 2/3 { r4^\tamb r^\tamb r^\tamb } |
	\repeat volta 2 { \pitchedTrill <a-12>4 \startTrillSpan b r16 \stopTrillSpan b32( a) r16 b32( a) | } \coda \pitchedTrill <a-12>4 \startTrillSpan b r16 \stopTrillSpan b32( a) r8 |
	\sp #'(-7 . 7) <d''-1 a'-1 f'-1>2\strum^\fermata^\markup{X}

	\repeat volta 2 { \fdown <d,-0>8 <d-0>16 <a,-0> d8 <c-2> | <f,-1> <g,-3>16( <a,-4>) <c-2>8 a, | } \fleft \tempo "Allegro" \repeat volta 2 { <d'-3>4 <c'-1>16( d' c'8) | <a-2>2 | } 
	a4-2 \priraz{g16-0 a} g8 f-3 | d4-0 f8-3 g | a4 \priraz{g16 a} g8 f | d2 | \repeat volta 2 { <f'-1>8. f'16 \priraz{e'-0 f'-1} e'8 <d'-3>16 <c'-1> | <a-2>2 | } <a-2>16 a a a <g-0>8 a |
	<d-0>16 d d d <f-3>8 g | <a-2>16 a a a g8 <f-3> | <d-0>4 r8 a16-2 gis-1 |
	\repeat volta 2 { a8-2 d'16-3 cis'-2 d'8-3 f'16-1 e'-0 | f'8-1 a'16-3 gis'-2 a'8-3 d''16-4 cis''-3 | \repeat percent 2{ <d''-3>8. d''16 <c''-1> d''( c''8) | a'2-3 | }
	a'4-3 \priraz {g'16-1 a'} g'8-1 f'-4 | d'4-1 d'16( f'-3 g'8)-4 |
	a'4 \priraz{g'16 a'} g'8 f' | } \alternative { { <d'-4>4 r8 a16-2 gis-1 | } { <d'-4>2 | }} 

	\repeat volta 2 { d''16-2( f''-4) d'' c''-1 d''( f'') d'' c'' d''( f'') d'' c'' a'4-2 | }
	\repeat volta 2 { a'16-1( c''-4) a' g'-4 a'( c'') a' g' | a'( c'') a' f'-2 d'4-3 | }
	\repeat volta 2 { d''16( f'') d'' c'' d''( f'') d'' c'' d''( f'') d'' c'' a'4 | }
	\repeat volta 2 { a'16( c'') a' g' a'( c'') a' g' | a'( c'') a' f' d'4 | }

	\repeat volta 2 { d,8-0 d16-0 a,-0 d8-0 c-2 | f,-1 g,16(-3 a,)-4 c8-1 a, } | d,4 <c''-1 g'-1 es'-1 c'-3>8^\markup{VIII} \empty q_\markup{\line{\small\italic "Dal " \tiny\musicglyph #"scripts.segno" \small\italic "al" \tiny\musicglyph #"scripts.coda"}} \break

	\mark\markup\magnify #1.8 \musicglyph #"scripts.coda"
	\pitchedTrill <a'-12>4 \startTrillSpan b' r16 \stopTrillSpan b'32( a') r16 b'32( a') | \pitchedTrill a'4 \startTrillSpan b' r16 \stopTrillSpan b'32( a') r16 b'32( a') |
	\set tieWaitForNote = ##t
	\sdown
	s4. f'8~ | a'4~ <d'' a' f'> | <d''-1 a'-1 f'-1>2\strum^\markup{X}^\fermata \bar "|."
}

basses = {
	\global
	\voiceTwo
	\stemDown
	\slurUp

	\repeat volta 2 { <d-0 a,-0 d,-0>2 <e-1>4 <d-0 a,-0 d,-0>2 } \grace { s4 } <e-2 b,-1>4 <d-0 a,-0 d,-0> s1 s2. | \time 2/4 \repeat unfold 7 { s2 | }
	\repeat volta 2 { <d-0 a,-0 d,-0>8 \vacuum q16 q q8 \visible <c-3> | } <d-0 a,-0 d,-0> 8 \vacuum q16 q q8 \visible <c-3> | <d-0 a,-0 d,-0>4 s4 |

	\time 5/4
	s2 \cross <a,-0 d,-0>8 q q4 s | \repeat unfold 2 { s2 q8 q q4 s | } s2 q8 q q4 \norm <c'-1> |
	\time 2/4
	<f'-1>4 <dis'-1> | <c'-1> \cross <d a, d,>8 q | q4 \norm <a-1>\glissando | <c'-1> <b-1> | <f-3> \cross <a, d,>8 q | q4 \norm <f,-3> | <a,-0> <g,-1> | d,2_\fermata | s2
	\cross \repeat volta 2 { <d a, d,>4 q8 q | } q4 q8 q | \norm <d a, d,>2_\fermata | \repeat volta 2 { s2 | s } | \repeat volta 2 { \tadam | \tadam } \repeat unfold 4 { \tadam | }
	\repeat volta 2 { \tadam | \tadam | } \repeat unfold 3 { d,4 d, | } d,8[ a, d a,] |
	\repeat volta 2 { d,4 d | d, d | \repeat percent 2 { d,8[ a, d a,] | d,[ a, d a,] | } d,4 a, | d, a, | d, a, } \alternative {{ d,8[ a, d a,] | } { d,[ a, d a,] }} 

	\repeat volta 2 { d,4 d, | d, d,8 d | }
	\repeat volta 2 { d,4 d, | d, d8 a, | }
	\repeat volta 2 { d,4 d, | d, d,8 d | }
	\repeat volta 2 { d,4 d, | \slurDown d, d8 a,( | }
	\repeat volta 2 { d,4) s | s2 | } s |

	\set tieWaitForNote = ##t
	\cross q4 q8 q | q4 q8 q | \norm  d,~ a,~ d~ s | s4 \override TextScript #'extra-offset = #'(4 . -2.8) <d a, d,> | <d-0 a,-0 d,-0>2_\markup{16. II. 2015 D. }_\fermata|

}

\paper
{
		#(define fonts (make-pango-font-tree "Georgia" "Arial" "Courier New" 1 ) )
		system-system-spacing #'basic-distance = #10
		indent = #12
		left-margin = #5
		right-margin = #5
		top-margin = #3
		bottom-margin = #6

		page-count = #1
}

\score {
	\new Staff \with {
		\consists "Span_arpeggio_engraver"
		midiInstrument = "acoustic guitar (nylon)"
		instrumentName = "Kytara"
	} {
		\set Staff.connectArpeggios = ##t
		<<
			\new Voice { \clef "treble_8" \melody }
			\new Voice { \clef "treble_8" \basses }
			\new Voice { \clef "treble_8" \lining }
		>>
	}
	\layout { }
	\midi {
		\context {
			\Score
			tempoWholesPerMinute = #(ly:make-moment 60 4)
			\override SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/1)
		}
	}
}
