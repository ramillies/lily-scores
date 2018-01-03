\version "2.18.0"
\language "deutsch"

\header {
	title = "Javier"
	subtitle = "(„Vzpomínka“)"
	subsubtitle = "ze „Španělských hradů“ (Castillos de España)"
	composer = "Federico Moreno Torroba"
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
	\time 5/4
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

}

melody = {	
	\global
	\voiceOne
	\tupletUp
	\slurDown
	\set tupletSpannerDuration = #(ly:make-moment 3 4)

	\tempo "Allegretto"
	
	\repeat volta 2
	{
		g'4 g'4.~ g'16 fis'16 e'4.~ e'16 d'16 |
		e'4 e'4.~ e'16 d'16 e'4.~ e'16 fis'16 |
		g'4 g'4.~ g'16 a'16 h'4.~ h'16 g'16 |

		<a' d' h fis>2.~ q2 |
	}
	\alternative
	{
		{
			<g' c' e>2.~ q2 |
			<d' a fis>2.~ q2 |
			<e' c' g>2. fis'4.~ fis'16 e'16 |

			<<
				{
					\voiceOne
					dis'2.~ dis'2 |
					dis'2.~ dis'2 |
				}
			\\
				{
					\voiceFour
					<fis h,>2. ~ q2 |
					q2.~ q2 |
				}
			>>
		}
		{
			c''4 c''4.~ c''16 a'16 d''4.~ d''16 h'16 |
			g'4 g'4.~ g'16 a'16 h'4.~ h'16 g'16 |
		}
	}

	e'4 e'4.~ e'16 g'16 fis'4.~ fis'16 d'16 |
	<< { \voiceOne <e' h g>2.~ q2 |\coda q2.~ q2 | } \\ { \voiceFour <e,>2.~ q2 | q2.~ q2 | } >>
	<e' h g>2.~ q2 |
	\time 3/4 q4. r8 e'4 \bar "||"

	\tempo "Moderato" \time 4/4
	g'2.( fis'4 |
	d') e'( g' fis') |
	d'2.( c'4) |
	h2( h4 a) |
	h1^\fermata |
	\slurUp
	r4 h2 a4( |

	h) h2 h4~ |
	h h2 h4~ |
	<e h>1^\fermata |
	\slurDown
	<g' es' a>1 |
	<fis' c' g> |
	<f' cis' gis> |

	<e' c' g> |
	<dis' a fis> |
	<<
		{
			\voiceOne
			r4 e' fis' h' |
			h' a' a' e' |
		}
		\\
		{
			\voiceFour
			s4 <c' g>2.~ |
			q4 r2. |
		}
	>>
	e'4 g' fis' d' |
	e'1 |

	<e' c'>2 <e' d' b> |
	<e' c'>1~ |
	q2 r4 fis |
	fis( a a g) |
	g( c' c' h) |
	h e' \priraz{e'16 fis'} e'4 d' |
	
	h1~ |
	h4 d' d' c' |
	e' e' e' fis'_\markup\italic{"Da Capo al " \tiny\musicglyph #"scripts.coda"} \bar "||" \break

	\mark\markup\line{\magnify #2 \raise #.75 \musicglyph #"scripts.coda" \italic "Coda"}
	\hide Score.TimeSignature \time 5/4

	<f' c' a>2.~ q2 |

	<g' e' h>2.~ q2 |
	<<
		{
			\voiceOne
			<dis'>2.~ q2 |
			q2.~ q2 |
			<g' e' h>2.~ q2 |
			q2.~ q2 |
			q2.~ q2 |
		}
	\\
		{
			\voiceFour
			<h, e, fis>2. ~ q2 |
			q2.~ q2 |
			<e,>2.~ q2 |
			q2.~ q2 |
			q2.~ q2 |
		}
	>>

	<g' e' h e e,>2.~ q2 \bar "|."
}

basses = {
	\global
	\voiceTwo

	\repeat volta 2
	{
		<d' h d e,>2. <c' g a,>2 |
		<h g d g,>2. <a c g,>2 |
		<h d g,>2. <c' e>2 |

		h,4 h,4.~ h,16 h,16 h,4.~ h,16 h,16 |
	}
	\alternative
	{
		{
			h,4 h,4.~ h,16 h,16 h,4.~ h,16 h,16 |
			h,4 h,4.~ h,16 h,16 h,4.~ h,16 h,16 |
			h,4 h,4.~ h,16 h,16 <c' g h,>2 |

			c'4 c'4.~ c'16 h16 c'4.~ c'16 h16 |
			c'4 c'4.~ c'16 h16 c'4.~ c'16 h16 |
		}
		{
			<g' e' e a,>2. <fis' a h,>2 |
			<d' h f>2. <e' h c>2 |
		}
	}

	<b g c>2. <a h,>2 |
	c4\rest h,4.~ h,16 h,16 h,4.~ h,16 h,16 |
	c4\rest h,4.~ h,16 h,16 h,4.~ h,16 h,16 |
	<h, e,>2.~ q2 |

	\time 3/4
	q4. s8 r4 |

	\time 4/4
	s1*5 |
	c2( d |

	e) a |
	f g4 d |
	s1 |
	\repeat unfold 5 {r4 h,2 h,4 |}

	a,2 r2 |
	s1*2 |
	r2 <c' g c> |

	<g c> <f g,> |
	<g c>1~ |
	q2 s |
	s1*3 |

	r2 <e fis> |
	q q4 r |
	s1 |

	% Coda
	c4\rest d4.~ d16 d16 d4.~ d16 d16 |
	c4\rest cis4.~ cis16 cis16 cis4.~ cis16 cis16 |
	c'4 c'4.~ c'16 h16 c'4.~ c'16 h16 |
	c'4 c'4.~ c'16 h16 c'4.~ c'16 h16 |
	c4\rest h,4.~ h,16 h,16 h,4.~ h,16 h,16 |
	c4\rest h,4.~ h,16 h,16 h,4.~ h,16 h,16 |
	c4\rest h,4.~ h,16 h,16 h,4.~ h,16 h,16 |
	s1 s4 |

}

\paper
{
		#(define fonts
			(set-global-fonts
				#:music "ross"
				#:brace "ross"
				#:roman "EB Garamond"
				#:sans "sans-serif"
				#:typewriter "monospace"
				#:factor (/ staff-height pt 20)
			)
		)

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
			tempoWholesPerMinute = #(ly:make-moment 140 4)
		}
	}
}
