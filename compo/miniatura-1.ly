\include "custom.ly"

\header {
	title = "Miniatura"
	subtitle = "(I — „Ukolébavka“)"
	composer = "Darek"
	poet = ""
	meter = ""
	tagline = ""
}

global = {
	\time 2/4
	\key e \major
	\globalstyle

	\magnifyStaff #.9
}

liningI = {
	\global

	\repeat unfold 8 { s2 | \noBreak } s | \break
	\repeat unfold 9 { s2 | \noBreak } s | \break
	\repeat unfold 8 { s2 | \noBreak } s | \break
	
}

melodyI = {	
	\global
	\voiceOne
	\tupletUp
	\slurDown

	\tempo\markup\sans\large\bold "Largo, rubato" 4 = 60

	\transpose c c'
	{
		\repeat volta 2
		{
			\transpose c c,
			{
				<e gis h e'>2\strum |
				<a h cis' e'>\strum |
				<e gis h e'>2\strum |
				<gis h h dis' e'>4_\markup\italic "Simile"
			}
			e'8. e'16 |
			e'8.( cis'16) cis'8.( fis16) |
			fis4 cis' |
			<gis, h, dis h>( gis) |
			e8 fis a fis |
			\times 2/3 { gis( fis cis) } <gis, cis e>4 |
			cis8. cis16 <e, gis, a, h, e>4~ |

			q2 |
			\times 2/3 { cis'8( h gis) } <e,, h,, e, h, e gis>4\strum |
			\times 2/3 { fis8( gis cis) } <e, gis, h, e>4\strum |
		}
		\alternative
		{
			{
				fis16( gis fis cis) <e, gis, h, e>4\strum |
				<gis, h, cis e>\strum <gis, h, e>\strum^\fermata \bar "||"

				\tempo\markup\sans\bold "Andante" \key e \minor

				e8 h a g |
				\priraz{fis16 g} fis8 e fis g |
				<g, c g>4 <g, d a> |
				h8. e16 e8 e |
				e8. e16 \times 2/3 { e8( g e) } |
				<h, d fis>4 h,8. h,16 |
				\ottava #1
				\set Staff.ottavation = \markup{\override #'(word-space . 0) \line{\italic "arm. " \large\sans\bold "8" \small\raise #1 \underline"a"}}
				\flagOn <g\finger "12" h\finger "12" e' \finger "12">2 |
				r4 q |
				r <d' \finger "7" g' \finger "7" h' \finger "7">~ |
				q2 \flagOff |
				\ottava #0
				<g, h, e> |
				q |
				s |
				\key e \major
			}
			{
				\tempo\markup\sans\bold "Ad libitum"
				\cadenzaOn
				fis16[ gis fis gis a gis a e'] |
				\ottava #1
				\set Staff.ottavation = \markup{\override #'(word-space . 0) \line{\italic "Canto con " \large\sans\bold "8" \small\raise #1 \underline"a"}}
				a'[( gis') gis'( e') e'( fis') fis'( dis')] |
				dis'[( e') e'( h)] \times 4/5 { h([ cis' dis' cis' h)] } 
				\ottava #0
				gis8[ h gis fis] \times 4/5 { e[( fis gis fis e)] }
				\cadenzaOff \bar "||" \noBreak
			}
		}

		\tempo\markup{\override #'(word-space . 0) \sans\bold\line{"T" \raise #1 \underline "o" " I" \raise #1 \underline "o"}}
	}
	<e gis h e'>2\strum |\noBreak
	<gis a h e'>\strum |\noBreak
	<e gis h e'>\strum |\noBreak
	<a h cis' e'>\strum |\noBreak
	<e'' gis' e' h>\strum \bar "|."
}

bassesI = {
	\global
	\voiceTwo
	\slurUp
	\shiftOn

	\repeat volta 2
	{
		<e, h, e>2\strum |
		<a fis e,>\strum |
		<e, h, e>2\strum |
		<e, gis>4 s |
		<a, e' a'>2 |
		a, |
		<e, h> |
		r4 <fis a cis'>~ |
		q <e, cis e gis> |
		r e,8. e,16 |
		e,8. h,16 e,4 |
		a,2 |
		<e, h, e a cis'>4\strum <e, h, e>\strum |
	}
	\alternative
	{
		{
			<e, h, e a cis'>4\strum <e, h, e>\strum |
			<e, e gis>\strum <fis, h, e gis>_\fermata\strum |
			e,2 |
			e, |
			<a, e g>4 <a, fis g> |
			e,2 |
			<g, c, e g h> |
			d |
			\set Voice.middleCPosition = #1
			e,4 e,8. fis,16 |
			g,4 r8. e,16 |
			fis,4 r |
			h, h,8 h, |
			\unset Voice.middleCPosition
			c8. c16 \times 2/3 { c8( d c) } |
			h,4 e,8 e,
			\voiceOne\slurDown \times 4/6 { e,8( fis, gis, h, cis e) } \voiceTwo\slurUp |
		}
		{
			\cadenzaOn
			<e, h, e a cis'>2
			\override TextSpanner.bound-details.left.text = "rit. all"
			\textSpannerDown
			\set Voice.middleCPosition = #1
			e,\startTextSpan
			a,
			\unset Voice.middleCPosition
			e,1\stopTextSpan
			\cadenzaOff
		}
	}

	\override TextSpanner.bound-details.left.text = "morendo"
	<e, h, e>2\strum\startTextSpan |
	<e, e gis>\strum |
	<e, h, e>\strum |
	<e, fis a>\strum |
	<e, gis h>\strum\stopTextSpan \bar "|."


}

\paper
{
		#(set-paper-size "a5" 'landscape)
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
