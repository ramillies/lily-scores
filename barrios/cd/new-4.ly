\version "2.18.0"
\language "deutsch"

\header {
	title = "Villancico de Navidad"
	subtitle = "(„Vánoční koleda“)"
	composer = "Agustín Barrios Mangoré (1885 - 1944)"
	poet = "6a muta in D"
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
flagOn = \override NoteHead.style = #'harmonic-mixed
flagOff = \revert NoteHead.style
ffXII = \markup{\tiny XII}
ffVII = \markup{\tiny VII}
ffV = \markup{\tiny V}
ffIV = \markup{\tiny IX}

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

global = {
	\key d \major
	\time 3/4
	\set fingeringOrientations = #'(left)
	\set stringNumberOrientations = #'(down)
	\mergeDifferentlyHeadedOn
	\mergeDifferentlyDottedOn
	\override Score.BarNumber.self-alignment-X = #LEFT
	\override Glissando.breakable = ##t
	\override Glissando.after-line-breaking = ##t
	\set Score.tempoHideNote = ##t
	\override TupletBracket.bracket-visibility = ##f
}

lining = {
	\global
}

melody = {	
	\global
	\voiceOne
	\tupletUp
	\slurDown

	\partial 8 <a-2>8\glissando |
	\repeat volta 2
	{
		\mark\markup\musicglyph #"scripts.segno" fis'4 fis'8 <e'-1 cis'-3>4 <a'-2>8 | fis'4 fis'8 e' a' e' | <fis'-2>4 <e'-2>8 \priraz{<d'-2>16 <e'-4>} d'8 <cis'-1> <d'-2> | e'4. r4 <a-1>8 |
		<g'-2>4 g'8 <e'-1> <fis'-4> <g'-4> | <fis'-4 d'-3>4 <fis' d'>8 <d'-1> <e'-4> <fis'-4> | <e'-1>4 e'8\glissando cis'4 <d'-2>8 | \coda
	}
	\alternative
	{
		{ <d'-2 fis-3>4. h4\rest  <a-2>8\glissando  }
		{ \once\hide NoteHead \once\hide Stem \grace fis' <d' fis>4 a8[ <fis'-1>8. <e'-4>16 <d'-2>8] }
	}

	<e'-4>4 <a-1>8[ <g'-2>8. fis'16 e'8] | \barre "II" { <fis'-1>4 <d'-2>8[ <a'-4>8. <g'-2>16 fis'8] } | <e'-0>[ <fis'-2> <d'-4> e' <fis'-3> d'] | <e'-0 cis'-2>4. \barre "II" { <fis'-1>8. <e'-0>16 <d'-2>8 } |
	<e' cis'>4 a8 \barre "II" { <g'-2>8. <fis'-1>16 <e'-4>8 | <fis'-1>4 } <a'-4>8\glissando d''8. <cis''-3>16 <h'-1>8 | <a'-1>[ <g'-4> <fis'-4> \priraz{<e'-0>16 <fis'-3>} e'8 <d'-4> cis'] |
	<d' fis>4 \flagOn \ottava #1 \osm a''8_\ffVII <fis'' d''>8._\ffVII e''16_\ffXII d''8_\ffVII | e''4.^\ffXII g''8.^\ffV fis''16_\ffVII e''8_\ffXII | <fis'' d''>4_\ffVII \ottava #0 \flagOff <e''-4>8 <d''-4> <cis''-3> d'' |
	<e''-2>4 e''8 <e'-0> e'' e' | <a'-1> <h'-4> a' \ottava #1 \osm \flagOn <fis'' d''>8._\ffVII e''16_\ffXII d''8_\ffVII | e''4.^\ffXII g''8.^\ffV fis''16_\ffVII e''8_\ffXII | <fis'' d''>4_\ffVII \ottava #0 \flagOff
	e''8 \barre "VII" { d'' cis'' d'' } | <g''-4>4 g''8\glissando \grace cis''8 <cis''-4 fis'-2>4 <d''-4>8 | <d''-4 fis'-1>4. r4. \bar "||"

	\key d \minor

	<a'-1 f'-2>4 <a' f'>8 <g'-4 e'-0> <a' f'> <b' g'> | <a' f'>4 a'8\glissando <d'' b'>4 q8 | <c''-1 a'-4>4 <c'' a'>8 \barre "VI" { <b'-1 g'-4>4 <b' g'>8 } | <a' f'>4. <f'-2>8 <g'-4> <a'-1> | <b'-2 d'-3>4 r8 <g'-1> <a'-4> <b'-4> |
	<c''-2 e'-3>4 r8 <h'-3> <c''-4> <d''-4> | <c''-1>4 <e''-4>8 \barre "VII" { <h'-1>4 e''8 } | \barre "V" { << {\stemUp\fleft <a'-1>4.} \\ {\stemUp\shiftOn\fleft\tinystems #'(5) <c'-2>8[ c' <g'-4>]} >> } <fis'-4>8. <e'-2>16 <d'-2>8 \bar "||"

	\key d \major
	<e'-4>4 a8 <g'-2>8. <fis'-1>16 <e'-0>8 | fis'4 d'8 <a'-4>8. g'16 fis'8 | e' fis' d' e' fis' <d'-1>\glissando | <e'-1 cis'-2>4. fis'8. e'16 d'8 | <e' cis'>4 a8 g'8. fis'16 e'8 |
	\barre "II" { <fis'-1>4 <a'-4>8\glissando } d''8. cis''16 h'8 | a'[ g' fis'] \priraz{e'16 fis'16} e'8[ d' cis'] |
	<d' fis>4 r4. <a-2>8_\markup\line{\small\italic "Dal" \tiny\musicglyph #"scripts.segno" \small\italic "al" \tiny\musicglyph #"scripts.coda" } \bar "||" \break

	\coda <d' fis>4. r | \flagOn d'4^\ffXII d'8^\ffXII g'4.^\ffXII \flagOff | <d''-4 fis'-1>2.^\markup{VII} \bar "|."


}

basses = {
	\global
	\voiceTwo
	\stemDown
	\slurUp

	\partial 8 s8 |
	 <d'-3>4. s | d' cis' | <d'-1>4 <cis'-3>8 <h-3>4. | <cis'-2>8[ <e-1> a,] a,4 r8 | <h-3 e-1>4. <cis'-2 a-3>4 a,8 | d4. <h-2 g-3>4 <d'-3 e-2>8 | <cis'-2 a-3>4. <g a,> |
	d,4 a,8 d4. | d,4. r |
	<cis-3>4. a, | <a-1 d-0> <fis-3> | <h g> <d' gis-1 h,-2> | r8 <a-1> a, <a-1 fis-3 d-4>4. | <e a,> <a e cis> | <a-1 fis-2 d-3> <h g> | <fis'-4 d'-3 a-2>4 r8 <cis' g a,>4. | d, s |
	\flagOn \ottava #1 \osm s8 g'8_\ffXII a4_\ffXII s4 | s4. \flagOff \ottava #0 <fis'-1 d'-1 h-2>4. | <d'-1 h-0 g-0> <gis' d' h> | <cis'-2 a-3> s |
	\flagOn \ottava #1 \osm s8 g'8_\ffXII a4_\ffXII s4 | s4. \flagOff \ottava #0 <fis'-1 d'-1 h-2>4. | <e'-2 h g> <a-1>8 a,4 | d, a,8 d4 <a-3>8|

	\key d \minor
	d'4. d' | d' <g-0> | <c'-3> <cis'-1> | d'4 <d-0>8 r4. | <g-1>8 <a-4> <b-4> <e'-2 c'-3>4. | <a-1>8 <b-1> <c'-4> <f'-1 d'-2>4. | <e'-2>8 <a'-3>4 <d'-1>8 <gis'-3> <e-1> | <a-3>4 a,8 d4.

	\key d \major

	<cis-3> <a,-0> | <a d>4 r8 <fis-3>4. | <h g>4. <d' gis h,>4 r8 | r <a-3> <a,-0> <a fis d>4. | <e a,> <a e cis> | <a-1 fis-2 d-3> <h g> | <fis' d' a>4 r8 <cis' g a,>4 r8 | d,4 a8 d4 r8 |

	d,4 a,8 d4 \flag a8_\ffXII | s2. | <d d,> |

}

\paper
{
		#(define fonts (make-pango-font-tree "Georgia" "Arial" "Courier New" 1 ) )
		system-system-spacing #'basic-distance = #10
		indent = #10
		left-margin = #5
		right-margin = #5
		top-margin = #3
		bottom-margin = #6

		page-count = #1
}

\score {
	\new Staff \with {
		midiInstrument = "acoustic guitar (nylon)"
		instrumentName = "Kytara"
	} {
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
