\include "custom.ly"

\header {
	title = "Agnus Dei"
	subtitle = "(ze skladby „Missa Kenya“)"
	instrument = ""
	composer = "Paul Basler"
	arranger = ""
	copyright = ""
	tagline = ""
}

global = {
	\globalstyle
	\key d \major
	\time 3/4
}

lining = {
	\global

}

housle = {
	\global

	\tempo\markup\main-tempo "Largo e dolce." 4 = 66

	R2.*11 |
	r2 a,4 |
	h,( d e |
	fis2) r4 |
	d2 e4~ |
	\times 2/3 { e fis2 } a4( |
	h a g) |

	\times 2/3 { fis8( g a~ } a2) |
	R2.*10 |
	r2 a,4 |

	h,( d e |
	fis2) r4 |
	d2 e4~ |
	\times 2/3 { e fis2 } a4( |
	h a g~ |
	g2) r4 |
	\transpose c c'
	{
		r c8( d e f |
		e2) r4 |
		r d8( c) e f |
		
		g4 f \times 2/3 { g( f8) } |
		f4( es4~ \times 2/3 { es) r8 } |
		g2( f4) |
		f( es2) |
	}
	R2. |
	r2 a,4 |
	h,( d e |
	fis2) r4 |
	d2 e4~ |
	\times 2/3 { e fis2 } a4( |
	h a g) |

	\times 2/3 { fis8( g a~ } a2) |
	R2.*10 |
	\transpose c c'
	{
		r2 a,4 |
		h,( d e |
		fis2) r4 |
		d2 e4~ |
		\times 2/3 { e fis2 } a4( |
		h a g |
		fis2) r4 |
		e2.( |
		d)^\fermata \bar "|."
	}
}

sopran = {
	\global

	fis2 fis4 |
	g8( a) a2 |
	d'8( cis') a4( fis) |
	g8( fis) d2 |
	fis2 fis4 |

	fis e2 |
	a2 a4 |
	a4 g2 |
	fis4( a) g |
	fis2.( |
	e) |

	d |
	R2.*5 |
	r2 fis4 |
	g8( a) a2 |
	d'8( cis') a4 fis |
	g8( fis) d2 |
	fis fis4 |
	fis e2 |

	a2 a4 |
	a g2 |
	fis8 fis a4 g |
	fis2.( |
	e) |
	d2. |

	R2.*7 |
	e2 e4 |
	e8( f) f2 |
	g4 f \times 2/3 { g4 f8 } |
	f4 es4~ \times 2/3 { es4 g8 }
	g2 f4 |
	f es2 |
	es8 es des4 des |
	des8( d) d2 |

	R2.*5 |
	fis2 fis4 |
	g8( a) a2 |
	d'8( cis') a4( fis) |
	g8( fis) d2 |

	fis2 fis4 |
	fis e2 |
	a2 a4 |
	a g2 |
	fis8 fis a4 g |
	fis2.( |
	e) |
	d |

	R2.*8 \bar "|."
}

alt = {
	\global
	d2 d4 |
	e8( fis) fis2 |
	fis4 e( d) |
	d d2 |
	d d4 |
	d4 e2 |
	d2 d4 |
	d2 d4 |
	d( fis) e |
	e d2~ |
	d4 h,( cis) |

	a,2. |
	R2.*5 |
	r2 d4 |
	e8( fis) fis2 |
	fis4 e d |
	d d2 |
	d d4 |
	d4 e2 |

	d d4 |
	d2 d4 |
	d8 d fis4 e |
	e( d2~ |
	d4 h, cis) |
	a,2. |

	R2.*5 |
	c2 c4 |
	c8( d) d2 |
	\repeat unfold 2 { \once\override MultiMeasureRest.staff-position = #-6 R2. | }
	
	g4 f \times 2/3 { g4 f8 }
	f4 es4~ \times 2/3 { es4 g8 } |
	g2 f4 |
	f es2 |
	es8 es des4 des |
	des8( d) d2 |

	R2.*5 |
	d2 d4 |
	e8( fis) fis2 |
	fis4( e) d |
	d d2 |

	d d4 |
	d e2 |
	d d4 |
	d2 d4 |
	d8 d fis4 e |
	e( d2~ |
	d4 h, cis) |
	a,2. |

	R2.*8 \bar "|."
}

tenor = {
	\global
	a2 a4 |
	h8( cis'8) cis'4( e') |
	d'( cis') d' |
	c' h2 |
	a a4 |
	a h2 |
	a4( d') a |
	c' h2 |
	a4( d') h |
	a2( fis4) |
	g2. |

	g4 fis2 |
	R2.*5 |
	
	r2 a4 |
	h8( cis') cis'4( e') |
	d'4 cis' d' |
	c' h2 |
	a a4 |
	a h2 |

	a4( d') a |
	c' h2 |
	a8 a d'4 h |
	a2( fis4 |
	g2.) |
	g4( fis2) |

	R2.*5 |
	c'2 c'4 |
	c'8( d') d'2 |
	\repeat unfold 2 { \once\override MultiMeasureRest.staff-position = #6 R2. | }

	g4 f \times 2/3 { g4 as8 } |
	b4 c'~ \times 2/3 { c' g8 } |
	g2 as4 |
	h4 h2 |
	a8 a a4 g |
	fis fis2 |

	R2.*5 |
	a2 a4 |
	h8( cis') cis'4( e') |
	d' cis'( d') |
	c' h2 |

	a2 a4 |
	a h2 |
	a4( d') a |
	c' h2 |

	a8 a d'4 h |
	a2( fis4 |
	g2.) |
	g4( fis2) |

	R2.*8 \bar "|."
}

bas = {
	\global
	d2 d4 |
	d2 cis4 |
	h,2 h4 |
	a2 g4 |
	a4 a,2 |

	g,2 g,4 |
	fis,4 fis,2 |
	g, g,4 |
	a,( fis,) g, |
	a,2.~ |
	a, |
	
	<d d,> |
	R2.*5 |

	r2 d4 |
	d2 cis4 |
	h, h, h |
	a2 g4 |
	a a,2 |
	g, g,4 |

	fis, fis,2 |
	g, g,4 |
	a,8 a, fis,4 g, |
	a,2.~ |
	a, |
	<d d,> |

	R2.*7 |
	e2 e4 |
	e8( f) f2 |

	g4 f \times 2/3 { g4 as8 } |
	b4 c'~ \times 2/3 { c' g8 } |
	g2 as4 |
	h h2 |
	a8 a a4 g |
	fis fis2 |

	R2.*5 |
	d2 d4 |
	d2 cis4 |
	h,2 h4 |
	a2 g4 |

	a a,2 |
	g,2 g,4 |
	fis, fis,2 |
	g,2 g,4 |
	a,8 a, fis,4 g, |
	a,2.~ |
	a, |
	<d d,> |

	R2.*8 \bar "|."
}

klavirP = {
	\global
	R2.*11 |

	\tupletSpan 4
	\times 2/3
	{
		a,8( d a) a,( d fis) a,( d fis) |
		a,( d g) a,( d e) g,( d e) |
		a,( d fis) d( a, fis) a,( d fis) |
		h,( d g) h,( d e) a,( d e) |
		a,( d fis) a,( d fis) a,( d fis) |
		g,( h, e) a,( h, e) g,( a, e) |

		a,( d fis) a,( d fis) a,( d fis) |
		h,( d g) cis( fis a) cis( e a) |
		d( fis h) d( cis a) h( d fis) |
		c( d a) h,( d g) h,( g, d) |
		a,( d fis) a,( d e) a,( d fis) |
		a,( d fis) h,( e g) h,( e g) |

		a,( d a) d( cis a) d( fis a) |
		d( g a) d( g h) e( d g) |
	}
		fis4 r2 |
		R2.*2 |
	\times 2/3
	{
		a,8( d a) a,( d fis) a,( d fis) |

		a,( d g) a,( d e) g,( d e) |
		a,( d fis) d( a, fis) a,( d fis) |
		h,( d h) h,( d e) a,( d e) |
		a,( d fis) a,( d fis) a,( d fis) |
		g,( h, e) a,( h, e) g,( a, e) |
		g,( c e) c( g, d) a,( d g) |
		c( f a) g( d h) d( g a) |
		e( h c') g( e a) e( g a) |
		c( g b) d( g b) e( f b) |

		es( g c') as( es c') f( b es') |
		f( b d') b( es c') g( d b) |
		c( es as) b,( es as) c( es as) |
		h,( cis gis) h,( dis fis) a( h, fis) |
		a,( dis fis) a,( cis dis) a,( cis e) |
		a,( d a) a,( d fis) a,( d fis) |

		a,( d g) a,( d e) g,( d e) |
		a,( d fis) d( a, fis) a,( d fis) |
		h,( d g) h,( d e) a,( d e) |
		a,( d fis) a,( d fis) a,( d fis) |
		g,( h, e) a,( h, e) g,( a, e) |
		a,( d fis) a,( d fis) a,( d fis) |
		h,( d g) cis( fis a) cis( e a) |
		d( fis h) d( cis a) h,( d fis) |
		c( d a) h,( d g) h,( g, d) |

		a,( d fis) a,( d e) a,( d fis) |
		a,( d fis) h,( e g) h,( e g) |
		a,( d a) d( cis a) d( fis a) |
		d( g a) d( g h) e( d g) |
	}
		fis4 r2 |
		R2.*2 |
	
	\times 2/3
	{
		a,8( d a) a,( d fis) a,( d fis) |
		a,( d g) a,( d e) g,( d e) |
		a,( d fis) d( a, fis) a,( d fis) |
		h,( d g) h,( d e) a,( d e) |
		a,( d fis) a,( d fis) a,( d fis) |
		g,( h, e) a,( h, e) g,( a, e) |
		a,( d fis) d( a, fis) a,( d fis) |
		h,( d g) h,( d g) d( e g) |
	}
	a2.^\fermata \bar "|."
}

klavirL = {
	\global
	R2.*11 |

	<d, d>2 a,4 |
	d2 a,4 |
	d,2 a,4 |
	d a, a,, |
	d,2 a,4 |
	d g, e, |

	d,2 a,4 |
	d d, cis, |
	h,, fis, h, |
	a2 g4 |
	a4 a,2 |
	g, g,4 |

	fis4 fis, d |
	g2 g,4 |
	a, r2 |
	R2.*2 |
	<d, d>2 a,4 |

	d2 a,4 |
	d,2 a,4 |
	d a, a,, |
	d,2 a,4 |
	d g, e, |
	d, g, c |
	a, f e |
	d a, e, |
	g, d, g,, |

	as,, as, es, |
	g, g d |
	f, c b, |
	h,2 h,,4 |
	a, a,, e, |
	<d d,>2 a,4 |

	d2 a,4 |
	d,2 a,4 |
	d a, a,, |
	d,2 a,4 |
	d g, e, |
	d,2 a,4 |
	d d, cis, |
	h,, fis, h, |
	g,2 e,4 |

	a, a,, d, |
	g,2 g4 |
	fis fis, d |
	g2 g,4 |
	a,4 r2 |
	R2.*2 |

	<d, d>2 a,4 |
	d2 a,4 |
	d,2 a,4 |
	d a, a,, |
	d,2 a,4 |
	d g, e, |
	d,2 a,4 |
	d g, e, |
	d,2._\fermata \bar "|."
}

tsopran = \lyricmode {
	A -- gnus De -- i, A -- gnus __ De -- i, A -- gnus De -- i, A -- gnus De -- i, A -- gnus De -- i, __
	qui tol -- lis pec -- ca -- ta mun -- di, mi -- se -- re -- re, mi -- se -- re -- re, mi -- se -- re -- re no -- bis. __
	A -- gnus De -- i, qui tol -- lis pec -- ca -- ta, __ pec -- ca -- ta mun -- di, mi -- se -- re -- re no -- bis.
	Do -- na no -- bis, do -- na __ no -- bis, do -- na no -- bis, do -- na no -- bis, do -- na no -- bis pa --  cem. __
}

talt = \lyricmode {
	A -- gnus De -- i, A -- gnus __ De -- i, A -- gnus De -- i, A -- gnus De -- i, A -- gnus, A -- gnus __ De -- i, __
	qui tol -- lis pec -- ca -- ta mun -- di, mi -- se -- re -- re, mi -- se -- re -- re, mi -- se -- re -- re no -- bis. __
	A -- gnus De -- i, qui tol -- lis pec -- ca -- ta, __ pec -- ca -- ta mun -- di, mi -- se -- re -- re no -- bis.
	Do -- na no -- bis, do -- na no -- bis, do -- na no -- bis, do -- na no -- bis, do -- na no -- bis pa -- cem. __
}

ttenor = \lyricmode {
	A -- gnus De -- i, A -- gnus De -- i, A -- gnus De -- i, A -- gnus De -- i, A -- gnus, A -- gnus De -- i, __
	qui tol -- lis pec -- ca -- ta mun -- di, mi -- se -- re -- re, mi -- se -- re -- re, mi -- se -- re -- re no -- bis. __
	A -- gnus De -- i, qui tol -- lis pec -- ca -- ta, __ pec -- ca -- ta mun -- di, mi -- se -- re -- re no -- bis.
	Do -- na no -- bis, do -- na __ no -- bis, do -- na no -- bis, do -- na no -- bis, do -- na no -- bis pa -- cem. __
}

tbas = \lyricmode {
	A -- gnus De -- i, A -- gnus De -- i, A -- gnus De -- i, A -- gnus De -- i, A -- gnus De -- i, __
	qui tol -- lis pec -- ca -- ta mun -- di, mi -- se -- re -- re, mi -- se -- re -- re, mi -- se -- re -- re no -- bis. __
	A -- gnus De -- i, qui tol -- lis pec -- ca -- ta, __ pec -- ca -- ta mun -- di, mi -- se -- re -- re no -- bis.
	Do -- na no -- bis, do -- na no -- bis, do -- na no -- bis, do -- na no -- bis, do -- na no -- bis pa -- cem. __
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
		 \new Staff = "housle" \new Voice = "housle" { s1*0\f \housle }
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
			instrumentName = "Housle"
			shortInstrumentName = "Vln."
		} \new Voice = "housle" { \oneVoice \transpose c c' { \housle } }


		\new PianoStaff \with {
			\remove "Keep_alive_together_engraver"
		} <<
			\new Lyrics = "slova-sopran" \with { \override VerticalAxisGroup #'staff-affinity = #DOWN } 
			\new Staff \with {
				instrumentName = \markup\center-column{"Soprán" "Alt"}
				shortInstrumentName = \markup\center-column{"S" "A"}
			} \new Voice <<
				\new Voice = "sopran" { \voiceOne \transpose c c' { \sopran } }
				\\
				\new Voice = "alt" { \voiceTwo \transpose c c' { \alt } }
			>>

			\new Lyrics = "slova-alt" \with { \override VerticalAxisGroup #'staff-affinity = #UP } 
			\new Lyrics = "slova-tenor" \with { \override VerticalAxisGroup #'staff-affinity = #DOWN } 
		
			\new Staff \with {
				instrumentName = \markup\center-column{"Tenor" "Bas"}
				shortInstrumentName = \markup\center-column{"T" "B"}
			} \new Voice <<
				\clef bass
				\new Voice = "tenor" { \voiceOne \tenor }
				\\
				\new Voice = "bas" { \voiceTwo \bas }
			>>
			\new Lyrics = "slova-bas" \with { \override VerticalAxisGroup #'staff-affinity = #UP } 
		
			\new Staff \new Voice \lining

			\context Lyrics = "slova-sopran" \lyricsto "sopran" \tsopran
			\context Lyrics = "slova-alt" \lyricsto "alt" \talt
			\context Lyrics = "slova-tenor" \lyricsto "tenor" \ttenor
			\context Lyrics = "slova-bas" \lyricsto "bas" \tbas
		>>

		\new PianoStaff \with {
			\remove "Keep_alive_together_engraver"
			instrumentName = "Klavír"
			shortInstrumentName = "Kl."
		} <<
			\new Staff \new Voice = "kl-prava" { \oneVoice \transpose c c' { \klavirP } }
			\new Staff \new Voice = "kl-leva" { \oneVoice \clef "bass" \klavirL }
		>>
	>>
	\layout { \context { \RemoveEmptyStaffContext \override VerticalAxisGroup #'remove-first = ##t }}
}

\score {
	\new StaffGroup <<
		\new Staff \with {
			midiInstrument = "violin"
			instrumentName = "Housle"
			shortInstrumentName = "Vln."
			midiMinimumVolume = 1
			midiMaximumVolume = 1
		} <<
			\new Voice = "housle" { \unfoldRepeats \transpose c c' { \housle } }
		>>

		\new ChoirStaff <<
			\new Staff \with {
				midiInstrument = "violin"
				instrumentName = "Soprán"
				shortInstrumentName = "S"
				midiMinimumVolume = 0.8
				midiMaximumVolume = 0.8
			} <<
				\new Voice = "sopran" { \unfoldRepeats \sopran }
			>>
		
			\new Staff \with {
				midiInstrument = "viola"
				instrumentName = "Alt"
				shortInstrumentName = "A"
				midiMinimumVolume = 0.8
				midiMaximumVolume = 0.8
			} <<
				\new Voice = "alt" { \unfoldRepeats \alt }
			>>
		
			\new Staff \with {
				midiInstrument = "cello"
				instrumentName = "Tenor"
				shortInstrumentName = "T"
				midiMinimumVolume = 0.8
				midiMaximumVolume = 0.8
			} <<
				\clef "treble_8"
				\new Voice = "tenor" { \unfoldRepeats \tenor }
			>>
		
			\new Staff \with {
				midiInstrument = "contrabass"
				instrumentName = "Bas"
				shortInstrumentName = "B"
				midiMinimumVolume = 0.8
				midiMaximumVolume = 0.8
			} <<
				\clef bass
				\new Voice = "bas" { \unfoldRepeats \bas }
			>>
		>>

		\new PianoStaff \with {
			midiInstrument = "acoustic grand"
			instrumentName = "Klavír"
			shortInstrumentName = "Kl."
			midiMinimumVolume = 0.6
			midiMaximumVolume = 0.6

		} <<
			\new Staff \new Voice = "klavir-prava" { \unfoldRepeats \klavirP }
			\new Staff \new Voice = "klavir-leva" { \clef bass \unfoldRepeats \klavirL }
		>>
	>>
	\midi { }
}
%% Rehearsal MIDI files:
%\book {
%	\bookOutputSuffix "sopran"
%	\score {
%		\rehearsalMidi "sopran" "soprano sax" \tsbor
%		\midi { }
%	}
%}
%
%\book {
%	\bookOutputSuffix "alt"
%	\score {
%		\rehearsalMidi "alt" "soprano sax" \tsbor
%		\midi { }
%	}
%}
%
%\book {
%	\bookOutputSuffix "tenor"
%	\score {
%		\rehearsalMidi "tenor" "tenor sax" \tsbor
%		\midi { }
%	}
%}
%
%\book {
%	\bookOutputSuffix "bas"
%	\score {
%		\rehearsalMidi "bas" "tenor sax" \tsbor
%		\midi { }
%	}
%}
%
%\book {
%	\bookOutputSuffix "solo"
%	\score {
%		\rehearsalMidi "solo" "tenor sax" \tsolo
%		\midi { }
%	}
%}

\paper
{
	left-margin = #12
%	page-breaking = #ly:one-page-breaking
}
