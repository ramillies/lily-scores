\version "2.18.0"
\language "deutsch"

\header {
	title = ""
	subtitle = ""
	subsubtitle = ""
	composer = ""
	%arranger = \markup\tiny "revise a prstoklady: Darek (II/2015)"
	poet = ""
	meter = ""
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
sp = #(define-music-function (parser location how) (pair?) #{ \override Arpeggio.positions = #how #} )
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
flagsOn = \override NoteHead.style = #'harmonic-mixed
flagsOff = \revert NoteHead.style

cross = \override NoteHead.style = #'cross
norm = \revert NoteHead.style

ffXII = \markup{\tiny XII}
ffVII = \markup{\tiny VII}
ffV = \markup{\tiny V}
ffIV = \markup{\tiny IX}
ffIX = \markup{\tiny IX}

osm = \set Staff.ottavation = \markup{\large\sans\bold "8"}
patnact = \set Staff.ottavation = \markup{\large\sans\bold "15"}

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
	\key e \major
	\cadenzaOn
	\set fingeringOrientations = #'(left)
	\set stringNumberOrientations = #'(down)
	\mergeDifferentlyHeadedOn
	\mergeDifferentlyDottedOn
	\override Score.BarNumber.self-alignment-X = #LEFT
	\override Glissando.breakable = ##t
	\override Glissando.after-line-breaking = ##t
	\set Score.tempoHideNote = ##t
	\override TupletBracket.bracket-visibility = #'if-no-beam
	\override Staff.TimeSignature.break-visibility = ##(#f #t #t)
	\set Score.voltaSpannerDuration = #(ly:make-moment 3 1)
%	\set fontSize = #1
}

flute = {
	\global
	
	e2~ e1.~ e~ e2.^\fermata\laissezVibrer |
}

lining = {
	\global

}

melody = {	
	\global
	\voiceOne
	\tupletUp
	\slurDown

	r4 <gis' e' h>\strum <a' f' c'>2\strum <gis' e' h>\strum <a' f' c'>4\strum <gis' e' h>2\strum 
	d,8[ a, d a d' f'] \ottava #1 \osm \times 2/3 { a'4 d'' f'' } a'' \ottava #2 \patnact \flag d''' a'''\laissezVibrer^\fermata
}

basses = {
	\global
	\voiceTwo

	s4 <e a, e,>\strum <f c e,>2\strum <e a, e,>\strum <f c e,>4\strum <e a, e,>2\strum s1. s2
}

\paper
{
		#(define fonts
			(set-global-fonts
				#:music "ross"
				#:brace "ross"
				#:roman "EB Garamond 08"
				#:sans "Linux Libertine O"
				#:typewriter "monospace"
				#:factor (/ staff-height pt 20)
			)
		)

		system-system-spacing #'basic-distance = #10
		indent = #0
		line-width = #120
		left-margin = #5
		right-margin = #5
		top-margin = #5
		bottom-margin = #5

		oddFooterMarkup=##f
		oddHeaderMarkup=##f
		bookTitleMarkup=##f
		scoreTitleMarkup=##f
}

\score {
	\new StaffGroup
	<<
		\new Staff \with {
			midiInstrument = "recorder"
			instrumentName = "Flétna"
			shortInstrumentName = "F"
		} \new Voice { \clef "treble" \transpose c c' { \flute } }
		\new Staff \with {
			\consists "Span_arpeggio_engraver"
			midiInstrument = "acoustic guitar (steel)"
			instrumentName = "Kytara"
			shortInstrumentName = "K"
		} {
			\set Staff.connectArpeggios = ##t
			<<
				\new Voice { \clef "treble_8" \melody }
				\new Voice { \clef "treble_8" \basses }
				\new Voice { \clef "treble_8" \lining }
			>>
		}
	>>
	\layout {  }
	\midi {
		\context {
			\Score
			tempoWholesPerMinute = #(ly:make-moment 50 4)
		}
	}
}
