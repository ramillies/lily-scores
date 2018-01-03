\include "custom.ly"

\header {
	dedication = ""
	title = "Princezna Leia"
	subtitle = ""
	composer = "John Williams"
	poet = ""
	meter = ""
	tagline = ""
}

solo = \markup\typewriter\fontsize #4 "Solo."

global = {
	\globalstyle
	\set Score.voltaSpannerDuration = #(ly:make-moment 2/1)
	\time 4/4
	\key d \major
}

fletna = \transpose c c'' {
	\global
	\phrasingSlurDown

	\tempo\markup\main-tempo "Andante espressivo."
	\partial 8 r8 |
	R1*3 |
	r2.. a,8\(_\markup\caps "Cor."^\solo
	
	a,_\markup{\dynamic "mf" \italic "dolce"} fis8 2~ 8 8 |
	g\) g16\( fis e2~ 8\) a,\( |
	8 fis8 2~ 8 a |
	b\) 16\( a g2~ 8\) b,\( |
	8 b8 2~ 8 8 |
	cis'\) h16\( ais gis2~ 8 8 |
	h\) ais16\( gis fis4~ 8 eis16 fis gis8 fis16 gis |
	b2 f4.\) f8 |
	b a16\( g f4~ 8 e16 f g8 f16 g |
	a2.^\fermata\) r8 e\(_\markup\caps "Ob." |
	\tupletSpan 4
	\times 2/3 { fis8( g a) fis( g a) fis( g a) fis( g a) } |
	h2 fis4^\fermata\) r8 h,\(_\markup\caps "Cor. ingl." |
	\times 2/3 { e8( f g) e( f g) e( f g) e( f g) } |
	a2..^\fermata\) r8 |

	a,2 b,4 gis,8 a, |
	g,4 b, d b, |
	a,2 b,4 a, |
	g,4 b, d b, |
	es b, g, b, |
	cis8 h,16 b, gis,2. |
	h,4. e8 fis8 eis16( fis) gis8 fis16( gis) |
	b2 f4 r8 f |
	f' e'16 d' c'4~ 8 b16 c' d'8 e'16 f' |
	e'2.^\fermata r4 \bar "||"

	\key a \minor

	\repeat unfold 4 { \times 4/6 { a,16( b, es g es b,) } } |
	\repeat unfold 4 { \times 4/6 { b,( des f ges f des) } } |
	\repeat unfold 4 { \times 4/6 { a,( c f ges f c) } } |
	\repeat unfold 4 { \times 4/6 { as,( c e f e c)  } } |

	e2. r4 |
}

liningI = {
	\global
}

melodyI = {	
	\global
	\voiceOne
	\tupletUp
	\slurDown
	\phrasingSlurDown

	\transpose c c'
	{
		<<
			{
				\phrasingSlurDown
				\partial 8 d'8\(^\markup\caps "Fl."^\solo_\mp |
				cis' d' h cis' b c' a d' |
				cis' d' h cis' b c' a4\)\laissezVibrer |
			}
			\\
			{
				\partial 8 s8 |
				s1 |
				\phrasingSlurUp
				s2. d8\rest g\(_\markup\caps "Ob." |
				\stemUp
				fis8 g e fis es f d g |
				fis g es fis d2\) |
			}
		>>

		\once\override Beam.positions = #'(2 . .5) \override Beam.extra-offset = #'(.5 . .5)
		\repeat tremolo 4 { <d fis>8(_\markup{\italic "sempre" \dynamic "p" \italic "accomp."}^\markup\caps "Vln." a,) } |
		\once\override Beam.positions = #'(3 . 2) 
		\repeat tremolo 4 { <d g>( b,) } |
		\once\override Beam.positions = #'(3.5 . 2.5)
		\repeat tremolo 4 { <fis a>( d) } |
		\once\override Beam.positions = #'(4 . 2.5)
		\repeat tremolo 4 { <g b>( d) } |
		\once\override Beam.positions = #'(4 . 3)
		\repeat tremolo 4 { q( es) } |
		\once\override Beam.positions = #'(4.5 . 3)
		\repeat tremolo 4 { <gis cis'>( e) } |
		\revert Beam.extra-offset
		<gis cis'> e \once\override Beam.gap-count = #1 \repeat tremolo 3 { <ais dis'>( fis) } |
		\once\override Beam.positions = #'(5 . 3.5) \once\override Beam.extra-offset = #'(.5 . .5)
		\repeat tremolo 4 { <b d'>( f) } |
		q( d q f q d) \times 2/3 { g( b g') } |
		<< { <a' cis'>2\strum } \\ { a,,\strum } >> <e a cis' a'>4.^\fermata\strum r8 |
		\tupletSpan 4 
		\times 2/3 { \transpose c c, { h8(\strum^\markup\caps "Fag." a g) h( a g) b( a g) b( a g) } } |
		r8 \flagOn h,(^\markup\caps "Arpa" dis fis h4)^\fermata\laissezVibrer \flagOff r |
		a,4^\markup\caps "Celli" a, gis, gis, |
		r8 \ottava #1 \arm-osm \flagOn e(^\markup\caps "Arpa" a cis' a'4)^\fermata\laissezVibrer \ottava #0 \flagOff r8 a,_\markup\caps "Fl." |

		a, <d fis> q2~ 8 8 |
		g\strum 16( fis e2)~ 8 a, |
		a, <d fis> q2~ 8 <d a> |
		<< \new Voice = "1" { \stemUp b8[ 16 a] } \new Voice = "2" { \voiceTwo \stemDown <d g>4 } >> g2~ 8 b, |
		b, <g b> q2~ 8 8 |
		<gis cis'>8( <fis h>16 <f b>) gis2~ 8 8 |
		<e h>4~ 8 ais16 gis fis8 eis16( fis) gis8 fis16( gis) |
		<b,, f, b, d f b>2:32_\markup\italic "Rasgueado." <b,, f, b, d f>: |
		<a,, f, a, d f>2.: <g,, b, d, g, d g>4: |
		<e, a, cis e>2\strum <a, cis e a>4^\fermata r8 a_\markup\caps "Fl."^\solo\( \bar "||"

		\key a \minor

		c'8 b16 a c8 d16 es \times 2/3 { g( a b) } a8~ 8 c'~ |
		8 f'16 des' \times 4/5 { c'( a f es c) } a,4.\) b8\( |
		\times 2/3 { f( ges as) } \times 4/6 { ges16( as heses) f( ges as) } ges f h c' f' e' c' h |
		c'32( a as f e h, as, f,) e,8. h,16 e,4~\) 8 c16 h, |
		<g,, e, g, h,>2 <fis,, e, g, h,> |
	}

}

bassesI = {
	\global
	\voiceTwo
	\shiftOn

	\partial 8 s8 |
	a,1~ |
	1 |
	\flagOn a~-\ffXII |
	1 \flagOff |

	d |
	g |
	d |
	d |
	es |
	cis' |
	cis'4 dis'2. |
	d'1 |
	g2. r4 |

	c'8\rest e' a'e' a,4.\strum s8 |
	<c e>4\strum_\markup\caps "Clar." 4 4 4 |
	<h, dis fis h dis'>2\strum\laissezVibrer s |
	<b, d>4_\markup\caps "Clar." 4 4 4 |
	<a, e a cis a'>2\strum\laissezVibrer s |

	<<
		\new Voice = "3" {
			\voiceThree
			<a, d>1\laissezVibrer |
			<b, d g d'>\strum\laissezVibrer |
			<a, d>1\laissezVibrer |
			\stemDown \shiftOn
			d4 <d b d'>2. |
			es1\laissezVibrer |
			<cis gis cis' e'>8\strum g\rest <e, cis gis h e'>2.\strum\laissezVibrer |

		}
		\new Voice = "4" {
			\voiceFour \stemDown \shiftOff
			s4 r8 d8 a d a d |
			s4 r8 g8 d' g d' s |
			s4 r8 d a d a d |
			s4 r8 b d' b d' s |
			s4 r8 es b es b es |
			s4 r8 gis h gis h e |
		}
	>>
	<e, cis gis h>2\laissezVibrer <ais, dis ais cis'>\strum |
	s1 |
	s |
	r16 a,( cis e a cis' e' a') a,4_\fermata r |
}

\paper
{
	left-margin = #10
}

\score {
	\new StaffGroup <<
		\new Staff \with {
			instrumentName = \markup\center-column{"Flauto dolce" "(Alto)"}
			shortInstrumentName = "Fl."
		} \new Voice { \clef "treble^8" \fletna }

		\new Staff \with {
			\consists "Span_arpeggio_engraver"
			instrumentName = "Guitarra   "
			shortInstrumentName = "Gtr."
		} {
			\set Staff.connectArpeggios = ##t
			<<
				\new Voice { \clef "treble_8" \melodyI }
				\new Voice { \clef "treble_8" \bassesI }
				\new Voice { \clef "treble_8" \liningI }
			>>
		}
	>>
	\layout {  }
}

\score {
	\new StaffGroup <<
		\new Staff \with {
			instrumentName = \markup\center-column{"Flauto dolce" "(Alto)"}
			shortInstrumentName = "Fl."
			midiInstrument = "recorder"
			midiMinimumVolume = 0.8
			midiMaximumVolume = 0.8
		} \new Voice { \clef "treble^8" \fletna }

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
	>>
	\midi { }
}
