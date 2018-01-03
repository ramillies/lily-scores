\version "2.18.0"
\language "deutsch"

\header {
	title = "Alcañiz"
	subtitle = "(„Slavnost“)"
	composer = \markup\line{"Federico Moreno Torroba"}  %," \teeny "revise a prstoklady: Darek (V/2015)"}
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
flagOn = \override NoteHead.style = #'harmonic-mixed
flagOff = \revert NoteHead.style

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
fup = \set fingeringOrientations = #'(up)

global = {
	\key g \major
	\time 3/8
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
%	\set fontSize = #1
	\set Score.voltaSpannerDuration = #(ly:make-moment 2/1)
}

lining = {
	\global
	
}

melody = {	
	\global
	\voiceOne
	\tupletUp
	\slurDown
	\set tupletSpannerDuration = #(ly:make-moment 3 4)

	\tempo \markup \sans \bold "Allegro"
	\repeat volta 4
	{
		d'8 g'16( fis' g' a') |
		h'8 g' <d'' h' fis'> |
		<e'' g'> d'' c'' 
		\priraz{h'16 c''} <h' fis'>8 <a' e'> r |

		c'' \priraz c''16 h' a' h' c'' |
		<d'' g'>8 h' g' |
	}
	\alternative
	{
		{
			<b' g' cis'>8 cis'16 g' b' a' |
			g' a' g' fis' e' fis' |
		}
		{
			\key f \major
			<b' g' cis'>8 q <a' fis' c'> |
			\times 2/3 { <a' c'>16 h' a' } <g h>4 |
			d'16 c' h8 c' |
			c'16[ g'] h[ g'] c' g' |
			d' c' h8 d' |

			c'16[ g'] h[ g'] c' g' |
			r16 c' f' es' d' c' |
			r g es' d' c' b |
			a r es( f g a) |
			b c' d' es' f' g' |

			a'4. |
			<d' b>8 r4 |
			r16 fis' d' a fis a~ |
			a g a g d' g |
			r es'( f' es' b' fis') |

			r g'( a' g' d'' c'') |
			b a' g' fis' g' es' |
			\repeat unfold 3 { r16 d'8[ d' d'16] | }

			r16 d'8^\markup\italic "(rit.)"[ d'8 d'16] |
		}
		{
			\key b \major
			<b' g' cis'>8 q <a' fis' c'> |
			<g' es' b>4. |
			r8 q4 |

			r8 <b' g' es'>4 |
			r8 q4 |
			<f' b>8 d'16 c' b d' |
			g'8 f' d' |
			c'' b' f' |

			<es'' g'>8 <d'' f'> <b' d'> |
			\key d \major
			<< { a'4. | a' | a' | } \\ { \stemUp s8 h( d') | s h( d') | s <h g>( cis') | } >>
			s4. |

			s | s |
			<< { a' | a' | a' | } \\ { <g a,> | q | q | } >> |

			s |
			<< { s8 gis'( a') | s^\markup\italic "(rit.)" gis'( a') | s gis'( a') | } \\ { d4. | d | d | } >> |
			<e'' c''>8-^ <e' c' g>^\markup\italic "(molto rit.)" <fis' d' a> |
		}
		{
			<b' g' cis'>8 cis'16 g' b' a' |
			g' a' g' fis' e' fis' |
			<d' h>8 g'16 fis' g' a' |
			h'8 g' <d'' h' fis'> |

			<e'' g'> d'' c'' |
			\priraz{h'16 c''} <h' fis'>8 <a' e'> r |
			<c'' g' e'> c''16 c'' c'' c'' |
			<d'' g'>8 h' g' |
			<b' g' cis'> q <a' fis' c'> |

			\repeat unfold 3 { r h16 d' g' d' | <c'' fis' e'>8 <h' fis' d'> <a' fis' c'> | }
			<g' d' h> h16 d' g' d' | <c'' fis' e'>8 <h' fis' d'> <a' fis' c'> |
			g'4.~^\markup\italic "(rit.)" |
			g'8 r4 |
			<g' d' h>8 r4 \bar "|."
		}
	}
}

basses = {
	\global
	\voiceTwo

	\repeat volta 4
	{
		<h d g,>8 r r |
		r4. |
		c'8 h a |
		d c d' |

		<g' e' a> r d' |
		h g e |
	}
	\alternative
	{
		{
			es r4 |
			d8 r4 |
		}
		{
			\key f \major
			es8 es d |
			g, d g |
			f4. |
			<c' e>8 <h d> <c' e> |
			f4. |

			<c' es>8 <h d> <c' es> |
			as,4. |
			b, |
			c16 s s4 |
			s4. |

			r16 d fis a c' a |
			a g f g f es |
			d4. |
			<es c>4( b,8) |
			c4( d8) |

			es4 r8 |
			s4. |
			d8 e f |
			fis b a |
			d b a |

			d b a |
		}
		{
			\key b \major
			es es d |
			c f es |
			a4 g8 |

			d'4 c'8 | d'4 c'8 |
			<d f,>4. |
			b8 r4 |
			<f' d'>8 r4 |

			r4. |
			\key d \major
			\repeat unfold 3 { r8 <g a,>4 | }
			d'8 fis' e' |

			a' g' cis'' |
			h' a' e' |
			\repeat unfold 3 { d'\rest <dis' his>( <e' cis'>) | }

			<h' g'> <a' fis'> <g' e'> |
			\repeat unfold 3 { c'\rest <c' eis>( fis) | }
			d4. |
		}
		{
			es8 r4 |
			<c' d>8 r4 |
			<d g,>8 r4 |
			r4. |

			c'8 h a |
			d c d' |
			a r <fis' d'> |
			h g e |
			es es d |

			\repeat unfold 3 { g, r4 | d8 d d | }
			<d g,> r4 | d8 d d |
			g,16 d g h d h |
			g8 r4 |
			<d g,>8 r4_\markup{\lower #6 \tiny "7. X. 2015 D."} |
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
		%#(set-paper-size "a5" 'landscape)

		system-system-spacing #'basic-distance = #20
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
	\layout {  }
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
			tempoWholesPerMinute = #(ly:make-moment 100 4)
		}
	}
}
