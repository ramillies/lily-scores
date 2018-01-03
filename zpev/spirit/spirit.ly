\include "custom.ly"

\header {
  title = "Spirit of God"
  tagline = ""
}

global = {
  \key b \major
  \time 4/4
  \globalstyle
}

soprano = {
	\global
	\voiceOne
	% Music follows here.
	\transpose c c'
	{
	      \repeat volta 2
	      {
		      b,2 c4 d |
		      es2. d4 |
		      c2. f4 |
		      d1 |
		      d2 es4 f |
		      g2. f4 |
		      es2. f4 |
		      f1 |
		      d2 es4 f |
		      g1 |
		      g2 c'4 a |
		      f1 |
		      f2 b4 a |
		      g2 c'4 a |
		      b1~ |
		      b
	      }
	
	}
}

alto = {
	\global
	\voiceTwo
	\repeat volta 2
	{
		b2 c'4 c' |
		b2. b4 |
		b2( a4) a |
		c'2( b) |
		b2 b4 b |
		f'2( es'4) es' |
		es'2( c'4) c' |
		c'2( d'2) |
		b2 b4 b |
		f'2( es') |
		es'2 f'4 f' |
		c'2( d') |
		d'2 d'4 d' |
		f'2 es'4 es' |
		es'2( c')( |
		d'1) 
	}
}

tenor = {
	\global
	\voiceThree
	\repeat volta 2
	{
		b2 a4 a |
		g2. g4 |
		f2. f4 |
		f1 |
		f2 f4 f |
		b2. b4 |
		a2. a4 |
		a2( b) |
		f2 f4 f4 |
		b1 |
		b2 a4 c' |
		a2( b) |
		b2 b4 b |
		b2 b4 c' |
		g2( es() |
		f1) |
	}
}

bass = {
	\global
	\voiceFour
	\repeat volta 2
	{
		b2 a4 a |
		g2. g4 |
		f2. f4 |
		b,1 |
		b,2 c4 d |
		es2. es4 |
		es2. es4 |
		d1 |
		b,2 c4 d |
		es1 |
		f2 es4 es |
		d1 |
		d2 g4 f |
		es2 f4 f |
		b,1~ |
		b,
	}
}

\paper
{
		#(set-paper-size "a5" 'landscape)
}

\score {
	\new ChoirStaff <<
		\new Staff \with {
			midiInstrument = "violin"
		} <<
			\new Voice = "soprano" { \voiceOne \soprano }
			\new Voice = "alto" { \voiceTwo \alto }
		>>
		\new Lyrics = "text"
		\new Staff \with {
			midiInstrument = "cello"
		} <<
			\clef bass
			\new Voice = "tenor" { \voiceOne \tenor }
			\new Voice = "bass" { \voiceTwo \bass }
		>>

		\context Lyrics = "text" \with {
			\override VerticalAxisGroup #'staff-affinity = #CENTER
		} \lyricsto "alto" 
		{
			Spi -- rit of God, who dwells __ in me! __
			O -- pen my eyes __ that I __ may see. __
			Come fill my heart __ and make me whole. __
			Spi -- rit of God, I am yours! __ _
		}
	>>
	\layout { }
	\midi {
		\context {
			\Score
			tempoWholesPerMinute = #(ly:make-moment 70 4)
		}
	}
}
