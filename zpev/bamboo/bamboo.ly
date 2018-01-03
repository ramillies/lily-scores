\include "custom.ly"

\header {
	title = "Bamboo"
	subtitle = ""
	instrument = ""
	composer = "Čert ví, kde se to vzalo"
	arranger = "upr. Darek"
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

kamca = \transpose c c'{
	\global

	\tempo\markup\main-tempo "Allegretto ma non tanto."
	\tempo 4 = 110

	\partial 8 r8 |
	R1 |
	fis8 fis fis fis a a4 a8 |
	gis gis gis gis e e4 e8 |
	fis fis fis fis d4 e |
	r e( gis2) |
	r4 fis( a2) |
	h4. h~ h4~ |
	h1 |

	e' |
	d' |
	h |
	a |
	gis |
	a |
	h4. h~ h4~ |
	h1 |

	e'8 e'2..\glissando |
	d'2 d'8 d'4. |
	h1~ |
	h |
	h8 h2..\glissando |
	a2 a8 a4. |
	gis1~ |
	gis |

	h4. e' h4 |
	d'4. fis' cis'4 |
	h4. gis e4 |
	fis4. d fis4 |
	e4. gis h4 |
	a4. d' d'8 dis' |
	e'4. e'~ e'4~ |
	e'2. r8 h8 |

	gis4( h) e'( h) |
	cis'8( d' fis'4) d'( a) |
	gis8( a h4) gis4( e) |
	d( fis) a( cis') |
	e'4. e'8( gis' e' gis'4) |
	d'4. fis'8( a' fis' d'4) |

	cis'4. h~ h4~ |
	h1 |

	gis8 gis2..\glissando |
	f2 f8 f4. |
	gis8( a h a gis a h a |
	gis1) |
	h8 h2..\glissando |
	a2 a8 a4. |
	gis1~
	\tempo\markup\main-tempo "Più Lento."
	gis1~ |
	gis |
	fis |
	e |
	d |
	r4 e( gis2) |
	r4 fis( a2) |
	\tempo\markup\main-tempo "Molto rubato."
	R1^\fermata |
	c8(^\fermata d^\fermata dis)^\fermata e4.~ e4~ |
	e1^\fermata \bar "|."
}

zaba = \transpose c c' {
	\global

	\partial 8 e8 |
	e e e e gis gis4 gis8 |
	fis fis fis fis d d4 d8 |
	e e e e h, h,4 h,8 |
	\clef "bass"
	a, a, a, a, a,4 a, |
	r gis,( h,2) |
	\clef "treble"
	r4 d( fis2) |
	gis4. gis( fis4 |
	e4. cis) h,4 |

	e8 e e e gis gis4 gis8 |
	fis fis fis fis a a4 a8 |
	gis gis gis gis e e4 e8 |
	fis fis fis fis d4 e |
	r e( gis2) |
	r4 fis( a2) |
	gis4. gis~ gis4~ |
	gis1 |

	gis8 gis2..\glissando |
	fis2 fis8 fis4. |
	gis1~ |
	gis |
	gis8 gis2..\glissando |
	fis2 fis8 fis4. |
	e1~ |
	e2. r8 gis, |
	h,4. h,~ h,4 |
	a, cis8 d4( fis8) e4 |
	gis4. e~ e4 |
	d4 cis8 h,4( ais,8) h,4 |

	h,4. e8( gis e gis4) |
	d4. fis8( a fis a4) |
	gis4. gis~ gis4~ |
	gis1 |

	gis4. e \clef "bass" h,4 |
	a,4. fis, d,4 |
	e,4. h, gis,4 |
	a,4. fis, a,4 |
	h,4. e h,4 |
	a,4. fis, a,4 |
	h,4. \clef "treble" e gis4 |
	e1 |

	e8 e2..\glissando |
	d2 d8 d4. |
	e1~ |
	e1 |
	gis8 gis2..\glissando |
	fis2 fis8 fis4. |
	e1(
	h,1)~ |
	h, |
	a, |
	h, |
	a, |
	r4 e( gis2) |
	r4 fis( a2) |
	R1^\fermata |
	c'4.^\fermata h~ h4~ |
	h1^\fermata \bar "|."
}

kolik = {
	\global

	\partial 8 r8 |
	R1*2 |
	e8 e e e gis gis4 gis8 |
	fis fis fis fis fis4 fis |
	r e( gis2) |
	r4 fis( a2) |
	gis4. gis~ gis4~ |
	gis1 |

	e |
	d |
	h, |
	a, |
	h, |
	d |
	e4. e~ e4~ |
	e1 |

	e2 e8 e4.\glissando |
	d2 d8 d4. |
	h,1~ |
	h,~ |
	h,2 h,8 h,4.\glissando |
	a,2 a,8 a,4. |
	h,1~ |
	h, |

	gis1 |
	fis4. d~ d4 |
	h,1 |
	a,4. fis,~ fis,4 |
	gis,4. h,~ h,4 |
	a,4. d d8( dis) |
	e4. e~ e4~ |
	e2. r8 \footnote "*" #'(-1 . 1) "*: Odtud až k dvojité taktové čáře: není-li přítomen Kolík, zpívá Darek Kolíka a Jiřík Darka." e |

	e e e e gis gis4 gis8 |
	fis fis fis fis a a4 a8 |
	gis gis gis gis e e4 e8 |
	fis fis fis fis d4 e |
	r e( gis2) |
	r4 fis( a2) |
	h4. h~ h4~ |
	h1 \bar "||"

	h2 h8 h4.\glissando |
	a2 a8 a4. |
	gis1( |
	e)~ |
	e2 h8 h4.\glissando
	a2 a8 a4. |
	gis1( |
	e1~) |
	e |
	d |
	e |
	d |
	r4 e( gis2) |
	r4 fis( a2) |
	R1^\fermata |
	e4.^\fermata e~ e4~ |
	e1^\fermata \bar "|."


}

jirik = {
	\global

	\partial 8 r8 |
	R1*2 |
	h,8 h, h, h, h, h,4 h,8 |
	a, a, a, a, a,4 a, |
	r h,( e2) |
	r4 fis( d2) |
	e4. e~ e4~ |
	e1 |

	h, |
	d |
	e |
	fis |
	e |
	d |
	h,4. h,~ h,4~ |
	h,1 |

	h,2 h,8 h,4.\glissando |
	a,2 a,8 a,4. |
	gis,1~ |
	gis,~ |
	gis,2 gis,8 gis,4.\glissando |
	fis,2 fis,8 fis,4. |
	gis,1~ |
	gis,2. r8 h, |
	e8 e e e gis gis4 gis8 |
	fis8 fis fis fis a a4 a8 |
	gis8 gis gis gis e8 e4 e8 |
	fis fis fis fis d4 e |

	r4 e( gis2) |
	r4 fis( a2) |
	h4. h~ h4~ |
	h1 |

	h,1 |
	cis |
	e4. h,~ h,4 |
	a,1 |
	h, |
	a, |
	gis,4. gis,~ gis,4~ |
	gis,1 \bar "||"

	gis,2 gis,8 gis,4.\glissando |
	h,2 h,8 h,4. |
	h,1( |
	gis,)~ |
	gis,2 gis,8 gis,4.\glissando |
	a,2 a,8 a,4. |
	gis,1~ |
	gis,~ |
	gis, |

	a, |
	gis, |
	a, |
	r4 e( gis2) |
	r4 fis( a2) |
	R1^\fermata |
	a,4.^\fermata gis,~ gis,4~ |
	gis,1^\fermata \bar "|."
}

darek = \transpose c c, {
	\global

	\partial 8 r8 |
	R1*3 |
	d1 |
	e4. e8( gis e gis4) |
	d4. fis8( a fis a4) |
	gis4. e~ e4~ |
	e1 |

	h4. e gis4 |
	a4. d fis4 |
	gis4. h e4 |
	d4. a fis4 |
	e4. gis e4 |
	d4. a d4 |
	e4. h gis4 |
	e4. h gis4 |

	e2 e8 e4.\glissando |
	d2 d8 d4. |
	e h e4 |
	e4. gis e4~ |
	e2 e8 e4.\glissando |
	d2 d8 d4. |
	e h e4 |
	e4. gis e4 |

	h1 |
	a4. fis~ fis4 |
	gis1 |
	fis4. d~ d4 |
	e1 |
	fis |
	e4. e~ e4~ |
	e1 |

	e1 |
	d |
	e |
	fis |
	e |
	d |
	e4. e~ e4~ |
	e1 \bar "||"

	e2 e8 e4.\glissando |
	f2 f8 f4. |
	e1~ |
	e~ |
	e2 e8 e4.\glissando |
	d2  d8 d4. |
	e1~ |
	e2. r8 e |

	e8 e e e gis gis4 gis8 |
	fis fis fis fis a a4 a8 |
	gis gis gis gis e e4 e8 |
	fis fis fis fis d4 e |
	r e( gis2) |
	r4 fis( a2) |

	h8( c' h a g a g f) |
	e4.^\fermata e~ e4~ |
	e1 \bar "|."

}

vkamca = \lyricmode {
	take a stick of bam -- boo, you take a stick of bam -- boo, you throw it in the wa -- ter, oh, __ oh, __ Han -- nah! __

	Hm __ _ _ _ _ _ Han -- nah! __ 

	Ri -- ver, __ _ she come down, __ ri -- ver, __ _ she come down. __
	Bom bom bom, bom bom bom, bom bom bom, bom bom bom, bom bom bom, bom bom bom bom, Han -- nah! __ 
	You tra -- vel ri -- ver, tra -- vel, ri -- ver, ó ó, __ ó ó, __ Han -- nah! __

	Ri -- ver, __ _ she come down, __ ri -- ver, __ _ she come down. __

	Hm, __ _ _ ó, __ ó, __ Han -- nah! __ 
}

vzaba = \lyricmode {
	You take a stick of bam -- boo, you take a stick of bam -- boo, you take a stick of bam -- boo, you throw it in the wa -- ter, oh, __ oh, __ Han -- nah! __ 
	You take a stick of bam -- boo, you take a stick of bam -- boo, you take a stick of bam -- boo, you throw it in the wa -- ter, oh, __ oh, __ Han -- nah! __ 

	Ri -- ver, __ _ she come down, __ ri -- ver, __ _ she come down. __

	You tra -- vel __ on the ri -- ver, tra -- vel __ on the ri -- ver, ó ó, __ ó ó, __ Han -- nah! __
	Bom bom bom, bom bom bom, bom bom bom, bom bom bom, bom bom bom, bom bom bom, bom bom bom, hm. __ 

	Ri -- ver, __ _ she come down, __ ri -- ver, __ _ she come down. __
	Hm, __ _ _ ó, __ ó, __ Han -- nah! __ 

}
vkolik = \lyricmode {
	take a stick of bam -- boo, you throw it in the wa -- ter, oh, __ oh, __ Han -- nah! __
	Hm __ _ _ _ _ _ Han -- nah! __ 
	Hm, ri -- ver, __ _ she come down, __ ri -- ver, __ _ she come down.

	Hm, __ _ _ _ _ _ _ _ _ _ _ Han -- nah! __
	You tra -- vel on the ri -- ver, you tra -- vel on the ri -- ver, you tra -- vel on the ri -- ver, you tra -- vel on the wa -- ter, oh, __ oh, __ Han -- nah! __ 
	Hm, ri -- ver, __ _ she come down, __ ri -- ver, __ _ she come down. __
	Hm, __ _ _ ó, __ ó, __ Han -- nah! __ 
}
vjirik = \lyricmode {
	take a stick of bam -- boo, you throw it in the wa -- ter, oh, __ oh, __ Han -- nah! __
	Hm __ _ _ _ _ _ Han -- nah! __ 
	Hm, ri -- ver, __ _ she come down, __ ri -- ver, __ _ she come down.
	You tra -- vel on the ri -- ver, you tra -- vel on the ri -- ver, you tra -- vel on the ri -- ver, you tra -- vel on the wa -- ter, oh, __ oh, __ Han -- nah! __ 
	Hm, __ _ _ _ _ _ _ Han -- nah! __
	Hm, ri -- ver, __ _ she come down, __ ri -- ver, __ _ she come down. __
	Hm, __ _ _ ó, __ ó, __ Han -- nah! __ 
}
vdarek = \lyricmode {
	Ó, __ ó ó, __ ó ó, __ Han -- nah! __ 
	Bom bom bom, bom bom bom, bom bom bom, bom bom bom, bom bom bom, bom bom bom, bom bom bom, bom bom bom.
	Hm, ri -- ver, __ _ she come bom bom bom, bom bom bom, __ ri -- ver, __ _ she come bom bom bom, bom bom bom.
	Hm, __ _ _ _ _ _ _ _ Han -- nah! __ Hm, __ _ _ _ _ _ Han -- nah! __
	Hm, ri -- ver, __ _ she come down, __ ri -- ver, __ _ she come down. __
	You take a stick of bam -- boo, you take a stick of bam -- boo, you take a stick of bam -- boo, you throw it in the wa -- ter, ó, __ ó, __ _ Han -- nah!
}

rehearsalMidi = #
(define-music-function
 (parser location name midiInstrument lyrics) (string? string? ly:music?)
 #{
	 \unfoldRepeats <<
		 \new Staff = "kamca" \new Voice = "kamca" { s1*0\f \kamca }
		 \new Staff = "zaba" \new Voice = "zaba" { s1*0\f \zaba }
		 \new Staff = "kolik" \new Voice = "kolik" { s1*0\f \kolik }
		 \new Staff = "jirik" \new Voice = "jirik" { s1*0\f \jirik }
		 \new Staff = "darek" \new Voice = "darek" { s1*0\f \darek }
		 \context Staff = $name {
			 \set Score.midiMinimumVolume = #0.5
			 \set Score.midiMaximumVolume = #0.5
%			 \set Score.tempoWholesPerMinute = #(ly:make-moment 90 4)
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
			instrumentName = "Kamča"
			shortInstrumentName = "K."
		} <<
			\new Voice = "kamca" \with { \consists "Ambitus_engraver" } {  \oneVoice \kamca }
		>>

		\new Lyrics = "lkamca" \with { \override VerticalAxisGroup #'staff-affinity = #CENTER } \lyricsto "kamca" \vkamca

		\new Staff \with {
			instrumentName = "Žaba"
			shortInstrumentName = "Ž."
		} <<
			\new Voice = "zaba" \with { \consists "Ambitus_engraver" } {  \oneVoice \zaba }
		>>

		\new Lyrics = "lzaba" \with { \override VerticalAxisGroup #'staff-affinity = #CENTER } \lyricsto "zaba" \vzaba

		\new Staff \with {
			instrumentName = "Kolík"
			shortInstrumentName = "K."
		} <<
			\clef "bass"
			\new Voice = "kolik" \with { \consists "Ambitus_engraver" } {  \oneVoice \kolik }
		>>

		\new Lyrics = "lkolik" \with { \override VerticalAxisGroup #'staff-affinity = #CENTER } \lyricsto "kolik" \vkolik

		\new Staff \with {
			instrumentName = "Jiřík"
			shortInstrumentName = "J."
		} <<
			\clef "bass"
			\new Voice = "jirik" \with { \consists "Ambitus_engraver" } {  \oneVoice \jirik }
		>>

		\new Lyrics = "ljirik" \with { \override VerticalAxisGroup #'staff-affinity = #CENTER } \lyricsto "jirik" \vjirik

		\new Staff \with {
			instrumentName = "Darek"
			shortInstrumentName = "D."
		} <<
			\clef "bass"
			\new Voice = "darek" \with { \consists "Ambitus_engraver" } {  \oneVoice \darek }
		>>

		\new Lyrics = "ldarek" \with { \override VerticalAxisGroup #'staff-affinity = #CENTER } \lyricsto "darek" \vdarek

		\new Staff \new Voice \lining
	>>
	\layout { \context { \RemoveEmptyStaffContext \override VerticalAxisGroup #'remove-first = ##t }}
}

\score {
	\new ChoirStaff <<
		\new Staff \with {
			instrumentName = "Kamča"
			shortInstrumentName = "K."
			midiInstrument = "violin"
			midiMinimumVolume = 1
			midiMaximumVolume = 1
		} <<
			\new Voice = "kamca" { \kamca }
		>>

		\new Lyrics = "lkamca" \lyricsto "kamca" \vkamca

		\new Staff \with {
			instrumentName = "Žaba"
			shortInstrumentName = "Ž."
			midiInstrument = "viola"
			midiMinimumVolume = 1
			midiMaximumVolume = 1
		} <<
			\new Voice = "zaba" { \zaba }
		>>

		\new Lyrics = "lzaba" \lyricsto "zaba" \vzaba

		\new Staff \with {
			instrumentName = "Kolík"
			shortInstrumentName = "K."
			midiInstrument = "cello"
			midiMinimumVolume = 1
			midiMaximumVolume = 1
		} <<
			\clef "bass"
			\new Voice = "kolik" { \kolik }
		>>

		\new Lyrics = "lkolik" \lyricsto "kolik" \vkolik

		\new Staff \with {
			instrumentName = "Jiřík"
			shortInstrumentName = "J."
			midiInstrument = "contrabass"
			midiMinimumVolume = 1
			midiMaximumVolume = 1
		} <<
			\clef "bass"
			\new Voice = "jirik" { \jirik }
		>>

		\new Lyrics = "ljirik" \lyricsto "jirik" \vjirik

		\new Staff \with {
			instrumentName = "Darek"
			shortInstrumentName = "D."
			midiInstrument = "contrabass"
			midiMinimumVolume = 1
			midiMaximumVolume = 1
		} <<
			\clef "bass"
			\new Voice = "darek" { \darek }
		>>

		\new Lyrics = "ldarek" \lyricsto "darek" \vdarek
	>>
	\midi { }
}
% Rehearsal MIDI files:
\book {
	\bookOutputSuffix "kamca"
	\score {
		\rehearsalMidi "kamca" "soprano sax" \vzaba
		\midi { }
	}
}

\book {
	\bookOutputSuffix "zaba"
	\score {
		\rehearsalMidi "zaba" "tenor sax" \vzaba
		\midi { }
	}
}

\book {
	\bookOutputSuffix "kolik"
	\score {
		\rehearsalMidi "kolik" "tenor sax" \vkolik
		\midi { }
	}
}

\book {
	\bookOutputSuffix "jirik"
	\score {
		\rehearsalMidi "jirik" "tenor sax" \vjirik
		\midi { }
	}
}

\book {
	\bookOutputSuffix "darek"
	\score {
		\rehearsalMidi "darek" "tenor sax" \vdarek
		\midi { }
	}
}

\paper
{
	left-margin = #7
}
