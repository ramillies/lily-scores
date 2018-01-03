\version "2.18.0"
\language "deutsch"

\header {
	title = "Vals op. 8 č. 3"
%	subtitle = ""
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
extStrum = \override Arpeggio.positions = #'(-7 . 5)
normStrum = \revert Arpeggio.positions
empty = { \once \hide NoteHead \once \override NoteHead.no-ledgers = ##t }
vacuum = { \hide NoteHead \override NoteHead.no-ledgers = ##t }
visible = { \undo \hide NoteHead \revert NoteHead.no-ledgers }
tamb = \markup { T }
flag = \once \override NoteHead.style = #'harmonic-mixed
flagOn = \override NoteHead.style = #'harmonic-mixed
flagOff = \revert NoteHead.style
ffXII = \markup{\tiny XII}
ffVII = \markup{\tiny VII}
ffV = \markup{\tiny V}
ffIV = \markup{\tiny IX}

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
	\key d \minor
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
	\set Score.voltaSpannerDuration = #(ly:make-moment 9/4)
}

lining = {
	\global
}

melody = {	
	\global
	\voiceOne
	\tupletUp
	\slurDown
	
	\tempo "Con brio"
	\repeat volta 2 { r4 r8 <b'-2> <a'-1>( b') | s4 <b'-2 e'-1> <b' e'> | \barre "V" { s <a' g' cis'> q | r q q } } | r2. \inStaffSegno |
	\repeat volta 2
	{
		<a'-1>4~ a'8 <b'-3> a' b' | <a'-1>2. | a'4~ a'8 <b'-2> a' b' | <a'-1>2. | q4. a'8 \priraz{<h'-4>} <d''-4> c'' | <b'-2> <a'-1> <g'-4> <f'-2> e' <d'-3> |
		d'4~ d'8 e' d' e' | <d'-3>2. | <d''-3>4~ d''8 <e''-4> d'' e'' | <d''-3>2. | d''4~ d''8 <e''-4> d'' e'' | d''2 d''4 | <b'-2>~ b'8 <c''-4> b' a' | <g'-4>2. | <gis'-4> |
		<a'-4>2. | <a'-3>4~ a'8 <b'-4> a' b' | a'2. | <g'-3>4~ g'8 <a'-4> g' a' | g'2. | \priraz{d'8} f'4~ f'8 g' f' g' | \mark\markup\musicglyph #"scripts.coda"
	}
	\alternative
	{
		{ <e'-1>4~ e'8 <f'-2> h( f') | <e'-1>2. | s }
		{ <e'-1>4~ e'8 <f'-1> e' f'\glissando | <d' a f>2. | s }
	}
	\repeat volta 2
	{
		<e''-4 g'-3>2. | r4 <f''-4 a'-1>4. <e'' g'>8 | q2. | <d''-1>4^\markup{X} r2 | <c''-2>4 <b'-1> d'' | <c'' e'>2 r4 | \barre "III" { <b'-4 d'-1> <a'-4 c'-3>4. <gis'-4 h-3>8 |}
		<a' c'>2. | <a'-4>2 e'8\glissando g' | <g'-3>2 <fis'-3>4 | <f'-1>2. | r8 <b-3> <c'-2> <g'-4> <b'-1>\glissando <d''-1> | d''4 d''8 <b'-2> <g'-3>4 |
		<f''-4 a'-1>2 <e''-4 g'-3>4 | \barre "X" { <d''-1 f'-1>2.~ | <d'' f'>4 } r2|
	}

	\key d \major

	\mark\markup{\small\musicglyph #"scripts.segno"} g4\rest <d''-1 fis'-2>4. <h' g'>8 | q2.^\markup{VII} | g4\rest <cis'' g'>4. <a'-1 fis'-4>8 | q2. | <a'-4>4\glissando fis'' fis'' |
	fis''4. <e''-3>8 e''4| <d''-4 g'-2 e'-3>4. <cis''-4 g'-2>8 <cis'' g'>4 | <h'-3>2. | g4\rest <d''-1 fis'-2>4. <h'-1 g'>8 | q2. | g4\rest <cis''-2 g'-1>4. <ais'-3>8 | 
	ais'2^\markup{IX} ais'4~ | ais'4. <h'-3>8 <cis''-1> fis'' | \mark\markup{\musicglyph #"scripts.varcoda"} <cis''-1>8( <e''-4>) e''( <es''-3>) <d''-2> <h'-4> |
	h'( <a'-2>) <fis'-3> <cis'-2> \times 2/3 { cis'( <h-1> <a-4>) } | \barre "IX" { f'4\rest <fis''-4> fis''~ | fis'' fis'' fis'' } | 
	\barre "X" { <fis''-4>2 fis''4 } | \barre "IX" { fis''2 fis''4 } | r8 <fis''-4>( <e''-3>) <d''-1> <h'-3> <g'-2> | e' <d'-3>( h) g <e-2>( d) | a'2\rest <e'-4>4 |
	a'2\rest a'4 | a'2\rest <h'-3>4 | a'\rest <gis'-1> <a'-1> | \barre "X" { <fis''-4>2 fis''4 | fis''2 fis''4 } | r8 <fis''-4>( <e''-3>) <d''-1> <h'-3> <g'-2> |
	e' <d'-3>( h) g <e-2>( d) | <cis-4> <f-3> <gis-1> h cis' h | <b-3> <cis'-1> e' <fis'-2> <b'-3> <cis''-4> | <d''-4>2. | <h'-1>^\markup{VII} | \break

	\mark\markup{\musicglyph #"scripts.varcoda"} <cis''-1>8( <e''-4>) e'' <d''-2>( cis'') <h'-4>( | <b'-3>) <a'-2> <fis'-3> <d'-4> <h-1>4 | r8 <g'-2> <g' h-3>4 <cis' g> |
	d'^\fermata <g'-2>8( <fis'-1>) e' <d'-2> | <cis'-2>2.~ | cis'4 a'8( g') fis' e' | <dis'-4>2.~ | dis'4 <h'-3>8 <a'-1> <g'-4> <fis'-3> | e'2.~ | e'4 <cis''-3>8 <h'-1> <a'-4> <g'-2> |
	<fis'-2>4 fis' fis' | <g'-4> <fis'-2> g' | <gis'-4> g' gis' | <a'-2> <gis'-1> a' | <h'-2> <cis''-4> h' | a' gis' a' | h' cis'' h' | a' gis' a' | <b'-2> <c''-4> b' |
	a' gis' a' | b' c'' b' | <a'-2>2. \bar "||"

	\key d \minor
	\mark\markup\musicglyph #"scripts.coda"
	e'4~ e'8 f' e' f' | <d' a f>2 <a'-1 g'-4 cis'-2>4 | \extStrum <d''-1 a'-1 f'-1>2.\strum^\markup{X} \bar "|."

}

basses = {
	\global
	\voiceTwo
	\stemDown
	\slurUp

	\repeat volta 2 { \flagOn g'2._\ffXII | d''_\ffVII | a'_\ffVII | e'_\ffVII | } a_\ffVII_\fermata \flagOff
	\repeat volta 2
	{
		h4\rest <f'-2 d'-4>2 | h4\rest <f' d'> q | h\rest <g' cis'>2 | h4\rest <g'-4 cis'-3> <g' cis'> | h2.\rest | s | g4\rest <g-0 e-2>2 | g4\rest <g e> q | e'4\rest <e'-2>2 | e'4\rest e' e' | e'\rest <f'-2>2 |
		e'4\rest f'2 | d'4\rest <e'-1 d'-3>2 | h4\rest <d'-2 b-3> <d' b> | h\rest q q | h\rest <e'-3 g-0> <e' g> | h\rest <es'-2 g-0>2 | h4\rest <es' g> q | h\rest <d'-2 g>2 | h4\rest <cis' g> q | g\rest <d'-3 a-2>2 |
	}
	\alternative
	{
		{ a4\rest <d' gis-4> s | a\rest <cis'-2 a-3> <cis' a> | g\rest q q }
		{ a4\rest <d'-4 gis-2> <cis' g> | s \flag b4-1^\markup{\tiny "I+XII"} \flag a_\ffXII | s2. }
	}
	\repeat volta 2
	{
		h4\rest gis <a-2> | s2. | h4\rest gis a | <f'-1 d'-3> e'\glissando f' | <fis'-1> g' fis' | f\rest <d-0> <e-1> | s2. | s | h4\rest <e' g> g\rest | h\rest <cis'-1 a-2>2 |
		g4\rest <d'-2 b-4> <d' b> | s2. | s | s | g4\rest <gis-2> <a-3> | s2.
	}
	s2. | h4\rest <e'-4 h-3> <e' h> | s2. | g4\rest <d'-3 a-2> <d' a> | s <a'-1>2 | <gis'-3>2 gis'4 | <a,-0> <a-1>2 | <f'-1 d'-2>4 <d' g>8 f' q f' | s2. | h4\rest <e' h> q |
	s2. | c'4\rest <e'-1 cis'-1> <e' cis'> | d'\rest <e' cis'>2 | s2. | s | s4 <cis'-2> <e'-1> | fis' <g'-2>2 |
	h4\rest <fis'-2>8 <a'-1> fis'4 | d'4\rest fis'8 <b'-3> fis'4 | s2. | s | h4\rest g8 a g4 | h4\rest cis'8 f' cis'4 | h4\rest d'8 fis' d'4 | s <f' d'> <fis' d'> |
	h\rest <fis'-2>8 <a'-1> fis'4 | d'\rest <fis'-2>8 <b'-3> fis'4 | s2. | s | s | s | s4 \stemUp e' e' \stemDown|
	<d'-1 h-3>2._\markup\line{\small\italic "Dal" \tiny\musicglyph #"scripts.segno" \small\italic "al " \tiny\musicglyph #"scripts.varcoda"} | 

	s2. | s | <e-1>4 e <e a,> | s2. | e4\rest <e g a,> q | <e g>4 e2\rest | e4\rest <a fis h,> q | q e2\rest | e4\rest <h-0 g-1 e-3> <h g e> | q e2\rest |
	s2. | \repeat unfold 11 { s | } 

	\key d \minor
	a4\rest <d' gis> <cis' g> | s4 <b,-1> a, | s2. |
}

ostinato = {
	\global
	\voiceTwo
	\stemDown
	\slurDown
	s2.*5
	\repeat volta 2 { <d-0>2. | a, | e | a, | d, | r | <b,-1> | q | <b-1> | q | <a-1> | q | <g-1> | <e-1> | <d-1> | <cis-1> | <c-1> | q | <h,-1> | <b,-1> | a, }
	\alternative { { <e-3> | a, | \flag a'^\ffVII } { <e-3>2 a,4 | d,2. | \flag d_\ffXII } }
	\repeat volta 2 { a,2. | \flag e'_\ffVII | d,~ | d, | s | s | <f-1~> | f4 <e-1> <d-0> | <cis-1>2. | a, | <b,-3> | <g,-1>2 c4\rest | a,2.~ | a, | d, |
	\flag d'_\ffXII_\markup{\column{\line{\small\italic"Dal " \fontsize #-9 \musicglyph #"scripts.varsegno"} \small\italic "senza 1. volta" }} }

	\flag <fis'' a'>2._\ffVII | <e-1> | \flag <g'' a'>_\ffV | d,~ | d, | <d'-2 h-0 gis-1>4 d' d' | s2. | d, |
	\flag <fis'' a'>2._\ffVII | <e-1> | \flag <g'' a'>_\ffV | <fis-1>2.~ | q | <h-1> | e\rest | fis~ | fis4 a,2 |
	d,2. | fis | g2 r4 | h,2.\rest | cis | a, | d, | \flag a_\ffVII | d, | <fis-1> | g2 r4 | a,2.\rest | e,\rest| a,\rest | g4\rest <b-1 fis-2> <b fis> | s2. |
	h | c\rest | s | <a fis d,>_\fermata | s | a, | s | s | s | s | <e' cis'-1 ais-3>~ | <e' cis' ais>4 e2\rest | <e' d'-1 h-3>2. |
	<e' cis'-3> | <e' d'-1> | <e' cis'> | <e' d'> | <e' cis'> | <e' d'> | <e' cis'> | q |
	q_\markup\line{\small\italic "D. C. al " \tiny\musicglyph #"scripts.coda"} | \break

	\key d \minor
	e2 a,4 | d,2.~ | <d d,> |
}

\paper
{
		#(define fonts (make-pango-font-tree "Georgia" "Arial" "Courier New" 1 ) )
		system-system-spacing #'basic-distance = #20
		indent = #10
		left-margin = #5
		right-margin = #5
		top-margin = #3
		bottom-margin = #6

		page-count = #2
}

\score {
	\new Staff \with {
		midiInstrument = "acoustic guitar (nylon)"
		instrumentName = "Kytara"
	} {
		<<
			\new Voice { \clef "treble_8" \melody }
			\new Voice { \clef "treble_8" \basses }
			\new Voice { \clef "treble_8" \ostinato }
			\new Voice { \clef "treble_8" \lining }
		>>
	}
	\layout { }
	\midi {
		\context {
			\Score
			tempoWholesPerMinute = #(ly:make-moment 120 2)
			%\override SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/1)
		}
	}
}
