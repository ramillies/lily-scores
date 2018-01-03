\version "2.18.0"
\language "deutsch"

\header {
	title = "Simancas"
	subtitle = "(„Žonglérka“)"
	subsubtitle = ""
	composer = \markup\raise #1 "Federico Moreno Torroba"
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

global = {
	\key e \minor
	\time 3/4
	\set fingeringOrientations = #'(left)
	\set stringNumberOrientations = #'(down)
	\mergeDifferentlyHeadedOn
	\mergeDifferentlyDottedOn
	\override Score.BarNumber.self-alignment-X = #LEFT
	\override Glissando.breakable = ##t
	\override Glissando.after-line-breaking = ##t
	\set Score.tempoHideNote = ##t
	\override TupletBracket.bracket-visibility = ##t
	\override Staff.TimeSignature.break-visibility = ##(#f #t #t)
	\set Score.voltaSpannerDuration = #(ly:make-moment 3 1)
	\magnifyStaff 0.9
}

lining = {
	\global
	
	\repeat unfold 5 { s2. |\noBreak } s |\break
	\repeat unfold 8 { s2. |\noBreak } s |\break
	\repeat unfold 5 { s2. |\noBreak } s |\break
	\repeat unfold 6 { s2. |\noBreak } s |\break
	\repeat unfold 5 { s2. |\noBreak } s |\break

}

melody = {	
	\global
	\voiceOne
	\tupletUp
	\slurDown
	\set tupletSpannerDuration = #(ly:make-moment 3 4)

	\tempo\markup\sans\bold "Andante mosso"

	e,4( h, g) |
	\repeat volta 2
	{
		es( a8 a d'4) |
		e,4( h, g) |
		es( a8 a d'4) |
		\times 12/15
		{
			e,16[ g' g' g' g' h, g' g' g' g' g g' g' g' \once\override TextScript.extra-offset = #'(-2.4 . 3) g']_\markup\small\italic "Simile" |

			s \repeat tremolo 4 a' s \repeat tremolo 4 g' s \repeat tremolo 4 fis' |
			s \repeat tremolo 4 g' s \repeat tremolo 4 fis' s \repeat tremolo 4 e' |

			s \repeat tremolo 4 dis' s \repeat tremolo 4 dis'  s \repeat tremolo 4 dis'|
			s \repeat tremolo 4 e' s \repeat tremolo 4 e' s \repeat tremolo 4 d' |
			s \repeat tremolo 4 c' s \repeat tremolo 4 d' s \repeat tremolo 4 e' |

			s \repeat tremolo 4 dis' s \repeat tremolo 4 dis'  s \repeat tremolo 4 dis' |
			s \repeat tremolo 4 dis' s \repeat tremolo 4 dis'  s \repeat tremolo 4 dis'|
			s \repeat tremolo 4 e' s \repeat tremolo 4 e' s \repeat tremolo 4 e' |

			s \repeat tremolo 4 fis' s \repeat tremolo 4 fis' s \repeat tremolo 4 fis' |
			s \repeat tremolo 4 g' s \repeat tremolo 4 g' s \repeat tremolo 4 a' |
			s \repeat tremolo 4 c'' s \repeat tremolo 4 h' s \repeat tremolo 4 g' |

			s \repeat tremolo 4 h' s \repeat tremolo 4 c'' s \repeat tremolo 4 a' |
		}
	}
	\alternative
	{
		{ \times 12/15 {
			s \repeat tremolo 4 a' s \repeat tremolo 4 a' s \repeat tremolo 4 a' |
			s \repeat tremolo 4 g' s \repeat tremolo 4 g' s \repeat tremolo 4 g' |

			s \repeat tremolo 4 h' s \repeat tremolo 4 h' s \repeat tremolo 4 h' |
		}
			<h' g'>4. r |
		}
		{
			\times 12/15 { s16 \repeat tremolo 4 g' s \repeat tremolo 4 fis' s \repeat tremolo 4 d' } |

			\times 8/10 { s \repeat tremolo 4 e' s \repeat tremolo 4 fis' } es' c' h a |
			\times 8/10 { s \repeat tremolo 4 e' s \repeat tremolo 4 fis' } es' c' h a |
			\times 12/15 {
				s \repeat tremolo 4 e' s \repeat tremolo 4 e' s \repeat tremolo 4 e' |

				s \repeat tremolo 4 fis' s \repeat tremolo 4 fis' s \repeat tremolo 4 fis' |
				s \repeat tremolo 4 fis' s \repeat tremolo 4 a' s \repeat tremolo 4 c'' |
			}
			e''[ h' g' h' d'' a' fis' a' c'' g' e' g'] |

			dis'-\tweak positions #'(6.2 . 2) [ h' a' g' fis' e' d' c' h a g fis] |
			r e'[ h g r d' a fis r c' g e] |
			dis-\tweak positions #'(2.5 . 8) [ a h cis' dis' e' fis' g' a' h' cis'' dis''] |

			r e''[ h' g' r c'' g' e' r fis' d' a] |
			r8 a \priraz{g16 a} g8 fis g4 |
			<h' g'>2.^\fermata \bar "|."
		}
	}

}

basses = {
	\global
	\voiceTwo

	s2. |

	\repeat volta 2
	{
		s | s | s |

		e,4 h, g |
		es a, h, |
		<h c> <a c> <g c> |

		fis h a |
		a g fis |
		\shape #'((1 . 1) (0 . 0) (0 . 0) (0 . 0)) Slur e( fis c) |

		fis c' h |
		a g fis |
		h a g |

		a h c' |
		c' h fis |
		e d cis |

		g e' fis |
	}
	\alternative
	{
		{
			c' d' c' |
			h c' h |

			<dis' fis a,> <cis' g h,> <dis' fis a,> |
			e,( h, g) |
		}
		{
			<h e g,>( <a, c'> <h, a>) |

			<h, e,> c h, |
			h, c h, |
			e, h, g |

			es a c' |
			a c' dis' |
			e2 r4 |
			
			<dis' a e> r r |
			fis, fis, fis, |
			<dis a, e,> r r |

			e a h, |
			<h, e,>2. |
			\override TextScript.extra-offset = #'(1 . -0.75)
			<g h, e,>2._\markup\tiny "19. IV. 2015 D."
		}
	}
}

ostinato = {
	\global
	\voiceTwo
	\stemDown
	\slurUp

	s2. |
	\repeat volta 2
	{
		\repeat unfold 6 { s | }
		c | h, | a, |
		\shape #'((0 . 0) (0.5 . -2) (-0.5 . -2) (0 . 0)) Tie h,~ | h, | c |
		d | <d g,> | s |
		d |
	}
	\alternative
	{
		{
			<fis g,> | <e g,> |
			s | s |
		}
		{
			s | s | e, | \repeat unfold 9 { s | }
		}
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

		system-system-spacing #'basic-distance = #10
		indent = #12
		left-margin = #5
		right-margin = #5
		top-margin = #3
		bottom-margin = #6

		page-count = #1

}

\score {
	\new Staff \with {
		\consists "Span_arpeggio_engraver"
		instrumentName = "Kytara"
	} {
		\set Staff.connectArpeggios = ##t
		<<
			\new Voice { \clef "treble_8" \melody }
			\new Voice { \clef "treble_8" \basses }
			\new Voice { \clef "treble_8" \ostinato }
			\new Voice { \clef "treble_8" \lining }
		>>
	}
	\layout {  }
}

\score {
	\new Staff \with {
		midiInstrument = "acoustic guitar (steel)"
	} {
		<<
			\new Voice { \clef "treble_8" \unfoldRepeats \melody }
			\new Voice { \clef "treble_8" \unfoldRepeats \basses }
			\new Voice { \clef "treble_8" \unfoldRepeats \ostinato }
		>>
	}
	\midi {
		\context {
			\Score
			tempoWholesPerMinute = #(ly:make-moment 100 4)
		}
	}
}
