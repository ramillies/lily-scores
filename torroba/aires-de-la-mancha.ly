\include "custom.ly"

\header {
	title = \markup \fontsize #2 \sans \bold "Aires de la Mancha"
	subtitle = "Napsáno pro kytaru"
	composer = "Federico Moreno Torroba"
	%arranger = \markup\tiny "revise a prstoklady: Darek (II/2015)"
	poet = ""
	meter = ""
	tagline = ""
}

global = {
	\globalstyle
}

tkI = {
	\time 3/8
	\key c \major
	\set Score.voltaSpannerDuration = #(ly:make-moment 9/8)
	\magnifyStaff #.8
}

liningI = {
	\tkI
	s4.*12 | \break
	s4.*13 | \break
	s4.*11 | \break
	\repeat unfold 14 { s4. | \noBreak } s | \break
	\repeat unfold 18 { s4. | \noBreak }
}

melodyI = {	
	\global
	\tkI
	\voiceOne
	\tupletUp
	\slurDown

	\tempo \markup \main-tempo "Allegro ma non troppo."

	\transpose c c'
	{
		<<
			{
				r8 \priraz g f4 |
				r8 \priraz f e4 |
				r8 \priraz es16 d8 c |
				r8 \priraz h8 a4 |
			}
			\\
			{
				s8 c( a,) |
				s h,( g,) |
				s fis, es, |
				s f c |
			}
		>>
		r16 f( c a, c f) |
		<h, d >4~ <h, d g>16 r |

		\repeat volta 5
		{
			c8 e16( f g8)~ |
			g g g |
			\times 2/3 { a16( h a) } g e g8~ |
			g c e |
			g \times 2/3 { f16( g f) } d8~ |
			d h, d |
		}
		\alternative
		{
			{ \times 2/3 { d16( e d) } << { c8 a } \\ { c4 } >> | g8 f g | }
			{
				\times 2/3 { d16( e d) } c4 |
				<a, c'>8 <g, h> <f, a> |
				<< { <h, d gis>4.~ | q8 r4 } \\ { \shiftOn a,,4.~ | a,,8 s4 } >> |
				r8 <b, cis g> g |
				<d b> <cis a> <b, g> |
				<< { <a, c fis>4.~ | q8 r4 } \\ { \shiftOn a,,4.~ | a,,8 s4 } >> |
				r8 \priraz as16 g8 f |
				as g f |
				<< { g4~ g16 g | f4~ f16 f } \\ { es,4. | d,4. } >> |
				r16 es as, f, as,( d) |
				fis,( a, f es d c) |
				h, c d es f fis |
				g4.~ |
				g8 r4 |
			}
			{
				\times 2/3 { d16( e d) } c4~ |
				c4. |
				<c f>8 a16( b c'8) |
				r8 c' c' |
				c' \times 2/3 { b16( c' b) } g8~ |
				g b b |
				b \times 2/3 { a16( b a) } f8 |
				f <d as> q |
				\priraz{as16 b} as8 g \priraz{as16 b} as8[-> |
				g] \priraz{as16 b} as8 g |
				<e g c'>8 e,16( f, g,8~) |
				<g, h, e g>8-^ r4 |
				r4. |
				<h, e g>8 r4 |
				r4. |
				<h, f g>8 r4 |
				r4. |
				<h, a>8 g d |
				f e g, |
				e d as, |
				r16 a,,( f, a, c f) |
				r h,,( f, a, h, e) |
			}
			{ \times 2/3 { d16( e d) } << { c8 a } \\ { c4 } >> | g8 f g | }
			{
				\times 2/3 { d16( e d) } c4~ |
				c4.~ |
				c |
			}
		}

		s |
		\times 2/3 { g16( as g) } f4~ |
		f4.~ |
		f8 s4 |
		s4. |
		<d f h>8 r4 |
		q8 r4 |
		<e g c'>4.~ |
		q~ |
		q~ |
		q8 r4 \bar "|."
	}
}

bassesI = {
	\global
	\tkI
	\voiceTwo
	\slurUp

	g,4. | g, | g, | g, | <g, d> | <g, f>4~ q16 r |
	\repeat volta 5
	{
		<c e g>8 r r |
		<h, e g> r r |
		r4. |
		<b, e g>8 r r |
		as, c f |
		g, d f |
	}
	\alternative
	{
		{ \slurDown c4( f8) | e d e | }
		{
			\slurDown c4( f8) \slurUp |
			a,8 r r |
			f\rest e e |
			f e d |
			<a, e>4.~ |
			q8 r r |
			e8\rest es f |
			\shiftOff es d c \shiftOn |
			d4. |
			f8 es d |
			h16\rest \repeat unfold 2 { c' a } h\rest |
			h\rest \repeat unfold 2 { h g } h\rest |
			c4. |
			s |
			s |
			<< { h8\rest <f h d'>4~ | q8 } \\ { r4 g,8~ | g, } >> \priraz b,16 as,8 g, |
		}
		{
			a,8 f e |
			b, e e |
			<a, c> r4 |
			<d c' f'>4. |
			<g d' f'>8 r4 |
			<c b>8 r4 |
			<d f'>8 a d' |
			<c f>4. |
			g,8[ r d] |
			r g r |
			c r4 |
			g,8 \repeat tremolo 4 { g16 } |
			a8 \times 2/3 {g16( a g)} e8~ |
			<g, e> c e |
			g \times 2/3 { f16( g f) } d8~ |
			d g,16 g, h, d |
			f8 \times 2/3 { e16( f e) } c8~ |
			c4. |
			<c b>4 r8 |
			<c f>4 r8 |
			g,4. |
			g, |
		}
		{ \slurDown c4( f8) | e d e | }
		{
			a,4 e,8\( |
			a,16 h, c8 e |
			a c' e' |
		}
	}
	a'\) r4 |
	r as,8\( |
	des f as |
	ces'\) r4 |
	des''8 r4 |
	g8 r4 |
	g8 r4 |
	r8 e,\( g, |
	c e g |
	c'4.\) |
	c8 r4 \bar "|."

}

tkII = {
	\time 6/8
	\key f \minor
}

liningII = {
	\tkII
}

melodyII = {	
	\global
	\tkII
	\voiceOne
	\tupletUp
	\slurDown

	\tempo \markup \main-tempo "Andante."

	\transpose c c'
	{
		\repeat volta 2
		{
			c8( f e f g es) |
			des4( es16 des c4.) |
			<es, a, c>8 es d es c b, |
			<f, c>4( b,16 as,) r8 des( g)^\fermata |
			f, b, a, c b, as, |
			g,4( \times 2/3 { f16 g f) } <g, c e>4. |
			c8 f, as, <des, c> \priraz des16 <as, c>8 <g, b,> |
			des4.~ des8( es16 des) c8^\fermata \bar "||"
			\time 2/4 \tempo\markup\main-tempo "Poco più mosso."
			r8 <as, des f>[ r <des es>] |
			r <c es as> r4 |
			r8 <des f> r4 |
			r8 <g, des> r4 |
			r8 <des f> \rit <h, as> <e g> |
			\a-tempo f4-> g-> |
			\rit as4( c'16 as f as) |
		}
		\alternative
		{
			{
				g8. f16 <ces es>8 <f, des> |
				\a-tempo r8 g c'4 |
			}
			{
				c8. des16 f8 e |
				<as, c f>2^\fermata \bar "|."
			}
		}
	}
}

bassesII = {
	\global
	\tkII
	\voiceTwo
	\slurUp

	\repeat volta 2
	{
		s2. |
		r8 <b, f as>4 r8 b,8 as,16 g, |
		f,4 r2 |
		des8 g,4 <c g>4._\fermata |
		des2 r8 c |
		es b, des c4. |
		as,4 c8 s4. |
		<< { \stemDown \tupletDown as4 \times 2/3 { g16( as g) } f4. } \\ { f,8 b,4~ b,4._\fermata } >> \bar "||"
		\time 2/4
		f4 g |
		as \times 2/3 { c'8 b as } |
		b4 as8 g |
		f4 es8 \times 2/3 { des16( es des) } |
		c4. r8 |
		r8 <as, as c'>8[ r <c b e'>] |
		r8 <f c' f'> r4 |
	}
	\alternative
	{
		{
			<ces as des'>4 r |
			<e c'>2 |
		}
		{
			r8 <g, des f> r <c b> |
			<f, c>2_\fermata \bar "|."
		}
	}


}

tkIII = {
	\compoundMeter #'(2 3 2 2 4)
	\key e \major
	\magnifyStaff #.9
}

liningIII = {
	\tkIII

	\repeat unfold 2 { s1 s1 s4 | } \break
	\repeat unfold 2 { s1 s1 s4 | } \break
	\repeat unfold 8 { s2 | \noBreak } |

}

melodyIII = {	
	\global
	\tkIII
	\voiceOne
	\tupletUp
	\slurDown

	\tempo \markup \main-tempo "Allegro moderato."

	\transpose c c'
	{
		\repeat volta 2
		{
			<h, e gis>8. gis16 gis8 fis <h, e gis>8 a16( gis) fis8 e dis e fis dis h,4 r2 |
			<e gis h>8. h16 h8 a <e a cis'>8 h16( a) gis8 e fis a gis fis16( e)~ e4 r2 |
			<a, cis e>8. <cis e>16 q8 q <h, dis>8 dis16( cis h,8) gis, a, cis h, gis,2 r4. |
			cis,16( dis, e, fis, gis,8 a,)
		}
		\alternative
		{
			{
				h,8 e16 e fis8 dis cis dis h,[ r <fis, a, dis>] r <gis, h, e> e e e |
				\key c \major \time 2/4
				g8 f16 e f8 e16 d |
				e8 c c c |
				e d16( c h, c d e) |
				d4 g8 a |
				g a16( g) f8 g |
				e c c c |
				<g, e> c c e |
				\key e \major
				<a, dis>4.\strum r8 |
			}
			{
				h,8 <gis, e>16 h, r8 <a, cis fis>[ r <a, dis gis>] <gis, h, e>8\strum r <e' gis e h,>8\strum r r2 \bar "|."
			}
		}
	}
}

bassesIII = {
	\global
	\tkIII
	\voiceTwo
	\slurUp

	\repeat volta 2
	{
		<e, h,>4 r8 a q4 r8 gis fis gis <h, e a>4 r8 fis, h, cis dis a |
		gis4 r8 fis a r h, cis dis fis <e h>4. h,16( cis h,8 gis, a, h,) |
		cis8 r4. <gis, e>4 r <fis, e> <gis, e> r8 h,16( cis e8 dis16 cis dis8 h,) |
		s2
	}
	\alternative
	{
		{
			<gis, e gis>4 r r r h,8 r e, dis' d' c' |
			\key c \major \time 2/4
			<e a c'>8[ r <d g h>] r |
			<c f a> a as g |
			<c fis a> r4. |
			r8 <g, c f>4 r8 |
			<f b>4 r |
			<a, fis>8 dis e fis |
			b, r4. |
			\key e \major
			<h, fis>4.\strum r8 |
		}
		{
			r4 a, h, <e, h, e gis>8\strum r8 <e, gis h>8\strum r r2 \bar "|."
		}
	}


}

tkIV = {
	\time 6/8
	\key d \minor
}

liningIV = {
	\tkIV

	\partial 4 s4 | s2.*6 | \break
}

melodyIV = {	
	\global
	\tkIV
	\voiceOne
	\tupletUp
	\slurDown

	\tempo \markup \main-tempo "Andante."

	\transpose c c'
	{
		\repeat volta 2
		{
			\partial 4 e8 d |
			e8 f g f e d |
			e \times 2/3 { d16( e d) } cis8~ cis <g, e> <a, f> |
			a g e c \priraz{c16 d} c8 b, |
			a,2 a8 g |
			\coda
			a g e f b, e |
			<< { dis4. } \\ { h,, } >> r8 gis,( f) |
			e d e h, \priraz d16 c8 h, |
			e2
		}
		e8 f |
		d g e d c d |
		e \times 2/3 { d16( e d) } c8~ c a, e |
		d a g f4. |
		es8 b, d c b, g, |
		r2 ges8 es |
		<f b> \times 2/3 { as16( b as) } f8~ f es f |
		<a, d~>4. d8 c d |
		<f, h,>4 r2 |
		r8 << { c g } \\ { a,4 } >> r8 g f |
		\omit Staff.TimeSignature \time 2/4
		<< { \shiftOn e2 } \\ { \shiftOn <a,, g,> } >> \bar "||"

		\coda-ending
		\time 6/8
		a8 a g <des a> a <e g> |
		a \times 2/3 { g16( a g) } f8 r4. |
		r8 << { h,( e) } \\ { gis,4 } >> r8 << { g( cis') } \\ { e4 } >> |
		<d f a d'>2.^\fermata \bar "|."
	}
}

bassesIV = {
	\global
	\tkIV
	\voiceTwo
	\slurUp
	\shiftOff

	\repeat volta 2
	{
		\partial 4 s4 |
		<a, f b>4. <a, gis h> |
		<a, g b>4 r8 r4. |
		<b, f d'>4. <a, e g>8[ r <g, d f>] |
		<a, e>2 r4 |
		<des b>4. <e a>8 d c |
		g8\rest c' a e,4. |
		<f, a>4 r8 <f a>4 <f, es>8 |
		<e, d gis>2 
	}

	r4 |
	<c as>4 r8 <b, e as>4 r8 |
	<c f a>2 r4 |
	r2 <es a>8 <d b> |
	<c g>4 r2 |
	c8 d es b r4 |
	<des as>4. <ces ges> |
	<< { e8\rest \stemDown f8 f } \\ { b,4. } >> <as, ges>4 r8 |
	g,8 g, gis, h, c d |
	es4. <g, f b> |
	\omit Staff.TimeSignature \time 2/4
	d'8 h cis' c'\rest_\dc-coda \bar "||" \break

	\time 6/8
	<f c' es'>4 r8 es[ r f] |
	<b, f d'>4 r8 g, a, b, |
	d4. a |
	<d a>2._\fermata \bar "|."


}

tkV = {
	\time 3/4
	\key a \major
	\magnifyStaff #.85
}

liningV = {
	\tkV
	s2.*7 | \break
	s2.*8 | \break
	s2.*8 | \break
	s2.*7 | \break
	s2.*7 | \break
	\repeat unfold 7 { s2. | \noBreak } 
}

melodyV = {	
	\global
	\tkV
	\voiceOne
	\tupletUp
	\slurDown

	\tempo \markup \main-tempo "Allegro vivace."

	\transpose c c'
	{
		<cis e>8 q q-> q q q |
		\segno <gis, d fis>8 d16 d d8 h, cis d |
		\repeat tremolo 6 { <cis e>8^\markup\italic "Simile" } |
		<gis, d fis>8 d16 d d8 h, cis d |
		<cis,a,>8 r <a, cis e a>4 q |
		q8 \repeat tremolo 4 { e } d |
		\times 2/3 { fis16( gis fis) } e4 d8 cis h, |
		cis \times 2/3 { h,16( cis h,) } a,8 r <h, e gis> r |
		<cis e a> <cis e> \repeat tremolo 4 { q } |
		<gis, d fis>8 d16 d d8 h, cis d |
		\repeat tremolo 6 { <cis e>8 } |
		<gis, d fis>8 e,16\( fis, gis, a, h, cis d e fis gis |
		a8\) r8 r2 |

		\repeat volta 2
		{
			e8 fis4 \times 2/3 { e16( fis e) } d8 cis |
			e h,2 d8 |
			a h, cis d e fis |
			\times 2/3 { fis16( gis fis) } e4 e8 d cis |
			\times 2/3 { h,16( cis h,) } a,4 a,8 a, gis, |
			\times 2/3 { h,16( cis h,) } a,4. <h, e gis>4-^
		}
		\alternative
		{
			{ \coda <cis e a>4 r2 | }
			{ q8 a,( h, cis \priraz e16 d8 cis) | } 
		}

		\repeat volta 2
		{
			<<
				{
					\slurDown
					a4. gis8( fis gis) |
					a4. gis8( fis gis) |
					a4. cis'8( h a) |
					gis( fis e d cis d) |
					e4. cis8 d e |
					fis4 e d |
					e4. cis8 d e |
					fis4. d8 e fis |
					a4 gis fis |
				}
				\\
				{
					\slurUp
					h,8\rest cis16( a, cis8) s4. |
					h,8\rest d16( gis, d8) s4. |
					h,8\rest cis16( a, cis8) s4. |
					s2. |
					h,8\rest gis,16( fis, gis,8) s4. |
					h,8\rest a,[ h,\rest gis, h,\rest fis,] |
					h,8\rest gis,16( fis, gis,8) s4. |
					h,8\rest d, a, s4. |
					h,8\rest <a, es>[ h,\rest q h,\rest q] |
				}
			>>
		}
		\alternative
		{
			{
				<< 
					{
						a4 gis fis |
						gis2.~ |
						gis |
					}
					\\
					{
						h,8\rest <a, es>[ h,\rest q h,\rest q] |
						r8 gis, d h, eis cis |
						e d cis h, a, gis, |
					}
				>>
			}
			{
				<a, cis e>8 r d'16([ cis' h a gis fis e d |
				cis h, a, gis, fis, e, d, cis, h,, a,, gis,, fis,,)] |
			}
		}
		r4 <e, a, d fis>4-^ <e,, e, h, d gis>-^ |
		<cis e a>8 <cis e> \repeat tremolo 4 { q } \bar "||"

		\coda-ending
		<cis e a>8 <cis e> \repeat tremolo 4 { q } |
		<d fis>8 d16 d d8 h, cis d |
		<cis e a,>8 <cis e> \repeat tremolo 4 { q } |
		<d, a, d fis>8 r8 s2 |
		<cis, a, cis e>4 <d, a, d fis> <e,, d gis h> |
		<cis e a>8\( d16 cis h, a, gis, e, fis, d, cis, h,, |
		a,,8\) r <cis e a>4 q |
		q r2 \bar "|."
	}
}

bassesV = {
	\global
	\tkV
	\voiceTwo
	\slurUp

	<a, e a>8 e h a fis gis |
	e, r8 r2 |
	<a, e a>8 e h a fis gis |
	e,8 r4 <e, d>8[ r q] |
	r4 <a, e a> q |
	q8 r r2 |
	r4 <cis gis h> r |
	r <d f a>8 r <e, d> r |
	a, e h a fis gis |
	e, r r2 |
	<a, e>8 e h a fis gis |
	e, r8 r2 |
	r8 a a h cis' d' |

	\repeat volta 2
	{
		r4 <d g h>8 r r4 |
		r a,8 d fis4~ |
		fis8 r r2 |
		r4 <cis a> r |
		r << { f'4 } \\ { <f, es> } >> r |
		r <fis, es> <e, d> |
	}
	\alternative
	{
		{ <a, e>8 \stemUp \slurDown a([ a h cis' d')] \stemDown\slurUp | }
		{ <a, e>8 r r2 | }
	}

	\repeat volta 2
	{
		fis,4. r |
		fis, r |
		fis, r |
		s s |
		cis r |
		h,2. |
		cis4. r |
		h, r |
		c2. |
	}
	\alternative
	{
		{ c2. | cis2.~ | cis8 r r2 | }
		{ <e, a, a>8 r s2 | s2. | }
	}
	e, |
	<a, e>8 e h a fis gis_\segno-coda \bar "||"

	<a, e>8 e h a fis gis |
	<e, gis>8 r r2 |
	a,8 e h a e cis |
	r8 d16( cis d e fis gis a h cis' d') |
	s2. |
	<a, e cis>8 r r2 |
	r4 <e, a, a>4 q |
	q r2 \bar "|."
}
\paper
{
	indent = #20
	page-count = #2
}

\score {
	\new Staff \with {
		\consists "Span_arpeggio_engraver"
		instrumentName = \markup\sans\bold "Jeringonza"
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
		\consists "Span_arpeggio_engraver"
		instrumentName = \markup\sans\bold\center-column{"Ya llega" "el invierno"}
	} {
		\set Staff.connectArpeggios = ##t
		<<
			\new Voice { \clef "treble_8" \melodyII }
			\new Voice { \clef "treble_8" \bassesII }
			\new Voice { \clef "treble_8" \liningII }
		>>
	}
	\layout {  }
}
\score {
	\new Staff \with {
		\consists "Span_arpeggio_engraver"
		instrumentName = \markup\sans\bold "Coplilla"
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
\score {
	\new Staff \with {
		\consists "Span_arpeggio_engraver"
		instrumentName = \markup\sans\bold "La pastora"
	} {
		\set Staff.connectArpeggios = ##t
		<<
			\new Voice { \clef "treble_8" \melodyIV }
			\new Voice { \clef "treble_8" \bassesIV }
			\new Voice { \clef "treble_8" \liningIV }
		>>
	}
	\layout {  }
}
\score {
	\new Staff \with {
		\consists "Span_arpeggio_engraver"
		instrumentName = \markup\sans\bold "Seguidilla"
	} {
		\set Staff.connectArpeggios = ##t
		<<
			\new Voice { \clef "treble_8" \melodyV }
			\new Voice { \clef "treble_8" \bassesV }
			\new Voice { \clef "treble_8" \liningV }
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
\score {
	\new Staff \with {
		midiInstrument = "acoustic guitar (steel)"
	} {
		<<
			\new Voice { \clef "treble_8" \unfoldRepeats \melodyII }
			\new Voice { \clef "treble_8" \unfoldRepeats \bassesII }
		>>
	}
	\midi {
		\context {
			\Score
			tempoWholesPerMinute = #(ly:make-moment 50 4)
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

\score {
	\new Staff \with {
		midiInstrument = "acoustic guitar (steel)"
	} {
		<<
			\new Voice { \clef "treble_8" \unfoldRepeats \melodyIV }
			\new Voice { \clef "treble_8" \unfoldRepeats \bassesIV }
		>>
	}
	\midi {
		\context {
			\Score
			tempoWholesPerMinute = #(ly:make-moment 50 4)
		}
	}
}

\score {
	\new Staff \with {
		midiInstrument = "acoustic guitar (steel)"
	} {
		<<
			\new Voice { \clef "treble_8" \unfoldRepeats \melodyV }
			\new Voice { \clef "treble_8" \unfoldRepeats \bassesV }
		>>
	}
	\midi {
		\context {
			\Score
			tempoWholesPerMinute = #(ly:make-moment 120 4)
		}
	}
}
