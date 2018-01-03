\version "2.18.0"
\language "deutsch"

\header {
	title = "Alba de Tormes"
	subtitle = "(„Píseň trubadůra“)"
	composer = \markup\line{"Federico Moreno Torroba"}  
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
	\key d \major
	\time 2/4
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

	\tempo\markup\sans\bold "Moderato"
	\repeat volta 3
	{
		r8 a( <fis' cis'>4) |
		r8 a( <fis' dis'>4) |
		r8 a( <fis' h>4) |
		r8 << { g' h'^\fermata cis' } \\ { <e' h>4 g8 } >> |
		
		r8 a <fis' cis'>4 |
	}
	\alternative
	{
		{
			r8 f( <d' as>4) |
			r8 << { cis'8( e'4) } \\ { <gis e>4. } >> |
			r8 <dis' fis>8( <fis' b>4) |
			r8 <d' as>8( <f' cis'>4) |

			r8 <e' h g>[ <g' d' h> <fis' cis' a> |
			<a' fis' cis'> <g' d' h> <fis' cis' a> <g' d' h>] |
			<e' h g>4 <fis' cis' a>^\markup\italic "(rit.)" |
		}
		{
			\key es \major
			r8 << { d'( g'4) } \\ { b4. } >> |
			r8 <d' b>8( g'4) |

			R2*2|
			r8 <g' es'>8( b'4) |
			r8 <g' es'>8( b'4) |
			d8[ es g b] |

			\priraz{b16 c'} b8[ a g f] |
			r8 <f' c' as>8( <as' f' c'>4) |
			r8 <es' h fis>8( <as' es' h>4) |
			r8 <d' as f>[ <c' g es> <d' as f>] |
			<es' b g>[ <f' c' as> <g' d' b> <as' f' c'>] |

			r8 << { fis'( g'4) } \\ { b4. } >> |
			\key d \major
			r8 << { a'( b'4) } \\ { d'4. } >> |
			r8 e'[ fis' e'] |
			h'^\fermata[ a' g' fis'] |
			e'4-> fis'-> |
		}
		{
			r8 f( <d' as>4) |
			r8 g( <e' h>4) |
			r8 <f' c' as>-.[( <g' c' as>-. <f' c' as>-.)] |
		}
	}

	r <e' d' gis> r <fis' cis' a> |
	\repeat unfold 2 { r a( <fis' cis'>4) | }
	r8 <cis' a>[ <fis' cis' a> <a' fis' cis'>] |
	<cis'' a' fis'>2^\fermata \bar "|."

}

basses = {
	\global
	\voiceTwo

	\repeat volta 3
	{
		d4. a,8 |
		h,4. fis,8 |
		e,4. d8 |
		a,2( |
		d4.) a,8 |
	}
	\alternative
	{
		{
			b,4. f,8 |
			fis,4. fis,8 |
			h,4. h,8 |
			b,4. b,8 |

			a,2~ |
			a,~ |
			a,8 a,4 a,8 |
		}
		{
			\key es \major
			c4. g,8 |
			c4. d8 |

			f[ e d c] |
			h,[ c \priraz e16 d8 c] |
			f4. c8 |
			f4. c8 |
			s2 |

			s |
			b,4. es8 |
			b,4. es8 |
			b,4 r |
			R2 |

			es4. es8 |
			\key d \major
			e4. e8 |
			<h g d a,>2~ |
			q4_\fermata r |

			q4 <cis' g a,> |
		}
		{
			b,4. b,8 |
			a,4. a,8 |
			d2 |
			b,4 a, |
			d4. a,8 |
			d4. a,8 |
			d2 |
			d_\fermata_\markup\lower #6 \tiny "6. X. 2015 D."
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
			tempoWholesPerMinute = #(ly:make-moment 85 4)
		}
	}
}
