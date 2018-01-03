\include "custom.ly"

\header {
	title = "Puerta del Ángel"
	subtitle = "(„Andělská brána“)"
	composer = "Federico Moreno Torroba"
	%arranger = \markup\tiny "revise a prstoklady: Darek (VII/16)"
	poet = ""
	meter = ""
	tagline = ""
}

global = {
	\time 2/4
	\key f \major
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

	\tempo\markup\sans\large\bold "Allegro vivace" 4 = 90
	
	\transpose c c'
	{
		\repeat volta 2
		{
			<f a>16 <d g> <f a>8 q <d g> |
			<f a> <a, d f> <e a c'> r |
			<d f>16 <a, e> <d f>8 q <c e> |
			f16 e d c b,8 d |

			c4~ c16 d( g d) |
			c4~ c16  g( e g) |
			<f d'>8 r r4 |
			r8 <c f>[ r <f, b, d>] |
			<c e>16 <d f,> <c e>8 <a, d f> <b, d g> |

			<f a> <c f> <gis, h, e>4 |
			g16 fis g8 <c e a> <d f b> |
		}
		\alternative
		{
			{
				a b, f e |
				\key d \major
				<a, d fis>4. <h, d g>8 |
				<a, d fis>4. <a, cis g>8 |

				<fis a>16 d' d' d' g d' d' d' |
				fis cis' cis' cis' h( g d h) |
				a e cis a <h, e g>8 <a, d fis> |
				<g,, d, h, e g>8 e,16( fis, g, a, h, cis) |

				dis8 e( g) r |
				r a16 c' h a g fis |
				\key c \major 
				<< { e2 } \\ { c, } >> |
				h,16( g, e h, g) r8. |

				a16( e c c' h a g fis) |
				<h, d g>4 <fis, a, d>8 q |
				<e g>16 <h, fis> <e g>8 <c a> <fis c'> |
				<h, dis h> r r4 |

				\stemDown a,8 c16( d \stemUp e fis g a) |
				<h, fis> e q8 \tempo\markup\sans\bold "Rit." <h, e g>8 <c e a> |
				d-^ h,-^ <fis,, cis, e, ais, e fis>4^\fermata |
				\tempo\markup\sans\bold "A tempo" g4 fis |
				\slurUp f16( \slurDown d, as, c) es,( c f c) |

				as8 d16 g f h, f e |
				<fis, a, es>8 d16 a, <h,, d, e> h, g, e |
				<a, h, f>4-^ <gis, h, e>-^ |
				f <a, f>8 <c a> |
				g4 f~ |
				
				f16 a f c f c a, c |
				\repeat unfold 2 { <g,, d, f>4 f8 <a, d> | }
				<gis, e> r r4 |
				<a,, e, a, c>2 |

				<b, d>8 r r4 |
				<g, b, e>8 h,16 c d e f g |
				\key f \major
			}
			{
				a8 b, <c, b, a> g |
				f c16 a, a4 |
				<f, c a f'>8 r q r \bar "|."
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
		<c f>8 r4 <b, f>8 |
		<c f> d a, r |
		d r r a, |
		b,4 d8 f |

		\repeat unfold 2 { r <f a> <e g> r | }
		r b,16 c d e f g |
		a4 b, |
		a,8[ r d] r |

		r <d a c'> <e gis>4 |
		<b d'> <a c>8 g |
	}
	\alternative
	{
		{
			<g, f>4 <a, g cis'> |
			\key d \major 
			d8 a, d g, |
			d a, d e |
			<d fis'>16 r8. <h e'>16 r8. |
			<a d'>16 r4.. |
			fis4 r8 h, |
			s2 |

			r8 g,16 a, h, cis dis e |
			dis8 r4. |
			\key c \major
			r16 h d' c' h a g a |
			<g, d>4~ q16 h,( e d) |

			fis8 r4. |
			e4 h,8 h, |
			e, r fis a |
			r h,16 cis dis e fis g |

			s4 c'16 a8.\rest |
			d8 g, e fis |
			<h, fis>4 s |
			r8 <e h d'>[ r <es a c'>] |
			s2 |

			s |
			<c fis>4 <h, d> |
			d8 a, d h, |
			a,16( d a h) s4 |
			r8 <c e h>[ r <d a c'>] |

			<g, a c'>16 r4.. |
			\repeat unfold 2 { h16 a h8~ h <f, c> | }
			e, h, h, d |
			s2 |

			g,8 g, f, d |
			c d16 e f g a h |
			\key f \major

		}
		{
			<g, f>4 f8 e |
			\slurDown f,16( c c' a) r4 |
			s2 \bar "|."
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
