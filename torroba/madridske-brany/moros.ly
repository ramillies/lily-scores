\include "custom.ly"

\header {
	title = "Puerta de Moros"
	subtitle = "(„Maurská brána“)"
	composer = "Federico Moreno Torroba"
	%arranger = \markup\tiny "revise a prstoklady: Darek (VII/16)"
	poet = ""
	meter = ""
	tagline = ""
}

global = {
	\time 2/4
	\key d \minor
	\set Score.voltaSpannerDuration = #(ly:make-moment 6/8)
	\globalstyle
}

liningI = {
	\global
}

melodyI = {	
	\global
	\voiceOne
	\tupletUp
	\slurDown

	\tempo\markup\sans\large\bold "Andante" 4 = 50
	
	\partial 4 d8 a~ |
	a as \times 2/3 { e g f~ } |
	f d cis b,~ |
	b, f_\markup\italic "pesante" \times 2/3 { f f f } |
	\transpose c c'
	{
		r4 <d a> |

		q2 |
		r4 <b, e>8( f,) |
		\tupletSpan 4 \times 2/3 { b, e a e d g, } |
		<b, e>( f,) <d a>( <b, e>) |
		c  g  \times 2/3 { f ( e  d ) } |

		f4 e8 d |
		<h, gis> f f8. \times 2/3 { d32( cis b,) } |
		r4 <d a~>-^ |
		a r |
		\times 2/3 { e8 d f } a gis |
		
		\times 2/3 { e g f } d cis16 b, |
		<c, f, a,>2 |
		g,8 es8 a8. \times 2/3 { b,32( a, g,) } |
		a,16 f f e e d d cis |

		cis b, b, b, b,8. cis32( b,) |
		r4 <d, a, f a> |
		q q |
		<c, b, es g> r8 \times 2/3 { g16( a g) } |
		d es, g, b, b, fis, fis, b, |

		<b,, f, g,~ d~>4 <g, a, d>8. c32 b, |
		<e, g, d~>4 <b,, e, g, d>8. g32( d) |
		<g, d b>4 r8. a32( g) |
		<a, f>4~ \times 4/6 { q16 gis, a, cis d f } |
		a4 \times 2/3 { g8 g e } |
		
		e d d8.-- b,32( cis) |
		a,4.( g8) |
		f des \times 2/3 { g g f } |
		c4~ \times 2/3 { c8 as b } |
		\times 2/3 { c' c' h g a, d |
		
		h, c a, c h, \times 2/3 { gis,16( h, gis,) } } |
		\repeat unfold 2 { r8 <c e>[ r <c f>] | }
		\times 2/3 { r <e a>( c) r <d g>( <c f>) |
		\tempo\markup\sans\bold "Accel." r <d g>( h,) r <d f>( a,) |

		\tempo\markup\sans\bold "Rit." r <a, c>( f,) r <g, d>( e,) |
		\tempo\markup\sans\bold "A tempo" <a,, e, c> f, h,, } c,16 a, a, f |
		f cis cis a a f f cis' |
		<d d'>4. b8 |
		a4. a8 |

		e2 |
		\tempo\markup\sans\bold "Rit." e |
		<a, cis e>2~ |
		\tempo\markup\sans\bold "A tempo" q4 d,8 a,~ |
		a, as, \times 2/3 { e, g, f,~ } |
		
		f, d, cis, b,,~ |
		b,, f, \times 2/3 { f,-^ f,-^ e,-^ } |
		r4 <b, d g> |
		r <g, c e> |
		r <e,, b,, d, b, d g>\strum |
		q\strum q\strum |

		r a,,~ |
		a,,8 d( cis8.) \times 2/3 { b,32( cis b,) } |
		\times 2/3 { <c, g,>8 d b e cis' b } |
		a <f, b, d> r <e, a, c> |
		r <a, d f>[ r <b, d fis>] |

		r <a, d f>[ r <a, c e>] |
		r <d, a, c>[ r <f, g, d>] |
		r16 e, g, c g, c e a |
		<f, d f b>8 b,, \times 2/3 { f, b, d } |
		f2 |

		e |
		<b,, f, d g>4 <c, a, c e> |
		<g, h, e>8_\markup\italic "pesante" <a, c> <g, h, e>4 |
		<f, b, d> <c, a, c>8 <f, b, d> |
		<a, d f>2^\fermata \bar "|."

	}

	
}

bassesI = {
	\global
	\voiceTwo
	\slurUp
	\shiftOn

	\partial 4 s4 |
	s2*3 |
	f2~ |

	f8 a, d \times 2/3 { e,16 f, g, } |
	a,2 |
	a, |
	a, |
	<a, e g>4 <a, d b> |

	<a, d gis> r |
	<a, d>2 |
	<d a> |
	\tupletSpan 4 \times 2/3 { b,8 e' d' a gis f' } |
	r4 <f b d'> |

	q r |
	r f,8 f, |
	<f, c>4 r |
	<f, d>8 r4. |
	
	r2 |
	s2*2 |
	r8 f, f, r |
	s2 |

	r8 f, f, r |
	f, b, r4 |
	r8 c c r |
	d4~ d16 r8. |
	r8 <f b d'> r4 |

	r2 |
	<f, e>4 <f, es>8 r |
	<b, f g>4 r |
	<as, g> <as, ges>8 r |
	<g c' e'>4 es |

	s s |
	g <es as> |
	g q |
	g q |
	f c |

	h, b, |
	s s |
	s s |
	r <f b d' g'> |
	r <c f c' d'> |

	r <a, e c'>8 <g, e b> |
	<a, e c'>4 <g, e b> |
	<a, e>2~ |
	q4 s |
	s2*3 |

	f4~ f8 g, |
	a,2 |
	d4 s |
	s2*4 |

	a,4 a, |
	d cis |
	d c |
	f, b, |
	a,2 |
	s |
	s |

	r4 <a, e a c'> |
	s2 |
	<e, h,>8 <a, e> <e, h,>4 |
	b, f,8 b, |
	d2_\fermata \bar "|."


}

\paper
{
		page-count = #1
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
