\include "custom.ly"

\header {
	dedication = \markup \raise #3 \italic "Věnováno Andrésu Segoviovi"
	title = \markup \fontsize #5 \sans \bold "CAVATINA"
	subtitle = \markup \fontsize #3 \sans \bold "I — Præludium"
	composer = "Alexandre Tansman"
	%arranger = \markup\tiny "revise a prstoklady: Darek (II/2015)"
	poet = ""
	meter = ""
	tagline = ""
}

global = {
	\time 4/4
	\key e \minor
	\globalstyle
	\set Score.voltaSpannerDuration = #(ly:make-moment 2/1)

	%\magnifyStaff #0.95
}

liningI = {
	\global

	s1*5 | \break
	s1*4 | \break
	s1*5 | \break
	s1*4 | \break
	s1*6 | \break

	s1*6 | \break
	s1*6 | \break
	s1*6 | \break

	\repeat unfold 5 { s1 | \noBreak } s | \break
}

melodyI = {	
	\global
	\voiceOne
	\tupletUp
	\slurDown

	\tempo\markup\main-tempo "Allegro con moto."

	\transpose c c'
	{
		r4 <e h, g,> <c a, dis,> <d h, fis,> |
		<h, g, d,>8 g( e4~) e8 g( e4~) |
		e8 e h d c f dis e |
		f c' a( e) f c f( e) |

		dis4. h,8 h4. h,8 |
		a,8 a16( e) a8 a,16( h,) c4. fis8 |
		<g h,>4 r r16 c a e e, h, g d |

		d, c f a, c, b, e fis, r8 f,16 a, d( h,) a d |
		d'8-> f16( e) d( c) h, a, gis,4. e8 |
		f4. c8 e4. h,8 |

		f4. c8 f4. a,8 |
		gis,4. dis8 e4. a,8 |
		fis,4. cis8 d fis, g, d |
		g g, d e, cis4 d |

		\repeat volta 2 { <a, e>8 a16 a, e4~ e8 b16 d g4 |
		a8 e f d e b r <g e b,> | }

		<e a,> a,16( h,) cis d e fis g8 <g h> fis <fis a> |
		e <g e> d <d fis> <e g,> <e c fis,>4 <dis a, fis,>8 \bar "||"

		\key a \major
		\coda <e h, gis,> e16( fis) gis( a) h cis' d'8\strum fis' cis'16 gis e'8 |
		h16 fis d'8 a16 e cis'8 gis16 d h8 fis16 cis a8 |
		<gis e h,>4. d8 <h, fis, d,>4. <cis gis, eis,>8 |

		<a, fis, cis,>4. d8 <h, fis, d,>4. <cis gis, eis,>8 |
		<a, e, cis,>4. <a, fis, c,> r4 |
		r \rall <a, d, h,,>2 <e d>4 |

		\tempo\markup\main-tempo "Un poco più Lento."
		\repeat volta 2
		{
			e e e e |
			e8 a e a, e2 |
			cis8 d e4 cis cis |
			a,8 h, cis4 cis2 |

			a,4. h,8 cis2 |
			cis4. h,8 h,4 b, |

			\key e \minor
		}
		\alternative
		{
			{
				\repeat volta 2
				{
					h,4._\markup\italic "poco tranquillo" d8 h4. d8 |
					h,4. d8 h4. d8 |

					h,4. d8 g4. h,8 |
					f4. h,8 b,4. fis,8 |
				}

				\transpose c c,
				{
					<h g d>4. h8 <h fis d>4. h8 |
					\repeat unfold 2 { <d' h fis>4. e'8 <h fis d>4. h8 | }
					<h gis d>4. h8 <d' h fis>4. <d' h>8 |
				}
			}
			{
				<h, dis,>4. q8 fis h f c |
				dis fis h, c a, f h, es, |
				\transpose c c, { ges f a c es ges f a } |
			}
		}
		\transpose c c, { c_\markup\italic "accel." es ges f a c es ges_\dc-coda \bar "||" }

		\key a \minor

		\mark\markup\large{\magnify #2 \musicglyph #"scripts.coda" \lower #.6 \italic "Coda"}
		<e h, g,>4 r2. |
		c'8-^ f c'-^ e c'-^ f f'-^ c' |
		<f c>-^ f,16 e, f,8 e, dis, h, e e, |
		
		f,-^ <e c> ges,-^ <dis h,> f,-^ <d h,> e, <e c a,> |
		\shiftOff <h, g, e,>-^ e h h, <h, fis, dis,>-^ fis h h, |
		<e h, g,>-^ e' h-^ h, e-^ e, e,,4 \bar "|."
	}
}

bassesI = {
	\global
	\voiceTwo
	\slurUp
	
	\repeat unfold 8 { e,8 } |
	e,4. <a c>8\glissando <ais cis>4. <fis a,>8 |
	<g h,>2 a, |
	a, s |

	r8 a, fis4 r8 g, fis4 |
	<e fis,>4 r4 r8 fis16( e) dis8 h16 a |
	e8 e'16 d' c'( h) a( g) fis4 e |

	d c h, s |
	r8 <a h,> r4 r8 e,8 h,4 |
	r8 a16 es a4 r8 gis e4 |

	r8 es a4 r8 d f4 |
	r8 d e4 r8 cis e4 |
	r8 c d4 h,2 |
	b, a,8 a16( g) f8 e16( d) |

	\repeat volta 2 { cis4. b16( gis) a4 r8 e |
	cis' cis'16( h) a8 b16( a) g4 g,8 d | }

	cis4 r4 r8 <d' e>8[ r <cis' d> |
	r <h cis> r <a h,(>] c) a, fis, h, \bar "||"

	\key a \major 
	e,4 s h\strum r8 a[ |
	r gis r fis r e r d] |
	e \repeat unfold 7 { e, } |

	\repeat tremolo 8 { e,_\markup\italic "Simile" } |
	\repeat tremolo 6 { e, } h, e, |
	\repeat tremolo 6 { e, } <h, fis> <e, gis> |

	\repeat volta 2
	{
		r8 cis'4 a, c' gis,8 |
		r h4 g,8 r ais4 fis,8 |
		r a4 f, gis e,8 |
		r g r es r fis4 d8 |

		r fis a,4 r8 eis gis, cis |
		r g, e cis r fis, e cis |
		\key e \minor
	}
	\alternative
	{
		{
			\repeat volta 2
			{
				r8 h, fis4 r8 a, fis4 |
				r8 g, fis4 r8 fis, fis4 |

				r8 e, g4 r8 e, g4 |
				r8 g, cis4 r8 fis, e r |
			}

			\repeat unfold 4 { \repeat tremolo 8 { e,8 } | }
		}
		{
			h,8 h, h,4 s2 |
			s1*2 |
		}
	}

	s1 \bar "||"

	\key a \minor

	%Coda
	e,8 e16 d c h, a, g, a,8 c' f f'16 c' |
	s1 |
	a,2 fis,4 g, |

	a, h, gis, a, |
	\shiftOff h, r h, r |
	e, r r e, |
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
	\layout {  }
}

\score {
	\new Staff \with {
		midiInstrument = "acoustic guitar (steel)"
	} {
		<<
			\new Voice { \clef "treble_8" \unfoldRepeats \melodyI }
			\new Voice { \clef "treble_8" \unfoldRepeats \bassesI }
		>>
	}
	\midi {
		\context {
			\Score
			tempoWholesPerMinute = #(ly:make-moment 100 4)
		}
	}
}
