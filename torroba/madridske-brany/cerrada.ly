\include "custom.ly"

\header {
	title = "Puerta Cerrada"
	subtitle = "(„Zavřená brána“)"
	composer = "Federico Moreno Torroba"
	%arranger = \markup\tiny "revise a prstoklady: Darek (VII/16)"
	poet = ""
	meter = ""
	tagline = ""
}

global = {
	\time 3/4
	\key a \minor
	\set Score.voltaSpannerDuration = #(ly:make-moment 6/8)
	\globalstyle
}

liningI = {
	\global
	\grace s8 
	
}

melodyI = {	
	\global
	\voiceOne
	\tupletUp
	\slurDown

	\tempo\markup\sans\large\bold "Allegro" 4 = 140
	\transpose c c'
	{
		\priraz{a16 h} <a, c e a>4 e <c e a~> |
		a8 d' c' h a h |
		\priraz{c'16 d'} <e a c'>4 a <c e'~> |
		<h, f a e'>8 f' e' d' c' d' |
		
		<c a e'>4 <e a c'> <c f a> |
		r8 c' <d h> <c a> <h, g> <a, f> |
		e e4 es h,8 |
		r h,4 h, h,8 |
		\priraz{f16 g} <a, d f>4 d <d f h>~ |

		q8 c' h a g a |
		\priraz{f16 g} <a, f>4 <a, d> <d f h> |
		<f a d'>8 r d'( c') h( d') |
		<a c' f'>4 <f a d'> <c e h> |

		<f a>8 g f e d c |
		r h,4 d h,8 |
		r h,4 h, h,8 |
		\repeat unfold 2 { e2 <c f h>4 } |

		<c f a>4 q <c e> |
		<c f a> <g, c e> <c f a> |
		<h, e g> q <ais, fis> |
		<h, e g> <ais, fis> <h, e g> |
		<a, d f> q <g, c e> |
		<a, d f> <g, c e> <a, d f> |
		
		\priraz{e16 f} <a, c e>4 <a, h,> <a, c e> |
		<d f> <e g>8 <d f> <c e> <h, d> |
		\priraz{e16 f} <a, e>4 <h, e> e |
		a8 c' h a h c' |
		<f h d'>4 r r |
		
		<e g c'> r r |
		<e a c'>4. a8( fis e) |
		<es g c'>4. a8( g es) |
		<es, g, c> d c h, c d |
		es f g a b c' |

		\repeat unfold 2 { <f d'>4. c'8( b  d') | <es c'>4. b8( as c') } |
		b4. a8( g a) |

		b4. a8 g a |
		<a, c f>4. e8( d e) |
		<a, c f>4. e8( d c) |
		\repeat unfold 2 { <b, f>4. e8( d e) | }

		<f a>4. g8 f g |
		q4. <e g>8( <d f> <e g>) |
		<d, h, f a> r \tupletSpan 4 \times 2/3 { f8 e g f e d |
		c( h, a, g, f, e, d, c, h,,) } |
		R2. |

		<f, a, es>8 r r2 |
		<a, c e>4 r <c a> |
		<h, f a>8 r r2 |
		r4 <e g c'> <c f a> |
		<h, d gis>8 e4 es h,8~ |

		h, h,4 h, h,8 \bar "||"
		\key a \major \tempo\markup\sans\bold "Meno mosso"
		fis4 <cis gis> <e a> |
		<d fis h>~ q8 <gis cis'> <e h> <gis cis'> |
		<cis a>4 <a, fis> cis |
		d~ \times 2/3 { d8 a g f e dis } |

		e4. e4 e8 |
		e4~ \times 2/3 { e8 d e fis a h } |
		\repeat unfold 2 { <h, fis a d'>4. e'8 \priraz{cis'16 d'} <f cis'>8 h } |
		<d' fis d>4~ q16 ais h cis' d' e' cis' e' |
		
		d' cis' h a gis fis e d \tempo\markup\sans\bold "Rit." cis d e f |
		\slurUp
		\tempo\markup\sans\bold "A tempo" <a, cis fis>4( <cis gis> <e a>) |
		<d fis h>~ q8 <gis cis'> <e h> <gis cis'> |
		<cis a>4 <a, fis> <e, cis> |

		d4~ d8 e16 d cis h, cis d |
		e4. e4 e8~ |
		e e4 e e8 |
		<b, d>4 <c e> <d f> |

		<e a>4~ \times 2/3 {q8 fis g a g fis} |
		\slurDown \phrasingSlurDown
		\priraz{d16 e} d8\(( c) \priraz{a,16 b,} a,8( g,) d,( f,)\) |
		\key f \major
		<a, d>4 e8 a, <d, a, f>4 |
		\slurUp <b, g>4( <b, a>8) e <e b>4 | \slurDown
		<a c'>4. c'\rest |
		\tempo\markup\sans\bold "Rit."
		r8 <es a>[ r <es g> r <c f>] |
		\repeat volta 2 { \priraz{g16 a} g8 f g4 <c f a>4 | }
		\tempo\markup\sans\bold "A tempo" \priraz{d16 es} d8 cis d4( b) |
		\priraz{d16 es} d8 cis d4( a) |
		\priraz{fis16 gis} fis8 eis fis4( h) |
		r8 cis' h a gis fis |
		\times 2/3 { \repeat unfold 6 { r e e } }
		\key a \major

		r <cis e>[ r q r q]
		r d a r4. |
		r8 <cis fis>[ r q r q] |
		r h,( <fis a>4) r |
		\repeat unfold 2 { r8 <a, d>[ r q r q] | }

		\key a \minor
		\tempo\markup\sans\bold "Tempo I."
		\priraz{a16 h} <a, c e a>4 e <c e a~> |
		a8 d' c' h a h |
		\priraz{c'16 d'} <e a c'>4 a <c e'~> |
		<h, f a e'>8 f' e' d' c' d' |
		
		<c a e'>4 <e a c'> <c f a> |
		r8 c' <d h> <c a> <h, g> <a, f> |
		r e4 es h,8 |
		r h,4 h, h,8 |
		\tempo\markup\sans\bold "Più mosso"
		\priraz{a16 h} <c e a>4 <g, e> <c a> |
		\priraz{g16 a} g4 e g |
		\priraz{f16 g} f4 d f |
		\priraz{e16 f} e4 c a, |
		f, \times 2/3 { g,8( d, b,,) a,( e, c,) |
		c( a, e,) d( b, f,) f( d a,) } |
		\key a \major
		d4 <h,, gis,> <cis, a,> |
		\times 2/3 { h,8( fis, d,) d( h, fis,) fis( d gis,) } |
		\priraz{a16 h}<cis e a>4 e <cis a> |
		\priraz{gis16 a} <e gis>4 e <gis h> |
		\priraz{a16 h}<cis e a>4 e <cis a> |
		\priraz{gis16 a} <e gis>4 e <gis> |
		<cis e a>4 r \times 2/3 { cis8 e cis } |
		<a, cis fis>8 r4. r4 |
		<a, cis e a>8 r4. r4 \bar "|."
	}
}

bassesI = {
	\global
	\voiceTwo
	\slurUp
	\shiftOn

	\priraz{s8} <a, e a>4 r r |
	<f c' es'>8 r r2 |
	s2. |
	s |

	r4 e f |
	<d a h> r r |
	<e gis> f a |
	g a f |
	e, h, f~ |
	f8 r r4 r |
	e, h, f |
	h8 r f'4 d' |
	d' h g |

	<d c'> r r |
	es f a |
	g a f |
	\repeat unfold 2 { e h e } |

	d d a, d a, d cis cis <c e> |
	cis <his, e> cis |
	<h, d> q a, |
	h, a, h, |

	e f e |
	<d a> r r |
	e gis <d' h> |
	c'8 e' d' c' d' e' |
	g4 d8 e f g |
	
	a,4 c8 d e f |
	fis4 a,2 |
	g4 c2 |
	s2. |
	s |

	\repeat unfold 2 { b4 f2 | as4 es2 } |
	e8 g d'4 r |

	es8 g des' c' b c' |
	\repeat unfold 2 { g, d d2 } |
	\repeat unfold 2 { f,8 d g2 } |

	h,8 d a h a h |
	c' e a2 |
	s2. |
	s |
	a,4-^ e-^ a,-^~ |

	a,8 d( c h, a, h,) |
	c4 a, e~ |
	e8 f( e d c d) |
	e4 a f |
	e f a |

	f a gis |
	\key a \major
	<<
		{
			\stemDown
			e8\rest e4 e e8 |
			g\rest gis gis2 |
			g8\rest e fis4 e |
			g8\rest f a4 e\rest |
		}
		\\
		{
			<a, a cis'>2. |
			a, |
			a, |
			a, |
		}
	>>

	\slurDown cis8( gis dis'4 cis') |
	h,8 f a4 r |
	\repeat unfold 2 { r e, a } |
	e8 a a16 r4.. |

	s2. |
	<<
		{
			\stemDown
			e8\rest e4 e e8 |
			g\rest gis gis2 |
			g8\rest e fis4 e |
			g8\rest f a e4.\rest |
		}
		\\
		{
			a,2. |
			a, |
			a, |
			a,4. s  |
		}
	>>
	cis8( gis dis'4 cis') |
	h8( g d'4 c') |
	r8 f4 f f8 |

	<< { \stemDown a8\rest b b g\rest } \\ { c2 } >> r4 |
	s2. |
	<< { \stemDown d8\rest c4. } \\ { f,2 } >> s4 |
	<< { \stemDown d8\rest d( \slurDown cis4() g) } \\ { f,4 s2 } >> |
	\slurUp f8 es'( g a b g) |
	c'4 b a |
	\repeat volta 2 { \grace{s16 s} <f b d'>4 r d | }
	\grace{s16 s} <b, f as>4 r2 |
	<h, f a>4 r2 |
	<e gis d'>4 r2 |
	<gis d'>8 s r2 |
	e4 d' cis' |
	h a gis |

	\key a \major
	fis gis a |
	h4. cis'8 h cis' |
	a4 fis d |
	d~ \tupletSpan 4 \times 2/3 { d8 a gis fis e d } |
	e4 e fis |
	gis fis e |
	\key a \minor 
	a, r2 |
	<f c' es'>4 r2 |
	s2.*2 |
	r4 e f |
	<d a h> r r |
	e f a |
	gis f e |
	r2. |
	<e h>4 r2 |
	<f b>4 r2 |
	<f, c f>4 r2 |
	s2.*2

	\key a \major
	<e, d fis>4 s2 |
	e,2. |
	<a, e a cis'>4 r2 |
	<cis gis>4 cis e |
	<a, e a cis'>4 r2 |
	<cis gis>4 cis e |
	<a, e a cis'>4 r r |
	e8 r4. r4 |
	<a, e a>8 r4. r4 \bar "|."
}

\paper
{
		page-count = #2
		ragged-last = ##t
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
		>>
	}
	\midi {
		\context {
			\Score
		}
	}
}
