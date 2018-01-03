\version "2.18.0"
\language "deutsch"

\header {
	title = "Preludium c moll"
%	subtitle = ""
	composer = "Agustín Barrios Mangoré (1885 - 1944)"
	tagline = ""
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
rpt = #(define-music-function (parser location music) (ly:music?) #{ \repeat volta 2 #music #} )
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
	\key c \minor
	\time 3/8
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
	\slurDown

	\tempo "Moderato"
	\repeat volta 2 { <c-1>16 g <as'-4> <es'-3> <g'-2> g | } \repeat volta 2 { <h,-1> g <as'-4> <d'-2> <g'-3> g | } \repeat volta 2 { d g <g'-4> h <f'-1> g | }
	\repeat volta 2 { \barre "I" { <c-3> g <f'-1> <c'-1> <es'-4> g } | } \repeat volta 2 { \barre "V" { <b,-2> <g-1> <f'-3> <c'-1> <es'-4> <g-1> } | }
	\barre "IV" { \repeat volta 2 {  <a,-2> <fis-1> <es'-1> <c'-3> <d'-4> fis | } \repeat volta 2 { <as,-1> fis es' <c'-2> d' fis | } } \barre "III" { \repeat volta 2 { <g,-1> <g-3> <es'-2> <c'-4> <d'-1> g | } 
	\repeat volta 2 { g, <f-1> es' <c'-3> <d'-1> f | } } \repeat volta 2 { <g,-3> <es-1> <d'-4> g <c'-1>^\markup{I} es | } \barre "III" { \repeat volta 2 { <g,-1> <d-3> <c'-4> <f-1> <b-1> d | } }
	\barre "I" { \repeat volta 2 { <g,-2> <c-3> <b-4> <es-1> <as-1> c | } } \repeat volta 2 { <g,-3> <h,-2> <as-1> d g h, | } \repeat volta 2 { <f,-1> d <d'-4> g h d | }
	e, g <g'-4> <b-3> <des'-2> g | e, b <as'-4> des' g' b | \barre "I" { \repeat volta 2 { <f,-1> <as-1> <g'-4> <c'-1> <f'-1> as | } \repeat volta 2 { <es-1> as <as'-4> c' f' as | } }
	\repeat volta 2 { d <f'-3> <es''-4> <as'-2> <c''-1> f' | } \barre "VI" { \repeat volta 2 { <es-1> <es'-2> <des''-4> <g'-3> <b'-1> <es'-2> | } \repeat volta 2 { <e-2> <des'-1> <c''-4> <g'-3> <b'-1> des' | } }
	\repeat volta 2 { <f-1> <c'-2> <b'-4> <f'-3> <as'-2> <c'-3> | } \repeat volta 2 { d <c'-2> <c''-4> <f'-3> <as'-1> c' | } \repeat volta 2 { <g-3> <h-2> <h'-1> <f'-4> <g'-1> h | }
	\barre "VIII" { \repeat volta 2 { <g-3> <c'-4> <as'-1> <es'-1> <g'-1> c' | } \repeat volta 2 { <f-1> <c'-3> c'' es' <as'-2> c' | } } \barre "III" { \repeat volta 2 { <f-1> <b-1> <b'-4> <d'-1> <as'-2> b | } }
	\barre "VI" { \repeat volta 2 { <es-1> <b-2> <b'-1> <es'-3> <g'-4> b | } <f-3> <as-1> <as'-4> <des'-1> <f'-1> as | } \barre "I" { <f,-1> as as' <des'-2> f' as | }
	\barre "III" { \repeat volta 2 { <g,-1> <g-3> <g'-1> <c'-4> <es'-2> g | } g, g <f'-4> <h-2> <d'-1> g | g, <f-1> <es'-3> h d' f | }
	\repeat volta 2 { <c-3> <es-1> <d'-4> g \barre "I" { <c'-1> <es-1> } | }
	<c-3> <es-1> <d'-4> g \barre "I" { <c'-1> <es-1> } | r4.^\fermata \bar "|."



}

basses = {
	\global
	\voiceTwo
	\stemDown
	\slurUp
	
	\repeat volta 2 { c4~ c8 |} \repeat volta 2 {h,4~ h,8 |} \repeat volta 2 { d4~ d8 |} \repeat volta 2 {c4~ c8|} \repeat volta 2 { b,4~ b,8|} \repeat volta 2 {a,4~ a,8|} \repeat volta 2 {as,4~ as,8|}
	\repeat unfold 6 { \repeat volta 2 { g,4~ g,8 | } } \repeat volta 2 { f,4~ f,8|} \repeat unfold 2 { e,4~ e,8| } \repeat volta 2 { f,4~ f,8| } \repeat volta 2 { es4~ es8} \repeat volta 2 { d4~ d8 | }
	\repeat volta 2 { es4~ es8 |} \repeat volta 2 { e4~ e8 |} \repeat volta 2 { f4~ f8| } \repeat volta 2 { d4~ d8| } \repeat unfold 2 { \repeat volta 2 { g4~ g8 | } } \repeat unfold 2 { \repeat volta 2 { f4~ f8 | } }
	\repeat volta 2 { es4~ es8 |} f4~ f8 f,4~ f,8 \repeat volta 2 { g,4~ g,8| } \repeat unfold 2 { g,4~ g,8 | } \repeat volta 2 { c4~ c8 | } c4~ c8 | <c-3>4._\fermata
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
%			\new Voice { \clef "treble_8" \unfoldRepeats \melody }
%			\new Voice { \clef "treble_8" \unfoldRepeats \basses }
			\new Voice { \clef "treble_8" \lining }
		>>
	}
	\layout { }
	\midi {
		\context {
			\Score
			tempoWholesPerMinute = #(ly:make-moment 45 4)
			\override SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/1)
		}
	}
}
