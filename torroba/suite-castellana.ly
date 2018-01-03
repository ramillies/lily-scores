\include "custom.ly"

\header {
	title = \markup \fontsize #5 \sans \bold "Suite castellana"
	composer = "Federico Moreno Torroba"
	%arranger = "Prstoklady: A. Segovia (zatím — z větší části)"
	%arranger = \markup\tiny "revise a prstoklady: Darek (II/2015)"
	poet = ""
	meter = ""
	tagline = ""
}

global = {
	\globalstyle
	\set Score.voltaSpannerDuration = #(ly:make-moment 2/1)
}

tkI = {
	\time 3/4
	\key e \minor
}

tkII = {
	\time 4/4
	\key c \major
}

tkIII = {
	\time 12/8
	\key e \major
}

liningI = {
	\tkI

	s2.*9 | \break
	s2.*9 | \break
	\repeat unfold 5 { s2.*8 | \break }


}

melodyI = {	
	\global
	\tkI
	\voiceOne
	\tupletUp
	\slurDown

	\tempo \markup \main-tempo "Allegro — Tempo di Fandango."

	\transpose c c'
	{
		e4. dis8 h,4 |
		e e fis |
		\times 2/3 { g8( a g) } fis2^\fermata
	}
	\repeat volta 2
	{
		\segno
		r4 h8 g e c' |
		g4 h2~ |
		h4 h8 g e c' |
		g4 h2~ |
		h4 d'8 a fis e' |
		a4 d'2~ |
		d'4 c'8 g e d' |
		g4 c'2~ | 
		c'4 h8 fis d c'|
		fis4 h2~ |
		h4 a8 e c e |
		<c a>4 <d h> <e c'> |
		<g e'> <a fis'> \priraz a'8 <h g'>4 |
		\coda
	}
	\alternative
	{
		{
			<e h e' fis'>2. |
		}
		{
			r4 h' \flag \ottava #1 \osm h'' \ottava #0 \bar "||"
		}
	}
	
	\key e \major
	e'4. dis'8( h4) |
	e' e' fis' |
	g'8 a' g' f' e'4~ |
	e'2. |
	fis'4. e'8 dis'4 |
	e'4-. dis'-. cis'-. |
	dis'8( e') dis' cis' h4~ |
	h2. |
	e'4. dis'8( h4) |
	e' e' fis' |
	g'8 a' g' f' e'4~ |
	e'2. |
	<fis' e'>4. g'8 a'4 |
	h' a' h' |
	\times 2/3 { g'8( a' g') } fis'2 |
	<h' fis' dis' h>4\strum dis8-. dis-. dis-. e-. |
	fis4 fis g |
	a g fis |
	g8( a) g fis e4 |
	g4 fis e |
	fis8( g) fis e dis4 |
	e dis cis |
	dis8( e) dis cis s4 |
	\transpose c c'
	{
		r dis8 dis dis e |
		fis4 fis gis |
		a gis fis |
		gis8( a gis) fis e4 |
		<gis cis ais,> <fis cis ais,> <e cis ais,> |
		fis4. e8 dis4 |
		e4 dis cis |
		dis4. cis8 
	}
	h4~ |
	h2. \bar "||"

	\key e \minor

	\mark\markup\large{\magnify #2 \musicglyph #"scripts.coda" \lower #.6 \italic "Coda"}
	R2. \bar "||"

	\tempo\markup\main-tempo "Lento."
	r4 <a fis'>2 |
	r4 <c' e' g'>2 |
	g8 a g fis e4^\fermata
	\bar "||"

	\tempo-primo
	h4 h8 g e c' |
	g4 h2~ |
	h4 d'8 a fis e' |
	\flagOn a4 d'2 \flagOff \bar "||"

	\tempo\markup\main-tempo "Vivace."
	r4 h8 g e c' |
	h4 c' e' |
	\stemDown
	fis' g' h' |
	e''2. |
	\stemUp
	\repeat unfold 2 { <e g h e'>8\strum r r2 | } \bar "|."
}

bassesI = {
	\global
	\tkI
	\voiceTwo

	s2.*3 
	\repeat volta 2
	{
		\repeat unfold 5 { e,2.~ | e,2 h,4 | }
		e,2. |
		e,~ |
		e,~ |
	}
	\alternative
	{
		{
			e,2. |
		}
		{
			<e, e h e' fis'> |
		}
	}

	\key e \major
	<< { \stemDown a2. | gis } \\ { r4 h,2~ | h,4 h,2 } >> |
	<c g c'>2. |
	c'4-. g-. c-. |
	<< { \stemDown a4\rest <g h>2 } \\ { cis2. } >> |
	<fis, e b>2. |
	<h, fis> |
	h,4 dis fis |
	<< { \stemDown a2. | gis } \\ { r4 h,2~ | h,4 h,2 } >> |
	<c g c'>2. |
	g4 c' e' |
	a,2.~ |
	a, |
	<h, a dis'>\strum |
	<h, fis h>4\strum s2 |
	s2.*6 |
	s2 h,4~ |
	h,2. |
	<h, dis'>4 q q |
	q q q |
	<e,~ ais cis'>2. |
	e, |
	r4 h,2 |
	<fis, b>4 q q |
	r h,2~ |
	h,4_\markup\italic "rall." a, fis,_\markup\right-align\line{\musicglyph #"scripts.segno" "—" \musicglyph #"scripts.coda"} |
	\key e \minor \bar "||"
	R2.*1 |
	e4.( dis8) h,4 |
	e2 fis4 |
	s2. \bar "||"
	e,2.~ |
	e,2 h,4 |
	e,2. |
	r2 h,4_\fermata \bar "||"
	e,2. |
	s2.*3 |
	\repeat unfold 2 { <e, h, e>8\strum r8 r2 | } \bar "|."
}

liningII = {
	\tkII

	s1*3 | \break
	s1*4 | \break
	s1*4 | \break
}

melodyII = {	
	\global
	\tkII
	\voiceOne
	\tupletUp
	\slurDown


	\tempo \markup \main-tempo "Lento."
	\transpose c c'
	{
		\repeat volta 2
		{
			<<
				{
					a4. \times 2/3 { gis16( a gis) } <gis, e>2 |
					<g, cis fis>4. \times 2/3 { e16( fis e) } d4. a8 |
				}
				\\
				{
					\voiceFour
					e,8\rest e, cis4 d,8\rest e, h,4 |
					d,8\rest e, ais,4 g,8\rest f, a,4  |
				}
			>>

			<f d'>8 q \priraz{e'16} q8 <e c'> <d h> q \priraz{c'16} q8 <c a>8 |
			<f, h, d gis>4. \priraz h16 a8 q4. \priraz h16 a8 |
			<h, d gis>4 r2. |
		}

		<<
			{
				<e a>4.\strum <f b>8\strum <e a>4.\strum <f b>8\strum |
				<g c'>4.\strum <gis cis'>8\strum <g c'>4.\strum <gis cis'>8\strum |
				<g c'>4.\strum
			}
			\\
			{
				\voiceThree
				\fup
				h,8\rest \flagOn <e\finger "19"> <a,\finger "12"> c\rest h,8\rest \flagOn <e\finger "19"> <a,\finger "12"> c\rest |
				d8\rest <g\finger "12"> <c\finger "8+12"> d\rest d8\rest <g\finger "12"> <c\finger "8+12"> d\rest |
				d8\rest <g\finger "12">[ <c\finger "8+12">]^\fermata  \breathe
			}
		>>
		\ottava #1 \osm g'8 f' g' es' f' \ottava #0 |
		<< { <as des'>2 c' } \\ {} \\ {} \\ { s2 b,4 s } \\ {} \\ { d8\rest c c( b,) f\rest as as( g) } >> |
		<es, ges c'~>4 c'16 es'( c') b ges b ges es c es( c) b, |
		\repeat unfold 4 { c es( f es) } |
		c( es) c b, ges,( b,) ges, es, c, es, ges,( b,) c es ges as |
		<< { b4. \times 2/3 { a16( b a) } f2 | g4. \times 2/3 { f16( g f) } } \\ { d8\rest f \flagOn <d\finger "12">4 r8 <es\finger "1+12"> <c\finger "3+12">4 \flagOff | r8 des b,4 } >> <g, es>8 <a, f> <b, g> <c a> |
		<d b>4. c'8 q4. c'8 |
		b c' d'_\markup\italic "espr." f' e' g' \priraz{e'16 g'} e'8 c' |
		d'4. e'8 \accel d'4. e'8\glissando |
		\rall d' c' b c' a b a b |
		<b, d g>2 g8( a) f g |
		e( f) \tempo\markup\sans\bold "Molto rall." d e cis a, d cis |
		<< { <fis, h,>4. \times 2/3 { a,16( h, a,) } } \\ { \voiceFour c,8\rest h,, d,4 } >> r8 <c e> <d fis> <c e> |
		\tupletSpan 4 \times 2/3 { <d fis>8( <c e>) <d fis> <c e> <d fis> <c e> } <d fis> <c e>4 <d fis>8 |
		<< { \flagOn <h\finger "12">4 <a\finger "2+12"> <h\finger "12">4 <a\finger "2+12">^\fermata~ | q16 } \\ { \voiceThree ges,4 <c, f,> ges, q~ | q16 } >> r f,8 e, es, d, c, h,, e,_\dc-coda \bar "||"

		\coda-ending
		<<
			{
				a4. \times 2/3 { gis16( a gis) } e2 |
				a4~ \slurDown \times 4/6 { a16\( c'( h) d' h g\) } e2 |
				d'2 
			}
			\\
			{
				\voiceFour
				\slurUp
				d8\rest cis( d4) g,8\rest gis,( a,4) |
				d8\rest cis( d4) g,8\rest gis,( a,4) |
				h,8\rest <f a>4.
			}
		>>

		\ottava #1 \osm \times 2/3 { f'8( g' e') f'( d' e') } \ottava #0 |
		<e a cis'>2\strum q\strum |
		q1\strum \bar "|."
	}
}

bassesII = {
	\global
	\tkII
	\voiceTwo
	\slurUp

	\repeat volta 2
	{
		<a, a>2 a, |
		a, a, |
		a,1 |
		r8 h, e,4 r8 h, e,4 |
		r8 f e es d c h, e \coda |
	}

	<cis g>4\strum r8 <d gis>\strum <cis g>4\strum r8 <d gis>\strum |
	<e b>4\strum r8 <f h>\strum <e b>4\strum r8 <f h>\strum |
	<e b>4\strum r2. |
	f2 e |
	c'8\rest b b4 r2 |
	s2 ges4 b |
	s1 |
	f4 r f,2 |
	f, <f, c>4 r |
	r8 e' g4~ g8 e' g4 |
	<g d' b'>4 r2. |
	r8 <b f' as'> q4 r8 q q4 |
	r8 <a e' g'> <g d' f'> <a e' g'> <f c' e'> <g d' f'> <f c' e'> <g d' f'> |
	e2 r |
	r1 |
	e,2 <e,~ gis> |
	e, r |
	a,8 e, r e, a, e, r e,_\fermata~ |
	e,16 s2... \bar "||"

	%Coda 
	f2 c |
	f4 r c2 |
	r4 \flag h2.\finger "19" |
	a,2\strum a,\strum |
	<a, cis'>1\strum \bar "|."
}

liningIII = {
	\tkIII

}

melodyIII = {	
	\global
	\tkIII
	\voiceOne
	\tupletUp
	\slurDown

	\tempo\markup\main-tempo "Vivace." \tempo 4 = 180
	\repeat unfold 12 { e8 } 
	\transpose c c'
	{
		\repeat volta 3
		{
			\repeat percent 2 { gis gis gis e fis gis a \times 2/3 { gis( a gis) } fis8 gis e |
			\times 2/3 { fis16( e dis) } e4~ e2. s4. | }
			cis'8 cis' cis' a h cis' d' \times 2/3 { cis'( d' cis') } h8 cis' a |
			\times 2/3 { h16( a gis) } a4~ a2. s4. |
			fis8 fis fis dis e fis gis \times 2/3 { fis( gis fis) } e8 fis dis |
		}
		\alternative
		{
			{
				\times 2/3 { e16( dis cis) } dis4~ dis2. s4. |
			}
			{
				\times 2/3 { a16( gis fis) } gis4~ gis4. r4 <h, e gis> r |

				\repeat volta 2
				{
					\tempo\markup\main-tempo "Lento espressivo." \tempo 4 = 50

					a8 a a \times 2/3 { a16( gis a) } fis8 h~ h16 a a( gis) gis e \times 2/3 { fis( gis) e } fis4 |
					<e h>8 8 8 \times 2/3 { <gis, e h>16 <a, cis'> <fis, a> } <gis, h>8 <a, cis'>~ q16 <cis e'> q <h, dis'> q <a, cis'> \times 2/3 { <e h> cis' a } h4 |
					<< { \flagOn \fleft <h\finger "12" e'\finger "12">4. \flagOff } \\ { cis4. } >> \times 2/3 { <gis dis'>16 e' cis' } dis'4~ 16 <e a cis'> q q q <dis a cis'> \times 2/3 { <gis h> <a cis'> <fis a> } << { h4^\fermata } \\ { gis8 h, } >> |
				}

				\tempo-primo \tempo 4 = 180

				\repeat unfold 12 { h,8 } |
				\rall cis'8 cis' cis' a h cis' dis' \times 2/3 { cis'( dis' cis') } h8 cis' a |
				\times 2/3 { h16( a gis) } a4.~ 1 |
				\a-tempo \repeat unfold 12 { h,,8 } |
			}
			{
				\times 2/3 { a16( gis fis) } gis4~ gis4. r4 <gis e'>2 \bar "|."
			}
		}

	}
}

bassesIII = {
	\global
	\tkIII
	\voiceTwo
	\slurUp

	s1. |
	\repeat volta 3
	{
		\repeat percent 2 { <e, e h>2. q |
		<cis gis>4. gis8 cis gis cis[ r gis r e'] r | }
		<a, a e'>2. q |
		<fis cis'>4. cis'8 fis cis' fis[ r cis' r fis'] r |
		<h, a>2. q |
	}
	\alternative
	{
		{
			q4. fis8 h, fis h,[ r h r fis'] r |
		}
		{
			<e, h>4. h8 e h e4 e r |

			\repeat volta 2
			{
				<fis cis' e'>4. <h dis'> <fis cis' e'> <h, dis'> |
				gis8 gis gis e,4. e, \times 2/3 { gis16 a fis } gis4 |
				r8 gis' a' h,4. h, e, |
			}

			s1. |
			<h e'>2. q~ |
			q1. |
			s |
		}
		{
			<e, h>4. h8 e h e,4 <e, e h>2 \bar "|."
		}
	}

}

\paper
{
}

\book
{
	\bookpart
	{
		\header { subtitle = \markup \lower #2 \column {  \fill-line { \line{\fontsize #4.5 \sans \bold "I"} } \fill-line { \line { \fontsize #2 \sans\bold "Fandanguillo" } } } }
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
	}
	\bookpart
	{
		\header {
			title = ""
			dedication = ""
			composer = ""
			arranger = ""
			subtitle = \markup \lower #2 \column {  \fill-line { \line{\fontsize #4.5 \sans \bold "II"} } \fill-line { \line { \fontsize #2 \sans\bold "Arada" } } }
		}
		\score {
			\new Staff \with {
				\consists "Span_arpeggio_engraver"
				instrumentName = "Kytara"
			} {
				\set Staff.connectArpeggios = ##t
				<<
					\new Voice { \clef "treble_8" \melodyII }
					\new Voice { \clef "treble_8" \bassesII }
					\new Voice { \clef "treble_8" \liningII }
				>>
			}
			\layout { \context { \Score \override NonMusicalPaperColumn.page-break-permission = ##f }  }
		}
	}
	\bookpart
	{
		\header {
			title = ""
			dedication = ""
			composer = ""
			arranger = ""
			subtitle = \markup \lower #2 \column {  \fill-line { \line{\fontsize #4.5 \sans \bold "III"} } \fill-line { \line { \fontsize #2 \sans\bold "Danza" } } }
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
				>>
			}
			\layout {  }
		}
	}
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
			tempoWholesPerMinute = #(ly:make-moment 180 4)
		}
	}
}

\score {
	\new Staff \with {
		midiInstrument = "acoustic guitar (steel)"
	} {
		<<
			\new Voice { \clef "treble_8" \melodyII }
			\new Voice { \clef "treble_8" \bassesII }
		>>
	}
	\midi {
		\context {
			\Score
			tempoWholesPerMinute = #(ly:make-moment 40 4)
		}
	}
}

\score {
	\new Staff \with {
		midiInstrument = "acoustic guitar (steel)"
	} {
		<<
			\new Voice { \clef "treble_8" \unfoldRepeats \melodyIII }
			\new Voice { \clef "treble_8" \unfoldRepeats \bassesIII }
		>>
	}
	\midi {
		\context {
			\Score
			tempoWholesPerMinute = #(ly:make-moment 110 4)
		}
	}
}
