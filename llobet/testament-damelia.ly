\include "custom.ly"

\header {
	title = \markup\main-tempo\fontsize #1 "El testament d'Amelia"
	subtitle = "(Katalánská lidová píseň)"
	subsubtitle = ""
	composer = \markup\line{"Miguel Llobet," \teeny "revise a prstoklady: Darek (V/2015)"}
	%arranger = \markup\tiny "revise a prstoklady: Darek (II/2015)"
	poet = \markup{\override #'(word-space . 0) \line{"6" \small\raise #1 \underline"a"} "muta in D"}
	meter = ""
	tagline = ""
}

global = {
	\globalstyle
	\key d \minor
	\time 3/4
}

lining = {
	\global
	\repeat unfold 7 { s2. | \noBreak } s | \break
	\repeat unfold 7 { s2. | \noBreak } s | \break
	\repeat unfold 7 { s2. | \noBreak } s | \break
}

melody = {	
	\global
	\voiceOne
	\slurDown

	\tempo\markup\main-tempo "Andante espressivo."

	\transpose c c'
	{
		\repeat volta 2
		{
			d4 d d\glissando |
			f2 g4\glissando |
			a2.^"VII" |
			f |
			g4\glissando b4 a8( b) |
			\barre "V" { c'2 b4 |

			a2.~ |
			\ignore-osm a2 r4 \unignore-osm |
			a f } g\glissando |
			a2 b4\glissando |
			g2. |
			f |
			d4^"I"\glissando f4 e8( f)\glissando |

			g2 f4\glissando |
			d2.~ |
			d2 r4 |
			\flagOn \ottava #1 \set Staff.ottavation = \markup{\italic "El canto con arm." \concat{ { \override #'(font-name . "Monky Business")\large\sans\bold "8" } \small\raise #1 \underline"a"}}
			\transpose c c'
			{
				a f g |
				a2 b4 |
				g2. |
				f |

				d4 f e8 f |
				g2 f4 |
				d2.~ |
				d \ottava #0 |
			}
		}

		\flagOff
		r4 <a d> r |
		r <c' es> r |
		\barre "V" { r b( a) } |
		\barre "III" { r b( a) } |
		<as b,>2 r4 |
		r^"V" <a g des> r |
		r^"III" <a d f,>2 |
	}
	\flag <d' a d>2.^\ffXII \bar "|."

}

basses = {
	\global
	\voiceTwo

	\repeat volta 2
	{
		f4\rest <a f> f\rest |
		g\rest <d' b> g\rest |
		b\rest <d' a>2 |
		g4\rest <d' a>2 |
		g4\rest <f' d' g> g\rest |
		b\rest <e' g> b\rest |

		c'\rest <f' c'> \ignore-osm e'\rest |
		b\rest <g' cis'> g\rest \unignore-osm |
		b\rest <d' a> b\rest |
		b\rest <es' fis> b\rest |
		b\rest <cis' e> b\rest |
		g\rest <d' a>2 |
		<as f b,>4 r2 |

		a4\rest <cis' a> a\rest |
		e\rest <a f>2 |
		e4\rest <a f> g\rest |
		\ignore-osm b\rest a2 |
		b4\rest <es' fis>2 |
		g4\rest <cis' e>2 |
		g4\rest <d' a>2 |

		<as b,>2 e4\rest |
		g\rest <cis' a> g\rest |
		e4\rest <a f>2 |
		e4\rest <a f>2 |
		\unignore-osm
	}

	\oneVoice
	a4\glissando f4 g\glissando |
	a2 b4 |
	s4 <e' cis'>2 |
	s4 d2 |
	d4 f e8( f) |
	g2 f4\glissando |
	d2\strum a,4 |
	s2. |
}

ostinato = {
	\global
	\voiceFour

	\repeat volta 2
	{
		d,2. | d, | d,2 f4 | d,2 d4 | d,2. | e2 a,4\rest |
		\override Staff.OttavaBracket.extra-offset = #'(-.7 . 2.5)
		f2 \flagOn\ottava #1 \arm-osm
		\once\override Staff.OttavaBracket.direction = #DOWN
		\override TextScript.outside-staff-priority = #150
		\override TextScript.extra-offset = #'(1.5 . 2)
		a'4_\ffVII |
		e'2_\ffVII a4_\ffVII \ottava #0 \flagOff |
		\revert TextScript.outside-staff-priority \revert TextScript.extra-offset \revert Staff.OttavaBracket.extra-offset
		d2 g,4\rest |
		c2. |
		b,2 a,4 |
		d,2 a,4 |
		s2. |

		a, |
		d,2 a,4 |
		d,2 a,4 |
		\set Voice.middleCPosition = #1
		d2. | c2 g,4\rest | b,2 a,4 | d,2 a,4 |
		s2. | a,2 s4 | d,2 a,4 | d,2 a,4 |
		\unset Voice.middleCPosition
	}

	d,2.~ | d, | <d,~ g> | <d, f> | d, | a, | d,2\strum a,4 | s2. |

}

\paper
{
		#(set-paper-size "a5landscape")
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
			\new Voice { \clef "treble_8" \ostinato }
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
			\new Voice { \clef "treble_8" \unfoldRepeats \ostinato }
		>>
	}
	\midi {
		\context {
			\Score
			tempoWholesPerMinute = #(ly:make-moment 90 4)
		}
	}
}
