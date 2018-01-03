\include "custom.ly"

\header {
	title = \markup\bold\fontsize #5 "IV"
	subtitle = ""
	composer = "Antonín Dvořák"
	arranger = "" %\markup\tiny "revise a prstoklady: Darek (VII/16)"
	poet = ""
	meter = ""
	tagline = ""
}


global = {
	\time 4/4
	\key d \major
	\globalstyle
	\magnifyStaff #.9
}

liningI = {
	\global

	s1*7 \time 2/4 s2 | \break
	\time 4/4
	s1*6 | \break
	s1*5 | \break
	s1*7 | \break
}

singing = {
	\global
	\tempo\markup\main-tempo "Andante."
	\tempo 4 = 70

	r1^\fermata |
	\transpose c c,
	{
		r4 a8.^\markup{\dynamic "mp" \italic "quasi recit."} a16 a4 a |
		h4.\< a8 a2^\fermata\> |
		r4\! \times 2/3 { e8 fis g } a4. a8 |
		h a a4 a2^\fermata |

		a4\p h fis2 |
		a4 h e2 |
		\time 2/4 e8 fis g4 |
		\time 4/4 fis8 fis d'4.\pp( h8) h4 |

		a8( fis) e g fis2 |
		r1 |
		h4\mf\< h d'2\! |
		cis'4 a8.\> fis16 h4.\! r8 |

		a4\p h fis2 |
		a4 h e2 |
		fis4 d'8 d' h4 g |
		fis e8. e16 d2~ |

		d4 r2. |
		d'8.\mf h16 h4 a8. fis16 fis4 |
		h h a8\< d d d\! |

		fis2.\fz\> fis4 |
		fis\pp fis r2 |
		h8\mf d' d' d' cis'8.( a16) fis4 |
		fis2\> fis\! |

		h8 h e'2\f-> cis'8 h |
		a2 \rit r |
		\a-tempo a4 h fis2 |
		a4 h e e8 e |

		fis4\< d'8( fis)\! e2^\fermata\> |
		d1~\! |
		d~ |
		d^\fermata\laissezVibrer \bar "|."
	}
}

text = \lyricmode {
	Hos -- po -- din jest můj pas -- týř, ne -- bu -- du mí -- ti ne -- do -- stat -- ku.
	Na pas -- tvách ze -- le -- ných pa -- se mne, "k vo" -- dám ti -- chým mne při -- vo -- dí. 
	Du -- ši mou ob -- čer -- stvu -- je; vo -- dí mne po stez -- kách spra -- ve -- dl -- nos -- ti pro jmé -- no Své. __ 
	Byť se mi do -- sta -- lo jí -- ti přes ú -- do -- lí stí -- nu smr -- ti, ne -- bu -- duť se bá -- ti zlé -- ho, ne -- bo Ty se mnou jsi;
	a prut Tvůj a hůl Tvá, toť mne po -- tě -- šu -- je. __ _ _
}

melodyI = {	
	\global
	\voiceOne
	\tupletUp
	\slurDown

	\tempo\markup\main-tempo "Andante."
	\tempo 4 = 70
	\transpose c c'
	{
		a1\fp^\fermata |
		r |
		r2. a4\pp^\fermata |
		r1 |
		r2. a4~^\fermata |

		a2. a4->~ |
		a2. a4 |
		\time 2/4 <h, g>4 <g, h> |
		\time 4/4 \slurUp h2.( g4) \slurDown |
		<< { <d fis>4( <cis e>) fis8( a d' e') } \\ { \shiftOn a,2 d4\< fis 8 a\! } >> |
		\priraz{fis'16 g'} fis'8\( e'16\> d' \priraz{fis'16 g'} fis'8 e'16 d' \priraz{fis'16 g'} fis'8 e'16 d' fis'8\)\! r |

		h1\mf |
		<< { a2 h } \\ { <fis, cis>2\> <h, d>\! } >> |
		a2. a4->~ |
		a2. a4~ |
		a h2 h4 |
		<< { a8( h cis' g') } \\ { <d, d fis>4 <e, e g>4 } >> <a fis'>4 <fis d'>8. <a e'>16 |
		\priraz{fis'16 g'} fis'8\( e'16\> d' \priraz{fis'16 g'} fis'8 e'16 d' \priraz{fis'16 g'} fis'8 e'16 d' fis'8\)\! r |

		<d fis h>2\mf\strum <cis fis a>\strum |
		<g, h, g>\strum <a, d fis>\strum |
		<h,, h, d>2\strum << { cis2 } \\ { h,4 ais, } >> |
		fis2 fis4 h8 cis' |
		<d fis h>2\fz\strum <cis fis a>\strum |
		h8. d'16 d'8 d' cis'8. a16 fis8 fis |

		<d fis h>4 << { <gis cis'>2( <e cis'>8 <d h>) } \\ { e4 d gis } >> |
		<a, cis fis a>4 <h g'> <a fis'>8 <g e'> <e cis'> <g h> |
		a2. a4->~ |
		a2. g4 |
		<a, d fis>4 <h, d fis> h4.^\fermata cis'8 |
		d'4 \priraz{fis'16 g'} fis'8\( e'16 d' \priraz{fis'16 g'} fis'8 e'16 d' \priraz{fis'16 g'} fis'8 e'16 d' |
		fis'1~ |
		<fis' a fis d, a,,>\)^\fermata \bar "|."
	}
}

bassesI = {
	\global
	\voiceTwo
	\slurUp
	\shiftOn

	\repeat unfold 5 { s1 | }
	<d d' fis'>1\pp |
	<a, d cis' fis'> |
	\time 2/4 <e e'>2 |
	\time 4/4 <fis h d' fis'>2 <g, d g d'> |

	<d, a, d>1 |
	<d, a, d fis' a'> |

	<h d' fis'> |
	fis' |
	<d d' fis'> |
	<a, d cis' fis'> |
	<d d' fis'>4 <h, d d' fis'> <g, h, d g d'>2 |
	a,2 <a, d> |
	<d, a, d fis' a'>1 |

	<h, fis h>2\strum <fis, cis fis>\strum |
	<g, d d>\strum <a, d a>\strum |
	<d, d fis'>1\strum |
	<d, h, fis h d'>2. r4 |
	<h, fis h>2\strum <fis, cis fis>\strum |
	<d d' fis'>2 <a, cis' fis' a'> |

	d4 e2. |
	a,4 a,2. |
	<d d' fis'>1 |
	<a, d cis' fis'> |
	d4 <h, d> <g, d g h>4 <a, a e' a'>4_\fermata |
	<fis a d' fis'>4\strum <d, a, d fis' a'>2. |
	<< { <fis' d a,>1 } \\ { a'2 a' } >> |
	r4 d,2._\fermata \bar "|."

}

\paper
{
	page-count = #1
}

\score {
	\new StaffGroup
	<<
		\new Staff \with {
			instrumentName = "Bas"
		} { \new Voice = "bas" { \clef "bass" \singing } }

		\new Lyrics \with { \override VerticalAxisGroup #'staff-affinity = #CENTER } \lyricsto "bas" \text

		\new Staff \with {
			\consists "Span_arpeggio_engraver"
			instrumentName = \markup\center-column{"Kytara" \line{\concat{"(6" \small\raise #1 \underline "a"} "= D)"}}
		} {
			\set Staff.connectArpeggios = ##t
			<<
				\new Voice { \clef "treble_8" \melodyI }
				\new Voice { \clef "treble_8" \bassesI }
				\new Voice { \clef "treble_8" \liningI }
			>>
		}
	>>
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
	\new StaffGroup
	<<
		\new Staff \with {
			instrumentName = "Bas"
			midiInstrument = "cello"
			midiMinimumVolume = 0.7
			midiMaximumVolume = 0.7
		} { \new Voice { \clef "bass" \singing } }

		\new Staff \with {
			\consists "Span_arpeggio_engraver"
			instrumentName = "Kytara"
			midiInstrument = "acoustic guitar (steel)"
			midiMinimumVolume = 1
			midiMaximumVolume = 1
		} {
			\set Staff.connectArpeggios = ##t
			<<
				\new Voice { \clef "treble_8" \melodyI }
				\new Voice { \clef "treble_8" \bassesI }
				\new Voice { \clef "treble_8" \liningI }
			>>
		}
	>>
	\midi {
		\context {
			\Score
		}
	}
}
