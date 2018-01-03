\include "custom.ly"

\header {
	title = "Vista Point"
	subtitle = ""
	subsubtitle = ""
	composer = "Kai Rosenkranz"
	%arranger = \markup\tiny "revise a prstoklady: Darek (II/2015)"
	poet = ""
	meter = ""
	tagline = ""
}

sup = { \change Staff = "up" \stemDown } 
sdown = { \change Staff = "down" \stemUp }
trem = #(define-music-function (note) (ly:music?) #{ \repeat tremolo 3 { #note } #})

global = {
	\key h \minor
	\time 4/4
	\globalstyle
	\set Score.voltaSpannerDuration = #(ly:make-moment 3 1)
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

	\tempo\markup\main-tempo "Andante."

	h8 h cis' d' h, h cis' d'16( cis') |
	<fis h d'>8 <fis' h'> <cis' fis' a'> <fis' a'> <d g d'> <d' g'> q d'16( cis') |
	<fis h d'>8 <fis' h'> <cis' fis' a'> <fis' a'> <d a d'> e'16( fis') <cis' e'>( fis'32 e') d'16 cis' |
	h8 h <fis a cis'> cis' <g, g h d' e'>4. cis'8 |
	<g d>8 fis' e' d' <e  a d'> a16 cis'32( h) <e a cis'>4 |
	h8 h cis' d' h, h cis' fis64 d' d' d' fis cis' cis' cis'|

	\transpose c c'
	{
		\set subdivideBeams = ##t
		\override TupletBracket.bracket-visibility = ##f \slurUp
		r64 \trem d[ s \trem d] s \trem h[ s \trem h] s \trem a[ \repeat unfold 2 { s \trem a } s \trem a] \tupletSpan 8 \times 4/6 { d,32([ h, d g d g,)] d,( d g h g d) } <g d' g'>8^\fermata\strum s64 \trem d[ s \trem cis] |
		\set baseMoment = #(ly:make-moment 1/32)
		s64 \trem d[ s \trem d] s \trem h[ s \trem h] s \trem a[ \repeat unfold 2 { s \trem a } s \trem a] s \trem d[ s \trem d s \trem e s \trem fis] s \trem e[ s e \times 2/3 { e( fis e)] } s64 \trem d[ s \trem cis] |
		\set subdivideBeams = ##f
		s64 \trem h,[ s \trem h, s \trem h, s \trem d] s \trem cis[ s \trem cis s \trem cis s \trem a,] \times 4/6 { d,32([ h, d g d g,)] d,( d g h g d) } <g d' g'>8.^\fermata\strum cis16 |
		\set subdivideBeams = ##t
		s64 \trem d[ s \trem d s \trem fis s \trem fis] s \trem e[ s \trem e s \trem d s \trem d] s \trem d[ s \trem d s \trem d \times 2/3 { cis( d cis) } h,32] s64 \trem cis[ s \trem cis s \trem d s \trem d] |
	}

	\set baseMoment = #(ly:make-moment 1/8)
	\times 4/6 { h,,32( fis h h h fis) h,( fis h h h fis) h,,( fis h cis' h fis) h,( fis h d' h fis) } \tupletSpan 4 \accel \times 4/7 { h,16( cis d e fis g a) h( cis' d' e' fis' g' a') } |

	\transpose c c'
	{
		\a-tempo
		r8 fis16( d) fis8 e r fis16( d) fis8 e |
		r8 fis16( d) fis8 e r fis16( d) fis8 e |
		d8\strum fis16( d) fis8 e e8\strum fis16( d) fis8 a |
		\flag h2\finger "12" s |
	}

	\transpose c c''
	{
		\set subdivideBeams = ##f
		\flagOn \ottava #1 \arm-osm
		<d-7>8 <d-7 fis-7 h-7>\strum <fis,,-7 e,-7 a-3>16 a,,\finger "12" a-3 cis-9 <h,,,\finger"12" g,\finger "12" h,\finger "12" d-5>4.\strum d16-7 cis-9 |
		<d-7>8 <d-7 fis-7 h-7>\strum <fis,,-7 e,-7 a-3>16 a,,\finger "12" a,-7 cis-9 <fis,,-7 a,-7 d-7>8 e16\finger "12" fis-7 e16\finger "12" fis32-7 e\finger "12" d16-7 cis-9 |
		<d,\finger "12" e,-7 g,\finger "12" h,\finger "12">4\strum <fis,,-7 a,-7 cis-9>8.\strum a,16-7 <h,,,\finger "12" a,,\finger "12" d,\finger "12" g,\finger "12" h,\finger "12">4.\strum cis8-9 |
		<d-7>8 <fis-7> <e\finger "12"> <d-7> <a,-7 cis-9 e\finger "12">8. cis32-9 h,\finger "12" cis8-9 d-7 \bar "||"

		\cadenzaOn \tempo\markup\main-tempo "Largo e molto rubato."
		\slurDown
		\grace{ \flagOff \sdown h,,,,16 \sup \flagOn h,\finger "12" fis-\offset control-points #'((0 . 9) (-2 . 7) (-1 . 1) (-.5 . 0)) \=1(-9 h-\offset control-points #'((0 . 9) (-2 . 7) (-1.75 . 1) (-.75 . 0)) \=2(-9 dis'\=3(-9 } <fis\=1) h\=2) dis'\=3)>4 
		\ottava #0 \flagOff
	}

	\transpose c c'
	{
		<fis, h, h, dis>4:32_\markup\italic "Rasgueado" <d, h, d>2: <e, g, d e>: \ottava #1 \osm <d fis h>: fis16~ <fis h d'>8.:32 <fis h e'>4: <h, fis h d' fis'>: \ottava #0 <h, d fis>:^\fermata r2 \bar "|."
	}


}

basses = {
	\global
	\voiceTwo

	r16 fis8 fis fis fis fis fis fis s16 |
	r16 h8 h fis cis' g g g8. |
	r16 h8 h cis' cis' a,8. s4 |
	r16 e8 d' fis a16 s2 |
	r16 g8 g g g e s e16( a d') |
	r16 fis8 fis fis fis fis fis fis16 fis fis |

	r16 fis h d' cis fis fis' cis' d8 d <d g>8\strum_\fermata fis16 fis |
	r fis h d' cis fis fis' cis' a, d g d' a, e a fis |
	e, h, e h, cis fis a fis d8 d <d g>8.\strum_\fermata s16 |
	e, d g d' e g fis g a, e a r a, e a e |
	h,,8[ h,] h,,[ h,] h,,2 |

	<g, d fis g h e'>2\strum <a, e g cis'>\strum |
	<h,, h, fis h d'>\strum <fis, cis' fis' a'>8\strum r4. |
	<d g' h'>2\strum <a, a' cis''>\strum |
	\oneVoice
	g16\rest h, d( fis) d\(( fis) h d'\) h( cis' d' fis') d'( fis' h' \flag cis''\finger "9") |
	\voiceTwo

	\flagOn
	\transpose c c'
	{
		r16 h,,8\finger "12" d16\finger "12" s2. |
		r16 h,,8\finger "12" d16\finger "12" s4 fis,16 a,\finger "12" r8 <e-7 a-7>4 |
		r8 h,,16\finger"12" d'-7 s2. |
		r16 <a,\finger "12" d\finger "12">8 a, a, a,16 s2 |
	}

}

ostinato = {
	\global
	\voiceFour

	h,,1 |
	h,,4 cis <h, d> s |
	h, fis, s <a, e> |
	<e, g g> cis s2 |
	<e, d> a,4 a, |
	h,,1 |
	h,, |
	h,, |
	s1*6 |
	h,,1 |
}

superbass = {
	\global
	s1*19

	\ottava #-1 \osmvb \stemDown
	\override TextSpanner.bound-details.left.text = "m. s." \textSpannerDown
	\grace{ \stemDown h,,4( s16 } h,,4) h,,4:32 h,8[\startTextSpan d cis8. a,16]\stopTextSpan <d, h,>2: << { \stemDown h8[_\markup\italic "melodia con m. s." d' cis'8. \showStaffSwitch \sup \stemDown e'16] \sdown } \\ { h,,2 } >> r16 <h,, d fis>8.: <h,, d g>4: h,,: <h,, h, fis>:_\fermata <h,, h, fis h>2 \bar "|."
}

\paper
{
	indent = #20
	page-breaking = #ly:one-page-breaking
}

\score {
	\new PianoStaff \with {
		\consists "Span_arpeggio_engraver"
		instrumentName = \markup\center-column{"Kytara" \line{ "6 =" \score { \new Staff \new Voice { \magnifyStaff #.5 \omit Staff.TimeSignature \clef "treble_8" h,,1 } \layout { indent = 0\cm } } } }
		\remove "Keep_alive_together_engraver"
	} {
		\set PianoStaff.connectArpeggios = ##t
		<<
			\new Staff = "up"
			{
				<<
					\new Voice { \clef "treble_8" \melody }
					\new Voice { \clef "treble_8" \basses }
					\new Voice { \clef "treble_8" \ostinato }
					\new Voice { \clef "treble_8" \lining }
				>>
			}
			\new Staff = "down" \new Voice { \clef "treble_8" \superbass }
		>>
	}
	\layout { \context { \Staff \RemoveEmptyStaves \override VerticalAxisGroup.remove-first = ##t }  }
}

\score {
	\new Staff
	{
		<<
			\new Voice { \clef "treble_8" \unfoldRepeats \melody }
			\new Voice { \clef "treble_8" \unfoldRepeats \basses }
			\new Voice { \clef "treble_8" \unfoldRepeats \ostinato }
			\new Voice { \clef "treble_8" \unfoldRepeats \superbass }
		>>
	}
	\midi {
		\context {
			\Score
			tempoWholesPerMinute = #(ly:make-moment 80 8)
		}
	}
}
