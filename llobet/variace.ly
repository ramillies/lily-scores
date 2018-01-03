\include "custom.ly"

\header {
	title = "Variace na Sorovo tema"
	subtitle = ""
	composer = "Miguel Llobet"
	%arranger = \markup\tiny "revise a prstoklady: Darek (VII/16)"
	poet = ""
	meter = ""
	tagline = ""
}

global = {
	\key e \minor
	\globalstyle
	\override Fingering.staff-padding = #'()
	\magnifyStaff #.85
	\override Staff.OttavaBracket.outside-staff-priority = #550
}

tkT = {
	\global
	\time 3/4
}

liningT = {
	\tkT

	s2.*7 | \break
}

melodyT = {	
	\tkT
	\voiceOne
	\tupletUp
	\slurDown

	\tempo\markup\sans\bold "Moderato" 4 = 88
	\transpose c c'
	{
		<g, e>4 <h, e> <c e> |
		e dis <a, h,> |
		<g, e> <h, e> <c e> |
		g fis <c d> |
		<h, g> q <e a> |
		g fis8 a g fis |
		<e g,>4 q <a, fis> |
		e dis h, |
		<g, e>4 <h, e> <c e> |
		e dis <a, h,> |
		<g, e> q <b, e> |
		g fis c |
		<h, g> q <e a> |
		g fis8 a g fis |
		<e g,>4 <a, c fis> <fis, a, dis> |
		<g, e> r2 \bar "|."
	}	
}

bassesT = {
	\tkT
	\voiceTwo
	\slurUp

	e,4 g, a, |
	<h, fis>2 r4 |
	e, g, a, |
	<d a>2. |
	g4 e cis |
	<< { \stemDown a4. c'8 h a } \\ { \shiftOn d2 dis4 } >> |
	e4 c a, |
	<h, fis>2 r4 |
	e,4 g, a, |
	<h, fis>2 r4 |
	e,4 e cis |
	<d a>2 <fis d'>4 |
	g e cis |
	<< { \stemDown a4. c'8 h a } \\ { \shiftOn d2 dis4 } >> |
	e a, h, |
	<e, e> r2 \bar "|."
}

tkI = {
	\global
	\time 3/4
}

liningI = {
	\tkI
	
	\partial 4 s4 |
	s2.*5 | \break
	\repeat unfold 5 { s2. | \noBreak } s | \break
}

melodyI = {	
	\tkI
	\voiceOne
	\tupletUp
	\slurDown

	\tempo\markup\sans\bold "Allegretto" 4 = 108
	\partial 4 <h h,>4 |

	\transpose c c'
	{
		\repeat volta 2
		{
			e8 \priraz a32 <e g>16 <dis fis> <e g>8 <g h>16 <fis ais> <g h>8 <e g> |
			<dis fis> q16 <cis eis> <dis fis>8 <fis a>16 <eis gis> <fis a>8 <dis fis> |
			<e g> q16 <dis fis> <e g>8 <g h>16 <fis ais> <g h>8 <g e> |
			<fis a>8 q16 <eis gis> <fis a>8 <d fis> <d g> <fis a> |
			<g h> q16 <fis ais> <g h>8 <h d'>16 <ais cis'> <h d'>8 <g h> |
		}
		\alternative
		{
			{
				<fis a> q16 <eis gis> <fis a>8 <a c'>16 <gis h> <a c'>8 <fis a> |
				<e g> q16 <dis fis> <e g>8 <e h> <fis a> <e g> |
				<dis fis> r2 h,8 |
			}
			{
				<fis a> q16 <eis gis> <fis a>8 <a c'> <g h> <fis a> |
				r <h, e g>[ r <a, c fis> r <fis, a, dis>] |
				<g, e>4 r2 \bar "|."
			}
		}
	}	
}

bassesI = {
	\tkI
	\voiceTwo
	\slurUp

	\partial 4 s4 |
	\repeat volta 2
	{
		e,8 r2 e,8 |
		h, r2 h,8 |
		e, r2 e8 |
		d r4 c'8 h a |
		g r2 g8 |
	}
	\alternative
	{
		{
			d r2 dis8 |
			e r4 g8 a b |
			h \priraz c'32 h16 ais h8 h' h, r |
		}
		{
			d r2 dis8 |
			e[ r a, r h,] r |
			r e e,2 \bar "|."
		}
	}
}

tkVIII = {
	\global
	\time 12/8
}

liningVIII = {
	\global

}

clarificationsVIII = {
	\tkVIII
	\magnifyStaff #.7

	\override Staff.BarLine.kern = #2.5
	\override Staff.BarLine.hair-thickness = #1.6
	\override Staff.BarLine.thick-thickness = #5.2
	a,8-7^\markup\right-align\sans\bold "Nápověda"_\markup\center-align\italic "(nota určuje strunu, číslo pražec)" g\finger 12 h\finger 12 e'\finger 12 h-7 g-5 e,-7 d-7 h-7 e'4.-7 |
	a,8-7 g\finger 12 h\finger 12 e'\finger 12 h-7 g-5 d\finger 12 g-7 h-7 d4.-3 |
	g8-5 h-5 e'-5 g-3 h-5 h-5 g-7 h-7 e'-7 d-3 h-7 g-7 |
	e,-7 d-7 h-7 a,-7 g\finger 12 e'\finger 12 a,\finger 12 h-7 e'\finger 12 <e,-7 e'-7>4. |
	a,8-7 g\finger 12 h\finger 12 e'\finger 12 h-7 g-5 e,-7 d-7 h-7 e'4.-7 |
	a,8-7 g\finger 12 h \finger 12 e'\finger 12 h-7 g-5 d\finger 12 g-7 e'\finger 12 h8-7 g-5 d-3 |
	g-5 h-5 e'-5 g-3 h-5 g-5 g-7 h-7 e'-7 d-3 h-7 g-7 |
	e,-7 d-7 h-7 g-5 h-7 e'-7 e,\finger 12 g-5 h-5 e'4.-5 \bar "|."
	
}

melodyVIII = {	
	\tkVIII
	\voiceOne
	\tupletUp
	\slurDown

	\tempo\markup\sans\bold "Andante" 4. = 66
	\transpose c c'
	{
		\flagOn \ottava #1 \osm
		e8^\markup\right-align\sans\bold "Melodie" g h e' fis' g' h, a fis' h'4. |
		e8 g h e' fis' g' d d' fis' a'4. |
		g'8 h' e'' d'' h' g' d' fis' h' a' fis' d' |
		h, a fis' e g e' a, fis' e' h'4. |
		e8 g h e' fis' g' h, a fis' h'4. |
		e8 g h e' fis' g' d d' e' fis' g' a' |
		g'8 h' e'' d'' h' g' d' fis' h' a' fis' d' |
		h, a fis' g' fis' h' e, g' h' e''4. \bar "|."
		
	}	
}

bassesVIII = {
	\tkVIII
	\voiceTwo
	\slurUp

	\flagOn
	\transpose c c'
	{
		e2. h, |
		e d4. a'4. |
		g' d'' d' a' |
		h, e a, h, |
		e2. h, |
		e d |
		g'4. d'' d' a' |
		h,2. e, \bar "|."
	}
}

tkX = {
	\global
	\time 3/4
}

liningX = {
	\tkX

	s2.*3 | \break
	s2.*3 | \break
	s2.*4 | \break
	
}

melodyX = {	
	\tkX
	\voiceOne
	\tupletUp
	\slurDown

	\tempo\markup\sans\bold "Vivace" 4 = 84
	\override Score.VoltaBracket.extra-offset = #'(0 . -.5)
	\transpose c c'
	{
		\repeat volta 2
		{
			<g e'>8^"VII" g32( a g fis e8) g,,32( a,, g,, fis,, e,,16) \flagOn h^\markup\tiny "XII" g^\markup\tiny "XII" e^\markup\tiny "VII" \flagOff |
			<h fis dis h,>8 dis32( e dis cis h,8) dis,32( e, dis, cis, h,,16) \flagOn a^\markup\tiny "VII" \ottava #1 \osm fis'^\markup\tiny "VII" h'^\markup\tiny "VII" \flagOff \ottava #0 |
			<g e'>8^"VII" g32( a g fis e8) g,,32( a,, g,, fis,, e,,16) \flagOn e'^\markup\tiny "XII" h^\markup\tiny "XII" g^\markup\tiny "XII" \flagOff |
			<d' a fis d>8^"X" fis32( g fis e d8) fis,32( g, fis, e, d,16) \flagOn a^\markup\tiny "VII" d'^\markup\tiny "VII" fis'^\markup\tiny "VII" \flagOff |
			g'8 h32( c' h a g8) h,,32( c, h,, a,, g,,16) \flagOn \ottava #1 \osm h'^\markup\tiny "V" g'^\markup\tiny "V" \ottava #0 d'^\markup\tiny "V" \flagOff |
			<d' a fis d>8^"X" fis32( g fis e d8) fis,32( g, fis, e, dis,16) \flagOn a^\markup\tiny "VII" \ottava #1 \osm fis'^\markup\tiny "VII" h'^\markup\tiny "VII" \flagOff \ottava #0 |
		}
		\alternative
		{
			{
				<e g, h,>16 e \sup \override Staff.OttavaBracket.extra-offset = #'(0 . .5) \ottava #1 \osm <g h g'>^\markup\center-align "½XII" \sdown e <fis c a,> e \sup <a c' fis'> \sdown e <fis e b,> e \sup <fis b fis'> \sdown e |
				<h fis dis h,>-\tweak extra-offset #'(-2 . 1) ^"VII" h, \sup <h dis' h'>^\markup\center-align "½XVI" \sdown h, \sup <h dis' a'>^"½XVI" \sdown h, \sup <a h fis'> \sdown h, <fis h dis'> h, <dis a h> h, |
			}
			{
				<e g, h,>16 e \sup <g h g'>^\markup\center-align "½XII" \sdown e <fis c a,> e \sup <a c' fis'> \sdown e <h fis dis h,>-\tweak extra-offset #'(-2 . 1) ^"VII" h, \sup <h dis' h'>^\markup\center-align "½XVI" \sdown h, |
			}
		}

		\phrasingSlurDown

		\shape #'((0 . 0) (-2 . -3) (-2 . 0) (-.5 . .5)) PhrasingSlur
		\once\override TupletNumber.extra-offset = #'(0 . -.1)
		\sup \times 8/12 { \flag e''\(-\tweak extra-offset #'(.2 . 3.5) _\markup\tiny "V" h' g' e' \sdown h g e h, g, e, h,, g,, } e,,4\) |
		<a, c e>\strum \barre "VII" { <h, e g h>\strum <h, dis fis h>\strum } |
		<g, h, e e'>\strum-\tweak extra-offset #'(-1 . -1) ^"IX" <e, g, h, e>\strum r \bar "|."
	}	
}

bassesX = {
	\tkX
	\voiceTwo
	\slurUp

	\repeat volta 2
	{
		<e, e h>8 r r2 |
		<h, e h>8 r r2 |
		<e, e h>8 r r2 |
		<d a d'>8 r r2 |
		<g h>8 r r2 |
		<d a d'>8 r r2 |
	}
	\alternative
	{
		{
			<g e h, e,>16[ r8. <a, e a>16 r8. e,16] r8. |
			<h, fis h>16 h[ s h s h s h s h s h] |
		}
		{
			<g e h, e,>16[ r8. <a, e a>16 r8. <h, fis h>16] r8. |
		}
	}

	e,2 e,4 |
	<a, e>4\strum <h, e>\strum <h, fis>\strum |
	e,\strum <e, h,>\strum r \bar "|."
}

\paper
{
		ragged-last = ##t
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%  TEMA  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\score {
	\new Staff \with {
		\consists "Span_arpeggio_engraver"
		instrumentName = \markup\sans\bold "Tema"
	} {
		\set Staff.connectArpeggios = ##t
		<<
			\new Voice { \clef "treble_8" \melodyT }
			\new Voice { \clef "treble_8" \bassesT }
			\new Voice { \clef "treble_8" \liningT }
		>>
	}
	\layout {  }
}

\score {
	\new Staff \with {
		midiInstrument = "acoustic guitar (steel)"
	} {
		<<
			\new Voice { \clef "treble_8" \unfoldRepeats \melodyT }
			\new Voice { \clef "treble_8" \unfoldRepeats \bassesT }
		>>
	}
	\midi {
		\context {
			\Score
		}
	}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%  1  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\score {
	\new Staff \with {
		\consists "Span_arpeggio_engraver"
		instrumentName = \markup\center-column{\sans\bold "I" \tiny "(Sor)"}
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
		}
	}
}
%%%%%%%%%%%%%%%%%%%%%%%%% 8 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\score {
	\new PianoStaff \with {
		instrumentName = \markup\sans\bold "VIII"
		\remove "Keep_alive_together_engraver" 
	} {
		\set PianoStaff.connectArpeggios = ##t

		<<
			\new Staff = "down"
			{
				<<
					\new Voice { \clef "treble_8" \melodyVIII }
					\new Voice { \clef "treble_8" \bassesVIII }
					\new Voice { \clef "treble_8" \liningVIII }
				>>
			}
			\new Staff = "up" { \new Voice { \clef "treble_8" \clarificationsVIII } }
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
			\new Voice { \clef "treble_8" \unfoldRepeats \melodyVIII }
			\new Voice { \clef "treble_8" \unfoldRepeats \bassesVIII }
		>>
	}
	\midi {
		\context {
			\Score
		}
	}
}

%%%%%%%%%%%%%%%%%%%%%%% 10 %%%%%%%%%%%%%%%%%%%%%%%%
\score {
	\new PianoStaff \with {
		instrumentName = \markup\sans\bold "X"
		\remove "Keep_alive_together_engraver" 
	} {
		\set PianoStaff.connectArpeggios = ##t

		<<
			\new Staff = "up" { \new Voice { \clef "treble_8" \tkX s2.*12 } }
			\new Staff = "down"
			{
				<<
					\new Voice { \clef "treble_8" \melodyX }
					\new Voice { \clef "treble_8" \bassesX }
					\new Voice { \clef "treble_8" \liningX }
				>>
			}
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
			\new Voice { \clef "treble_8" \unfoldRepeats \melodyX }
			\new Voice { \clef "treble_8" \unfoldRepeats \bassesX }
		>>
	}
	\midi {
		\context {
			\Score
		}
	}
}
