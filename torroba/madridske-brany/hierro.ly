\include "custom.ly"

\header {
	title = "Puerta de Hierro"
	subtitle = "(„Železná brána“)"
	composer = "Federico Moreno Torroba"
	%arranger = \markup\tiny "revise a prstoklady: Darek (II/2015)"
	poet = ""
	meter = ""
	tagline = ""
}

global = {
	\time 3/8
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
	\tieDown

	\tempo\markup\sans\large\bold "Allegro vivace" 8 = 208
	\transpose c c'
	{
		\repeat volta 2
		{
			a,,8 <cis e> a |
			<b,, g, d> g e |
			\priraz{d16 e} <a,, d>8 c16( b,) << { \tieDown a,8~ | a,4. } \\ { s8 | s \stemUp \tupletUp \tupletSpan 8 \times 2/3 { a,,16 e e e, e e } } >> |

			d,8 b, f~ |
			f a, e |
			a8. g16 f e |
			g f e d c b, |
			a,8 <cis e> a |

			<g, d> g <b, e> |
			\priraz{d16 e} d8 c16 b, a,8 |
			<< { \shiftOn \once\override NoteColumn.force-hshift = #-1 a,4 s8 } \\ { \stemUp \tupletSpan 8 \tupletUp \times 2/3 { cis,16 e e g, e e e, e e } } >> |
			d8 d16 e f8 |
			r <h, e g> <a, d f> |

			e16 d e8 c |
			d c <d as,> |
			e16( d) e4 |
			g16 fis g8 fis |
			e16 g g g e g |

			fis h h h fis h |
			c'8. h16 a g |
			a g f e d c |
			h,4 <h, e>8 |
			h,4 q8-^ |

			h,4 e8 |
			f8. e16 d c |
			d c h, a, g, f, |
			\repeat unfold 2 { h,4 <a, h, e>8-^ | }

			h,8. e16 e e |
			\tupletSpan 8 \times 2/3 { g f e f e d e d c } |
			h,4 d8-^ |
		}
		\alternative
		{
			{
				d g4-^ |
				r8 f16 a e a |

				b a g f g a |
				r8 f16 a e a |
				<d d'>8. c'16 b a |
				g f e d c b, |
			}
			{
				d8 f4 |
				\repeat unfold 2 { a8. g16 f g | }
				<e a>8 \times 2/3 { d'16 c' b a g f |
				c'( b a g f e d c b,) } |
				
				a,8 e a |
				a, e a |
				d g b |
				d g b |
				g d g |
				<c' e> g c' |

				\ottava #1 \osm <b g'>8 \ottava #0 r4 |
				<cis e>8 g16 f e d |
				cis b, a, g, f, e, |
				r8 <a, d f> q |
				q r4 \bar "|."
			}
		}
	}
}

bassesI = {
	\global
	\voiceTwo
	\slurUp
	\shiftOn

	\repeat volta 2
	{
		a,4.\f |
		s |
		s |
		e,8 a, e |

		d4. |
		c |
		r8 <f b d'> r |
		s4. |
		a, |

		b,4 c8 |
		f, c f |
		cis g e |
		f f16 g a8 |
		g,4. |

		<h, g>4 <a, e>8 |
		<as, as>8 f f, |
		<g c>4 g,8 |
		<e h>4 <d h>8 |
		<c g h>8 r4 |

		<h, a d'>8 r4 |
		r8 <a e' g'> r |
		s4. |
		\repeat unfold 2 { h,16 e fis8 g | }

		a,16 f a8 <a g,> |
		f, <c d a> r |
		s4. |
		\repeat unfold 2 { e,16 h, f4 | }

		r8 <e, h, f> r |
		s4. |
		r8 <g, d g> r |
	}
	\alternative
	{
		{
			<b, f b> r <es b es'> |
			d4 c8 |

			g r4 |
			d( c8) |
			r <f b> r |
			s4. |
		}
		{
			<b, f b>8 r <as, es> |
			r <h, f d'> r |
			r <b, f cis'> r |
			<a, d g> r r |
			s4. |

			<a, d>4. |
			q |
			r8 b g |
			r b g |
			<es b>4. |
			b |

			s4. |
			<a, e g>8 r r |
			s4. |
			d |
			s \bar "|."
		}
	}
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
