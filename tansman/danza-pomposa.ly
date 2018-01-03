\include "custom.ly"

\header {
	title = \markup \fontsize #3 \sans \bold "V — Danza pomposa"
	subtitle = "(Pompézní tanec)"
	composer = "Alexandre Tansman"
	%arranger = \markup\tiny "revise a prstoklady: Darek (II/2015)"
	poet = ""
	meter = ""
	tagline = ""
}

global = {
	\time 3/4
	\key e \major
	\globalstyle
	\set Score.voltaSpannerDuration = #(ly:make-moment 9/4)
}

liningI = {
	\global

	s2.*5 | \break
	s2.*4 | \break
	s2.*4 | \break
	s2.*5 | \break
	s2.*4 | \break

	s2.*5 | \break
	s2.*4 | \break
	s2.*4 | \break
	s2.*4 | \break
	\repeat unfold 4 { s2. | \noBreak }

}

melodyI = {	
	\global
	\voiceOne
	\tupletUp
	\slurDown

	\tempo\markup\main-tempo "Andante pomposo." \tempo 4 = 80

	\repeat volta 2
	{
		<gis h e'>4 <fis h dis'> <e gis cis'> |
		<dis fis h> cis8 fis16( e) dis8 gis |
		e a16( gis) fis8 h gis cis' |
		<dis h>4 s a16( h) cis' dis' |
		<gis h e'>4 <fis h dis'> <e gis cis'> |
		<dis fis h> cis a,8 fis16( e) |
	}
	\alternative
	{
		{
			fis4. e8 a4~ |
			8 gis cis'4. h8~ |
			8 e'~ 16 dis' e'8~ 8 8~ |
			16 dis' e'8~ 8 8~ 16 dis' e'8~ |
			16 dis' e'8~ 8 8~ 16 dis' e'8~ |
			8 8~ 16 dis' e'8~ 8 8~ |
			8 h h'4-> cis'8 e'16 cis'' |
			a'4 h8 dis'16 h' gis'4 |
			a8 cis'16 a' fis'4 gis8 h16 gis' |
			e'8 ais h fis' a16( h) <a cis'>8 |
			\transpose c c'
			{
				dis4 r8 gis cis'4~-> |
				8 fis h4~ 8 e |
				a4 fis,8 dis gis4~ |
				8 cis4 fis8 dis16( cis) dis8 |
			}
		}
		{
			\rall
			fis8 <e h> e a dis gis |
			fis16 gis a8 h e'16 dis' <e gis h e'>4^\fermata\strum_\tweak extra-offset #'(7 . 7) -\fine \bar "|."
		}
	}

	\a-tempo
	e,4-.\mp h, cis8 h,16( a,) |
	h,8 e4 cis16( a,) h,4~ |
	8 a, gis, fis,16( e,) fis,8( gis,) |
	h,4\mf e gis8 fis16( e) |
	fis8 h4 gis16 e fis4 |
	r8 e dis cis16( h,) cis8 h,16( ais,) |
	h,4 cis r8 dis16( e) |
	dis8 gis e4 fis8 dis |
	e4_\markup\line{\italic "più" \dynamic "f"}  h cis'8 h16( a) |
	h8 e'4 cis'16 a <dis h>4 |
	r8 <dis a> <e gis> fis16( e) fis8 <e gis> |
	<e a> fis'16 e' dis'4. cis'8 |
	<gis his>2 r8 gis' |
	\transpose c c'
	{
		e8_\markup\line{\italic "subito" \dynamic "p"} fis16( gis) fis8 e dis e16( fis) |
		e8 dis cis dis16( e) dis8 cis |
		<dis, gis, his,>8 gis, gis2-> |
		dis8 a fis4 h,8 gis |
		e4 a,8 fis dis << { cis16( dis) } \\ { a,8 } >> |
		his,4 gis,8 dis16( cis) dis4 |
	}
	fis8 h16( a) h4 e8 a16( gis) |
	a4 dis8 gis16( fis) gis4 |
	r8 a fis fis'16 e' dis'( cis') dis'8_\dc-fine \bar "||"
}

bassesI = {
	\global
	\voiceTwo
	\slurUp

	\repeat volta 2
	{
		e,4_\markup\line{\dynamic "f" \italic "deciso"} gis, a, |
		gis,8 h, a,4 h, |
		cis dis e |
		h,8 h,16( cis) dis( e) fis gis s4 |
		e,8 16( fis,) gis,8 a,16( h,) a,8 gis,16( fis,) |
		gis,8 h, h, a,16( gis,) a,4 |
	}
	\alternative
	{
		{
			fis8 gis,16( fis,) gis,4 cis8 h,16( a,) |
			h,4 a,8 gis,16( fis,) gis,4 |
			<cis a>4_\markup\line{\italic "subito meno" \dynamic "f"} <h, gis> <a, fis> |
			<h, gis> <cis a> <gis, h> |
			<h, gis> <cis a> <gis, h> |
			<cis a>4 <h, gis> <a, fis> |
			<h, fis dis'>4 r8 gis cis'4~ |
			8 fis h4~ 8 e |
			a4~ 8 dis gis4 |
			cis dis cis8 a, |
			h, h, h4->~ 8 e16 cis' |
			<< { s4. dis16 h } \\ { a4~ 8 dis } >> gis4~ |
			8 cis16 a << { s4. h,16 gis} \\ { fis4~ 8 h, } >> |
			e4 <cis e a> <h, a> |
		}
		{
			fis8 gis, cis fis, h, e, |
			a, <fis, e> <h, e a> q <e, h, e>4\strum_\fermata |
		}
	}

	s2.*3 |
	r8 e,16( fis,) gis,8 cis16( a,) gis,8 r |
	a, gis,16( a,) h,4 cis16( h,) a,8 |
	gis,4 fis, r |
	r cis8 a,16( gis,) a,4 |
	h,4 cis8 gis, dis h, |
	<cis gis,>4 << { dis8 e16( dis) } \\ { fis,4 } >> <gis, e>4 |
	fis,8 gis, a,4 fis,16 gis, a,8 |
	gis,8 fis, e,4 a,8 gis, |
	fis,4 h8 a,16( gis,) a,4 |
	<gis, dis>2 r4 |
	<cis gis>8 r <ais, cis'>4 <h, a>8 r |
	<gis, h>4 <a, a>8 r <fis, a>4 |
	gis,8 gis~ 4. dis'16( cis') |
	dis'4 fis'8 h16( a) h4 |
	e'8 a16( gis) a4 fis |
	gis8 gis, gis4. a8 |
	fis4. gis8 e4~ |
	8 fis dis4. e8 |
	cis4 a, h, \bar "||"
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
