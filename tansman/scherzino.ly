\include "custom.ly"

\header {
	title = \markup \fontsize #3 \sans \bold "III — Scherzino"
	composer = "Alexandre Tansman"
	%arranger = \markup\tiny "revise a prstoklady: Darek (II/2015)"
	poet = ""
	meter = ""
	tagline = ""
}

global = {
	\time 3/4
	\key e \minor
	\globalstyle
	\set Score.voltaSpannerDuration = #(ly:make-moment 2/1)

}

liningI = {
	\global

	s2.*3 |\break
	s2.*5 | \break
	s2.*5 | \break
	s2.*6 | \break
	s2.*4 | \break
	s2.*5 | \break
	s2.*5 | \break
	s2.*7 | \break
	\repeat unfold 6 { s2. | \noBreak }


}

melodyI = {	
	\global
	\voiceOne
	\tupletUp
	\slurDown

	\tempo\markup\main-tempo "Allegro con moto." \tempo 4 = 80

	\transpose c c'
	{
		e,32 g g g h, g g g c g g g ais, g g g h, g g g e, g g g^\markup\italic "Simile" |
		\repeat unfold 3 { s32 \repeat tremolo 3 { g[ } \repeat unfold 4 { s \repeat tremolo 3 { g } } s \repeat tremolo 3 { g] } } |
		s32 \repeat tremolo 3 { h[ } s32 \repeat tremolo 3 { h } s32 \repeat tremolo 3 { h } s32 \repeat tremolo 3 { h] } s \repeat tremolo 3 { g[ } s \repeat tremolo 3 { h] } |
		\repeat unfold 3 { s \repeat tremolo 3 { g[ } s \repeat tremolo 3 { h] } } |
		\repeat unfold 2 { s \repeat tremolo 3 { g[ } s \repeat tremolo 3 { h] } } s \repeat tremolo 3 { dis[ } s \repeat tremolo 3 { h] } |
		s \repeat tremolo 3 { h[ } s \repeat tremolo 3 { h] } \repeat unfold 2 { s \repeat tremolo 3 { g[ } s \repeat tremolo 3 { h] } } \bar "||"

		\tempo\markup\main-tempo "Più vivo." \tempo 4 = 100
		\segno
		<h, g>4 e <fis, d>8 e16 d |
		<g, e>8 d16 c d8 d16 e fis g a h |
		c'4. h |
		a g |
		fis e |
		d c |
		<dis, h,>8 fis, h, fis h \flagOn \ottava #1 \arm-osm fis' |
		h'2. \flagOff \ottava #0 |

		r8 e'16[ gis h8] d'16[ f ais8] h16[ e |
		\repeat volta 2 { gis8] b16[ d f8] gis16[ h, e8] f16[ b, | }
		d8] e16[ gis, h,8] d16[ f, b,8] h,16 e, |

		r8 e'16[ a cis'8] es'16[ g b8] cis'16[ e |
		a8] b16[ es g8] a16[ cis e8] g16[ b, |
		es8] e16[ a, cis8] es16[ g, b,8] cis16[ e, |
		cis8] e16[ a, cis8] es16[ g, b,8] cis16 e, |

		\repeat volta 2
		{
			d16 fis a8 a a a e |
			d16 fis a8 a a \priraz a e4 |
			d8 d' a g16 fis g8 fis16 e |
			fis16 g a8 a a \priraz a e4 |
		}

		<a, fis>8 g16 fis <g, e>8 fis16 e <fis, dis>8 e16 dis |
		<g, e>2 <fis, d>8 g, |
		<e, g, c>4 r c8 e |
		c e c a fis e' |
		<fis dis'> h16 h, c8 ais, h,8 h16 h, |
		c8 ais, h,4 c16 ais, h,8_\markup\right-align\bold\sans\fontsize #2 "D. S." \bar "||"
	}

	<gis h e'>2 <a c' f'>4~ 
	4 <fis a d'>2 |
	<gis h e'>4 <d gis h> <f b d'> |
	<d f b> <e gis h> <h, e gis> |
	<d fis a>2 <h, e gis>4~ |
	q <fis a d'> <d gis h>~ |
	q <fis a d'> <gis h e'>~ |
	q <a c' fis'> <gis h e'> |
	\transpose c c'
	{
		<a, d fis>4 <h, e gis> <d fis a> |
		\repeat unfold 3 { <e gis h>2-^ <d fis a>8 q | }
		<e gis h>4-^ 8-^ 8-^ 8-^ <d fis a>-^ |
		<e gis h>2. \bar "|."
	}
}

bassesI = {
	\global
	\voiceTwo
	\slurUp

	e8[ h c' ais h] e[ |
	c' ais h] d[ ais c'] |
	d[ h c' ais h] d[ |
	c' ais h] d[ ais c'] |
	dis[ g e' g] c[ g] |
	h, g c' g cis' g |
	h, fis des' c' h fis |
	g' fis' h a g fis |

	e8 e,16 fis, g,8 g,16 a, h,4 |
	c h, r |
	r8 g'16 a d'4 fis'16 g c'8 |
	r e'16 fis h4 d'16 e a8 |
	r8 c'16 d g4 h16 c fis8 |
	r a16 h, e4 g16 a, d8 |
	h,4 s2 |
	s2. |

	e,\laissezVibrer | \repeat volta 2 { s } | s |
	a,\laissezVibrer | s2.*3 |

	\repeat volta 2 { \repeat unfold 4 { d4 cis'8 a h g | } }

	d4 c h, |
	e8 e,16 fis, g, a, h, c h,4 |
	b,8 e,16 fis, g, a, b, c <b, e>4 |
	<a, fis>4 r2 |
	h4 r8 fis16 e dis4 |
	r8 fis16 e dis8 e16 ais r8 dis |

	%Coda
	e,8 e, e, e, e, e,_\markup\italic "Simile" |
	\repeat unfold 12 { \repeat tremolo 6 e,8 } |
	e,2. \bar "|."
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
