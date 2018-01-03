\version "2.18.0"
\language "deutsch"

\header {
	title = "II — Angelus"
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
	\time 4/4
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
	\repeat unfold 3 { s1 |\noBreak } s |\break
	\repeat unfold 3 { s1 |\noBreak } s |\break
	s | \noBreak \time 2/4 s2 | \noBreak \time 4/4 s1 |\noBreak s |\break
	\repeat unfold 2 { s1 |\noBreak } s |\break
	\repeat unfold 2 { s1 |\noBreak } s |\break
	\repeat unfold 3 { s1 |\noBreak } s |\break
	\repeat unfold 3 { s1 |\noBreak } s |\break
	s | \noBreak \time 2/4 s2 | \noBreak \time 4/4 s1 |\noBreak s |\break
	\time 2/4
	\repeat unfold 6 { s2 |\noBreak } s |\break

}

melody = {	
	\global
	\voiceOne
	\tupletUp
	\slurDown

	\tempo\markup\line{\teeny "Calmo ed estatico (" "Andante" \teeny ")"}

	\repeat volta 2 { d''4 s2. | }
	\repeat volta 2 { d''8[ h' a' fis' e' d' h a] | }
	d''8[ h' a' fis' e' d' h a] \bar "||"

	<h g d>4 <a f c>8 <c' as es> <h g d>4 <c' a e>8 <e' c' g> |
	<d' h fis>4 <e' c' g>8 <g' e' h> <fis' d' a> <g' e' h> <h' g' d'> <a' fis' c'> |
	<h g d>4 <a f c>8 <c' as es> <h g d>4 <c' as es>8 <es' c' g> |

	\key es \major
	<d' b f>4 <es' c' g>8 <g' es' b>  <f' d' a>\strum <a' f' c'> <d'' a' f'> <c'' a' es'> |
	\repeat volta 2 { <d' b f>4 <c' as es>8 <es' ces' ges> <d' b f> <f' des' as> <as' e' ces'> <f' des' as> | }

	\repeat unfold 2 { <d' h f> <f' des' as> <as' e' ces'> <f' des' as> } |
	\time 2/4 <c'' as' es'>4 <h' g' d'> \bar "||"

	\key g \major \time 4/4

	\repeat volta 2 { c16 g c' e' d' e' f' d' c' d' e' c' as b c' as | }
	e h e' g' fis' g' a' fis' e' fis' g' e' d' e' fis' d' |
	e h e' g' fis' g' a' fis' e' fis' g' e' d' e' f' d' |

	\repeat volta 2 { s4 c''8. h'16 s4 c''8. h'16 | }
	\repeat volta 2 { c16 g c' e' d' e' f' d' c' d' e' c' as b c' as | }
	a, e c' e' d' e' f' d' c' d' e' c' as b c' as |

	\repeat volta 2 { s4 g'8. f'16 s4 g'8. f'16 | }

	\key a \major
	\repeat unfold 2 
	{
		r8 <e' cis' a> <cis' a fis> <d' h gis> <e' cis' a> <fis' d' h>16 <gis' e' cis'> <a' fis' d'>8 <gis' e' cis'>16 <fis' d' h> |
		\repeat unfold 2 { <e' cis' a>8 <cis' a fis> <a fis d> <h gis e> } |
	}

	\key f \major
	<c b e >4 r r8 c' f' g' |
	<b' d'>\strum a'16 g' f'8 g' <c b e>4 r |

	r8 c' f' g' <b' d'>\strum a'16 g' <f' d'>8 g' |
	\key g \major
	e' <d' g>16 c' a8 <c' a> <h a dis>4 r |

	r8 fis h cis' <e' a>\strum dis'16 cis' h8 cis' |
	<a e c>4 r r8 fis h c' |

	\time 2/4 <e' a>8\strum d'16 c' h8 c' |
	\time 4/4
	\repeat unfold 2 { \times 8/12 { <e' a>8( c' e') <d' a>( h d') <e' a>( c' e') <d' a>( h d') } | }

	\transpose c c'
	{
		e'16[ e s s dis' e] s s |
		\repeat volta 2
		{
			d'[ e s s cis' e] s s |
			h[ e s s cis' e] s s |
			a[ e s s fis e] s s |
		}
		\alternative{
			{ e'16[ e s s dis' e] s s | }
			{ \key c \major e'4 r8. d'16 | }
		}
	}
	e''4 r |
	e''4 r8. d''16 |
	e''4 r |
	s2 \bar "||"

	\time 4/4
	<h g d>4 <a f c>8 <c' as es> <h g d>4. r8 |
	<h g d>4 <a f c>8 <c' as es> <h as d>4. r8 |

	\repeat volta 2
	{
		<cis' a e>4 <h g d>8 <d' b f> <cis' a e>4 <d' b f>8 <f' cis' as> |
		<e' c' g>4 <f' des' as>8 <a' f' c'> <gis' e' h> <a' f' c'> <c'' as' es'> <h' gis' d'> |
	}

	\key a \major
	\time 2/4
	<d'' b' f'>4 <cis'' gis' e'> |

	\time 4/4
	<e'' cis'' a'>4. r8 q4. r8 |
	\override TextScript.extra-offset = #'(0 . -4)
	\flag <e'' a'>1_\markup\tiny{13. IV. 2015 D.} \bar "|."


}

basses = {
	\global
	\voiceTwo
	\stemDown
	\slurUp

	\repeat volta 2 { d''8[ h' a' fis' e' d' h a] | }
	\repeat volta 2 { <c' d>4 s2. | }
	<h d g,>4 s2. |

	\times 2/3 { r8 d g, } r4 \times 2/3 { r8 d g, } r4 |
	\times 2/3 { r8 d g, } r2. |
	\times 2/3 { r8 d g, } r4 \times 2/3 { r8 d g, } r4 |

	\times 2/3 { r8 d f, } r4 <es f,>4\strum r  |
	\repeat volta 2 { \times 2/3 { r8 f b, } r2. | }
	<f g,>4 r q r |

	\time 2/4 r8 <f g,>4.
	\time 4/4

	\repeat volta 2 { c8 s as s g s f s | }
	\repeat unfold 2 { e s c' s h s a s | }
	\repeat volta 2 { d16 a d' f' c'' f' d' h' g, d a f' c'' f' d' h' | }
	\repeat volta 2 { c8 s as s g s f s | }
	a, s f s e s d s |

	\repeat volta 2 { ais,16 d as c' g' c' as f' e, h, as d' g' d' as f' | }

	\key a \major

	<e a,>4 r2. |
	q4 r q r |

	<fis, cis>4 r2. |
	q4 r q r |

	\key f \major 

	r8 c f g b a16 g f8 g |
	<b f c>4\strum r r8 c f g |

	b a16 g f8 g <b f c>4\strum <a h> |
	\key g \major
	r8 <e b,> r <e a,> r fis, h, cis |

	e dis16 cis h,8 cis <e h, fis,>4\strum r |
	r8 fis, h, c e d16 c h,8 c |

	\time 2/4
	<e h, fis,>4\strum r |
	\time 4/4
	<c f,>4 <h, f,> q q |
	<c f,>4 <h, f,> <c f,> <h, f,> |

	\time 2/4
	e,8 e16[ fis s s e g] |
	\repeat volta 2
	{
		s s e[ gis s s e a] |
		s s e[ h s s e d'] |
		s s e[ cis' s s e c'] |
	}
	\alternative { { s s e[ fis s s e g] | }

	{ e'' a' f' a d a f' d'' | } }
	e'' a' f' h g h f' d'' |
	e'' a' f' a d a f' d'' |
	e'' a' f' h g g' e' g |
	h a f d g,8 r 

	\time 4/4
	\times 2/3 { r8 d g, } r2 g,8 r |
	\times 2/3 { r8 d f, } r2 e,8 r |

	\repeat volta 2
	{
		\times 2/3 { r8 e a, } r4 \times 2/3 { r8 e a, } r4 |
		\times 2/3 { r8 e a, } r4 <d e,>4 r |
	}

	\time 2/4
	s2 |

	\time 4/4
	\times 2/3 { r8 e a, } r4 \times 2/3 { r8 e' a } r4 |
	s1 |

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
	\layout { #(layout-set-staff-size 18)  }
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
			tempoWholesPerMinute = #(ly:make-moment 80 4)
		}
	}
}
