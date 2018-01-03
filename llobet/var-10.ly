\version "2.18.0"
\language "deutsch"

\include "/home/glorfindel/Music/lilypond/openlilylib/debugging-layout/display-control-points/display-curve-control-points.ly"

\header {
%	title = "Variace na Sorovo tema"
%	subtitle = "(Var. X)"
%	composer = "Miguel Llobet"
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
	\time 3/4
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
	\magnifyStaff #.85
	\override Staff.OttavaBracket.outside-staff-priority = #550
}

liningI = {
	\global

	s2.*3 | \break
	s2.*3 | \break
	s2.*4 | \break
	
}

melodyI = {	
	\global
	\voiceOne
	\tupletUp
	\slurDown

	\tempo\markup\sans\bold "Vivace" 4 = 84
	\override Score.VoltaBracket.extra-offset = #'(0 . -.5)
	\transpose c c'
	{
		\repeat volta 2
		{
			<g e'>8^"VII" g32( a g fis e8) g,,32( a,, g,, fis,, e,,16) \flagOn h^\markup\tiny "XII" g^\markup\tiny "XII" e^\markup\tiny "VII" \flagOff |
			<h fis dis h,>8 dis32( e dis cis h,8) dis,32( e, dis, cis, h,,16) \flagOn a^\markup\tiny "VII" \ottava #1 \osm fis'^\markup\tiny "VII" h'^\markup\tiny "VII" \flagOff \ottava #0 |
			<g e'>8^"VII" g32( a g fis e8) g,,32( a,, g,, fis,, e,,16) \flagOn e'^\markup\tiny "XII" h^\markup\tiny "XII" g^\markup\tiny "XII" \flagOff |
			<d' a fis d>8^"X" fis32( g fis e d8) fis,32( g, fis, e, d,16) \flagOn a^\markup\tiny "VII" d'^\markup\tiny "VII" fis'^\markup\tiny "VII" \flagOff |
			g'8 h32( c' h a g8) h,,32( c, h,, a,, g,,16) \flagOn \ottava #1 \osm h'^\markup\tiny "V" g'^\markup\tiny "V" \ottava #0 d'^\markup\tiny "V" \flagOff |
			<d' a fis d>8^"X" fis32( g fis e d8) fis,32( g, fis, e, dis,16) \flagOn a^\markup\tiny "VII" \ottava #1 \osm fis'^\markup\tiny "VII" h'^\markup\tiny "VII" \flagOff \ottava #0 |
		}
		\alternative
		{
			{
				<e g, h,>16 e \sup \override Staff.OttavaBracket.extra-offset = #'(0 . .5) \ottava #1 \osm <g h g'>^\markup\center-align "½XII" \sdown e <fis c a,> e \sup <a c' fis'> \sdown e <fis e b,> e \sup <fis b fis'> \sdown e |
				<h fis dis h,>-\tweak extra-offset #'(-2 . 1) ^"VII" h, \sup <h dis' h'>^\markup\center-align "½XVI" \sdown h, \sup <h dis' a'>^"½XVI" \sdown h, \sup <a h fis'> \sdown h, <fis h dis'> h, <dis a h> h, |
			}
			{
				<e g, h,>16 e \sup <g h g'>^\markup\center-align "½XII" \sdown e <fis c a,> e \sup <a c' fis'> \sdown e <h fis dis h,>-\tweak extra-offset #'(-2 . 1) ^"VII" h, \sup <h dis' h'>^\markup\center-align "½XVI" \sdown h, |
			}
		}

		\phrasingSlurDown

		\shape #'((0 . 0) (-2 . -3) (-2 . 0) (-.5 . .5)) PhrasingSlur
		\once\override TupletNumber.extra-offset = #'(0 . -.1)
		\sup \times 8/12 { \flag e''\(-\tweak extra-offset #'(.2 . 3.5) _\markup\tiny "V" h' g' e' \sdown h g e h, g, e, h,, g,, } e,,4\) |
		<a, c e>\strum \barre "VII" { <h, e g h>\strum <h, dis fis h>\strum } |
		<g, h, e e'>\strum-\tweak extra-offset #'(-1 . -1) ^"IX" <e, g, h, e>\strum r \bar "|."
	}	
}

bassesI = {
	\global
	\voiceTwo
	\slurUp

	\repeat volta 2
	{
		<e, e h>8 r r2 |
		<h, e h>8 r r2 |
		<e, e h>8 r r2 |
		<d a d'>8 r r2 |
		<g h>8 r r2 |
		<d a d'>8 r r2 |
	}
	\alternative
	{
		{
			<g e h, e,>16[ r8. <a, e a>16 r8. e,16] r8. |
			<h, fis h>16 h[ s h s h s h s h s h] |
		}
		{
			<g e h, e,>16[ r8. <a, e a>16 r8. <h, fis h>16] r8. |
		}
	}

	e,2 e,4 |
	<a, e>4\strum <h, e>\strum <h, fis>\strum |
	e,\strum <e, h,>\strum r \bar "|."
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
			\new Staff = "up" { \new Voice { \clef "treble_8" \global s2.*12 } }
			\new Staff = "down"
			{
				<<
					\new Voice { \clef "treble_8" \melodyI }
					\new Voice { \clef "treble_8" \bassesI }
					\new Voice { \clef "treble_8" \liningI }
				>>
			}
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
