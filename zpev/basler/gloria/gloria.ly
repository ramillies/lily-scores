\include "custom.ly"

\header {
	title = "Gloria"
	subtitle = "(ze skladby „Missa Kenya“)"
	instrument = ""
	composer = "Paul Basler"
	arranger = ""
	copyright = ""
	tagline = ""
}

global = {
	\globalstyle
	\key e \major
	\time 4/4
}

lining = {
	\global

}

solo = {
	\global

	\tempo\markup\main-tempo "Allegro vivace." \tempo 4 = 130
	e'8 e' e' e'4 h4 cis'8~ |
	cis' cis'4( h8) cis'8( dis') h4~ |
	h8 r2.. |
	R1*2 |
	r4 e4 gis4. a8~ |
	a4 h2. |
	r2. e'8 e' |
	cis'4. a4. h4 |
	R1 |
	h8 h h cis'4 cis' h8~ |
	h4 r2. |
	h4 h8 cis'4 cis' h8~ |
	h4 r2. |
	e'8 e' e' e'4 h cis'8~ |
	cis' cis'4( h8) cis'8( dis') h4~ |
	h8 r2.. |
	R1*2 |
	gis8 h h cis'4 h4.~ |
	h8 r2.. |
	e'8 h h a4 h4.~ |
	h8 r2.. |
	gis8 gis gis a4 a h8~ |
	h h4( a8) h8( cis') cis'4 |
	R1*2 \bar "||"
	\tempo\markup\main-tempo "Lento." \tempo 4 = 65
	R1*2 \bar "||"
	\tempo-primo \tempo 4 = 130
	gis8 h h cis'4 h4.~ |
	h8 r2.. |
	e'8 h h a4 h4.~ |
	h8 r2.. |
	gis8 gis gis a4 a h8~ |
	h h4( a8) h8( cis') cis'4 |
	R1 |
	r2. h4 \bar "||"

	\key g \major
	h4( d'8) d'4. h4 |
	a8( h) c' h4 g4.~ |
	g8 r2.. |
	r2. h4 |
	h4( d'8) d'4. h4 |
	a8( h) c' h4 g4.~ |
	g8 r2.. |
	r2. d'4 |
	d'4. d' d'4 |
	\times 2/3 { f'4( e') c' } d'4. d'8~ |
	d'4. d'2~ d'8~ |
	d'4 r2 d'4 |
	d'4. d' d'4 |
	\times 2/3 { e'4( d') e' } d'2~ |
	d'4 r2 e'4~ |
	\times 2/3 { e'2 d' e'~ } |
	e'2 d'2~ |
	d'4 r2. \bar "||"

	\key e \major
	e'8 e' e' e'4 h cis'8~ |
	cis' cis'4 h8 cis' dis' h4~ |
	h8 r2.. |
	R1*2 |
	gis8 gis gis gis a4 a8 fis~ |
	fis fis fis e fis( gis) gis4~ |
	gis8 r2.. |
	r2. gis8 h |
	h1~ |
	h4 r4. e'4 cis'8 |
	h1~ |
	h4 r4. cis'4 cis'8~ |
	cis'4 h2.~ |
	h4 r2. |
	h4( e'8) a~ a2 |
	gis8( a h) fis8~ fis2 |
	r2 r8 e'4( cis'8) |
	h2 r8 dis'4. |
	e'1~ |
	e'~ |
	e'8 r2.. \bar "|." 
}

sopran = {
	\global

	R1*2 |
	gis4 gis8 a4 a4 fis8~ |
	fis fis4( e8) fis gis e4 |
	h8 h h h gis4( fis8) e~ |
	e4 r2. |
	r h8 h |
	cis'4 h8 a4. h4 |
	R1 |
	gis8 gis gis fis4 fis8 e4~ |
	e8 r2.. |
	r8 gis4 gis8 a( h) h4~ |
	h8 r2.. |
	r8 gis8 gis gis a( h) h4~ |
	h8 r2.. |
	R1 |
	gis4 gis8 a4 a fis8~ |
	fis fis4( e8) fis gis e4 |
	h8 h h h gis4( fis8) e~ |
	e4 r r4. gis8~ |
	gis fis gis h4 gis4.~ |
	gis8 r2. e8~ |
	e e e fis4 gis4. |
	gis8 gis gis a4 a h8~ |
	h h4( a8) h8( cis') cis'4 |
	h4 e'8 a4 gis fis8 |
	gis fis e2. \bar "||"
	r4 \times 2/3 { h8 h h } h16 h h h \times 2/3 { h8 h h } |
	h h cis'( a) h2 \bar "||"
	r2.. gis8~ |
	gis fis gis h4 gis4.~ |
	gis8 r2. e8~ |
	e e e fis4 gis4. |
	gis8 gis gis a4 a h8~ |
	h h4( a8) h8( cis') cis'4 |
	h4 e'8 a4 gis( fis8) |
	e2. r4 \bar "||"

	\key g \major

	R1*2 |
	h4 h8 c'4 c' a8~ |
	a8 a a g a( h) h4 |
	R1*2 |
	h8 h h c'4 c' a8~ |
	a8 a a g a( h) h4 |
	R1*2 |
	\repeat unfold 3 { h4 h8 c'4 c' a8~ | a8 a a g a( h) h4 | }
	h8( g) d' c'4 c' a8~ |
	a8 a a g a( h) h4 \bar "||"

	\key e \major
	R1 * 2 |
	gis4 gis8 a4 a fis8~ |
	fis fis4 e8 fis gis e4 |
	h8 h h h gis4 fis8 e~ |
	e4 r2. |
	r e4 |
	gis8 gis gis gis a4 a8 fis~ |
	fis fis fis e fis( gis) gis4 |
	gis8 h h gis a4 a8 fis~ |
	fis fis fis e fis( gis) gis4 |
	gis8 h h h a4 a8 fis~ |
	fis fis fis e fis( gis) gis4 |
	gis8 gis gis a a a4 h8~ |
	h h h a h( cis') cis'4 |
	R1*2 |
	h4( e'8) a~ a2 |
	gis8( a h) fis8~ fis2 |
	r4 e'2( cis'4) |
	e'1~ |
	e'8 r2.. \bar "|."


}

alt = {
	\global
	R1*2 |
	e4 e8 e4 e dis8~ |
	dis dis4( cis8) dis8 e h,4 |
	h,8 h, h, h, e4( dis8) e8~ |
	e4 r2. |
	r h8 h |
	a4 gis8 fis4. gis4 |
	R1 |
	e8 e e dis4 dis8 h,4~ |
	h,8 r2.. |
	r8 gis4 gis8 a( h) h4~ |
	h8 r2.. |
	r8 gis8 gis gis a( h) h4~ |
	h8 r2.. |
	R1 |
	e4 e8 e4 e dis8~ |
	dis dis4( cis8) dis e h,4 |
	h,8 h, h, h, e4( dis8) e~ |
	e4 r r4. gis8~ |
	gis fis gis h4 gis4.~ |
	gis8 r2. e8~ |
	e e e fis4 gis4. |
	e8 e e fis4 fis gis8~ |
	gis gis4( fis8) gis( a) a4 |
	h4 e'8 a4 gis fis8 |
	gis fis e2. \bar "||"
	r4 \times 2/3 { h8 h h } h16 h h h \times 2/3 { h8 h h } |
	h h cis'( a) h2 \bar "||"
	r2.. gis8~ |
	gis fis gis h4 gis4.~ |
	gis8 r2. e8~ |
	e e e fis4 gis4. |
	e8 e e fis4 fis gis8~ |
	gis gis4( fis8) gis( a) a4 |
	h4 e'8 a4 gis( fis8) |
	e2. r4 \bar "||"

	\key g \major
	R1*2 |
	g4 g8 g4 g fis8~ |
	fis fis fis e fis( g) g4 |
	R1*2 |
	g8 g g8 g4 g fis8~ |
	fis fis fis e fis( g) g4 |
	R1*2 |
	\repeat unfold 4 { g4 g8 g4 g fis8~ | fis fis fis e fis( g) g4 | }
	\bar "||"

	\key e \major
	R1*2 |
	e4 e8 e4 e dis8~ |
	dis dis4 cis8 dis e h,4 |
	h,8 h, h, h, e4 dis8 e~ |
	e4 r2. |
	r e,4 |
	e8 e e e e4 e8 dis~ |
	dis dis dis cis dis( e) e4 |
	e8 e gis e e4 e8 dis~ |
	dis dis dis cis dis( e) e4 |
	e8 e gis gis e4 e8 dis~ |
	dis dis dis cis dis( e) e4 |
	e8 e e fis fis fis4 gis8~ |
	gis gis gis fis gis( a) a4 |
	R1*2 |
	gis4( e8) e~ e2 |
	e4. dis8~ dis2 |
	r4 a2. |
	fis4.( gis8~ gis2~ |
	gis8) r2.. \bar "|."
}

tenor = {
	\global

	R1*2 |
	h4 h8 cis'4 cis' h8~ |
	h h4( a8) h8 h gis4 |
	h8 h h h a4( h8) e~ |
	e4 r2. |
	r h8 h |
	cis'4 h8 a4. h4 |
	R1 |
	h8 h h h4 h8 h4~ |
	h8 r2.. |
	r8 gis4 gis8 a( h) h4~ |
	h8 r2.. |
	r8 gis gis gis a( h) h4~ |
	h8 r2.. |
	R1 |
	h4 h8 cis'4 cis' h8~ |
	h h4( a8) h h gis4 |
	h8 h h h a4( h8) e~ |
	e4 r r4. cis'8~ |
	cis' h cis' e'4 cis'4.~ |
	cis'8 r2. cis'8~ |
	cis' cis' cis' dis'4 e'4. |
	h8 h h cis'4 cis' dis'8~ |
	dis' dis'4( cis'8) dis'8( e') e'4 |
	h4 e'8 a4 gis fis8 |
	gis8 fis e2. \bar "||"
	r4 \times 2/3 { h8 h h } h16 h h h \times 2/3 { h8 h h } |
	h h cis'( a) h2 \bar "||"
	r2.. cis'8~ |
	cis' h cis' e'4 cis'4.~ |
	cis'8 r2. cis'8~ |
	cis' cis' cis' dis'4 e'4. |
	h8 h h cis'4 cis' dis'8~ |
	dis' dis'4( cis'8) dis'8( e') e'4 |
	h4 e'8 a4 gis( fis8) |
	e2. r4 \bar "||"

	\key g \major
	R1*2 |
	d'4 d'8 e'4 e' d'8~ |
	d' d' d' d' d'4 d' |
	R1*2 |
	d'8 d' d'8 e'4 e' d'8~ |
	d' d' d' d' d'4 d' |
	R1*2 |
	\repeat unfold 3 { d'4 d'8 e'4 e' d'8~ | d' d' d' d' d'4 d' | }
	h8( g) d'8 c'4 c' d'8~ |
	d' d' d' d' d'4 d' \bar "||"

	\key e \major
	R1*2 |
	h4 h8 cis'4 cis' h8~ |
	h h4 a8 h h gis4 |
	h8 h h h a4 h8 e~ |
	e4 r2. |
	r e4 |
	h8 h h h cis'4 cis'8 h~ |
	h h h a h4 h |
	h8 h h h cis'4 cis'8 h~ |
	h h h a h4 h |
	h8 h e' h cis'4 cis'8 h~ |
	h h h a h4 h4 |
	h8 h h cis' cis' cis'4 dis'8~ |
	dis'8 dis' dis' cis' dis'( e') e'4 |
	R1*2 |
	e'4( h8) cis'8~ cis'2 |
	h8( cis' h) h~ h2 |
	r4 cis'2( e'4) |
	cis'8( h2..~ |
	h8) r2.. \bar "|."
}

bas = {
	\global

	R1*2 |
	h4 h8 cis'4 cis' h8~ |
	h h4( a8) h8 h gis4 |
	h8 h h h a4( h8) e~ |
	e4 r2. |
	r h8 h |
	a4 gis8 fis4. gis4 |
	R1 |
	e8 e e a4 a gis8~ |
	gis8 r2.. |
	r8 gis4 gis8 a( h) h4~ |
	h8 r2.. |
	r8 gis gis gis a( h) h4~ |
	h8 r2.. |
	R1 |
	h4 h8 cis'4 cis' h8~ |
	h h4( a8) h h gis4 |
	h8 h h h a4( h8) e~ |
	e4 r r4. e8~ |
	e dis e gis4 e4.~ |
	e8 r2. a8~ |
	a a a h4 cis'4. |
	e8 e e fis4 fis gis8~ |
	gis gis4( fis8) gis( a) a4 |
	h,4 e8 a,4 gis, fis,8 |
	gis, fis, e,2. \bar "||"
	\transpose c c, { r4 \times 2/3 { h8 h h } h16 h h h \times 2/3 { h8 h h } |
	h h cis'( a) h2 } \bar "||"
	r2.. e8~ |
	e dis e gis4 e4.~ |
	e8 r2. a8~ |
	a a a h4 cis'4. |
	e8 e e fis4 fis gis8~ |
	gis gis4( fis8) gis( a) a4 |
	h,4 e8 a,4 gis,( fis,8) |
	e,2. r4 \bar "||"

	\key g \major

	R1*2 |
	g4 g8 g4 g d8~ |
	d d d d d( g) g4 |
	R1*2 |
	g8 g g8 g4 g d8~ |
	d d d d d( g) g4 |
	R1*2 |
	\repeat unfold 3 { g4 g8 g4 g d8~ | d d d d d( g) g4 | }
	g8( e) g8 g4 g d8~ |
	d d d d d( g) g4 \bar "||"

	\key e \major

	R1*2 |
	h4 h8 cis'4 cis' h8~ |
	h h4 a8 h h gis4 |
	h8 h h h a4 h8 e~ |
	e4 r2. |
	r e4 |
	h8 h h h cis'4 cis'8 h~ |
	h8 h h a h4 h |
	h8 h h h cis'4 cis'8 h~ |
	h h h a h4 h |
	h8 h h h cis'4 cis'8 h~ |
	h h h a h4 h |
	e8 e e fis fis fis4 gis8~ |
	gis gis gis fis gis( a) a4 |
	R1*2 |
	h4( gis8) a~ a2 |
	h8( a gis) h~ h2 |
	r4 <a a,>2. |
	<e e,>1~ |
	q8 r2.. \bar "|."
}

tsolo = \lyricmode {
	Glo -- ri -- a in ex -- cel -- sis __ De -- o! __
	Lau -- da -- mus __ te, 
	a -- do -- ra -- mus te.
	Gra -- ti -- as a -- gi -- mus __
	ma -- gnam glo -- ri -- am, __
	Glo -- ri -- a in ex -- cel -- sis __ De -- o! __
	Do -- mi -- ne De -- us, __
	Do -- mi -- ne De -- us, __
	Do -- mi -- ne De -- us, rex __ cœ -- les -- tis,
	Do -- mi -- ne De -- us, __
	Do -- mi -- ne De -- us, __
	Do -- mi -- ne De -- us, a -- gnus De -- i.

	Qui tol -- lis pec -- ca -- ta mun -- di, __
	Qui tol -- lis pec -- ca -- ta mun -- di, __
	Qui se -- des ad dex -- te -- ram Pa -- tris, __
	qui se -- des ad dex -- te -- ram __ Pa -- - - tris, __

	Quo -- ni -- am tu so -- lus __ sanc -- tus Do -- mi -- nus, __
	San -- cto Spi -- ri -- tu in glo -- ria De -- i Pa -- tris! __
	Glo -- ri -- a! __
	Glo -- ri -- a! __
	Glo -- ri -- a! __
	A -- men! A -- men! A -- men! A -- men! __
}

tsbor = \lyricmode {
	Et in ter -- ra pax __ ho -- mi -- ni -- bus bo -- næ vo -- lun -- ta -- tis. __ 
	be -- ne -- di -- ci -- mus te,
	glo -- ri -- fi -- ca -- mus te. __
	ti -- bi prop -- ter __
	glo -- ri -- am tu -- am __
	Et in ter -- ra pax __ ho -- mi -- ni -- bus bo -- næ vo -- lun -- ta -- tis. __ 
	Do -- mi -- ne De -- us, __
	Do -- mi -- ne De -- us, Do -- mi -- ne De -- us, rex __ cœ -- le -- stis, De -- us pa -- ter om -- ni -- po -- tens.

	Do -- mi -- ne fi -- li u -- ni -- ge -- ni -- te Ie -- su Chri -- ste,
	Do -- mi -- ne De -- us, __
	Do -- mi -- ne De -- us, Do -- mi -- ne De -- us, a -- gnus De -- i, fi -- li -- us Pa -- tris.

	mi -- se -- re -- re, mi -- se -- re -- re no -- bis.
	sus -- ci -- pe de -- pre -- ca -- ti -- o -- nem nos -- tram.
	mi -- se -- re -- re, mi -- se -- re -- re no -- bis,
	mi -- se -- re -- re, mi -- se -- re -- re no -- bis,
	mi -- se -- re -- re, mi -- se -- re -- re no -- bis,
	mi -- se -- re -- re, mi -- se -- re -- re no -- bis,

	Do -- mi -- nus, tu so -- lus al -- tis -- si -- mus, Ie -- su Chri -- ste Do -- mi -- nus. __
	Cum San -- cto Spi -- ri -- tu in glo -- ria De -- i Pa -- tris,
	San -- cto Spi -- ri -- tu in glo -- ria De -- i Pa -- tris,
	San -- cto Spi -- ri -- tu in glo -- ria De -- i Pa -- tris,
	San -- cto Spi -- ri -- tu in glo -- ria De -- i Pa -- tris!
	A -- men! A -- men! A -- men! __ 
}

rehearsalMidi = #
(define-music-function
 (parser location name midiInstrument lyrics) (string? string? ly:music?)
 #{
	 \unfoldRepeats <<
		 \new Staff = "sopran" \new Voice = "sopran" { s1*0\f \sopran }
		 \new Staff = "alt" \new Voice = "alt" { s1*0\f \alt }
		 \new Staff = "tenor" \new Voice = "tenor" { s1*0\f \tenor }
		 \new Staff = "bas" \new Voice = "bas" { s1*0\f \bas }
		 \new Staff = "solo" \new Voice = "solo" { s1*0\f \solo }
		 \context Staff = $name {
			 \set Score.midiMinimumVolume = #0.5
			 \set Score.midiMaximumVolume = #0.5
			 \set Score.tempoWholesPerMinute = #(ly:make-moment 70 4)
			 \set Staff.midiMinimumVolume = #0.8
			 \set Staff.midiMaximumVolume = #1.0
			 \set Staff.midiInstrument = $midiInstrument
		 }
		 \new Lyrics \with {
			 alignBelowContext = $name
		 } \lyricsto $name $lyrics
	 >>
 #})

\score {
	\new StaffGroup
	<<
		\new Staff \with {
			instrumentName = "Solo"
			shortInstrumentName = ""
		} \new Voice = "solo" { \clef "treble_8" \oneVoice \solo }

		\new Lyrics \with { \override VerticalAxisGroup #'staff-affinity = #CENTER } \lyricsto "solo" \tsolo

		\new PianoStaff \with {
			\remove "Keep_alive_together_engraver"
		} <<
			\new Staff \with {
				instrumentName = \markup\center-column{"Soprán" "Alt"}
				shortInstrumentName = \markup\center-column{"S" "A"}
			} \new Voice <<
				\new Voice = "soprano" { \voiceOne \transpose c c' { \sopran } }
				\\
				\new Voice = "alt" { \voiceTwo \transpose c c' { \alt } }
			>>

			\new Lyrics = "slova" \with { \override VerticalAxisGroup #'staff-affinity = #CENTER } \lyricsto "soprano" \tsbor
		
			\new Staff \with {
				instrumentName = \markup\center-column{"Tenor" "Bas"}
				shortInstrumentName = \markup\center-column{"T" "B"}
			} \new Voice <<
				\clef bass
				{ \voiceOne \tenor }
				\\
				{ \voiceTwo \bas }
			>>
		
			\new Staff \new Voice \lining
		>>
	>>
	\layout { \context { \RemoveEmptyStaffContext \override VerticalAxisGroup #'remove-first = ##t }}
}

\score {
	\new ChoirStaff <<
		\new Staff \with {
			midiInstrument = "violin"
			instrumentName = "Soprán"
			shortInstrumentName = "S"
			midiMinimumVolume = 0.5
			midiMaximumVolume = 0.5
		} <<
			\new Voice = "sopran" { \unfoldRepeats \sopran }
		>>

		\new Staff \with {
			midiInstrument = "viola"
			instrumentName = "Alt"
			shortInstrumentName = "A"
			midiMinimumVolume = 0.5
			midiMaximumVolume = 0.5
		} <<
			\new Voice = "alt" { \unfoldRepeats \alt }
		>>

		\new Staff \with {
			midiInstrument = "cello"
			instrumentName = "Solo"
			shortInstrumentName = "Solo"
			midiMinimumVolume = 1
			midiMaximumVolume = 1
		} <<
			\clef "treble_8"
			\new Voice = "solo" { \unfoldRepeats \solo }
		>>

		\new Staff \with {
			midiInstrument = "cello"
			instrumentName = "Tenor"
			shortInstrumentName = "T"
			midiMinimumVolume = 0.5
			midiMaximumVolume = 0.5
		} <<
			\clef "treble_8"
			\new Voice = "tenor" { \unfoldRepeats \tenor }
		>>

		\new Staff \with {
			midiInstrument = "contrabass"
			instrumentName = "Bas"
			shortInstrumentName = "B"
			midiMinimumVolume = 0.5
			midiMaximumVolume = 0.5
		} <<
			\clef bass
			\new Voice = "bas" { \unfoldRepeats \bas }
		>>
	>>
	\midi { }
}
% Rehearsal MIDI files:
\book {
	\bookOutputSuffix "sopran"
	\score {
		\rehearsalMidi "sopran" "soprano sax" \tsbor
		\midi { }
	}
}

\book {
	\bookOutputSuffix "alt"
	\score {
		\rehearsalMidi "alt" "soprano sax" \tsbor
		\midi { }
	}
}

\book {
	\bookOutputSuffix "tenor"
	\score {
		\rehearsalMidi "tenor" "tenor sax" \tsbor
		\midi { }
	}
}

\book {
	\bookOutputSuffix "bas"
	\score {
		\rehearsalMidi "bas" "tenor sax" \tsbor
		\midi { }
	}
}

\book {
	\bookOutputSuffix "solo"
	\score {
		\rehearsalMidi "solo" "tenor sax" \tsolo
		\midi { }
	}
}

\paper
{
	left-margin = #8
}
