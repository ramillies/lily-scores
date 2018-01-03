\version "2.18.0"
\language "deutsch"

\header {
  title = ""
  tagline = ""
}

tinystems = #(define-music-function (parser location how) (list?) #{ \override Stem.details.beamed-lengths = #how #} )
normstems = \revert Stem.details

flag = \once \override NoteHead.style = #'harmonic-mixed
flagOn = \override NoteHead.style = #'harmonic-mixed
flagOff = \revert NoteHead.style


global = {
	\key gis \minor
	\time 4/4
	\compressFullBarRests
}

sopran = {
	\global

	\tempo\markup\sans\bold "Moderato"
  	R1 |
	ais2 gis4 ais |
	cis' ais2. |
	R1*3 |

	dis'2 cis'4 dis' |
	fis' dis'2. |
	R1*2 |

	dis'2 cis'4 dis' |
	fis' dis'2 gis8 h |

	dis'4 h cis' dis' |
	h16 ais h8 h16 cis' dis'8 cis'16 h ais gis fisis4 |

	R1 |
	dis'2 cis'4 dis' |
	fis' dis'2. |
	R1 |
	
}

alt = {
	\global

	dis2 cis4 dis |
	fis dis2 dis4 |
	cis8( eis eis16 dis eis fis) gis8( eis) fis( dis) |
	cis4 dis2.-\fermata |
	R1 |

	gis2 fis4 gis |
	h gis2 gis4 |
	fis8( ais ais16 gis ais h) cis'8( ais) h( gis) |
	fis4 gis2.-\fermata |
	R1*2 |

	\flag fis4 gis gis8 fisis gis h |
	\flagOn h4 fis gis \flagOff h8 ais16( h) |
	s1 |

	gis2 fis4 gis |
	h gis2 gis4 |
	fis8( ais ais16 gis ais h) cis'8( ais) h( gis) |
	fis4 gis2. |
}

tenor = {
	\global

	R1*2 |
	ais2 gis4 ais |
	cis' ais2.-\fermata |
	R1*3 |

	dis'2 cis'4 dis' |
	fis' dis'2.-\fermata |
	R1*2 |

	dis'2 cis'4 dis' |
	fis' dis' r2 |

	s1 |
	R1*2 |
	dis'2 cis'4 dis' |
	fis' dis'2 r4 |
}

bas = {
	\global

	R1*2 |
	r2. dis4 |
	cis dis fis8.( eis16) dis4-\fermata |

	R1*3 |
	r2. gis4 |
	fis gis h gis-\fermata |
	R1 |

	dis'16(\( cis' h ais) h( ais gis h) ais8( cis') h( gis) |
	dis( fis) gis( h) ais4 gis\) |
	\flagOn h fis e <fis h,> \flagOff |
	h16 ais h8 h16 ais gis fis e4 dis |

	R1*2 |
	r2. gis4 |
	fis gis h gis|

}

\paper
{
		#(define fonts
			(set-global-fonts
				#:music "ross"
				#:brace "ross"
				#:roman "EB Garamond"
				#:sans "Linux Libertine O"
				#:typewriter "monospace"
				#:factor (/ staff-height pt 20)
			)
		)
		system-system-spacing #'basic-distance = #10
		system-separator-markup = \slashSeparator
		indent = #0
		line-width = #120
		left-margin = #5
		right-margin = #5
		top-margin = #5
		bottom-margin = #5

		oddFooterMarkup=##f
		oddHeaderMarkup=##f
		bookTitleMarkup=##f
		scoreTitleMarkup=##f
}

\score {
	\new ChoirStaff <<
		\new Staff \with {
			midiInstrument = "violin"
			instrumentName = "Soprán"
			shortInstrumentName = "S"
		} <<
			\new Voice = "soprano" \with { \consists "Ambitus_engraver" } { \override Ambitus.X-offset = #2 \oneVoice \transpose c c' { \sopran } }
		>>
		\new Lyrics \with { \override VerticalAxisGroup #'staff-affinity = #CENTER } \lyricsto "soprano"
		{
			Christ __ ist er -- stan -- den!
			Christ __ ist er -- stan -- den!
			Christ __ ist er -- stan -- den!
			Áá __ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
			Christ __ ist er -- stan -- den!
		}

		\new Staff \with {
			midiInstrument = "violin"
			instrumentName = "Alt"
			shortInstrumentName = "A"
		} <<
			\new Voice = "alto" \with { \consists "Ambitus_engraver" } { \override Ambitus.X-offset = #2 \oneVoice \transpose c c' { \alt } }
		>>
		\new Lyrics \with { \override VerticalAxisGroup #'staff-affinity = #CENTER } \lyricsto "alto"
		{
			Christ __ ist er -- stan -- den! Áá __ _ _ _ _ _
			Christ __ ist er -- stan -- den! Áá __ _ _ _ _ _
			Áá __ _ _ _ _ _ _ _ _ _ _
			Christ __ ist er -- stan -- den! Áá __ _ _ _ _ _
		}

		\new Staff \with {
			midiInstrument = "cello"
			instrumentName = "Tenor"
			shortInstrumentName = "T"
		} <<
			\clef "treble_8"
			\new Voice = "tenor" \with { \consists "Ambitus_engraver" } { \override Ambitus.X-offset = #2 \oneVoice \tenor }
		>>
		\new Lyrics \with { \override VerticalAxisGroup #'staff-affinity = #CENTER } \lyricsto "tenor" 
		{
			Christ __ ist er -- stan -- den!
			Christ __ ist er -- stan -- den!
			Christ __ ist er -- stan -- den!
			Christ __ ist er -- stan -- den!
		}

		\new Staff \with {
			midiInstrument = "contrabass"
			instrumentName = "Bas"
			shortInstrumentName = "B"
		} <<
			\clef bass
			\new Voice = "bass1" \with { \consists "Ambitus_engraver" } { \override Ambitus.X-offset = #2 \oneVoice \bas }
		>>
		\new Lyrics \with { \override VerticalAxisGroup #'staff-affinity = #CENTER } \lyricsto "bass1"
		{
			Christ __ ist er -- stan -- den!
			Christ __ ist er -- stan -- den!
			Áá __ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
			Christ __ ist er -- stan -- den!
		}

%		\new Staff \new Voice \lining
	>>
	\layout { \context { \RemoveEmptyStaffContext \override VerticalAxisGroup #'remove-first = ##t }}
	\midi {
		\context {
			\Score
			tempoWholesPerMinute = #(ly:make-moment 70 4)
		}
	}
}
