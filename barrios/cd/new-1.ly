\version "2.18.0"
\language "deutsch"

\header {
	title = "Aire de zamba"
%	subtitle = ""
	composer = "Agustín Barrios Mangoré (1885 - 1944)"
	poet = "6a muta in D"
	tagline = \markup{\italic "senza replica" — bez repetice}
}

barre = #(define-music-function (parser location barre music) (string? ly:music?) 
	(let ((elts (extract-named-music music '(NoteEvent EventChord RestEvent))))
			 (if (pair? elts)
					 (let ((first-element (first elts))
								 (last-element (last elts)))
						 (set! (ly:music-property first-element 'articulations)
									 (cons (make-music 'TextSpanEvent 'span-direction -1)
												 (ly:music-property first-element 'articulations)))
						 (set! (ly:music-property last-element 'articulations)
									 (cons (make-music 'TextSpanEvent 'span-direction 1)
												 (ly:music-property last-element 'articulations))))))
	 #{
			 \override TextSpanner.bound-details.left.text = \markup { \upright { #barre } }
 \override TextSpanner.bound-details.right.text = \markup { \draw-line #'(0 . -0.5) }
 \override TextSpanner.bound-details.right.padding = #-2
			 \override TextSpanner.style = #'line
			 #music
#} )
	 
tinystems = #(define-music-function (parser location how) (list?) #{ \override Stem.details.beamed-lengths = #how #} )
priraz = #(define-music-function (parser location music) (ly:music?) #{ \acciaccatura #music #} )
normstems = \revert Stem.details
extStrum = \override Arpeggio.positions = #'(-4 . 4)
normStrum = \revert Arpeggio.positions
empty = { \once \hide NoteHead \once \override NoteHead.no-ledgers = ##t }
vacuum = { \hide NoteHead \override NoteHead.no-ledgers = ##t }
visible = { \undo \hide NoteHead \revert NoteHead.no-ledgers }
tamb = \markup { T }
flag = \once \override NoteHead.style = #'harmonic
flagsOn = \override NoteHead.style = #'harmonic
flagsOff = \revert NoteHead.style
ffXII = \markup{\tiny XII}
ffVII = \markup{\tiny VII}
ffV = \markup{\tiny V}
ffIV = \markup{\tiny IX}

fO = \markup { \italic o }
fA = \markup { \italic a }
fM = \markup { \italic m }
fI = \markup { \italic i }
fP = \markup { \italic p }

sup = \arpeggioArrowUp
sdown = \arpeggioArrowDown
strum = \arpeggio


fleft = \set fingeringOrientations = #'(left)
fright = \set fingeringOrientations = #'(right)
fdown = \set fingeringOrientations = #'(down)

global = {
	\key d \minor
	\time 3/4
	\set fingeringOrientations = #'(left)
	\set stringNumberOrientations = #'(down)
	\mergeDifferentlyHeadedOn
	\mergeDifferentlyDottedOn
	\override Score.BarNumber.self-alignment-X = #LEFT
	\override Glissando.breakable = ##t
	\override Glissando.after-line-breaking = ##t
	\set Score.tempoHideNote = ##t
	\override TupletBracket.bracket-visibility = ##f
}

lining = {
	\global
}

melody = {	
	\global
	\voiceOne
	\tupletUp
	
\repeat volta 2 {
	\slurUp
	r8 <f-3 d'-4> r <f d'> r^\markup{III} \acciaccatura{b'-4} <a'-2 d'-1> | r <cis'-3 g> r q r^\markup{IV} \acciaccatura{b'-4} <a'-3 e'-2> | 
	r^\markup{V} \acciaccatura{c''-4} <b'-3 f'-2> r^\markup{II} \acciaccatura{a'-4} <g'-2 cis'-1> \barre "III"{ r \acciaccatura{b'-4} <a'-3 d'-1> 
	r \acciaccatura{a'-4} <g'-1 b-1> r \acciaccatura{e'-2} <d' b> } <a' e' cis' a>4^\markup{V} |
}
	\slurDown

	r8 <a d'>[ r q r q] | r <a-1>\glissando d' <f'-4> <e'-3>4 | <d'-3~>8 <a'-1 f'-2 d'> <cis'-3> d'~ <a' f' d'>4 | \barre "V" { <d'-1~>8 <b'-2 g'-4 d'> cis' d' } <b'-1 g'-1 cis'-1>4^\markup "VI" |
	\barre "V" { c'8~ <b'-2 g'-4 c'> <h-1>\glissando c'~ <b' g' c'>4 } | \barre "III" { <c'-2>8~ <a'-3 f'-4 c'> <h-2> c' <g'-1 e'-3 b-1>4 } |\mark\markup{\musicglyph #"scripts.segno"} a8~ <f' d' a> gis a~ q4 |
	<< {\fleft\stemDown <b-3>4 <a-3>8 q} \\ {\stemUp\fleft a'8\rest <g'-4 cis'-1>4 a'8\rest } >> <e'-0 cis' g-0>4 | r8 <d'-4 a-1>[ r q r q] \bar "||"

	r8 <a'-1>\glissando d'' <f''-4 a'-1> <e''-4 f'-3>4 | <d''-4 f'-3>8 <d'' f'> <cis'' e'> <d'' f'>~ q4 |
	r8 \priraz{e''-4} <d''-2 b'-3>\glissando <cis'' a'> <d'' b'>\glissando \barre "V" { <b' g'>4 | }

	\repeat volta 2 {
		\barre "V" { <a'-1 f'-2>8[ q r q r q] } | r <c''-1 a'> <cis''-4 g'-2> q <d''-4 f'-1>4 | 
		\barre "X" { r8 <e''-4 g'-3>[ <f''-4 a'-1> <f'' a'>] <e'' g'>4 } | r8 <d''-1 f'-1> <e''-4 g'-3>4 <cis''-4 g'-2> | <d''-4 f'-3>2 r4 | \barre "V" { r8 <a' f' c'>[ r q r q] } |
		r <g'-4 e'-0 c'> q4 <g' e' c'> | r8 <b'-2 e'-0> q4 <b' e'> | <d''-4 e'-2> <c''-4 f'-2>^\markup{V} r | r8 <f''-4 c''-3> <e''-2 c''> <f'' c''> q4 |
		\barre "VIII" { <d''-3 b'-4>8 q <c''-1 a'-3>4 <d'' b'> } | \barre "V" { r8 <b'-2 g'-4> <a'-1 f'-2>4 } \barre "VIII" { <g'-1 f'-3>~ | q <a'-4> <g'-1 e'-2 b-1> } |
		r8 \barre "V" { <a' f' c'>[ r q r q] } | r <g' e' c'> q4 q | r8 <b'-2 e'-0> <b' e'>4 q | <d''-4 g'-1 e'-2>^\markup{VIII} <cis''-4 g' e'>2^\markup{VII} |
		r8 <d''-4> \priraz{<a'-1>16 <b'-2>} a'8 <g'-4> f4 | r8 <g'-4 cis'-1>[ f'\rest <g' cis'> f'\rest q] | r e'' \priraz{cis'' e''} cis'' <a'-2> <g'-2>4 | <f'-2 d'-3>8 <f' d'> q q r q | 
		r8 <d''-4> \priraz{<a'-1>16 <b'-2>} a'8 <g'-4> f4 | r8 <g'-4 cis'-1>[ f'\rest <g' cis'> f'\rest q] | r e'' \priraz{cis'' e''} cis'' <a'-2> <g'-2>4 | r8 <f' d'>~ q4 r|
	}

}

codaMelody = { 
	\global
	\stemUp
	\voiceOne

	r8 <f' d'>4 r8 r4 | <g'-4 e'-0 cis'-2>4 <f' d' a> <a' e' cis' g>^\markup{V} | \extStrum <d'' a' f'>2.\strum^\markup{X}
}

basses = {
	\global
	 \voiceTwo
	 \stemDown
	 \slurUp

	\repeat volta 2 { d,4 \acciaccatura{b,8-1} a,4 f-1 | e,-2 \acciaccatura{g,8-1} a,4 cis | d e f | <g-3> <gis-3> a, | }
	<< { \stemDown \fleft <f-3>2 } \\ { \fleft <d,-0>4 <a,-0> } >> <e,-2> | d,2. | <d-0>2 d4 | g2 <f-3>4 | <e-3>2 e4 | <f,-1>2 <g,-2>4 | a,2. | a,2 a,4 |
	<< {\stemDown\fleft <f-3>2. } \\ {\fleft d,4_\markup{\tiny\italic "Da capo senza replica"} a, <f,-2>} >>  | d,2. | << {\stemDown d2.} \\ {\stemDown\fleft s4 <b-1> a} >> | g2-0 <c'~ e-3>4 |

	\repeat volta 2 {
		<c'-1 f-4> <g-3> c' | f' e' d' | <cis'-2> c' b | \flag a2_\ffXII a,4 | d d, <c-4> | f g a | b4 a8 b~ b4 | <d'-3>4 <c'-1>8 d' c'4 | <b-1>4 <a-3>\glissando c' | <a,-0>2 q4 |
		<b,-1> <f-1> <fis-2> | <g-1> <a-3> <b-1> | <h-2> <c'-3> <c-3> | f g a | b a8 b~ b4 | <d'-3>4 <c'-1>8 d' c'4 | <b-1> a <a,-0> | 
		\flag d2._\ffXII | << {\stemDown \flag e'2._\ffVII | \flag a_\ffXII} \\ {\stemDown\fleft s4 <b-3> <a-2> | s4 r8 <cis'-3> e'4} >> | d4 b a | 
		\flag d2._\ffXII | << {\stemDown \flag e'2._\ffVII | \flag a_\ffXII} \\ {\stemDown\fleft s4 <b-3> <a-2> | s4 r8 <cis'-3> e'4} >> |
		d4 a_\markup{\column{\line{\small\italic{D. C. al} \tiny\musicglyph #"scripts.segno"}\line{\small\italic{e poi la}\tiny\musicglyph #"scripts.coda"}}} c |}  \break
}

codaBasses = {
	\global
	\voiceTwo
	\stemDown

	<< {\stemDown a,2} \\ {\stemDown\fleft a4 <gis-1>8[ a]} >> <e-1>4 | <g-1> f a,_\markup{\small\italic "rit."} | <d a, d,>2. \bar "|."
}

\paper
{
		#(define fonts (make-pango-font-tree "Georgia" "Arial" "Courier New" 1 ) )
		system-system-spacing #'basic-distance = #20
		indent = #10
		left-margin = #5
		right-margin = #5
		top-margin = #3
		bottom-margin = #6

%	page-count = #1
}

\score {
	\new Staff \with {
		midiInstrument = "acoustic guitar (nylon)"
		instrumentName = "Kytara"
	} {
			<<
					\new Voice { \clef "treble_8" \melody }
					\new Voice { \clef "treble_8" \basses }
		\new Voice { \clef "treble_8" \lining }
			>>
	}
	\layout { }
	\midi {
		\context {
	\Score
	tempoWholesPerMinute = #(ly:make-moment 100 4)
	\override SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/1)
		}
	}
}

\score {
	\new Staff \with {
		midiInstrument = "acoustic guitar (nylon)"
		instrumentName = \markup{\fontsize #5 \musicglyph #"scripts.coda" } 
	} {
			<<
					\new Voice { \clef "treble_8" \codaMelody }
					\new Voice { \clef "treble_8" \codaBasses }
			>>
	}
	\layout
	{
		indent = 3\cm
		line-width = 15\cm
		ragged-last = ##f
	}
}
