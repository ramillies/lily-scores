\include "custom.ly"

\header {
	title = "Javier"
	subtitle = "(„Vzpomínka“)"
	composer = "Federico Moreno Torroba"
	arranger = \markup\tiny "úprava a prstoklady: Darek (XII/2016)"
	poet = ""
	meter = ""
	tagline = "* — Šikmé barré."
}

global = {
	\key e \minor
	\time 5/4
	\globalstyle
%	\set fontSize = #1
}

lining = {
	\global

}

melody = {	
	\global
	\voiceOne
	\tupletUp
	\slurDown
	\set tupletSpannerDuration = #(ly:make-moment 3 4)

	\tempo \markup \main-tempo "Allegretto"
	
	\repeat volta 2
	{
		g'4-4 g'4.. fis'16-3 e'4..-0 d'16-4 |
		e'4-0 e'4.. d'16-3 e'4..-4 fis'16-1^"½II" |
		g'4-3 g'4.. a'16-3 h'4..-3 g'16-4 |

		\once\override Arpeggio.positions = #'(-4.5 . 4) \override TextScript.fret-diagram-details.orientation = #'landscape
		<a'-1 d'-3 h-0 fis-4 d-0>2.~\strum^\markup{\fret-diagram #"s:0.9;d:0.3;1-5;2-o;3-7;4-o;5-9;6-7;"} q2 |
	}
	\alternative
	{
		{
			<< { \tightstrum \fleft <g'-4 c'-1 g-0 e-3>2.\strum~ q2 } \\ {  \tightstrum \fleft <e,-0>2.~\strum e,2 } >> |
			\barre "II" { << { \tightstrum \fleft <d'-1 a-1 fis-3>2.~\strum q2 } \\ { \tightstrum \fleft <fis,-1>2.~ \strum q2 } >> } |
			<e'-0 c'-1 g-0>2. fis'4..-3 e'16 |

			<<
				{
					\voiceOne\fleft
					<dis'-3>2.~ dis'2 |
					dis'2.~ dis'2 |
				}
			\\
				{
					\voiceFour\fleft
					<fis-2 h,-1>2. ~ q2 |
					q2.~ q2 |
				}
			>>
		}
		{
			c''4-3 c''4.. a'16-3 \barre "VII" { d''4..-4 h'16-1 } |
			\barre "III" { g'4-1 g'4.. a'16-4 } \barre "VII-VIII*" { h'4..-1 g'16-2 } |
		}
	}

	e'4-0 e'4.. g'16-2 \barre "II" { fis'4..-1 d'16-2 } |
	<< { \fleft \voiceOne <e'-0 h-0 g-0 e-3>2.~ q2 |\coda q2.~ q2 | } \\ { \fleft \voiceFour <e,-0>2.~ q2 | q2.~ q2 | } >>
	\time 3/4 <g-0 h-0 e'-0>4.\strum r8 e'4-0 \bar "||"

	\tempo \markup \main-tempo "Moderato" \time 4/4
	g'2.(-2 fis'4-1 |
	d'-2) e'-0( g'-2 fis'-1) |
	d'2.(-2 c'4)-1 |
	h2(-0 h4 a)-2 |
	h1^\fermata |
	\slurUp
	r4 h2-0 a4(-2 |

	h) h2-0 h4~ |
	h h2 h4~ |
	<e-2 h-0>1^\fermata |
	\slurDown
	<g'-2 es'-3 a-1>1 |
	<fis'-4 c'-3 g-0> |
	<f'-2 cis'-4 gis-1> |

	<e'-0 c'-1 g-0> |
	<dis'-4 a-1 fis-3>  |
	<<
		{
			\voiceOne
			r4 e'-0 fis'-2\glissando h'-4 |
			h' a'-2 a' e'-0 |
		}
		\\
		{
			\voiceFour\fleft
			s4 <c'-1 g-0>2.~ |
			q4 r2. |
		}
	>>
	e'4 g'-2 fis'-1 d'-3 |
	e'1-0 |

	<e'-0 c'-1>2 <g'-1 d'-1 b-1>^"III" |
	<e'-0 c'-1>1~ |
	q2 r4 fis-3 |
	fis( a-2 a g)-0 |
	g( c'-1 c' h)-0 |
	h e'-0 \priraz{e'16 fis'-2} e'4 d'-3 |
	
	h1~-0 |
	h4 d'-1 d' c'-1 |
	e'-0 e' e' fis'-2_\dc-coda \bar "||" \break

	\mark\markup\line{\magnify #2 \raise #.75 \musicglyph #"scripts.coda" \italic "Coda"}
	\omit Score.TimeSignature \time 5/4

	<< { \fleft <f'-1 c'-1 a-2>2.~ q2 } \\ { e,2.~ e,2 } >> |

	<< { \fleft <g'-1 e'-4 h-3>2.~ q2 } \\ { e,2. ~ e,2 } >> |
	<<
		{
			\voiceOne
			<dis'-3>2.~ q2 |
			q2.~ q2 |
		}
	\\
		{
			\voiceFour
			<h, e, fis>2. ~ q2 |
			q2.~ q2 |
		}
	>>

	<e'-0 h-0 g-0 e-3 h,-2 e,-0>2.\strum~ q2 |
	\barre "II" { <g'-2 e'-4 h-3 e-1 h,-1 e,-0>2.\strum~ q2 } |
	\barre "VII" { <h'-1 g'-2 e'-4 h-3 e-1>2.\strum~ q2 } |
	\flagOn <e''\finger"12" h'\finger"12" g'\finger"12">2.~ q2_\markup\tiny "15. V. 2015" \bar "|."
}

basses = {
	\global
	\voiceTwo

	\repeat volta 2
	{
		\once\override Arpeggio.positions = #'(-6 . 3) <d-0 h-0 g-0 h,-2 e,-0>2.\strum <c'-1 g a,>2 |
		\once\override Arpeggio.positions = #'(-5 . 2) <h g d g,-2>2.\strum <a-2 c-3 g,-1>2 |
		<h d g,-2>2. <c'-1 e-2>2 |

		<h,-2>4 h,4.. h,16 h,4.. h,16 |
	}
	\alternative
	{
		{
			<h,-2>4 h,4.. h,16 h,4.. h,16 |
			\barre "II" { <h,-1>4 h,4.. h,16 h,4.. h,16 } |
			<h,-2>4 h,4.. h,16 <c' g h,>2 |

			<c'-4>4 c'4.. <h-4>16 c'4.. h16 |
			c'4 c'4.. h16 c'4.. h16 |
		}
		{
			<g'-2 e'-4 e-1 a,-0>2. <fis'-1 a-1 h,-1>2 |
			<d'-1 h-2 f-1>2. <e'-4 h-3 c-1>2 |
		}
	}

	<b-2 g-4 c-1>2. <a-1 h,-1>2 |
	c4\rest <h,-2>4.. h,16 h,4.. h,16 |
	c4\rest h,4.. h,16 h,4.. h,16 |

	\time 3/4
	<e,-0 h,-2 e-3>4.\strum r |

	\time 4/4
	s1*5 |
	c2(-3 d-0 |

	e)-2 a-2 |
	f-3 g4-0 d-0 |
	s1 |
	r4 <h,-1>2 h,4 |
	r4 <h,-2>2 h,4 |
	r4 <h,-3>2 h,4 |
	r4 <h,-2>2 h,4 |
	r4 <h,-1>2 h,4 |

	a,2-0 r2 |
	s1*2 |
	r2 <c'-3 e-2 g-0 c-1> |

	<g-0 e-2 c-3> <f-1 g,-1> |
	<g,-3 c-4 e-2 g-0>1~ |
	q2 s |
	s1*3 |

	r2 <e-4 fis-3> |
	q q4 r |
	s1 |

	% Coda
	\omit Score.TimeSignature \time 5/4
	c4\rest <d-0>4.. d16 d4.. d16 |
	c4\rest <cis-2>4.. cis16 cis4.. cis16 |
	<c'-4>4 c'4.. <h-4>16 c'4.. h16 |
	c'4 c'4.. h16 c'4.. h16 |
	c4\rest h,4.. h,16 h,4.. h,16 |
	c4\rest h,4.. h,16 h,4.. h,16 |
	c4\rest \flagOn h4..\finger"19" h16 h4.. h16 |
	\flagOff e,2.~ e,2 |

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
			\new Voice { \clef "treble_8" \melody }
			\new Voice { \clef "treble_8" \basses }
			\new Voice { \clef "treble_8" \lining }
		>>
	}
	\layout {  }
}

\score {
	\new Staff \with {
		midiInstrument = "acoustic guitar (steel)"
	} {
		<<
			\new Voice { \clef "treble_8" \unfoldRepeats \melody }
			\new Voice { \clef "treble_8" \unfoldRepeats \basses }
		>>
	}
	\midi {
		\context {
			\Score
			tempoWholesPerMinute = #(ly:make-moment 70 4)
		}
	}
}
