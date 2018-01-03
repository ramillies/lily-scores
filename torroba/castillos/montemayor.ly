\version "2.18.0"
\language "deutsch"

\header {
	title = "Montemayor"
	subtitle = \markup{\override #'(word-space . 0) \line{ "(„Romance borovic — " \italic "Romance de los pinos" "“)" } }
	composer = \markup\line{"Federico Moreno Torroba, " \tiny "prstoklady A. Segovia"}
	%arranger = \markup\tiny "prstoklady A. Segovia"
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
	\key a \major
	\time 3/4
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
	\set Score.voltaSpannerDuration = #(ly:make-moment 12/8)
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

	\tempo\markup\sans\bold "Largo"
	\repeat volta 2
	{
		\barre "II" { <cis'-1 a-1>8 d'-2 \priraz{cis'16 d'} cis'8 a cis' d' } |
		\barre "IV" { e'2-2 d'16-4( cis'-3 h-1 a-4) |
		<h-1 fis-1>8 cis'16-3 h } \once\override TextSpanner.extra-offset = #'(.2 . -.8) \barre "II" { <a e>2 |
		e'8-4 fis'-1 e' h-3 <cis'-1 a-1> } <e' h> |

		<< { <a'-4 c'>2^"III" } \\ { f } >> h'16-3^"V" a' gis' a' |
		<cis'-1 a-1>8^"II" \priraz e'16 d'8^"III" <cis' a>4^"II" <h gis> |
	}
	\alternative
	{
		{
			\key c \major
			<a-1 e-1 a,>2.^"II"^\fermata |
			e'8-0 f'-1 e' c' e' f' |

			g'2-4 a'16-4^"III"( g' f' a') |
			<g' d'>2.^"III"
			e'8-0 f' e' c' e' f' |
			<g' h>2^"III" f'16-1( e' d'-3 f') |
			
			e'2.-0 |
			e'8-0 f' e' c' e' f' |
			<g' c'>2^"III" a'16-4( g' f' a') |
			<g' d'>2.^"III" |

			<a'-4 c'-3>8 c''-4 h'-3 a'-4 gis'-3 \priraz h'16 a'8-2 |
			\key a \major 
			gis'2-3^"II" a'16-3^"III"( h'-4 a' h') |
			<gis'-3 e'-0>2.^\fermata^"II"
		}
		{
			\barre "II" { r4 e'2-4~ |
			e'2.^\fermata } \bar "|."
		}
	}
}

basses = {
	\global
	\voiceTwo

	\repeat volta 2
	{
		<e-1 a,>4 r <a fis-3> |
		<gis-3 cis>2 r4 |
		<d-2>4 r8 cis[-3 h,-1 a,] |
		<e-1 gis,-3>2 <e a,>8 <g-0 g,-2> |

		r8 e-2 dis4-1 <f'-2 c'-1> |
		e8[ f r e, d e,] |
	}
	\alternative
	{
		{
			\key c \major
			s2. |
			<a-2 c-3>2 as4 |

			<c'-1 e-2>2 <c'-3 f-1>4 |
			<h g>2. |
			<a-2 c-3> |
			e,8 h,-1 g4-0 d |

			<gis-1 e-2 h-0>2. |
			<a-2 c-3>2 as4-2 |
			<c'-1 e-2>2 <c'-3 f-1>4 |
			<h g-3>2. |

			f8-1 a-1 g-1 f-1 e-1 f-1 |
			\key a \major
			<e' h-2 e-1>2 <c'-2 f-1>4 |
			<h-2 e-1>2._\fermata
		}
		{
			<a-1 e-1 a,-0>2.~ | q \bar "|."
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
			tempoWholesPerMinute = #(ly:make-moment 70 4)
		}
	}
}
