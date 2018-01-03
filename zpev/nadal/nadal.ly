\include "custom.ly"

\header {
	title = "Nadal"
	subtitle = "(koleda z Menorky)"
	instrument = ""
	composer = "Lidová píseň"
	arranger = "harmonisoval Baltasar Bibiloni"
	copyright = ""
	tagline = ""
}

global = {
	\globalstyle
	\key b \major
	\numericTimeSignature
	\time 3/8
}

lining = {
	\global

}

soprano = \transpose c c'{
	\global

	\tempo\markup\main-tempo "Allegro moderato."
	\tempo 4 = 90

	R4.*3 |
	r8 r g\p |
	f4.~ |
	f4 g8 |
	f4.~ |
	f4 r8 |
	
	b4\mf f8 |
	g4 f8 |
	g4 a8 |
	b8.( c'16 b8) |
	b4f8 |
	g4 f8 |
	g4 a8 |
	b4 b8 \breathe |
	es'4 es'8 |
	d'( c') b |
	c'( b) a |
	b4 b8 |
	es'4 es'8 |
	d'( c') b |
	c'( b) a |
	b4. \breathe |
		
	\repeat volta 2
	{
		f8\p g a |
		b8.( c'16 b8) |
		f8 g a |
		b8.( c'16 b8) |
		f8 g a |
		b8.( c'16) b8\breathe |
		es'4\f es'8 |
		d'8( c') b |
		c'( b) a |
		b4 b8 |
		es'4 es'8|
		d'8( c') b |
		\rall c' b a |
		b4.^\fermata-\tweak extra-offset #'(8 . 0) ^\dc
	}
}

alto = \transpose c c' {
	\global
	
	R4.*3 |
	r8 r es\p |
	d4.~ |
	d4 es8 |
	d4.~ |
	d4 r8 |
	
	d4\mf d8 |
	d c4 |
	es4 es8 |
	f4. |
	d4 d8 |
	d8 c4 |
	es4 es8 |
	f4 f8 \breathe |
	es4 g8 |
	f4 f8 |
	g4 f8 |
	f4 f8 |
	es4 g8 |
	f4 f8 |
	g4 f8 |
	f4.\breathe |
		
	\repeat volta 2
	{
		d8\p es c |
		d f16 es d c |
		d8 es c |
		d f16 es d c |
		d8 es c |
		d16 d f es d8 \breathe |
		es16\f g a b c' g |
		f4 f8 |
		g16 a g f es f |
		d4 d8 |
		es16 g a b c' g |
		fis g a fis g8 |
		g16( a) a( g) f( es) |
		d4.^\fermata
	}
}

tenor = {
	\global

	R4.*3 |
	r8 r a\p |
	c'4.~ |
	c'4 a8 |
	c'4.~ |
	c'4 r8 |
	
	b8 a4 |
	g a8 |
	b8( g) c' |
	d'4. |
	b8 a4 |
	g4 a8 |
	b8( g) c' |
	d'4 d'8 \breathe |
	g( a) b |
	b4 b8 |
	b c'4 |
	d'4 d'8 |
	g( a) b |
	b4 b8 |
	b( c'16 d') es'8 |
	d'4. \breathe |

	\repeat volta 2
	{
		b8\p b16 b b b |
		b8 b b |
		b b16 b b b |
		b8 b b |
		b b16 b b b |
		b8 b b \breathe |
		g(\f c') b |
		b16 a b c' d' es' |
		d'4( c'8) |
		b4. |
		g8( c') b8 |
		a d'4 |
		c'4. |
		b4.^\fermata |
	}
}

bass = {
	\global

	b,4\mf f8 |
	b,4 f8 |
	b, b, f |
	b, b,16 b, b, b, |
	b,4 f8 |
	b,4 f8 |
	b, b, f |
	b, b,16 b, b, b, |

	b,4 b,8 |
	es4 d8 |
	c4 c8 |
	b,4. |
	b,4 b,8 |
	es4 d8 |
	c4 c8 |
	b,4 b,8 \breathe |
	c4 c8 |
	d4 d8 |
	es4 f8 |
	g4 g8 |
	c4 c8 |
	d4 d8 |
	es4 f8 |
	b,4. \breathe |

	\repeat volta 2
	{
		b,\p |
		b, |
		b, |
		b, |
		b, |
		b, \breathe |
		c\f |
		d |
		es4 f8 |
		g16 a g f es d |
		c4 c8 |
		d16 e fis d g f |
		es8 d4 |
		b,4.^\fermata |
	}
}

vsoprano = \lyricmode {
	tm tm, __ tm tm, __
	
	<<
		{ Jo sóm es pa -- stor més gros, __ qui venc per en -- tre ses mur -- tes amb ses fal -- des cur -- tes cur -- tes \markup{\undertie{"i els"}} mos -- tat -- xos plens d'ar -- rós. }
		\new Lyrics \with { alignBelowContext = #"ls" } {
			\set associatedVoice = "soprano"
			Jo qui sóm el quart pa -- stor, qui no tenc més \markup\undertie "que u" -- na co -- ca i me la llev' de sa bo -- ca per do -- nar -- \markup\undertie "la al" sant mi -- nyó.
		}
	>>

	To -- ca tim -- bal, __ to -- ca Pas -- qual, __ to -- ca Re -- gi --  na, tot són fes -- tes d'a -- le -- gri -- a, ses de Pa -- sco i de Na -- dal.
}

valto = \lyricmode {
	tm tm, __ tm tm, __

	<<
		{ Jo sóm es pa -- stor més gros, __ qui venc per en -- tre ses mur -- tes amb ses fal -- des cur -- tes cur -- tes \markup{\undertie{"i els"}} mos -- tat -- xos plens d'ar -- rós. }
		\new Lyrics \with { alignBelowContext = #"la" } {
			\set associatedVoice = "alto"
			Jo qui sóm el quart pa -- stor, qui no tenc més \markup\undertie "que u" -- na co -- ca i me la llev' de sa bo -- ca per do -- nar -- \markup\undertie "la al" sant mi -- nyó.
		}
	>>

	To -- ca tim -- bal, pa -- ra pa -- ra, to -- ca Pas -- qual, pa -- ra pa -- ra, to -- ca Re -- gi -- na, pa -- ra pam, tot són fes -- tes d'a -- le -- gri -- a, tot són fes -- tes d'a -- le -- gri -- a, ses de Pas -- \markup\undertie "co i" de Na -- dal i de Na -- dal i __ de __ Na -- dal.
}

vtenor = \lyricmode {
	tm tm, __ tm tm, __

	<<
		{ Jo sóm es pa -- stor més gros, __ qui venc per en -- tre ses mur -- tes amb ses fal -- des cur -- tes cur -- tes \markup{\undertie{"i els"}} mos -- tat -- xos plens d'ar -- rós. }
		\new Lyrics \with { alignBelowContext = #"lt" } {
			\set associatedVoice = "tenor"
			Jo qui sóm el quart pa -- stor, qui no tenc més \markup\undertie "que u" -- na co -- ca i me la llev' de sa bo -- ca per do -- nar -- \markup\undertie "la al" sant mi -- nyó.
		}
	>>

	Pam, pa -- ra pa -- ra, pam pam pam, pam, pa -- ra pa -- ra, pam pam pam, pam pa -- ra pa -- ra pam pam pam, tot __ són, tot són fes -- tes d'a -- le -- gri __ a, ses __ de Pas -- \markup\undertie "co i" Na -- dal.
}

vbass = \lyricmode {
	Pam pam pam pam pam pam pam pam, pa -- ra pa -- ra,
	Pam pam pam pam pam pam pam pam, pa -- ra pa -- ra,

	<<
		{ Jo sóm es pa -- stor més gros, __ qui venc per en -- tre ses mur -- tes amb ses fal -- des cur -- tes cur -- tes \markup{\undertie{"i els"}} mos -- tat -- xos plens d'ar -- rós. }
		\new Lyrics \with { alignBelowContext = #"lb" } {
			\set associatedVoice = "bass"
			Jo qui sóm el quart pa -- stor, qui no tenc més \markup\undertie "que u" -- na co -- ca i me la llev' de sa bo -- ca per do -- nar -- \markup\undertie "la al" sant mi -- nyó.
		}
	>>

	Pam, pam, pam, pam, pam, pam, tot són fes -- tes, tot són fes -- tes d'a -- le -- gri -- a, ses de Pas -- \markup\undertie "co i" de Na -- dal, Na -- dal.
}

rehearsalMidi = #
(define-music-function
 (parser location name midiInstrument lyrics) (string? string? ly:music?)
 #{
	 \unfoldRepeats <<
		 \new Staff = "soprano" \new Voice = "soprano" { s1*0\f \soprano }
		 \new Staff = "alto" \new Voice = "alto" { s1*0\f \alto }
		 \new Staff = "tenor" \new Voice = "tenor" { s1*0\f \tenor }
		 \new Staff = "bass" \new Voice = "bass" { s1*0\f \bass }
		 \context Staff = $name {
			 \set Score.midiMinimumVolume = #0.5
			 \set Score.midiMaximumVolume = #0.5
			 \set Score.tempoWholesPerMinute = #(ly:make-moment 90 4)
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
	\new ChoirStaff <<
		\new Staff \with {
			instrumentName = "Soprán"
			shortInstrumentName = "S"
		} <<
			\new Voice = "soprano" \with { \consists "Ambitus_engraver" } { \override Ambitus.X-offset = #2 \oneVoice \soprano }
		>>

		\new Lyrics = "ls" \with { \override VerticalAxisGroup #'staff-affinity = #CENTER } \lyricsto "soprano" \vsoprano

		\new Staff \with {
			instrumentName = "Alt"
			shortInstrumentName = "A"
		} <<
			\new Voice = "alto" \with { \consists "Ambitus_engraver" } { \override Ambitus.X-offset = #2 \oneVoice \alto }
		>>

		\new Lyrics = "la" \with { \override VerticalAxisGroup #'staff-affinity = #CENTER } \lyricsto "alto" \valto

		\new Staff \with {
			instrumentName = "Tenor"
			shortInstrumentName = "T"
		} <<
			\clef "treble_8"
			\new Voice = "tenor" \with { \consists "Ambitus_engraver" } { \override Ambitus.X-offset = #2 \voiceOne \tenor }
		>>

		\new Lyrics = "lt" \with { \override VerticalAxisGroup #'staff-affinity = #CENTER } \lyricsto "tenor" \vtenor

		\new Staff \with {
			instrumentName = "Bas"
			shortInstrumentName = "B"
		} <<
			\clef bass
			\new Voice = "bass" \with { \consists "Ambitus_engraver" } { \override Ambitus.X-offset = #2 \voiceOne \bass }
		>>

		\new Lyrics = "lb" \with { \override VerticalAxisGroup #'staff-affinity = #CENTER } \lyricsto "bass" \vbass

		\new Staff \new Voice \lining
	>>
	\layout { \context { \RemoveEmptyStaffContext \override VerticalAxisGroup #'remove-first = ##t }}
}

\score {
	\new ChoirStaff <<
		\new Staff \with {
			midiInstrument = "violin"
			instrumentName = "Soprán"
			shortInstrumentName = "S"
			midiMinimumVolume = 1
			midiMaximumVolume = 1
		} <<
			\new Voice = "soprano" { \repeat unfold 2 { \unfoldRepeats \soprano } }
		>>

		\new Staff \with {
			midiInstrument = "viola"
			instrumentName = "Alt"
			shortInstrumentName = "A"
			midiMinimumVolume = 1
			midiMaximumVolume = 1
		} <<
			\new Voice = "alto" { \repeat unfold 2 { \unfoldRepeats \alto } }
		>>

		\new Staff \with {
			midiInstrument = "cello"
			instrumentName = "Tenor"
			shortInstrumentName = "T"
			midiMinimumVolume = 1
			midiMaximumVolume = 1
		} <<
			\clef "treble_8"
			\new Voice = "tenor" { \repeat unfold 2 { \unfoldRepeats \tenor } }
		>>

		\new Staff \with {
			midiInstrument = "contrabass"
			instrumentName = "Bas"
			shortInstrumentName = "B"
			midiMinimumVolume = 1
			midiMaximumVolume = 1
		} <<
			\clef bass
			\new Voice = "bass" { \repeat unfold 2 { \unfoldRepeats \bass } }
		>>
	>>
	\midi { }
}
% Rehearsal MIDI files:
\book {
	\bookOutputSuffix "soprano"
	\score {
		\rehearsalMidi "soprano" "soprano sax" \vsoprano
		\midi { }
	}
}

\book {
	\bookOutputSuffix "alto"
	\score {
		\rehearsalMidi "alto" "soprano sax" \valto
		\midi { }
	}
}

\book {
	\bookOutputSuffix "tenor"
	\score {
		\rehearsalMidi "tenor" "tenor sax" \vtenor
		\midi { }
	}
}

\book {
	\bookOutputSuffix "bass"
	\score {
		\rehearsalMidi "bass" "tenor sax" \vbass
		\midi { }
	}
}

\paper
{
	page-count = #2
}
