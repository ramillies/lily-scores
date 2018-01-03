\version "2.18.0"
\language "deutsch"

\include "/home/glorfindel/Music/lilypond/openlilylib/debugging-layout/display-control-points/display-curve-control-points.ly"

\header {
	title = "Variace na Sorovo tema"
	subtitle = "(Var. VIII)"
	composer = "Miguel Llobet"
	%arranger = \markup\tiny "revise a prstoklady: Darek (VII/16)"
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
   
specbarre = #(define-music-function (parser location barre music) (markup? ly:music?) 
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
               \override TextSpanner.bound-details.left.text = #barre
	       \override TextSpanner.bound-details.right.text = \markup { \draw-line #'(0 . -0.5) }
	       \override TextSpanner.bound-details.right.padding = #-1
               \override TextSpanner.style = #'line
               #music
       #} )
tinystems = #(define-music-function (parser location how) (list?) #{ \override Stem.details.beamed-lengths = #how #} )
movetext = #(define-music-function (parser location how) (pair?) #{ \override TextScript.extra-offset = #how #} )
freezetext = \movetext #'(0 . 0)
sp = #(define-music-function (parser location how) (pair?) #{ \override Arpeggio.positions = #how #} )
priraz = #(define-music-function (parser location music) (ly:music?) #{ \acciaccatura #music #} )
normstems = \revert Stem.details
extStrum = \override Arpeggio.positions = #'(-4 . 4)
normStrum = \revert Arpeggio.positions
empty = { \once \hide NoteHead \once \override NoteHead.no-ledgers = ##t }
vacuum = { \hide NoteHead \override NoteHead.no-ledgers = ##t }
visible = { \undo \hide NoteHead \revert NoteHead.no-ledgers }
tamb = \markup { T }
coda = \mark\markup\fontsize #4 \musicglyph #"scripts.coda"
segno = \mark\markup\musicglyph #"scripts.segno"
flag = \once \override NoteHead.style = #'harmonic-mixed
flagOn = \override NoteHead.style = #'harmonic-mixed
flagOff = \revert NoteHead.style

cross = \override NoteHead.style = #'cross
norm = \revert NoteHead.style

ffXII = \markup{\tiny XII}
ffVII = \markup{\tiny VII}
ffV = \markup{\tiny V}
ffIV = \markup{\tiny IX}
ffIX = \markup{\tiny IX}

osm = \set Staff.ottavation = \markup{\override #'(word-space . 0) \line{\large\sans\bold "8" \small\raise #1 \underline"a"}}
patnact = \set Staff.ottavation = \markup{\large\sans\bold "15"}

fO = \markup { \italic o }
fA = \markup { \italic a }
fM = \markup { \italic m }
fI = \markup { \italic i }
fP = \markup { \italic p }

sup = { \change Staff = "up" \stemDown } 
sdown = { \change Staff = "down" \stemUp }
strum = \arpeggio

fleft = \set fingeringOrientations = #'(left)
fright = \set fingeringOrientations = #'(right)
fdown = \set fingeringOrientations = #'(down)
fup = \set fingeringOrientations = #'(up)

global = {
	\time 12/8
	\key e \minor
	\set fingeringOrientations = #'(left)
	\set stringNumberOrientations = #'(down)
	\mergeDifferentlyHeadedOn
	\mergeDifferentlyDottedOn
	\override Score.BarNumber.self-alignment-X = #LEFT
	\override Glissando.breakable = ##t
	\override Glissando.after-line-breaking = ##t
	\override Glissando.minimum-length = #4
	\override Glissando.springs-and-rods = #ly:spanner::set-spacing-rods
	\override TupletBracket.bracket-visibility = ##t
	\override Staff.TimeSignature.break-visibility = ##(#f #t #t)
%	\set fontSize = #1
	\override Fingering.staff-padding = #'()
}

liningI = {
	\global

}

clarifications = {
	\global
	\magnifyStaff #.75

	\override Staff.BarLine.kern = #3.1
	\override Staff.BarLine.hair-thickness = #2
	\override Staff.BarLine.thick-thickness = #5.8
	a,8-7 g\finger 12 h\finger 12 e'\finger 12 h-7 g-5 e,-7 d-7 h-7 e4.-7 |
	a,8-7 g\finger 12 h\finger 12 e'\finger 12 h-7 g-5 d\finger 12 g-7 h-7 d4.-3 |
	g8-5 h-5 e'-5 g-3 h-5 h-5 g-7 h-7 e'-7 d-3 h-7 g-7 |
	e,-7 d-7 h-7 a,-7 g\finger 12 e'\finger 12 a,\finger 12 h-7 e'\finger 12 <e,-7 e'-7>4. |
	a,8-7 g\finger 12 h\finger 12 e'\finger 12 h-7 g-5 e,-7 d-7 h-7 e'4.-7 |
	a,8-7 g\finger 12 h \finger 12 e'\finger 12 h-7 g-5 d\finger 12 g-7 e'\finger 12 h8 g-5 d-3 |
	g-5 h-5 e'-5 g-3 h-5 g-5 g-7 h-7 e'-7 d-3 h-7 g-7 |
	e,-7 d-7 h-7 g-5 h-7 e'-7 e,\finger 12 g-5 h-5 e'4.-5 \bar "|."
	
}

melodyI = {	
	\global
	\voiceOne
	\tupletUp
	\slurDown

	\tempo\markup\sans\bold "Andante" 4. = 66
	\transpose c c'
	{
		\flagOn \ottava #1 \osm
		e8 g h e' fis' g' h, a fis' h'4. |
		e8 g h e' fis' g' d d' fis' a'4. |
		g'8 h' e'' d'' h' g' d' fis' h' a' fis' d' |
		h, a fis' e g e' a, fis' e' h'4. |
		e8 g h e' fis' g' h, a fis' h'4. |
		e8 g h e' fis' g' d d' e' fis' g' a' |
		g'8 h' e'' d'' h' g' d' fis' h' a' fis' d' |
		h, a fis' g' fis' h' e, g' h' e''4. \bar "|."
		
	}	
}

bassesI = {
	\global
	\voiceTwo
	\slurUp

	\flagOn
	\transpose c c'
	{
		e2. h, |
		e d4. a'4. |
		g' d'' d' a' |
		h, e a, h, |
		e2. h, |
		e d |
		g'4. d'' d' a' |
		h,2. e, \bar "|."
	}
}

\paper
{
		#(define fonts
			(set-global-fonts
				#:music "ross"
				#:brace "ross"
				#:roman "EB Garamond"
				#:sans "Linux Libertine O"
				#:typewriter "monospace"
				#:factor (/ staff-height pt 20)
			)
		)
		#(set-paper-size "a5" 'landscape)

		system-system-spacing #'basic-distance = #20
		indent = #12
		left-margin = #5
		right-margin = #5
		top-margin = #3
		bottom-margin = #6

		page-count = #1
		ragged-last = ##t
}

\score {
	\new PianoStaff \with {
		instrumentName = "Kytara"
		\remove "Keep_alive_together_engraver" 
	} {
		\set PianoStaff.connectArpeggios = ##t

		<<
			\new Staff = "down"
			{
				<<
					\new Voice { \clef "treble_8" \melodyI }
					\new Voice { \clef "treble_8" \bassesI }
					\new Voice { \clef "treble_8" \liningI }
				>>
			}
			\new Staff = "up" { \new Voice { \clef "treble_8" \clarifications } }
		>>
	}
	\layout
	{
		\context
		{
			\Staff \RemoveEmptyStaves
			\override VerticalAxisGroup.remove-first = ##t
		}

		\override Hairpin.thickness = #1.5
		\override Slur.thickness = #1.2
		\override Tie.thickness = #1.2
		\override PhrasingSlur.thickness = #1.2
		\override Score.StaffSymbol.thickness = #1.4
		\override PianoPedalBracket.thickness = #1.5

		%\displayControlPoints
	}
}

\score {
	\new Staff \with {
		midiInstrument = "acoustic guitar (steel)"
		midiMinimumVolume = 1
		midiMaximumVolume = 1
	} {
		<<
			\new Voice { \clef "treble_8" \unfoldRepeats \melodyI }
			\new Voice { \clef "treble_8" \unfoldRepeats \bassesI }
		>>
	}
	\midi {
		\context {
			\Score
		}
	}
}
