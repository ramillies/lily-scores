\version "2.18.0"
\language "deutsch"

\header {
	title = "Julia Florida"
	subtitle = "(Barkarola)"
	composer = "Agustín Barrios Mangoré (1885 - 1944)"
	poet = "6a muta in D"
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
normstems = \revert Stem.details
extStrum = \override Arpeggio.positions = #'(-4 . 4)
normStrum = \revert Arpeggio.positions
empty = { \once \hide NoteHead \once \override NoteHead.no-ledgers = ##t }
vacuum = { \hide NoteHead \override NoteHead.no-ledgers = ##t }
visible = { \undo \hide NoteHead \revert NoteHead.no-ledgers }
tamb = \markup { T }
coda = \mark\markup\musicglyph #"scripts.coda"
segno = \mark\markup\musicglyph #"scripts.segno"
flag = \once \override NoteHead.style = #'harmonic-mixed
flagOn = \override NoteHead.style = #'harmonic-mixed
flagOff = \revert NoteHead.style
% pro zhuštěnou versi se použije \fontsize #-3
ffXII = \markup{\tiny XII}
ffVII = \markup{\tiny VII}
ffV = \markup{\tiny V}
ffIV = \markup{\tiny IV}
ffIII = \markup{\tiny III}
ffIX = \markup{\tiny IX}

osm = \set Staff.ottavation = #"8"

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
fup = \set fingeringOrientations = #'(up)

% #(set-global-staff-size 17)
#(set-global-staff-size 23)

global = {
	\key d \major
	\time 6/8
	\set fingeringOrientations = #'(left)
	\set stringNumberOrientations = #'(down)
	\mergeDifferentlyHeadedOn
	\mergeDifferentlyDottedOn
	\override Score.BarNumber.self-alignment-X = #LEFT
	\override Glissando.breakable = ##t
	\override Glissando.after-line-breaking = ##t
	\set Score.tempoHideNote = ##t
	\override TupletBracket.bracket-visibility = ##f
	%\set fontSize = #-2
	\set fontSize = #1
}

melody = {	
	\global
	\voiceOne
	\tupletUp
	\slurDown

	r4. <a'-2> | r <a'-2>8 <h'-4> a' | \grace fis\glissando <a-1>4. a8 h a | <a-1>4. a8 <h-0> <cis'-1> | <d'-2>4. d'8 <e'-4> d' | <d'-1>4. d'8 <e'-4> d' | <g'-4>4. <fis'-2>8 <e'-0> <g'-4> |
	\barre "II" { <fis'-1>4. <h-4>8 <cis'-1> <d'-2> } | <e'-0>4. e'8 <fis'-4> <d'-1> | <e'-1> <h-4>\glissando <d'-4> <cis'-3> h \flag a^\ffXII | \grace fis8\glissando <a-1>4. a8 <h-3> a | <a-1>4. a8 <h-0> <cis'-1> |
	<d'-2>4. <d'-1>8 <e'-4> d' | <h'-4>4. <e'-0>8 <fis'-1> <g'-2>\glissando | <a'-2>4. \barre "VII" { <h'-1>8 <cis''-3> <d''-4> } | a'4. \stemUp <h'-1>8 <cis''-3> <d''-4>\glissando |  <a'-4>4. a' |
	\coda <a'-4 d'-2 fis-3>4. <a'-2>8 <h'-4> a' | <a'-4 d'-2 fis-3>4. <cis'-1>4.^\markup{II} | <d'-2> <cis'-1 ais-2>4. |

	\repeat volta 2
	{
		<fis-3>4 <h-0>8 <g-0>4 h8 | fis4 h8 g4 h8 | fis4 h8 <e-1> <a-2> <g-0> | <fis-2> <g-4>( <e-1>) <fis-4> <b-2> <cis'-1> | <fis'-1>4 fis'8 <d'-2> <fis'-1> d' | e'4 e'8 <cis'-2> e' cis' |
		<d'-2>4 d'8 <h-0> \flagOn h'_\ffXII g'_\ffXII \flagOff | <e'-2 h-1>4 r8 <h-0> <e'-1> <g'-4> | <g'-4>4. <fis'-2>8 <e'-1> <g'-4> | <fis'-4>4. <h-0>8 <cis'-1> <d'-2> | 
	}
	\alternative
	{	{ <e'-0>4. <cis'-1> | <cis'-1>8 <ais-2> <fis-4> fis4. | }
		{ <e'-0>4. <fis'-3> | <d'-2 fis-3>4. r | }
	}

	a'8\rest <e'-0> <a'-2>~ a'4 <e''-4>8 | \barre "VII" { <d''-4> <cis''-3>( <h'-1>) } \barre "V" { <a'-1> <g'-4> <fis'-3> } | <g'-2>16( <fis'-1>) <e'-4>8 <h-0> \priraz{cis'16-1 d'-2} cis'8 <h-3> a |
	<h-4>4. <h-2>8 <cis'-4> a | <h-0>4. <h-2>8 <cis'-4>\glissando a | <fis-1>4. <f-1> | <fis-1> <eis-1>8 <fis-2> <gis-4> | \barre "II" { <a-1>4 <fis'-1>8 } <eis'-2>4. | <fis'-1>4. <eis'-2>8  <fis'-2> <gis'-4> |
	<fis'-2>4. <f'-1> | r <e'-0>8 <fis'-3> <g'-4>\glissando | <d'-2>4. r | r <e'-2>8 <f'-4>\glissando <d'-4> | <c'-1>4. <c'-1>8 <e'-0> <a'-2>~ | a' a' <h'-4> \priraz{a'16-2 h'-4} <a'-2>8 <f'-3> <h-1> | 
	<c'-1>4. <c'-1>8 <e'-0> <a'-2>~ | a' a' <h'-4> \priraz{a'16-2 h'-4} <a'-2>8 <f'-3> <h-1> | a\rest <e-2> <a-3> <c'-1> <e'-0> \flag a'^\ffVII | \barre "V" { <g,-1> <e-3> <a-4> <cis'-2> <e'-1> } \flag a'^\ffVII |
	\barre "IV" { <fis,-1> <es-3> <a-4> <c'-2> <es'-1> } \flag a'^\ffVII | \barre "III" { <f,-1> <d-3> <g-4> <h-2> <d'-1> } \flag a'^\ffVII |
	<e,-1> <cis-3> <g-0> <h-0>_\markup\line{\small\italic "D. C. al" \tiny\musicglyph #"scripts.coda"} <cis'-2> \flag a'^\fermata^\ffVII |\break

	\coda <a'-4 d'-2 fis-2>4. <a'-2>8 <h'-4> a' | <a'-2>4. r | s2. | s | s \bar "|."


}

basses = {
	\global
	 \voiceTwo
	 \stemDown
	 \slurUp

	 s8 a, fis\glissando <cis'-3 g-1>4. | s8 a, fis <cis'-3 g-1>4. | d8\rest a, <fis-3> \fdown <g-4>4. | d8\rest a, fis <g-0>4. \fleft | a8\rest <d-0> <a-1> <b-1>4. | a8\rest <d-0> <h-2> <c'-3>4. | g8\rest g <d'-3> <d'-3>4. |
	 g8\rest <fis-3> <d'-2> s4. | g8\rest <fis-3> <d'-2> <gis-3>4. | s2. | d8\rest <a,-0> <fis-3> \shiftOn\fdown <g-4>4. \shiftOff\fleft | d8\rest <a,-0> <fis-3> g4. | g8\rest <d-0> <a-1>  c'4. -\tweak X-offset #-1.2 -\tweak Y-offset #-0.7 -3 |
	 g8\rest d h <cis'-4>4. | \barre "IX" { c'8\rest <cis'-3> <e'-1> } <g'-2 d'-1 e-1>4. | \stemUp \shiftOn cis'8 d' cis' <g-0 h-0>4. |
	 \tinystems #'(4) <e'-3>8[ d' <h-0>] \normstems \slurDown\grace{cis'16-1( d'-2} cis'8) <h-0> \slurUp <cis'-1> | s <a,-0> <fis-3> <cis'-3 g-1>4. | s8 <a,-0> <fis-3> \fdown\stemDown <a-1> <h-3> a \fleft |
	 \stemUp a h a \stemDown <fis-3> <g-4> fis |

	 \repeat volta 2
	 {
	 	<d-4>8( <h,-1>) r <e-4>8( <cis-3>) r | d( h,) r e( cis) r | d( h,) r <cis-4>4. | <d-3>4. <cis-3> | g8\rest <fis-3>4~ <h-4 fis>4. | g8\rest <g-0>4 \fdown <h-4>4. \fleft | g8\rest <fis-4> d' s4. |
		<cis-1>8 <e-4> g s4. | a8\rest <d-1> <b-3> r4. | a8\rest <d-0> <e-3> fis4. |
	 }
	 \alternative
	 {
	 	{ g8\rest <g-3> <h-2> g\rest <e-1> <h-2> | <fis,-3>4. <ais,-1>8 <h,-1> <cis-3> | }
		{ g8\rest <gis-1> <d'-4> g\rest <g-0> <cis'-2> | <d,-0> <a,-0> <h,-1> <fis,-3> <a,-0> <d-0> | }
	 }

	s8 <cis'-3> g' -\tweak Y-offset #0 -4 s <a-2> <g'-3> | h\rest fis'4 s4. | <h-3 e-1>4 s8 <g-0> e4\rest | e8\rest <a,-0> <fis-3> s4. | e8\rest <a,-0> <fis-1> <f-1>4 d8\rest | <fis,-1> <a,-4> <cis-1> <d-3>4. |
	<fis,-1>8 <a,-4> <cis-1> <d-3>4. |  e8\rest <cis-4> <a-1> <h-0>4. | \barre "II" {e8\rest <cis-4> <a-1> } <h-0>4. | <d-0>8 <gis-1> <his-1> <cis-4> <gis-1> <cis'-2> | <b,-1> <g-0> <cis'-2> h,4.\rest |
	<h,-1>8 <fis-3> h <a,-0> <f-3> <h-0> | g\rest <e-2> <h-0> g4.\rest | f8\rest <e-2> <a-3> f4.\rest | a\rest <f'-3 h-1> | e8\rest <e-1> <a-2> e4.\rest | a\rest <f'-3 h-1>4. | s2. | 
	s | s | s | s |

	h,8\rest <a,-0> fis <e' cis' g>4. | d,8 <fis,-1> <a,-0> <d-0> <fis-1> \flagOn a^\ffXII | d'^\ffXII fis'^\ffIX a'^\ffVII \ottava #1 \osm d''^\ffVII fis''^\ffVII a''^\ffIII d'''4.^\ffIV \ottava #0 <d''-7 a''-7 fis'-9> |
	<d' d>2._\ffXII
}

ostinato = {
	\global
	\voiceTwo
	\stemDown
	\slurUp

	d,4. s | d, s | d, s | d, s | <fis,-3> s | <g,-3> s | <h,-1> s | h, s | h, s | <a,-0> <g-0> | d, s | d, s | <fis,-3> s | <g,-2> s | <fis-1> s | fis s |
	<fis-2 a,-0> \once\override NoteHead.X-offset = #1 \once\override Stem.X-offset = #1 g | d, s | d, s | <fis-3> s |
	
	\repeat volta 2
	{
		s2. | s | s | s | d,4. s | <e,-1> s | <fis,-3> s | s s | <g,-1> s | <a,-0> s |
	}
	\alternative { { e, <g,-3> | s s } { <e,-2> <a,-0> | \stemUp d, \stemDown s } }

	<fis-1>4. <cis-1> | <d-0> <dis-2> | s s | d, <g-3> | d, s | s2. | s | fis,4.-3 s | fis, s | s2. | s | s | \priraz{f,16-3} gis,4.~ gis, | <a,-0> s | d, s | <a,-0> s | d, s |
	a,2. | g, | fis, | f, | e, |

	d,4. s | s2. | s | s | s
}

lining = {
	\global
	\repeat unfold 4 { s2. | \noBreak } s | \break
	\repeat unfold 4 { s2. | \noBreak } s | \break
	\repeat unfold 5 { s2. | \noBreak } s | \break
	\repeat unfold 5 { s2. | \noBreak } s | \break
	\repeat unfold 5 { s2. | \noBreak } s | \break
	\repeat unfold 5 { s2. | \noBreak } s | \break
	\repeat unfold 5 { s2. | \noBreak } s | \break
	\repeat unfold 5 { s2. | \noBreak } s | \break
	\repeat unfold 5 { s2. | \noBreak } s | \break
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

%		page-count = #1
}

\score {
	\new Staff \with {
		midiInstrument = "acoustic guitar (nylon)"
		instrumentName = "Kytara"
	} {
		<<
			\new Voice { \clef "treble_8" \melody }
			\new Voice { \clef "treble_8" \basses }
			\new Voice { \clef "treble_8" \ostinato }
%			\new Voice { \clef "treble_8" \lining }
		>>
	}
	\layout { }
	\midi {
		\context {
			\Score
			tempoWholesPerMinute = #(ly:make-moment 70 4)
			\override SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/1)
		}
	}
}
