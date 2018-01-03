\include "custom.ly"

\header {
	title = ""
	subtitle = ""
	composer = ""
	arranger = ""
	poet = ""
	meter = ""
	tagline = ""
}
global = {
	\set fingeringOrientations = #'(left)
	\set stringNumberOrientations = #'(down)
	\mergeDifferentlyHeadedOn
	\mergeDifferentlyDottedOn
	\override Score.BarNumber.self-alignment-X = #LEFT
	\override Glissando.breakable = ##t
	\override Glissando.after-line-breaking = ##t
	\override Glissando.minimum-length = #4
	\override Glissando.springs-and-rods = #ly:spanner::set-spacing-rods
	\set Score.tempoHideNote = ##t
	\override TupletBracket.bracket-visibility = ##t
	\override Staff.TimeSignature.break-visibility = ##(#f #t #t)
%	\set fontSize = #1
	\set Score.voltaSpannerDuration = #(ly:make-moment 2/1)
}

tkII = {
	\global
	\time 4/4
	\key cis \minor
}

liningII = {
	\tkII
}

melodyII = {	
	\tkII
	\voiceOne
	\tupletUp
	\slurDown

	\set subdivideBeams = ##t
	\set baseMoment = #(ly:make-moment 1/8)

	\partial 4 { a16 dis dis dis } |
	cis( dis) cis dis h, dis a, dis gis,_\markup\italic "cresc. poco a poco" dis \tupletSpan 8 \times 2/3 { a dis gis, a dis gis, a dis gis, |
	h dis gis, cis' dis gis, dis' a e cis a dis' cis a dis' cis a dis' h, a dis' a, a dis' |
	gis, a dis' } \repeat unfold 3 { e'32 cis' h, gis } fis' cis' h, gis gis' cis' h, gis a' e' cis' a \times 4/6 { cis gis dis' e' dis' gis |
	\repeat unfold 3 { cis gis dis' e' dis' gis } h, gis dis' e' dis' gis a, gis dis' e' dis' gis gis, gis dis' e' dis' gis } \tupletSpan 4 \times 8/10 { a' e' cis' gis a, e, a, gis cis' e' } |
	\tempo\markup\sans\bold\small "Molto animato"
	\times 8/10 { \repeat unfold 2 {  a' e' cis' gis a, e, a, gis cis' e' } h' e' cis' gis a, e, a, gis cis' e' cis'' gis' e' a a, e, a, a e' gis' |
	dis'' a' e' h a, e, a, h e' a' cis'' a' e' h a, e, a, h e' a' h' a' e' h a, e, a, h e' a' cis'' a' e' h a, e, a, h e' a' |
	dis'' a' e' h a, e, a, h e' a' e'' h' fis' cis' a, e, a, cis' fis' h' fis'' h' fis' cis' a, e, a, cis' fis' h' e'' h' fis' cis' a, e, a, cis' fis' h' |
	dis'' h' fis' cis' a, e, a, cis' fis' h' dis'' h' fis' cis' a, e, a, cis' fis' h' e'' h' fis' cis' a, e, a cis' fis' h' fis'' cis'' a' e' a, e, a, e' a' cis'' |}

	r8 \ottava #1 \osm \repeat tremolo 4 { a''32\fff^\markup\italic "Rasgueado" } \repeat tremolo 4 { gis'' } \repeat tremolo 8 { a'' } \repeat tremolo 4 { gis'' } \repeat tremolo 4 { a'' } gis''8 |
	r8 \repeat tremolo 4 { a''32 } \repeat tremolo 4 { gis'' } \repeat tremolo 8 { a'' } \repeat tremolo 4 { gis'' } \repeat tremolo 4 { a'' } gis''8 |
	r8 \tupletSpan 8 \override TupletBracket.bracket-visibility = ##f \times 4/6 { \repeat tremolo 6 { a''32 } \repeat tremolo 6 { gis'' } } \times 8/12 { \repeat tremolo 12 { a'' } } \times 4/6 { \repeat tremolo 6 { gis'' } \repeat tremolo 6 { a'' } } gis''8 \ottava #0 |

}

\paper
{
	page-count = #1
}
bassesII = {
	\tkII
	\voiceTwo

	\partial 4 s4 |
	s1*8 |
	\repeat unfold 2 { r8 \repeat tremolo 24 { <gis e' fis' cis''>32 } q8 | }
	r8 \times 24/36 { \repeat tremolo 24 { q32~ } \repeat tremolo 12 { q32 } } q8 |
	
	
}

\score {
	\new Staff \with {
		\consists "Span_arpeggio_engraver"
		instrumentName = "..."
		midiInstrument = "acoustic guitar (steel)"
	} {
		\set Staff.connectArpeggios = ##t
		<<
			\new Voice { \clef "treble_8" \melodyII }
			\new Voice { \clef "treble_8" \bassesII }
			\new Voice { \clef "treble_8" \liningII }
		>>
	}
	\layout {  }
}

\score
{
	\new Staff \with {
		midiInstrument = "acoustic guitar (steel)"
	} {
		\set Staff.connectArpeggios = ##t
		<<
			\new Voice { \clef "treble_8" \unfoldRepeats \melodyII }
			\new Voice { \clef "treble_8" \unfoldRepeats \bassesII }
		>>
	}
	\midi { }
}
