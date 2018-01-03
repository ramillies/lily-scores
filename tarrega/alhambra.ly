\include "custom.ly"

\header {
	title = \markup\typewriter\fontsize #8 "Recuerdos de la Alhambra"
	subtitle = "(„Vzpomínky na Alhambru“)"
	composer = "Francisco Tárrega"
	arranger = "" %\markup\tiny "revise a prstoklady: Darek (VII/16)"
	poet = ""
	meter = ""
	tagline = ""
}


global = {
	\time 3/4
	\key a \minor
	\globalstyle
	\set Score.voltaSpannerDuration = #(ly:make-moment 6/8)
	\magnifyStaff #.9
}

liningI = {
	\global
	s2.*4 | \break
	s2.*6 | \break
	s2.*5 | \break
	s2.*5 | \break
}

melodyI = {	
	\global
	\voiceOne
	\tupletUp
	\slurDown

	\tempo\markup\main-tempo "Andante"
	\tempo 4 = 70
	\transpose c c'
	{
		\set subdivideBeams = ##t
		\set baseMoment = #(ly:make-moment 1/8)

		\repeat volta 2
		{
			a,,32 e e e e, e e e c e e e e, e e e h, d d d e, d d d^\markup\italic "Simile" |
			\repeat unfold 4 { s \repeat tremolo 3 { c } } \repeat unfold 2 { s \repeat tremolo 3 { d } } |
			\repeat unfold 6 { s \repeat tremolo 3 { e } } |
			\repeat unfold 4 { s \repeat tremolo 3 { e } } \repeat unfold 2 { s \repeat tremolo 3 { f } } |
			\repeat unfold 4 { s \repeat tremolo 3 { g } } \repeat unfold 2 { s \repeat tremolo 3 { f } } |
			\repeat unfold 4 { s \repeat tremolo 3 { e } } \repeat unfold 2 { s \repeat tremolo 3 { f } } |
			\repeat percent 2 { \repeat unfold 6 { s \repeat tremolo 3 { g } } } |
			\repeat unfold 4 { s \repeat tremolo 3 { c' } } \repeat unfold 2 { s \repeat tremolo 3 { h } } |
			\repeat unfold 4 { s \repeat tremolo 3 { a } } \repeat unfold 2 { s \repeat tremolo 3 { h } } |
			s \repeat tremolo 3 a s a \times 2/3 { a( h a) } \repeat unfold 4 { s \repeat tremolo 3 { gis } } |
			\repeat unfold 6 { s \repeat tremolo 3 { gis } } |
			\repeat unfold 4 { s \repeat tremolo 3 { b } } \repeat unfold 2 { s \repeat tremolo 3 { a } } |
			\repeat unfold 4 { s \repeat tremolo 3 { g } } \repeat unfold 2 { s \repeat tremolo 3 { a } } |
			s \repeat tremolo 3 g s g \times 2/3 { g( a g) } \repeat unfold 4 { s \repeat tremolo 3 { f } } |
			\repeat unfold 6 { s \repeat tremolo 3 { f } } |
			\repeat unfold 4 { s \repeat tremolo 3 { e } } \repeat unfold 2 { s \repeat tremolo 3 { d } } |
			\repeat unfold 4 { s \repeat tremolo 3 { c } } \repeat unfold 2 { s \repeat tremolo 3 { d } } |
			s \repeat tremolo 3 c s c \times 2/3 { c( d c) } \repeat unfold 4 { s \repeat tremolo 3 { h, } } |
			\repeat unfold 6 { s \repeat tremolo 3 { h, } }
		}

		\key a \major
		\repeat unfold 4 { s \repeat tremolo 3 { e } } \repeat unfold 2 { s \repeat tremolo 3 { d } } |
		\repeat unfold 4 { s \repeat tremolo 3 { cis } } \repeat unfold 2 { s \repeat tremolo 3 { d } } |
		\repeat percent 2 { \repeat unfold 6 { s \repeat tremolo 3 { e } } } |
		\repeat unfold 6 { s \repeat tremolo 3 { fis } } |
		\repeat unfold 4 { s \repeat tremolo 3 { d' } } \repeat unfold 2 { s \repeat tremolo 3 { fis } } |
		s \repeat tremolo 3 fis s fis \times 2/3 { fis( gis fis) } \repeat unfold 4 { s \repeat tremolo 3 { e } } |
		\repeat unfold 6 { s \repeat tremolo 3 { e } } |
		\repeat unfold 6 { s \repeat tremolo 3 { a } } |
		\repeat unfold 4 { s \repeat tremolo 3 { gis } } \repeat unfold 2 { s \repeat tremolo 3 { dis } } |
		\repeat unfold 2 { s \repeat tremolo 3 { fis } } \repeat unfold 4 { s \repeat tremolo 3 { e } }
		\repeat unfold 6 { s \repeat tremolo 3 { e } } |
		\repeat unfold 6 { s \repeat tremolo 3 { d } } |
		\repeat unfold 4 { s \repeat tremolo 3 { cis } } \repeat unfold 2 { s \repeat tremolo 3 { h, } } |
		s \repeat tremolo 3 h, s h, \times 2/3 { h,( cis h,) } \repeat unfold 4 { s \repeat tremolo 3 { a, } } |
		\repeat unfold 3 { s \repeat tremolo 3 a, } s \repeat tremolo 3 h, s \repeat tremolo 3 cis s \repeat tremolo 3 d_\segno-coda |

		\repeat volta 2
		{
			\repeat unfold 6 { s \repeat tremolo 3 { a, } } |
			\repeat unfold 6 { s \repeat tremolo 3 { a, } } |
			\repeat unfold 2 { s \repeat tremolo 3 h, } \repeat unfold 2 { s \repeat tremolo 3 c } \repeat unfold 2 { s \repeat tremolo 3 d } |
			\repeat percent 2 { \repeat unfold 6 { s \repeat tremolo 3 { e } } | }
		}
		\alternative
		{
			{
				\repeat unfold 6 { s \repeat tremolo 3 { e } } |
				\repeat unfold 2 { s \repeat tremolo 3 d } \repeat unfold 2 { s \repeat tremolo 3 cis } \repeat unfold 2 { s \repeat tremolo 3 h, } |
				\repeat unfold 6 { s \repeat tremolo 3 { a, } } |
			}
			{
				\repeat unfold 6 { s \repeat tremolo 3 { gis } } |
			}
		}

		\repeat unfold 2 { s \repeat tremolo 3 fis } \repeat unfold 2 { s \repeat tremolo 3 e } \repeat unfold 2 { s \repeat tremolo 3 d } |
		\repeat unfold 6 { s \repeat tremolo 3 { cis } } |
		\repeat percent 2 { \repeat unfold 6 { s \repeat tremolo 3 { cis } } | }

		a,,8 e, a, cis e a |
		<a e'>2. |
		<e, a,>2 r4 \bar "|."
	}
}

bassesI = {
	\global
	\voiceTwo
	\slurUp
	\shiftOn

	\repeat volta 2
	{
		s8 e c' e h e |
		s e a e h e |
		s e c' e c' e |
		s e c' e d' g |
		s g e' g d' g |
		s g c' g d' g |
		\repeat percent 2 { s g e' g e' g | }
		s c' a' c' g' c' |
		s c' f' c' s f' |
		s h e' h e' h |
		s d' e' d' e' d' |
		s cis' e' cis' e' cis' |
		s a e' a f' a |
		s e' d' a d' a |
		s a d' a d' a |
		s a h a h a |
		s dis a dis a dis |
		s e gis e gis e |
		s e gis e gis e |
	}

	\key a \major
	s e cis' e h e |
	s e a e h e |
	\repeat percent 2 { s e cis' e cis' e | }
	s fis d' fis d' fis |
	s d' h' d' d' fis |
	s d' cis' e cis' e |
	s e cis' e cis' e |
	s fis a cis' a fis |
	s gis c' dis' c' gis |
	\repeat unfold 2 { s gis cis' gis cis' gis | }
	s f f d e f |
	s e e e s e |
	s e e e fis gis |
	s e cis e a h |

	\repeat volta 2
	{
		s e e e e e |
		s f f f f f |
		s f a f a f |
		\repeat percent 2 { s e cis' e cis' e } |
	}
	\alternative
	{
		{
			s gis gis gis gis gis |
			s fis e e s d |
			s e e eis fis eis |
		}
		{
			s e e' e e' e |
		}
	}
	
	s e cis' e h e |
	s e a e fis a |
	\repeat percent 2 { s e a e, his, cis | }
	s2. |
	a2. |
	<a, cis>2 r4 \bar "|."
}

ostinato = {
	\global
	\voiceFour

	\repeat volta 2
	{
		\repeat unfold 4 { a,2. | }
		c | c |
		\repeat percent 2 { c | }
		f | f2 d4 |
		e,2. |
		e, |
		a, |
		cis |
		d | d | d |
		f, |
		e, |
		e, |
	}

	\key a \major
	\segno
	a, | a, | \repeat percent 2 { a, } |
	a, | a, | a, | a, |
	fis, | gis, |
	\repeat unfold 2 { cis }
	h, |
	e,2 e,4 |
	a,2. |
	\coda
	a,4 s2 |

	\coda-ending

	\repeat volta 2
	{
		a,2. | a, | a, | \repeat percent 2 { a, } |
	}
	\alternative
	{
		{
			e, |
			e,2 e,4 |
			a,2. |
		}
		{
			e, |
		}
	}
	e, |
	a, |
	\repeat percent 2 { a,4. s | }
	a,2. |
	a, |
	s \bar "|."
}

\paper
{
	page-count = #1
}

\score {
	\new Staff \with {
		\consists "Span_arpeggio_engraver"
		instrumentName = "Kytara"
	} {
		\set Staff.connectArpeggios = ##t
		<<
			\new Voice { \clef "treble_8" \melodyI }
			\new Voice { \clef "treble_8" \bassesI }
			\new Voice { \clef "treble_8" \ostinato }
			\new Voice { \clef "treble_8" \liningI }
		>>
	}
	\layout
	{
		\context
		{
			\Staff \RemoveEmptyStaves
			\override VerticalAxisGroup.remove-first = ##t
		}
		%\displayControlPoints
	}
}

\score {
	\new Staff \with {
		midiInstrument = "acoustic guitar (steel)"
		midiMinimumVolume = 1
		midiMaximumVolume = 1
	} {
		<<
			\new Voice { \clef "treble_8" \unfoldRepeats \melodyI }
			\new Voice { \clef "treble_8" \unfoldRepeats \bassesI }
			\new Voice { \clef "treble_8" \unfoldRepeats \ostinato }
		>>
	}
	\midi {
		\context {
			\Score
		}
	}
}
