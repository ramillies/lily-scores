\include "custom.ly"

\header {
	title = "Præludium"
	subtitle = "(BWV 543)"
	composer = "Johann Sebastian Bach"
	arranger = "" %\markup\tiny "revise a prstoklady: Darek (VII/16)"
	poet = ""
	meter = ""
	tagline = ""
}


global = {
	\time 4/4
	\key a \minor
	\globalstyle
	\set Score.voltaSpannerDuration = #(ly:make-moment 6/8)
}

liningI = {
	\global
}

melodyI = {	
	\global
	\voiceOne
	\tupletUp
	\slurDown

	\tempo\markup\main-tempo "Allegretto."
	\tempo 4 = 76
	\transpose c c'
	{
		r8 c'[ e' c'] f' h e' h |
		e' a d' a d' gis c' g |
		c' fis h f h e a e |

		a d gis d \tupletSpan 8 \times 2/3 { g16 cis d e f g f e d cis h, a, |
		d e f e d c h, c d c h, a, gis, a, h, e, gis, h, d c h, f e d |

		c a, h, c d e f e d c h, a, } r f8[ f e e16~ |
		e16 e8 e d d d d c c16~ |
	}

	c'16 c'8 c' h h h h a a16~ |
	a16 a8 a gis gis16] \tupletSpan 4 \times 4/6 { a,( c e h gis a) h,( d e h gis a) |

	c( e a h gis a) d( f a h gis a) e( a c' h gis a) f( a d' h gis a) |
	e( a c' e' gis' a') f( a d' e' gis' a') e( a c' e' gis' a') d( gis h f' e' d') |

	e( a c' e' gis a) f( a d' e' gis a) e( a c' e' gis a) d( gis h e' gis a) |
	c( e a c' d' e') d( f a d' e' f') c( e a c' d' e') h,( d gis h c' d') |

	a,( e a c' gis a) h,( e a d' gis a) c( e a e' gis a) cis( e g e' gis a) |
	d( f a d' e' f') cis( e a e' f' g') d( f a d' e' f') e( g a cis' d' e') |

	f( a d' e' cis' d') g( b d' e' cis' d') a( d' f' e' cis' d') b( d' g' e' cis' d') |
	\transpose c c'
	{
		a,( d f a cis' d') b,( d g b cis' d') a,( d f a cis' d') g,( cis e b a g) |

		a,( d f a cis d) b,( cis d g cis d) a,( d f a cis d) g,( cis e a cis d) |
		f,( a, d f g a) g,( cis e g a b) f,( a, d f g a) e,( g, cis e f g) |
	}

	d( a d' g' cis' d') e( g b g' cis' d') fis( a cis' a' cis' d') gis( h d' h' cis' d') |
	\transpose c c' { a,( c e a h c') gis,( h, e h c' d') a,( c e a h c') h,( d f gis a h) | } }

	\transpose c c'
	{
		c32 e fis gis a h c' d' e' f' e' d' c' h a gis a h c' d' e' fis' gis' a' h' f' e' d' gis h c' d' |
		e d e fis gis a h c' d' h a g h, d e f \repeat tremolo 16 { <f h d' gis, e> } |

		c'2... d'16 |
		h4~ h16 dis' e'8 } r16 e gis e h e gis e |
	c' dis fis dis h d f d h cis e cis a c e c |

	a h, dis h, gis h, d h, g cis e a, f cis d a, |
	cis a, e cis g e b e cis' g a e s4 |
}

bassesI = {
	\global
	\voiceTwo
	\slurUp
	\tieUp
	\shiftOn

	\transpose c c'
	{
		r16 a8[ a a a gis gis g g16~ |
		g fis8 fis f f e e e e16~ |
		e dis8 dis d d cis cis c c16~ |

		c h,8 h, h, h,16] s2 |
		s1 |
	}
	s2 gis8 h g h |
	
	fis a f a e gis e g |
	dis fis d f cis e c e |
	h, d h, d a,4 h, |

	c d e f |
	e f e d |

	e f e d |
	c d c h, |

	a, h, c cis |
	d cis d e |

	f g a b |
	a b a g |

	a b a g |
	f g f e |
	d e fis gis |
	a gis a h |

	s1 |
	s |

	r16 a, c a, e c e c a e a e c' dis e8 |
	r16 a' gis' fis' gis' fis' gis' dis' r16 e, gis, e, h, e, gis, e, |
	\transpose c c,
	{
		c' dis fis dis h d f d h cis e cis a c e c |

		a h, dis h, gis h, d h, g cis e a, f cis d a, |
		cis a, e cis g e b e cis' g a e s4 |
	}
}

ostinato = {
	\global
	\voiceFour

	s1*9 |
	\repeat unfold 12 { a,,1 | }
	<a,, a,>~ |
	q |

	<a e'~ a'>1 |
	<a,, a, e'>2 e'8 r4. |
	s1 |

	s|
	s2. <f, f>4~ |
	q2. a4 |

}

\paper
{
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
