\version "2.18.0"
\language "deutsch"

\header {
	title = ""
	%subtitle = ""
	composer = ""
	poet = ""
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
flagsOn = \override NoteHead.style = #'harmonic-mixed
flagsOff = \revert NoteHead.style
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
	\key g \minor
	\set fingeringOrientations = #'(left)
	\set stringNumberOrientations = #'(down)
	\mergeDifferentlyHeadedOn
	\mergeDifferentlyDottedOn
	\override Score.BarNumber.self-alignment-X = #LEFT
	\override Glissando.breakable = ##t
	\override Glissando.after-line-breaking = ##t
	\set Score.tempoHideNote = ##t
	\override TupletBracket.bracket-visibility = #'if-no-beam
	\override Score.VerticalAxisGroup #'remove-first = ##t
}

one = {	
	\global
	\tupletDown
	\slurUp
	\stemDown
	\oneVoice

	\cadenzaOn \accidentalStyle forget
	r16 d,[ g, b,] d[ b, a, b,] g,[ b, d fis] g[ d c d] b,[ d g b]
	<<
		{
			d'4~ d'16[ g h d'] c'4~ c'16[ g a c'] b4 r16 h[ d' b'] as'4~ as'16[ c' es' as'] g'4 \bar ""
			r16 d'[ es' c'] fis'4~ fis'16[ d' es' c'] g'4~ g'16[ d' es' c'] a'4~ a'16[ g' a' fis']
			\transpose c c''
			{
				\alterBroken padding #'(0.5 4) Staff.OttavaBracket
				c4~ c16[ b, c a,] \ottava #1 \osm es4~ es16[ c fis8~ fis16 es a8~ a16 fis c'8~ c'16 a es'8]~ \bar ""
			}
			\grace
			{
				\transpose c c'' { es'32[ d' c' b a g fis es \ottava #0 d c }
				\transpose c c' { b a g fis a es fis c es }
				a c' fis a es fis c es a, c \change Staff = "down"
				\transpose c c, { fis a es fis c es a, c a, fis, es,] fis,[ a, c es fis a c' } \change Staff = "up"
				es fis a c' es' fis' \ottava #1 \osm a' c'' es'' fis'' a'' c''']
			}
			es'''16 \ottava #0 r <es'' fis' es'>8-^ <d'' fis' es'>-^ <c'' fis' es'>-^ \bar ""

		}
		\\
		{
			r16 b[ g d] es4~ es16[ d es c] d4~ d16[ g d es] f4~ f16[ es f d] es4~ es16[ d es c] \bar ""
			a4~ a16[ d es c] b4~ b16[ d es c] c'4~ c'16[ g a fis] es'4~ es'16[ b c' a] fis'4~ fis'16[ d' es' c']
			\transpose c c' { a8.[ fis16 c'8. a16 es'8. c'16 fis'8. es'16] \bar "" }
			\grace
			{
				\transpose c c' { a'32[ fis' es' d' c' b a g fis es d c }
				b a c' fis a es fis c es a, c \change Staff = "down"
				\transpose c c, { fis a es fis c es a, c }
				\transpose c c,, { fis a es fis c es c a,] g,[ a, c es fis a }
				\transpose c c, { c es fis a } \change Staff = "up"
				c es fis a c' es' fis' a' c'' es'']
			}
			fis''16 s <a es c g,>8 q q \bar ""

		}
	>>

	<b' g' d' b>16-^ \grace { g32[ b d' g' d' b g] }
	fis16-^-- \grace { g32[ b d' g' d' b g] }
	d16-^-- \grace { g32[ b d' g' d' b g] }
	\ottava #1 \osm <d''' d''>16-^ \ottava #0 \grace { g32[ b d' g' d' b g] }

	s16 \grace { g32[ b d' g' d' b g] }
	fis16-^-- \grace { g32[ b d' g' d' b g] }
	d16-^-- \grace { g32[ b d' g' d' b g] }
	\ottava #1 \osm <d''' d''>16-^ \ottava #0 \grace { g32[ b d' g' d' b g] } \bar ""

	s16 \grace { g32[ b d' g' d' b g] }
	fis16-^-- \grace { g32[ b d' g' d' b g] }
	d16-^-- \grace { g32[ b d' g' d' b g] }
	\ottava #1 \osm <d''' d''>16-^ \ottava #0 \grace { g32[ b d' g' d' b g] }

	s16 \grace { g32[ b d' g' d' b g] }
	fis16-^-- \grace { g32[ b d' g' d' b g] }
	a16-^-- \grace { b32[ d' g' b' g' d' b] }
	\transpose c c'
	{
		fis16-^-- \grace { g32[ b d' g' d' b g] }
		a16-^-- \grace { b32[ d' g' b' g' d' b] }
	}
	
	\bar ""
	\once\override Staff.OttavaBracket.padding = 4 \ottava #1 \osm fis''16-^--
	\grace { \transpose c c'' { g32[ b d' g' d' b g d \ottava #0 } \transpose c c' { b g d } b g d b, \change Staff = "down" g, d, b,,] \change Staff = "up" }
	\accidentalStyle default
	r4 <b' g' d' b g d b,> r <a' g' cis' a g cis a,> r <c'' a' es' c' a es c a,> r <b' d' b d b,>
	r8 <d'' h' f' d' h f d>[ r <c'' ges' es c' ges es> r <es'' c'' f' es' c' f> r <d'' as' f' d' as f d as,>
	r <f'' g' f' g' f d g,> r <e'' b' g' e' b' g e b,> r <g'' cis'' b' g' cis' b g cis'> r <b'' e''  cis'' b' e' cis' b e>]

	\cadenzaOff \bar "||"
	\time 4/4
	R1*2 \bar "|."

}

one_bass = {
	\global
	\slurDown
	\stemUp
	\oneVoice

	\cadenzaOn
	<g, g,,>1~ q q1. \bar ""
	q1 s1. s1 \bar ""
	s16 r s4. \bar ""
	<g, g,,>16-^ s8. f16-^\sf s8. \bar ""
	e16-^\sf s8. es16-^\sf s4 \bar ""
	s16 <es, es,,>2-^ <e, e,,>-^
	<f, f,,>-^ <fis, fis,,>-^ <g, g,,>4-^ <gis, gis,,>4-^ <a, a,,>-^ <b, b,,>-^ <h, h,,>-^ <c c,>-^ <e e,>-^ <g g,>-^

	\cadenzaOff \bar "||"
	\time 4/4
	r4 <d d, d,,>2 <d c c, d,, c,,>4~ | q <d h, h,, d,, h,,,> <d b, b,, d,, b,,,> <d a, a,, d,, a,,,>
}

kytara = {
	\global
	\voiceOne
	\slurDown
	\override Staff.BarLine.thick-thickness = #4.4
	\override Staff.BarLine.kern = #2.4
	\override Staff.BarLine.hair-thickness = #1.5

	s1*14 \repeat unfold 10 s16
}

kytara_bass = {
	\global
	\voiceTwo
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
		system-system-spacing #'basic-distance = #15
		indent = #13
		left-margin = #9
		right-margin = #5
		top-margin = #3
		bottom-margin = #6


}

\score {
	<<
		\new StaffGroup 
		<<
			\new PianoStaff \with {
				instrumentName = "Klavír"
				\remove "Keep_alive_together_engraver"
			} {
				<<
					\new Staff = "up" { \new Voice { \magnifyStaff 0.75 \clef "treble" \transpose c c' \one } }
					\new Staff = "down" { \new Voice { \magnifyStaff 0.75 \clef "treble_15" \one_bass } }
				>>
			}

			\new Staff \with {
				instrumentName = "Kytara"
			} {
				<<
					\new Voice { \clef "treble_8" \kytara }
					\new Voice { \clef "treble_8" \kytara_bass }
				>>
			}
		>>
	>>
	\layout
	{
		\context
		{
			\Score
			\override StaffGrouper.staff-staff-spacing.padding = #0
			\override StaffGrouper.staff-staff-spacing.basic-distance = #1
		}
	}
}

\score {
	\new StaffGroup 
	<<
		\new Staff \with {
			midiInstrument = "acoustic grand"
		} {
			<<
				\new Voice { \clef "treble" \unfoldRepeats \transpose c c' \one }
				\new Voice { \clef "treble" \unfoldRepeats \one_bass }
			>>
		}

		\new Staff \with {
			midiInstrument = "acoustic guitar (steel)"
		} {
			<<
			%	\new Voice { \clef "treble_8" \unfoldRepeats \kytara }
			%	\new Voice { \clef "treble_8" \unfoldRepeats \kytara_bass }
			>>
		}
	>>

	\midi {
		\context {
			\Score
			tempoWholesPerMinute = #(ly:make-moment 40 4)
			\override SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/1)
		}
	}
}
