\include "custom.ly"

\header {
	title = "La alborada"
	subtitle = "(Cajita de musica — „Hudební skříňka“)"
	composer = "Francisco Tarrega"
	%arranger = \markup\tiny "revise a prstoklady: Darek (VII/16)"
	poet = \markup{\override #'(word-space . 0) \line{"6" \small\raise #1 \underline"a"} "muta in D"}
	meter = ""
	tagline = ""
}


global = {
	\time 2/4
	\key a \major
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
	\phrasingSlurDown

	\tempo\markup\main-tempo "Allegro moderato." 4 = 90
	\transpose c c'
	{
		\repeat volta 2
		{
			\partial 4 e'16( cis') a e |
			\segno \priraz a16 cis8 <a, cis> fis \times 2/3 { <gis, d fis>16( gis fis) } |
			<< { e4 } \\ { a,, } >> e'16( cis') a e |
			\priraz a16 cis8 <a, cis> fis \times 2/3 { <gis, d fis>16( gis fis) } |
			<< { e4 } \\ { a,, } >> \barre "½IX" { cis16 e a cis' } |
		}
		\alternative
		{
			{
				\barre "½IX" { e'8 <e a cis'> } fis' <fis a d'>^"½X" |
				cis'4 a,,16( cis,) e, a, | 
				<cis e>8 \ottava #1 \osm \times 6/9 { e'16\(( fis' e') d'( e' d') cis'( d' cis') } \ottava #0 |
				h4\)
			}
			{
				
				\priraz e'16 a'8 <cis' e'> <a d'> <fis d'> |
				<e cis'>4 \barre "I" { a,16( h,) a,( h,) } |
			}
		}
		\barre "II" { cis d dis e\glissando } e'8^\fermata <h, d gis> |
		<a, cis a>4^\fine_\markup\right-align\fontsize #1 \sans\bold\line{ "D. C." } \times 4/6 { d'16\(( e' d') cis'( d' cis')\) } |
		\key d \major
		\repeat volta 2
		{
			\times 8/12 { h16\(( cis' h) a( h a) fis( g fis) e( fis e) } |
			d4\) \barre "½X" { \flag d16 fis a d' |
			fis'8 <fis a d'> } \flag <g h> <h, g d'> |
			<a, g cis'>4 \times 4/6 { d'16\(( e' d') cis'( d' cis') } |
			\times 8/12 { h( cis' h) a( h a) fis( g fis) e( fis e) } |
			d4\) \barre "VI" { gis,,16 h, d f } |
			\barre "VII" { <a, d fis>32( g gis a) h( his cis' d')\glissando } fis'8^\fermata
		}
		\alternative
		{
			{
				<cis a e'>8 |
				<d fis d'>4^"VII" \times 4/6 { d'16\([( e' d') cis'( d' cis')\)] } |
			}
			{
				\barre "VII" { <a, gis cis'>8 |
				<a, fis d'>4 } e'16( cis') a e_\ds-fine
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
		\partial 4 r4 |
		a, a, |
		g8\rest <a cis'> r4 |
		a, a, |
		g8\rest <a cis'> r4 |
	}
	\alternative
	{
		{
			a, a, |
			a, r |
			r8 \flagOn cis''8_\markup\tiny "XVI" h'_\markup\tiny "XII" a'_\markup\tiny "XIX" |
			e'4_\markup\tiny "XIX" \flagOff 
		}
		{
			\grace s16 a,4 d, |
			a, <f, dis>8 q |
		}
	}
	<e, e> r4 e8 |
	a,4 \flagOn fis''8_\markup\tiny "XIX" a'_\markup\tiny "XIX" |
	\key d \major
	d''_\markup\tiny "XIX" fis'_\markup\tiny "XVI" a'_\markup\tiny "XIX" a_\markup\tiny "XIX" |
	fis'4_\markup\tiny "XVI" d'4_\markup\tiny "XII" \flagOff 

}

\paper
{
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
		%\displayControlPoints
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
