\version "2.18.0"
\language "deutsch"

\header {
	title = "Sigüenza"
	subtitle = "(„Spící princezna“)"
	composer = "Federico Moreno Torroba"
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
	\key e \minor
	\time 6/8
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
	\override TextSpanner.bound-details.left.stencil-align-dir-y = #UP

	\tempo\markup\sans\bold "Andantino"

	\repeat volta 2
	{
		\repeat unfold 2 { <g' d' h>4. <fis' d' a> | }
		e'4 e'8 g'8. fis'16 g'8 |
		e'4 fis'8 a'8. g'16 a'8 |

		<fis' dis' a>4 <g' e' h>8 <c' g' e'>8. h'16 c''8 |
		<ais' cis'>8 <h' dis'>4 r4. |
		c''4 a'8 fis'8. g'16 a'8 |
		h'4 fis'8 e'8. fis'16 e'8 |
	}
	\alternative
	{
		{
			d'4 d'8 c'8. d'16 e'8 |
			h4. e8\rest <fis' dis' fis>8 c'' |
			h4. c' |
			h c' |

			\repeat unfold 2 { r8 <es' c'>4-> r8 q4-> | }
			r8 <a fis>4 r8 q4 |
			r8 <es' a fis>4 r8_\markup\italic "(rit.)" <c' b e>4 |
			r8 <d' gis eis>4 r8 <dis' a fis>4_\markup\italic "(a tempo)"
		}
		{
			d'4 d'8 c'8. d'16 e'8 |

			c''4 a'8 fis'8. g'16 a'8 |
			h'4 fis'8 e'4. |
			g'2 f'8 a' |
			r8 <cis' g> <dis' fis> <e' g> <g' b> <fis' dis'> |
			\repeat unfold 2 { <g' d' h>4. <fis' d' a> | }

			<g' d' h>2.~ |
			q |
			<h g fis e> \bar "|."
		}
	}
}

basses = {
	\global
	\voiceTwo

	\repeat volta 2
	{
		\repeat unfold 2 { r8 e h, r e, h, | }
		r <c' g a,>4 r8 <d' g h,>4 |
		r8 <c' g c> <d' a h,> r <e' c' c>4 |

		h, e8 a4. |
		g8 \slurUp fis( a) \slurDown c c h, |
		<< { \stemDown a8\rest <e' c'>4 a8\rest <c' a>4 | a8\rest <d' h>4 a8\rest b4 | } \\ { a,4. d | g, c | } >> 
	}
	\alternative
	{
		{
			<< { \stemDown a8\rest <h fis>4 g8\rest <g e>4 | f8\rest << { fis4( a4.) } \\ { \shiftOn e8 dis s dis c' } >> | } \\ { g,4. a, | h, a, | } >>
			\repeat unfold 2 { <g fis>8 h, e, <fis e> d a, | }

			\repeat unfold 2 { \transpose c c, { h4 a8 a8. h16 a8 } | }
			e8. d16 c8 e d c |
			h,4 a,8 fis,4 g,8 |

			b,4 h,8 h,4 c8 |
		}
		{
			<<
				{
					\stemDown g8\rest <h fis>4 g8\rest <g fis>4 |
					a8\rest <e' c'>4 a8\rest <c' a>4 |
					h8\rest <d' h>4 a8\rest \stemUp <ais fis> <h g> \stemDown |
					h\rest e( c') s4. |
				}
				\\
				{
					g,4. a, |
					a, d |
					g, c4( h,8) |
					b,4. <c' f a,> |
				}
			>> 
			h,2. |
			\repeat unfold 2 { r8 e h, r e, h, | }
			r e h, e h, g, |
			e,2.~ |
			\override TextScript.extra-offset = #'(-.5 . -2)
			e,_\markup\tiny "11. X. 2015 D." |
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
			tempoWholesPerMinute = #(ly:make-moment 60 4)
		}
	}
}
