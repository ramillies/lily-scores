\version "2.18.0"
\language "deutsch"

\include "/home/glorfindel/Music/lilypond/openlilylib/debugging-layout/display-control-points/display-curve-control-points.ly"

\header {
	title = ""
	subtitle = ""
	composer = ""
	%arranger = \markup\tiny "revise a prstoklady: Darek (II/2015)"
	poet = ""
	meter = ""
	tagline = ""
}
#(define (octave-up m t)
 (let* ((octave (1- t))
      (new-note (ly:music-deep-copy m))
      (new-pitch (ly:make-pitch
	(+ t (ly:pitch-octave (ly:music-property m 'pitch)))
        (ly:pitch-notename (ly:music-property m 'pitch))
        (ly:pitch-alteration (ly:music-property m 'pitch)))))
  (set! (ly:music-property new-note 'pitch) new-pitch)
  new-note))

#(define (octavize-chord elements t)
 (cond ((null? elements) elements)
     ((eq? (ly:music-property (car elements) 'name) 'NoteEvent)
       (cons (car elements)
             (cons (octave-up (car elements) t)
                   (octavize-chord (cdr elements) t))))
     (else (cons (car elements) (octavize-chord (cdr elements ) t)))))

#(define (octavize music t)
 (if (eq? (ly:music-property music 'name) 'EventChord)
       (ly:music-set-property! music 'elements (octavize-chord
(ly:music-property music 'elements) t)))
 music)

makeOctaves = #(define-music-function (parser location arg mus) (integer? ly:music?)
	(music-map (lambda (x) (octavize x arg)) (event-chord-wrap! mus)))
 
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
coda = \mark\markup\fontsize #4 \musicglyph #"scripts.coda"
segno = \mark\markup\musicglyph #"scripts.segno"

osm = \set Staff.ottavation = \markup{\override #'(word-space . 0) \line{\large\sans\bold "8" \small\raise #1 \underline"a"}}
osmvb = \set Staff.ottavation = \markup{\override #'(word-space . 0) \line{\large\sans\bold "8" \small\raise #1 \underline"a" \italic " bassa"}}
patnact = \set Staff.ottavation = \markup{\override #'(word-space . 0) \line{\large\sans\bold "15" \small\raise #1 \underline"ma"}}

strum = \arpeggio

lh = \change Staff = "LH"
rh = \change Staff = "RH"
slh = { \change Staff = "LH" \stemUp }
srh = { \change Staff = "RH" \stemDown }
mininotes = \set fontSize = #-4

global = {
	\time 3/4
	\key e \minor
	\set fingeringOrientations = #'(left)
	\set stringNumberOrientations = #'(down)
	\mergeDifferentlyHeadedOn
	\mergeDifferentlyDottedOn
	\override Score.BarNumber.self-alignment-X = #LEFT
	\override Beam.breakable = ##t
	\override Glissando.breakable = ##t
	\override Glissando.after-line-breaking = ##t
	\override Glissando.minimum-length = #6
	\override Glissando.springs-and-rods = #ly:spanner::set-spacing-rods
	\set Score.tempoHideNote = ##t
	\override TupletBracket.bracket-visibility = ##t
	\override Staff.TimeSignature.break-visibility = ##(#f #t #t)
	\set Score.voltaSpannerDuration = #(ly:make-moment 6/8)

	\override Rest.staff-position = #0
	\override MultiMeasureRest.staff-position = #2
}

lining = {
	\global

}

onePrimoR = {
	\global

	\partial 4 \times 2/3 { e'8\f\<( g' h') } |
	e''-.-> r4. \times 2/3 { e'8(\< g' h') } |
}

onePrimoL = {
	\global
	\partial 4 \times 2/3 { e8( g h) } |

}

oneSecondoR = {
	\global
	
	\partial 4 \times 2/3 { e8\f\<( g h) } |
	e'-.->\! r4. \times 2/3 { e8\<( g h) } |
	e'->-.\! r4. \tupletSpan 4 \times 2/3 { e8\<( g h\! |
	e'-> h g e g h) } e'-. r |
	R2.*5 |
	\repeat unfold 2 { \times 2/3 { e8\f( g h) } e'-. r4. | }

	\times 2/3 { e8->\<( g h e' h g e h g)\! } |
	e'-.-> r4. r4 |
	R2.*4 |
	\times 2/3 { h,8->( d fis) } h-. r4. |
	\times 2/3 { h,8->( d fis) } h-. r4. |
	R2.*2 |

	\times 2/3 { d8->( fis a) } d'-. r4. |
	R2. |
	\times 2/3 { d8->( fis a) } d'-. r4. |
	R2.*7 |
	r4 \times 2/3 { e8( g b) } e'-. r |
	r2 cis'8-.\sf r |
	cis\sf r4. r4 |

	R2. |
	r4 \times 2/3 { e8( g b) } e'-. r |
	r2 c'8-.\sf r |
	c-.\sf r4. c'8-.\sf r |
	c-.\sf r4. c'8-.\ff r |
	c-.\< r c'-. r c-. r |
	c'-. r c-. r c' r-.\!_\markup\italic "secco" |
	R2.*4 |


}

oneSecondoL = {
	\global

	\transpose c c,
	{
		\partial 4 \times 2/3 { e8( g h) } |
		e'-.-> r4. \times 2/3 { e8( g h) } |
		e'->-. r4. \tupletSpan 4 \times 2/3 { e8( g h |
		e'-> h g e g h) } e'-. r |
		R2.*5 |
		\repeat unfold 2 { \times 2/3 { e8( g h) } e'-. r4. | }

		\times 2/3 { e8->( g h e' h g e h g) } |
		e'-.-> r4. r4 |
		R2.*4 |
		\times 2/3 { h,8->( d fis) } h-. r4. |
		\times 2/3 { h,8->( d fis) } h-. r4. |
		R2.*2 |

		\times 2/3 { d8->( fis a) } d'-. r4. |
		R2. |
		\times 2/3 { d8->( fis a) } d'-. r4. |
		R2.*6 |
		r2 \times 2/3 { e8( g b) } |
		e'-.-> r4. r4 |
		\times 2/3 { e8( g b) } e'-. r cis'-. r |
		cis r4. r4 |

		r2 \times 2/3 { e8( g b) } |
		e'-.-> r4. r4 |
		\times 2/3 { e8( g b) } e'-. r c' r |
		c-. r4. c'8-. r |
		c-. r4. c'8-. r |
		c-. r c'-. r c-. r |
		c'-. r c-. r c' r-. |
		R2.*4 |
	}

}

twoPrimoR = {
	\global
}

twoPrimoL = {
	\global
}

twoSecondoR = {
	\global
}

twoSecondoL = {
	\global
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
		%#(set-paper-size "a5" 'landscape)

		system-system-spacing #'basic-distance = #20
		indent = #24
		left-margin = #5
		right-margin = #5
		top-margin = #3
		bottom-margin = #6

		%page-breaking = #ly:one-line-breaking

}

\score {
	\new StaffGroup
	<<
		\new PianoStaff \with {
			instrumentName = \markup\center-column{ "Klavír I" "(4 ruce)" }
			shortInstrumentName = "I"
			\consists #Span_stem_engraver
		} {
			\set PianoStaff.connectArpeggios = ##t
			<<
				\new Staff = "PrimoR" {
					\new Voice { \clef "treble" \transpose c c' \onePrimoR }
				}
				\new Staff = "PrimoL" {
					\new Voice { \clef "treble" \transpose c c' \onePrimoL }
				}
				\new Staff = "SecondoR" {
					\new Voice { \clef "bass" \oneSecondoR }
				}
				\new Staff = "SecondoL" {
					\new Voice { \clef "bass" \oneSecondoL }
				}
			>>
		}

		\new PianoStaff \with {
			instrumentName = \markup\center-column{ "Klavír II" "(4 ruce)" }
			shortInstrumentName = "II"
			\consists #Span_stem_engraver
		} {
			\set PianoStaff.connectArpeggios = ##t
			<<
				\new Staff = "PrimoR" {
					\new Voice { \clef "treble" \transpose c c' \twoPrimoR }
				}
				\new Staff = "PrimoL" {
					\new Voice { \clef "treble" \transpose c c' \twoPrimoL }
				}
				\new Staff = "SecondoR" {
					\new Voice { \clef "bass" \twoSecondoR }
				}
				\new Staff = "SecondoL" {
					\new Voice { \clef "bass" \twoSecondoL }
				}
			>>
		}
	>>
	\layout
	{
		\context
		{
		%	\Staff \RemoveEmptyStaves
		%	\override VerticalAxisGroup.remove-first = ##t
		}

		\override Hairpin.thickness = #1.5
		\override Slur.thickness = #1.2
		\override Tie.thickness = #1.2
		\override PhrasingSlur.thickness = #1.2
		\override Score.StaffSymbol.thickness = #1.4
		\override PianoPedalBracket.thickness = #1.5

		\displayControlPoints
	}
}

\score {
	\new StaffGroup
	<<
		\new PianoStaff \with {
			instrumentName = "Klavír I"
			shortInstrumentName = "I"
			midiInstrument = "acoustic grand"
			midiMinimumVolume = 1
			midiMaximumVolume = 1
		} {
			\set PianoStaff.connectArpeggios = ##t
			<<
				\new Staff = "PrimoR" {
					\new Voice { \clef "treble" \transpose c c' \unfoldRepeats \onePrimoR }
				}
				\new Staff = "PrimoL" {
					\new Voice { \clef "treble" \transpose c c' \unfoldRepeats \onePrimoL }
				}
				\new Staff = "SecondoR" {
					\new Voice { \clef "bass" \unfoldRepeats \oneSecondoR }
				}
				\new Staff = "SecondoL" {
					\new Voice { \clef "bass" \unfoldRepeats \oneSecondoL }
				}
			>>
		}

		\new PianoStaff \with {
			instrumentName = "Klavír II"
			shortInstrumentName = "II"
			midiInstrument = "acoustic grand"
			midiMinimumVolume = 1
			midiMaximumVolume = 1
		} {
			\set PianoStaff.connectArpeggios = ##t
			<<
				\new Staff = "PrimoR" {
					\new Voice { \clef "treble" \transpose c c' \unfoldRepeats \twoPrimoR }
				}
				\new Staff = "PrimoL" {
					\new Voice { \clef "treble" \transpose c c' \unfoldRepeats \twoPrimoL }
				}
				\new Staff = "SecondoR" {
					\new Voice { \clef "bass" \unfoldRepeats \twoSecondoR }
				}
				\new Staff = "SecondoL" {
					\new Voice { \clef "bass" \unfoldRepeats \twoSecondoL }
				}
			>>
		}
	>>
	\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 80 8) } } 
}
