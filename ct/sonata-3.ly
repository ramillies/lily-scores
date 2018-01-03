\include "custom.ly"

\header {
	title = ""
	dedication = ""
	composer = ""
	arranger = ""
	subtitle = \markup \fill-line { \line{\fontsize #4.5 \sans \bold "III"} }
	poet = \markup\center-column{\line{\concat{"5" \small\raise #1 \underline "a"} "= G"} \line{\concat{"6" \small\raise #1 \underline "a"} "= D"}}
	tagline = ""
}

global = {
	\globalstyle
	\set Score.voltaSpannerDuration = #(ly:make-moment 6/4)
	\time 3/4
	\key g \minor
}

liningIII = {
	\global

	\partial 4 s4 s2.*4 | \break
	s2.*5 | \break
	s2.*5 | \break
	s2.*5 | \break
	s2.*4 | \break
	s2.*4 | \break
	s2.*6 | \break
	s2.*6 | \break

	s2.*4 | \break
	s2.*4 | \break
	s2.*5 | \break
}

melodyIII = {	
	\global
	\voiceOne
	\tupletUp
	\slurDown

	\tempo\markup\main-tempo "Tempo di Minuetto."
	\partial 4 d'16( es') a( b) |
	\segno
	g4 g <d' b'> |
	fis fis8. d16 e8. fis16 |
	\priraz a16 g8. fis16 g8. a16 b8. d'16 |

	\transpose c c'
	{
		f2 es16( f) ges8 |
		d4 d c16( d) es8 |
		b,4 b, a,16( b,) c8 |
		g,8. a,16 c8. b,16 a,8. g,16 |
		fis,8. es,16 d,4 d16( es) a,( b,) |
	}
	g4 g <d' b'> |
	fis fis8. d16 e8. fis16 |
	\priraz a16 g8. fis16 g8. a16 b8. d'16 |
	\transpose c c'
	{
		f2 ges16( as) b8 |
		f4 f es16( f) ges8 |
		d4 d c16( d) es8 |
		b,8. c16 d8. c16 \priraz c16 b,8. a,16 |
		\coda
		g,4. r8 g16( as) d( es) |

		h,4 h, c |
		d d es |
		f8. g16 b8. as16 g8. f16 |
		g8. f16 es4 b16( c') f( ges) |
		
		dis4 dis eis |
		fis fis <eis gis> |
		<fis ais>8. h16 cis'8. h16 ais8. gis16 |
		<< { ais8. gis16 } \\ { cis4 } >> fis4 r |

		<< { a8. gis16 } \\ { cis4 } >> fis4 r |
		<< { a8. g16 fis4 a8. g16 | fis4 a8. g16 d'( es') a( b) } \\ { d4 c\rest cis~ | cis c fis } >> |
		g-- g-- <d b>-- |

		fis fis <fis es'> |
		g, g, <g, des>-> |
		r2. |
		r4 <as es> <g, e>8 r |
		r4 <f, c f>8 r r4 |

		s2. |
		r2 d16( es) a,( b,) |
		g,4 <g, des,> <g, des,> |
		as,4 <g, b,> <ges, c>4 |
		d8. b,16 <fis, as,>2 |
		s2. | \pageBreak

		\key g \major \mark\markup\sans\bold\huge "Trio"
		\repeat volta 2
		{
			d'16( e') h c' d'( e') h c' <h d'>8 q |
			<ais g'> <h d'> q <a c'> <g h> q |
			<fis ais d'> <g h> q <d g> <h, d> <b, e> |
		}
		\alternative
		{
			{
				<a, fis>-- q-- q4-- <d g>16( a) b8 |
				<c fis>8-- q-- q4-- e16( fis) g8 |
				<a, d>8-- q-- q4-- <g, c>16( d e8) |
				<fis, h,>16( c) d8 <e, a,>16( h,) c8 <d, g,>8 a, |
				<dis, a, h,>8 q q4 <fis, c d>8\strum r |
			}
			{
				<a, f>8 q q4 <b, es>16( f) g8 |
				<a, d>8 q q4 <g, c>16( d) es8 |
			}
		}
		b,8 b, b,4 a,16( b,) c8 |
		g,16( a,) b,8 f,16( g,) a,8 es,16( f,) g,8 |
		<cis, g, a,>8 q q4 <fis, c d>8\strum r |

		\mark\markup\sans\bold\huge "Double"
		\repeat volta 2
		{
			d'16( e') h c' \ottava #1 \osm d'8 d'16 e' fis' g' a' h' |
			a'16( g') fis' e' \ottava #0 d'8 \flagOn h-\ffXII g-\ffXII d-\ffXII \flagOff |
			h16( c') g a h8 h16 c' \ottava #1 \osm d' e' fis' g' |
			fis'( e') d' \ottava #0 c' h8 g e h, |
		}
		\alternative
		{
			{
				<e g>16( a) e fis g8 g <g d> g |
				g,16( a,) e, fis, g,8 g, g, g, |
				c4 <g, c>16( d) e8 c4 |
				h,4 <fis, h,>16( c) d8 h,4 |
				a,16( h,) c8 g,16( a,) h,8 fis,16( g,) a,8 |
				<dis, a, h,>8 q q4 <fis, c d>8\strum r |
			}
			{
				<b,, g, b, es b>16 c' g as b8 b <b,, f, b, d b> b |
				b,16( c) g, as, b,8 b, b, b, |
			}
		}

		es4 es16( f) g8 es4 |
		d d16( es) f8 d4 |
		c16( d) es8 b,16( c) d8 a,16( b,) c8 |
		<fis, c d>8 q q4 d16( es) a,( b,)_\tweak extra-offset #'(2.5 . 3.5) -\segno-coda \key g \minor \bar "||"

		\coda-ending
		g4 <b g'>8 r4. \bar "|."
	}

}

bassesIII = {
	\global
	\voiceTwo
	\slurUp

	\partial 4 s4 |
	g,8-. d-. g-. d-. g-. d-. |
	d,_\markup\italic "sempre staccato" a, fis8 a,4 a,8 |
	g, d g d4 d8 |

	b, as ces' as ges r |
	b, f as f ges r |
	b, d g d es4 |
	b,8 d4-- d-- d8-- |

	d,8 a, d a, d,4-- |
	g,8 d g d g d |
	d, a, fis a,4-- a,8-- |
	g, d g d4-- d8-- |
	b, ces' d' ces' <b es'> r |

	b, as ces' as ges4-- |
	b,8 f as f ges r |
	d,8 d4-- d8-- e-- fis-- |
	g8 d g, r r4 |

	g,8 f as f g16( as) d( es) |
	h,8 g d' g c g |
	d b4 b8 d-. b-. |
	es-. b-. es'-. b-. r4 |

	dis8 fis h fis << { ais16( h) eis( fis) } \\ { d8 s } >> |
	cis8 ais cis' ais h d' |
	cis' ais cis ais h d' |
	fis,-. cis-. ais cis ais cis |

	fis,-. cis-. a cis a cis |
	fis,-. d-. a-. d-. fis,-. d-. |
	a-. d-. fis,-. d~ d r |
	g'-. f'-. es'-. d'-. c'-. b-. |

	a-. g-. fis-. es-. d-. c-. |
	b,-. a,-. g,-. f,-. es,-. b,-. |
	es4 r <des g es'>16( es) f8 |
	c4 c b,16( c) des8 |
	as,4 as, g,16( as,) b,8 |

	f,8. g,16 b,8. as,16 g,8. f,16 |
	es,4 d, d8 r |
	r4 es, es, |
	<cis as,> r r |
	r d, d, |
	<g, g>8 r d16( es) a,( b,) g,8 r

	%Trio
	\key g \major
	\repeat volta 2
	{
		<g, d g h>4\strum r r |
		r2. |
		r |
	}
	\alternative
	{
		{
			d8-. d-. d4 b8-. d-. |
			a-. d-. a-. d-. b-. d-. |
			fis d fis d e d, |
			d d, c d, h,16( a,) g,8 |
			fis, fis, fis,4 <d, a,>8\strum r |
		}
		{
			f,8-. f,-. f,4 g8-. f,-. |
			f8-. f,-. f-. f,-. es-. f,-. |
		}
	}

	d-. f,-. d-. f,-. es-. f,-. |
	d-. f,-. c-. f,-. b,-. f,-. |
	e,-. e,-. e,4 <d, a,>8\strum r |

	\repeat volta 2
	{
		<g, d g h>4\strum r2 |
		r2. |
		<e g h>8 r r2 |
		r2. |
	}
	\alternative
	{
		{
			<c g>8 r r4 <h, g> |
			<c e>8 r r4 <h, d> |
			g8 e a, e fis d |
			fis d g,4 fis8 d |
			e fis, e g, c a, |
			f,8 f, f,4 d,8\strum r |
		}
		{
			s2. |
			<b, es>4 r <b, d> |
		}
	}
	b8 g c g a f |
	a f b, f a f |
	g a, g b, es c |
	as,8 as, as,4 <d, fis c'>4 \bar "||"

	\key g \minor
	g8-. d-. <g, g>8 r4. \bar "|."

}

dynamics = {
	\global

	\partial 4 s4_\tweak extra-offset #'(0 . 4) -\markup{\dynamic "p" \italic "ceremonioso con grazia"}\> |
	s4.\! s8\< s\> s\! |
	s s\< s2 |
	s8\! s s2\< |
	s4\mp s\> s4\< |
	s4\! s s\< |
	s\! s s\< |
	s4. s\> |
	s4 s\! s\> |
	s4.\p s8\< s\> s |
	s2\! s8 s\< |
	s2 s8 s\! |
	s2 s8\< s |
	s2\! s8\< s |
	s2\! s8\< s |
	s4. s\> |
	s2\! s4\> |
	
	s4\< s\! s\> |
	s2.\< |
	s2 s4\> |
	s2\! s8 s\> |
	s2\< s4\! |
	s2.*3|
	s4\> s2\! |
	s4\> s\! s\> |
	s2.\! |
	s4._\markup{\dynamic "p" \italic "semplice"} s\> |
	s4\! s2\> |
	s2. |
	s |
	s4\! s s\< |
	s\! s s\< |
	s2.*3\! |
	s2.\< |
	s4.\! s\> |
	s4\! s4\p\> s |

	\repeat volta 2
	{
		s4\!_\markup{\dynamic "p" \italic "grazioso"} s s\< |
		s\> s s\! |
		s\< s\> s\! |
	}
	\alternative
	{
		{
			s\mf s s\p\< |
			s\! s s\< |
			s\! s s\< |
			s2 s4\! |
			s2\< s4\sf\! |
		}
		{
			s4\mf s s\p\< |
			s\! s s\< |
		}
	}
	s\! s s\< |
	s2.\! |
	s2 s4\sf |

	\repeat volta 2
	{
		s4_\markup\italic "leggiero e grazioso" s8 s\< s s\! |
		s4\> s\! s |
		s2. |
		s8 s\> s s\! s4 |
	}
	\alternative
	{
		{
			s4\< s\! s |
			s2._\markup{\italic "poco" \dynamic "p"} |
			s4\mp s\< s\! |
			s s\< s\! |
			s2.\< |
			s4\! s4.\< s8\! |
		}
		{
			s2. |
			s_\markup{\italic "più" \dynamic "p"} |
		}
	}
	s4 s\< s |
	s s\< s |
	s2.\< |
	\rall s4\! s \tempo\markup\sans\bold "tornando al Tempo I" s |

	s2. \bar "|."
}

\paper
{
	%page-count = #2
}

\score {
	\new Staff \with {
		\consists "Span_arpeggio_engraver"
		instrumentName = "Kytara"
	} {
		\set Staff.connectArpeggios = ##t
		<<
			\new Voice { \clef "treble_8" \melodyIII }
			\new Voice { \clef "treble_8" \bassesIII }
			\new Voice { \clef "treble_8" \liningIII }
			\new Dynamics { \dynamics }
		>>
	}

	\layout { \context { \Score \override NonMusicalPaperColumn.page-break-permission = ##f }  }
}

\score {
	\new Staff \with {
		midiInstrument = "acoustic guitar (steel)"
		midiMinimumVolume = 1
		midiMaximumVolume = 1
	} {
		<<
			\new Voice { \clef "treble_8" \unfoldRepeats \melodyIII }
			\new Voice { \clef "treble_8" \unfoldRepeats \bassesIII }
		>>
	}
	\midi {
		\context {
			\Score
			tempoWholesPerMinute = #(ly:make-moment 85 4)
		}
	}
}
