\version "2.18.0"
\language "deutsch"

\header {
	title = "Turégano"
	subtitle = "(„Milostná píseň“)"
	composer = \markup\line{"Federico Moreno Torroba"}  %," \teeny "revise a prstoklady: Darek (V/2015)"}
	arranger = \markup\tiny "prstoklady A. Segovia"
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
	\key e \major
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
%	\set fontSize = #1
	\set Score.voltaSpannerDuration = #(ly:make-moment 2/1)
}

lining = {
	\global

	\repeat unfold 16 { \repeat unfold 5 { s2. | \noBreak } s | \break }
}

melody = {	
	\global
	\voiceOne
	\tupletUp
	\slurDown
	\set tupletSpannerDuration = #(ly:make-moment 3 4)

	\tempo \markup \sans \bold "Moderato"

	r4 h8-. h-. h-. h-. |
	<e'-0 c'-1 g-0>2.-> |
	r4^\markup\italic "Simile" \repeat tremolo 4 h8-. |
	<fis'-3 d'-4 a>2.-> |

	r4 \repeat tremolo 4 h8-. |
	<g'-4 cis'-2 ais-3>2. |
	<e' cis' g> |
	<fis' dis' a>4^"II" \repeat tremolo 4 h8-. |
	s2. |

	\repeat volta 3
	{
		gis'4-3 gis'8( e'-0) gis' a'-4-\tweak eccentricity #-.9 -\tweak extra-offset #'(0 . .2) ( |
		gis'-4 e') gis'4 <e' h> |
		<cis' a>^"II" <fis'-4 a-3> <e' a-1> |
		dis'8(^"II" cis') h2 |

		a'4-2 a'8 fis' \barre "VII" { h' a'-4 |
		gis'} e' e' h e'( fis') |
		\barre "VIII" { <g' e' b>4 q \priraz a'8 q4 } |
		<fis' dis' a>2^"VII" r4 |

		gis'4-3 gis'8( e'-0) gis' a'-4( |
		gis'-4 e') gis'4 <e' h> |
		<cis' a>^"II" <fis'-4 a-3> <e' a-1> |
		dis'8(^"II" cis') h4 s |

		<cis'' a' e'>\strum^"IX" cis''8-3 cis'' h'-1^"VII" a' |
		<gis'-4 e'-3>8 gis' gis' e' h e' |
		\barre "VIII" { <g' e' b>4 \priraz a'8 q4 } <fis' dis' a>^"VII" |
	}
	\alternative
	{
		{
			e'4 r2 |
			\key e \minor 

			r8 g c'-1 e' r fis'-1 |
			r8 \barre "VII" { h-3 d'-1 g'-2 fis'-1 g'-2 |
			<h' g'>4-> } <c''-2 fis'-1>-> <a' fis' c'>->^"V" |
			\barre "VII" { <h' g' d'>-> r2 |

			r8 d' h-3 g-4 } r <e' g> |
			\barre "V" { r8 c' g c' e' c' |
			<g'-4 d'-3 g-1>4-- q-- \priraz h'16 <a' fis' c'>4-- } |
			<g' d' h>--^"III" \barre "V" { h8-3 h' h' h' |

			r8 e'8 a-1 g'-4 fis'-3 e'-1 } |
			\barre "VII" { r8 d' g'-2( fis'-1) e' d' } |
			\barre "V" { r8 c' e' dis' fis'-3( e'-1) |
			g'-4( fis'-3) e' dis'-4_\markup\italic "(poco rit.)" e'-1 fis'-4 } |

			r8_\markup\italic "(a tempo, suave)" c' h c' h c' |
			\repeat unfold 4 { r c' h c' h c' | }

			r h-0 c'-2 h c' h |
			h'-4( a'-2) g'-2 fis'-1 e'-3( d'-1) |
			\once\override Beam.positions = #'(3.5 . 7)
			\times 6/9 { c'-1_\markup\italic "leggiero"[ d'-1 e'-3 fis'-1 g'-2 a'-4 h'-1 c''-2 cis''-4] } |

			<< { d''4-4\laissezVibrer-> r2 | \barre "VIII" { c''4 r2 } | \barre "V" { h'4 r2 } | } \\ { e'8-3 g'-2 fis'-1 g' a'-4 g' | es'-1 g'-1 fis'-4 g' a'-3 g' | cis' e' dis'-4 e' fis'-3( e'-1) | } >> 
			\once\override Beam.positions = #'(5 . .5)
			\times 6/9 { fis'-3(_\markup\italic "leggiero"[ e'-1) d'-4 c'-2( h-1) a-4 g-2( fis-1) e-4] } |

			r8 a-2 d'-1 fis'-3 gis-1 fis' |
			r g h e' fis-3 e' |
			r fis-3 a-1 e' r <e' h g> |
			r8 <e'-0 c'-1 a-3> r q r q |

			<<
				{
					r4 <e'-0 c'-1> q |
					q q8 r q r |
					r4 q q |
					q q8 r q r |

					\key e \major
					r4^"II" <fis' cis'> q |
					q_\markup\italic "(rit.)" \barre "II" { q q |
					r q r } \bar "||"
				}
				\\
				{
					\repeat unfold 2 { s4 fis-4 a-2 |
					\override Beam.positions = #'(-3 . -2.5)
					fis8 g a4-2 h-4 | }
					s4 fis a |
					fis8-3 gis-4 a4-1 h-3 |
					\revert Beam.positions
					s4 fis8 gis a4
				}
			>>


			\once\override Beam.positions = #'(1 . 4.8)
			\times 6/9 { fis8-1([ gis-3) a-4 h-0 cis'-1 dis'-3 e'-4 fis'-1 g'-2] | }

		}
		{
			e'4 r2 |
			e'4-2 e'8 gis-3 e'( dis') |
			e'-2 gis'-3 e'4-0 dis'-4 |

			cis'4 r2 |
			gis'8-4( fis'-2) f'-1 d'-2( cis'-1) h |
			r4 cis' <fis'-4 cis'-2> |
			\barre "IV" { r8 cis'8-4 e'-2 gis' fis'-4( e') |

			r gis' b gis' c' gis' | }
			<e'-2 cis'-4 gis-3>2 h,8 dis'-4 |
			r cis'-2 e'-0 dis'-4 fis'-2( e') |
			gis'-4( fis'-2) e'-0 cis''-4( h'-2) b'-1 |

			dis''4.-4-> fis''8-4 e''-2 dis''-1 |
			cis''-4( h'-2) b' gis'-4 fisis'-3 gis'-4 |
			<f'-4 h-1 gis-3>2^"IV" <g' cis' ais>4^"VI" |
			<gis' dis' h>^"IV" r2 |

			r4 \barre "IV" { <gis' dis' h> q |
			q r2 } |
			r8 dis-1 a-3 cis'-4( h-) a-3 |
			fis'-1( e'-0) dis'-3 a'-1( gis'-3) fis'-1 |
			cis''-4( h'-2) a'-2( gis'-1) fis'-4 e'-2 |
			
			dis'8-1_\markup\italic "(rit.)" cis'-3 h c'-1 \priraz dis'16-1 cis'8-2 h
		}
		{
			<< { e'2.-0 | e' | e' | e' | } \\ { e, | cis-1 |c-1 | c-2 } >> |
			d'8-4( c'-1) e'_\markup\italic "(rit.)" dis'-3 fis'-1( e')
			gis'4-3 gis'8( e'-0) gis' a'-4 |

			gis'( e') gis'4-3 e'-4 |
			h gis <cis' a> |
			<e'-2 cis'>4 q <fis' cis'>^"II" |
			<gis' dis' h>4\strum r2 |
			<h' fis' dis'>4\strum r2 |

			r4 cis8( h,) cis-. h,-. |
			cis4-- h,-- cis-- |
			h,-- cis-- h,-- |
			e,-- h,---2 e-.-2 |

			gis-.-1 h-.-4 e'-.-1 |
			gis'-.-4 r2 |
			<e' h gis>8\strum r4. r4 |
			<e' h gis>8\strum r4. r4 \bar "|."
		}
	}
}

basses = {
	\global
	\voiceTwo
	\shiftOn

	h,2.-2~ |
	h,4 h, h, |
	h,2.-1~ |
	h,4 h, h, |
	
	h,2.-1~ |
	h,4 h, h, |
	r h, h, |
	h,2. |
	h4-> h-> h->

	\repeat volta 3
	{
		<h-0 e,>2.~_\markup\italic "con gracia" |
		q4 r gis,-3 |
		a, dis-1 cis-3 |
		h,4. cis8-1( dis-3 e-4) |

		<cis'-3 fis-1>4 r <dis' h,> |
		e, r2 |
		c4 c c |
		h,8( c-3) h, a, g,-2 fis,-1 |
		
		e,4 r2 |
		e,4 r gis,-3 |
		a, dis cis |h,4. cis8-1( dis-3) fis-4 |

		<cis' fis>4\strum r <dis'-2 h,> |
		<ais cis-2> r <gis-4> |
		c c h, |
	}
	\alternative
	{
		{
			<gis-2 e-3>4 e,8 r4. |

			\key e \minor
			c2-3 d4 |
			g2. |
			\slurUp
			d4-> d-> d-> |r8 g-4( fis-3) e d-4( c-2) |
			\slurDown

			h,4-1 r c-2 |
			a,-1 r2 |
			h,4-2 h, d |
			g, r2 |

			<a-3 h,-2>2. |
			q |
			<g a,>2 r4 |
			s2. |

			<< { dis'2. | e' | dis' | e' | dis' | \flag g'^\ffXII | } \\ { <fis-3 h,-1> <g h,> <fis h,> <g h,> <fis h,> \flag a_\ffXII | } >> |
			s2. |
			s |

			d | d | d | s | d | d |
			c2-2 h,4 |
			a,-0 g,-4 fis,-2 |

			h,2.-2~ | h, | h,~ | h, |

			\key e \major
			h, | h, | h, | s |
		}
		{
			<gis-2 e-3>4 e, r |
			\repeat unfold 2 { cis-1 r c | }
			\barre "VI" { r8 h, gis cis' f' cis' } |
			s2. |
			<< { \stemDown g8\rest fis-1 cis'-4 gis-1 } \\ { a,2 } >> <a-3 dis-1>4 |
			gis2.-3 |

			<< { \stemDown gis,2-- } \\ { s4 b---4 } >> c'---4 |
			r8 cis8-1 cis cis h,4-1 |
			b,4-1 r2 |
			s2. |

			r4 <gis' dis' h>8 r4. |
			s2. |
			r4 dis-2 dis |
			r4 gis,8( h,) b,( gis,) |

			h,2.~ |
			h,4 gis,8( h,) b,( gis,) |
			h,2-2 r4 |
			s2. | s | s |
		}
		{
			g8\rest gis-3 a-4( gis) a-. gis-. |
			g8\rest gis-3 a-4( gis) a-. gis-. |

			g8\rest fis-2 gis-4( fis) gis-. fis-. |
			g8\rest a-1 h( a) h a |
			s2. |
			<h e,>4_\markup\italic "(a tempo)" r2 |
			s2. |
			r4 <e gis,> <e a,> |
			<gis cis> q <ais e> |
			<gis dis gis,>4\strum r2 |
			<a fis h,>4\strum r2 |

			e,2. |
			\repeat unfold 5 { s2. | }
			<e h, e,>8\strum r4. r4 |
			\override TextScript.extra-offset = #'(1 . -4)
			<e h, e,>8\strum r4. r4_\markup\tiny "15. X. 2015 D." |
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

		page-count = #2

		print-page-number = ##f

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
			tempoWholesPerMinute = #(ly:make-moment 170 4)
		}
	}
}
