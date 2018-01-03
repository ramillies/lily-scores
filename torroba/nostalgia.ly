\include "custom.ly"

\header {
	title = \markup\typewriter\fontsize #8 "Nostalgia"
	composer = \markup\line{"Federico Moreno Torroba"}  
	%arranger = \markup\tiny "revise a prstoklady: Darek (II/2015)"
	poet = \markup{\concat{"6" \small\raise #1 \underline"a"} "muta in D"}
	meter = ""
	tagline = ""
}

global = {
	\key d \minor
	\time 3/4
	\set Score.voltaSpannerDuration = #(ly:make-moment 2/1)
	\globalstyle
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

	\tempo\markup\main-tempo "Andante."

	\transpose c c'
	{
		\repeat volta 2
		{
			d8 e\glissando f a g e |
			d4 c d8 e |
			f4. g8 <e c g,> <c g, e,> |
			<b, f, d,>2. |
			d8(\strum cis d e f d) |
			e4 cis a8. g16( |
			a4.) g8 c' b |
			<cis e b>2. |
			a8 a\glissando d' cis' d' c' |
			b4\strum g( d'8) cis' |
			<d' b g d>4 r8 e' e'( d') |
			<e a cis'>2. |
		}

		c'8 c' c'( b) a g |
		c' c' c' a b c'( |
		<d' g>2) r4 |
		<e' b>8 d' b g e d |
		b, g, e, f, g, b, |
		a,4. f8 f g |
		e4. e8 <g, cis e> f |
		<f, a, d>2 <gis, h, f>4 |
		\slurUp
		e2( a4) |
		<d' a f>2.^\fermata \bar "|."
	}
}

basses = {
	\global
	\voiceTwo

	\repeat volta 2
	{
		<d, f a>4. r |
		<a, e>2 <f a>8 <g b> |
		<< { \stemDown <a c'>2 } \\ { r4 d } >> s |
		r g, g, |
		<as, f h>2\strum r4 |
		<a, e g>2 <g c' e'>4 |
		<f a d'> r <e d' g'>8 r |
		r a,4 a, a,8 |
		<a, fis d'>2 r4 |
		<g d' g'>2\strum r4 |
		r e r |
		a8 a,4 a,8 \priraz c16 b,8 a, |
	}
	<d, fis c'>4 r <es g c'> |
	<d, fis c'> r <d c' fis'> |
	b,8 d cis d \priraz f16 es8 d |
	g2 r4 |
	s2. |
	r8 a, f e d h |
	<< { \stemDown r8 d g4 } \\ { a,2 } >> a,4 |
	d,2. |
	<< { \stemDown d'4 cis'4( \once\hide Stem a') } \\ { <a, g>2. } >> |
	d,2._\fermata |
}


\paper
{
	#(set-paper-size "a5" 'landscape)
	page-count = #1
	bookTitleMarkup = \markup\column {
		\fill-line
		{
			\fromproperty #'header:poet
			\fontsize #5 \fromproperty #'header:title
			\fromproperty #'header:composer
		}
		\fill-line
		{
			\fromproperty #'header:meter
			\fromproperty #'header:arranger
		}
	}
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
			\new Voice { \clef "treble_8" \unfoldRepeats \melody }
			\new Voice { \clef "treble_8" \unfoldRepeats \basses }
		>>
	}
	\midi {
		\context {
			\Score
		}
	}
}
