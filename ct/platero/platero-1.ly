\version "2.18.0"
\language "deutsch"

\header {
	title = "I — Platero"
%	subtitle = "(ze souboru „Platero a já“)"
	composer = "Mario Castelnuovo-Tedesco (1895 — 1968)"
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
	\key g \major
	\time 12/8
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
%	\set fontSize = #1
}

lining = {
	\global
	\repeat unfold 3 { s1. | \noBreak } s |\break
	\repeat unfold 4 { s1. | \noBreak } s |\break
	\repeat unfold 4 { s1. | \noBreak } s |\break
	\repeat unfold 4 { s1. | \noBreak } s |\break
	\repeat unfold 3 { s1. | \noBreak } \time 4/4 s1 |\noBreak s |\break
	\time 2/4 s2 |\noBreak \time 12/8 \repeat unfold 3 { s1. | \noBreak } s |\break
	\repeat unfold 3 { s1. | \noBreak } s \break |
	\time 4/4
	\repeat unfold 4 { s1 | \noBreak } s |\break
	\repeat unfold 4 { s1 | \noBreak } \time 12/8 s1. |\break
	\repeat unfold 4 { s1. | \noBreak } \time 2/2 s1 |\break
	\repeat unfold 6 { s1 | \noBreak } s |\break
	\repeat unfold 4 { s1 | \noBreak } \time 12/8 \repeat unfold 1 { s1. |\noBreak } s |\break
	\repeat unfold 4 { s1. | \noBreak } s |\break
}

melody = {	
	\global
	\voiceOne
	\tupletUp
	\slurDown

	\tempo\markup\line{"Allegretto" \teeny "molto mosso, trottando"}
	\repeat volta 2 { \repeat unfold 4 { \repeat unfold 4 { r8 e' h } | } }

	\repeat unfold 6 { \repeat unfold 4 { r8 e' h } | }

	s1. |
	\repeat unfold 4 { r8 e' h } |
	s1. |
	r8 e'( h) d' a( c') g( a) f g a c' |

	d'4.\laissezVibrer s s s |
	r8 e'( h) d' a( c') g( a) f g a c' |
	d'4.\laissezVibrer s s s |
	\repeat unfold 4 { r8 e' h } |

	\repeat unfold 4 { r8 e' h } |
	r8 d'( a) c' g( b) f( g) d f g b |
	c'4 r8 d'4 r8 f'4 r2 |
	g4 r8 b4 r8 d'4 r8 f'4 r8 \bar "||"

	\time 4/4 
	r4 \priraz dis''8 e'' r <h' gis' d'>4. r8 |
	r4 \priraz h'8 c'' r8 <fis' c' a>4. r8 \bar "||"

	\time 2/4
	r4 \priraz gis'8 a' r \bar "||"

	\time 12/8
	e'8 fis' d' e'( c') d' a( c') g a c' d' |
	e'4 r8 g'4 r8 a'4 r8 c''4 r8 |
	r8 e'' h' r es'' h' r d'' a' r des'' as' |
	r c'' g' r h' fis' r b' f' r a' e' |
	r as' es' r g' d' r fis' cis' r f' c' |
	r e' h r es' b r d' a r des' as |
	\repeat unfold 2 { \repeat unfold 4 { r c' g } | }

	\time 4/4
	<a fis d>4\strum q8 q <b f d>4\strum q8 q |
	<h e d>4\strum q8 q <b f d>4\strum q8 q |
	<a fis d>4\strum q8 q <b f d>4\strum q8 q |
	<h e d>4\strum q8 q <d' g e h,>4\strum q8 q |

	<cis' ais fis>4\strum q8 q <d' a fis>4\strum q8 q |
	<dis' g fis>4\strum q8 q <d' a fis>4\strum q8 q |
	<cis' ais fis>4\strum q8 q <d' a fis>4\strum q8 q |
	<dis' as fis>4\strum q8 q <fis' h gis dis>4\strum fis'8 fis' |
	<dis' as fis>4\strum q8 q <fis' h g dis>4\strum fis'8 fis' |

	\time 12/8 \key h \major
	r fis' cis' dis'( ais) cis' gis( ais) fis gis ais cis' |
	dis' cis' gis ais( fis) gis dis( fis) cis dis fis gis |
	ais gis dis fis( cis) dis ais,( cis) gis, ais cis dis |
	fis4 r8 gis4 r8 ais4 r8 cis'4 r8 |
	<c e ais c'>8 r4 r4. <c e ais c' fis,>8 r4 r4. \bar "||"

	\time 2/2 \key g \major \tempo\markup\line{\teeny "Un poco" "Moderato"}
	r4. <a f>8 r4. <e b>8 |
	r4. <c' f>8 r4. <e b>8 |
	r4. <a f>8 r4. <e gis>8 |
	r4. <a f>8 r4. <c' f>8 |
	r4. <a cis'>8 r4. <d' as>8 |
	r4. <e' cis'>8 r4. <d' as>8 |
	r4. <a cis'>8 r4. <c' as>8 |
	r4. <a cis'>8 r4. <e' a>8 |
	<fis' c'>8 r4. q8 r4. |
	<b gis>8 r4. q8 r4. |
	<fis' c'>8 r4. q8 r4. |
	<b g>8 r4. q8 r4. |

	\time 12/8 \tempo "Tempo I."
	r8 e' h d'( a) h g( a) e g a h |
	d'( e') h d' e' g' a'( h') g' a' h' d'' |
	r e'' h' r es'' b' r d'' a' r es'' b' |
	r e'' h' r es'' b' r d'' a' r es'' b' |
	r e'' h' es'' b' d'' a'( h') fis' a' h' d'' 
	\ottava #1 \osm  e''4 r8 \flagsOn <fis'' cis''>4 r8 <a'' e''>4 r2 \flagsOff \ottava #0 |
	\override TextScript.extra-offset = #'(-.5 . -3)
	<e' h a d>2.\laissezVibrer r_\markup\tiny "30. III. 2015, D." \bar "|."



}

basses = {
	\global
	\voiceTwo
	\stemDown
	\slurUp

	\repeat volta 2 
	{
		e,4. a, d g |
		fis d cis e |
		d h, a, cis |
		h,2.\laissezVibrer <fis' h>\laissezVibrer |
	}

	<cis' eis>2. <d' fis> |
	<cis' eis>4. <a cis> <h d>2. |
	<a cis> <h d> |
	<a cis>4. <fis a,> <gis h,>2. |

	<g c>\laissezVibrer s |
	<g c> q |
	<des' h f cis>8 r4 r4. q8 r4 r4. |
	<g c>2. q |

	<des' ais e c>8 r4 r4. q8 r4 r4. |
	<c f,>4.\laissezVibrer s s s |
	r8 a( fis) g e( f) c( d) a, c d f |
	<g c f,>4.\laissezVibrer s s s |

	r8 a( fis) g e( f) c( d) a, c d f |
	gis4 r8 a4 r8 gis4 r8 g4 r8 |
	fis4 r8 f4 r8 e4 r8 <f, es>4 r8 |
	<d b,>4.\laissezVibrer s s s |
	r8 b( f) g( d) f c( d) b, c d f |
	s1. |

	\time 4/4
	<e' d' gis>8 r r2 e8 r |
	e, r8 r2 e8 e |

	\time 2/4 
	e,8 r4. |

	\time 12/8
	<c' g d>4 s s1 |
	<c' g d a,>4 s s1 |
	\repeat unfold 4 { e,4\laissezVibrer r8 a,4\laissezVibrer r8 <g d a,>4\laissezVibrer r2 | }
	r4. es4\laissezVibrer r8 b,4\laissezVibrer r8 c4\laissezVibrer r8 |
	fis,4\laissezVibrer r8 g,4\laissezVibrer r8 b,4\laissezVibrer r8 c4\laissezVibrer r8 |

	\time 4/4
	\repeat unfold 9 { s1 | }

	\time 12/8 \key h \major
	<ais fis cis>4\strum s s1 |
	\repeat unfold 4 { s1. | }

	\time 2/2 \key g \major

	\repeat unfold 4 { <c f,>4 c8 d q4 c8 d8 | }
	\repeat unfold 4 { <e e,>4 e8 fis q4 e8 fis | }

	\shiftOn
	<a d>8 r4. q8 r4. |
	<d b,>8 r4. q8 r4. |
	<a d>8 r4. q8 r4. |
	<d e,>8 r4. q8 r4. |

	\time 12/8
	<g d a,>4.\strum\laissezVibrer s s s |
	s1. |
	<h a d>2. <g d a,>\strum |
	<h a d>2. <g d a,>\strum |
	<h a d>2.\laissezVibrer r |
	s1.
	s |


}

\paper
{
		#(define fonts (make-pango-font-tree "Georgia" "Arial" "Courier New" 1 ) )
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
			\new Voice { \clef "treble_8" \lining }
		>>
	}
	\layout { }
}

\score {
	\new Staff \with {
		midiInstrument = "acoustic guitar (steel)"
	} {
		<<
			\new Voice { \clef "treble_8" \unfoldRepeats \melody }
			\new Voice { \clef "treble_8" \unfoldRepeats \basses }
		>>
	}
	\midi {
		\context {
			\Score
			tempoWholesPerMinute = #(ly:make-moment 180 4)
		}
	}
}
