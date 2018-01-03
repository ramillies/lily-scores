\include "custom.ly"

\header {
  title = "Modlitba"
  tagline = ""
}

global = {
  \key es \minor
  \time 4/4
  \globalstyle
}

soprano = {
	\global
	% Music follows here.
	\transpose c c'
	{
		\tempo\markup\main-tempo "Andantino."
		ces'4.\mf\> as8 as4\p ces' |
		des' es' des'4. ces'8 |
		b2 b8 r b4 |
		b2 b |
		c' es'4 es' |
		ges'2. es'4 |
		es'2 es' |
		des'4(\pp es') des'( ces') |
		b b b2 |
		b1 |
		b1^\fermata \bar "|."
	}
}

alto = {
	\global
	\transpose c c'
	{
		as4.\mf\> es8 es4\p as |
		b ces' b4. as8 |
		f2 f8 r f4 |
		g2 g |
		g as4 as |
		<<
			{
				b2. b4 |
				b2 b |
			}
			\\
			{
				ges2. ges4 |
				ges2 ges |
			}
		>>
		b4\pp( ces') b( as) |
		g g as2 |
		f1 |
		g^\fermata \bar "|."
	}
}

tenor = {
	\global
	es'4.\mf\> as8 as4\p es' |
	ges' ges' ges'4. es'8 |
	d'2 d'8 r d'4 |
	es'2 es' |
	<< { es' es'4 es' | es'2. es'4 | es'2 es' } \\ { c'2 ces'4 ces' | b2. b4 | b2 b  } >> |
	r2 es'4\pp es' |
	es' es' << { es'2 | d'1 | es'^\fermata } \\ { c'2 | b1 | b1_\fermata } >> \bar "|."
}

bass = {
	\global
	\voiceOne

	as4.\mf\> as8 as4\p as |
	ges ces' ges4. as8 |
	b2 b8 r b4 |
	es2 es |
	es es4 es |
	es2. es4 |
	es2 es |
	r es4\pp es |
	es es es2 |
	es1 |
	es^\fermata \bar "|."
}

superbass = {
	\global
	\voiceTwo

	\transpose c c,
	{
		as4. as8 as4 as |
		ges ces' ges4. as8 |
		b2 b8 r b4 |
		es2 es |
		es es4 es |
		es2. es4 |
		es2 es |
		r es4 es |
		es es es2 |
		es1 |
		es_\fermata \bar "|."
	}
}

orchestr = {
	\global

	s1*7 |
	\override Beam.positions = #'(-1 . 0)
	\repeat tremolo 16 { es,,32\pp_\markup{\caps "Cb. Timp."} es, } |
	\repeat tremolo 16 { es,,32 es, } |
	\repeat tremolo 16 { es,,32 es, } |
	<< { \once\hide MultiMeasureRest R1^\fermataMarkup } \\ { \override Beam.positions = #'(-3 . -2) \repeat tremolo 16 { es,,32 es, } } >> \bar "|."
}

\paper
{
	page-breaking = #ly:one-line-breaking
}

\score {
	\new ChoirStaff <<
		\new Staff \with {
			midiInstrument = "violin"
			instrumentName = "Soprán"
			shortInstrumentName = "S"
		} \new Voice = "soprano" { \clef "treble" \soprano }
		\new Lyrics = "textWomen"
		\new Staff \with {
			midiInstrument = "violin"
			instrumentName = "Alt"
			shortInstrumentName = "A"
		} \new Voice = "alto" { \clef "treble" \alto }
		\new Staff \with {
			midiInstrument = "viola"
			instrumentName = "Tenor"
			shortInstrumentName = "T"
		} \new Voice = "tenor" { \clef "treble_8" \tenor }
		\new Lyrics = "textMen"
		\new Staff \with {
			midiInstrument = "cello"
			instrumentName = "Bas"
			shortInstrumentName = "B"
		} <<
			\new Voice = "bass" { \clef "bass" \bass }
			\new Voice = "superbass" { \clef "bass" \superbass }
		>>
		\new Staff \with {
			instrumentName = "Orchestr"
		} \new Voice = "orch" { \clef "bass" \orchestr }

		\context Lyrics = "textWomen" \with {
			\override VerticalAxisGroup #'staff-affinity = #CENTER
		} \lyricsto "soprano" 
		{
			Гос -- по -- ди! Не дай вра -- гам "в о" -- би -- ду и о -- хра -- ни нас и до -- мы на -- ши
			ми -- ло -- сер -- ди -- ем тво -- им.
		}

		\context Lyrics = "textMen" \with {
			\override VerticalAxisGroup #'staff-affinity = #CENTER
		} \lyricsto "bass" 
		{
			Гос -- по -- ди! Не дай вра -- гам "в о" -- би -- ду и о -- хра -- ни нас и до -- мы на -- ши
			ми -- ло -- сер -- ди -- ем тво -- им.
		}
	>>
	\layout { }
	\midi {
		\context {
			\Score
			tempoWholesPerMinute = #(ly:make-moment 60 4)
		}
	}
}
