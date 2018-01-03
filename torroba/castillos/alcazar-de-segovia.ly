\version "2.18.0"
\language "deutsch"

\header {
	title = "Alcazar de Segovia"
	subtitle = "(„Volání do zbraně“)"
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
	\key a \major
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
	\set Score.voltaSpannerDuration = #(ly:make-moment 2/1)
}

lining = {
	\global

	\repeat unfold 7 { s2. | \noBreak } s | \break
	\repeat unfold 7 { s2. | \noBreak } s | \break
	\repeat unfold 5 { s2. | \noBreak } s | \break
	\repeat unfold 3 { s2. | \noBreak } s | \break
	\repeat unfold 6 { s2. | \noBreak } s | \break
	\repeat unfold 5 { s2. | \noBreak } s | \break
	\repeat unfold 6 { s2. | \noBreak } s | \break
	\repeat unfold 5 { s2. | \noBreak } s | \break
	\repeat unfold 7 { s2. | \noBreak } s | \break
	\repeat unfold 5 { s2. | \noBreak } s | \break
	\repeat unfold 8 { s2. | \noBreak } s | \break

}

melody = {	
	\global
	\voiceOne
	\tupletUp
	\slurDown
	\set tupletSpannerDuration = #(ly:make-moment 3 4)

	\tempo \markup \sans \bold "Allegro moderato"

	\repeat volta 2
	{
		\repeat percent 2 { <e' cis' a>8 q q <d' h fis> <e' cis' a>4 | }
		<e' cis' a>8 q q d' e' g' |

		fis' \priraz{gis'16 fis'} e'8 d' << { e'4. } \\ { cis } >> |
		\repeat percent 2 { <h' fis' d' a>8 <h' fis' d'> q <a' c'> fis'4 | }

		<h' fis' d'>8 d''[ cis'' h' \priraz{cis''16 h'} a'8 gis' |
		fis' e' d' d' \priraz{e'16 d'} cis'8 d'] |
		\repeat percent 2 { <e' cis' a>8 q q <d' h fis> <e' cis' a>4 | }

		<e' cis' a>8 q q d' e' g' |
		fis' \priraz{gis'16 fis'} e'8 d' << { e'4. } \\ { cis } >> |

		\repeat percent 2 { <h' g' cis'>8 e q <a' fis' d'> d''4 | }
		fis'8 d' a a' es' c' |

		<a' cis'> fis' e' d' \priraz{e'16 d'} cis'8 h |
		r <gis' d' his> h' <a' e' cis'>4. |
		\key a \minor
		r8 <a' e' c'> r4 q8 r |

		r8 <a' e' c'> r4 q8 r |
		r8 <e' c'> r4 q8 r |
		c'8 a'16[ g' fis' e' d' c' h a g fis] |

		r8 <e' h g> r4 q8 r |
		r <fis' dis' a>4 r4. |
		r16 h c' d' c' h r e' fis' g' fis' e' |

		r h'[ g' fis' e' cis' h g e cis h, g,] |
		r h( cis') d' cis' h r e'( fis') g' fis' e' |
		r h'( cis'') d'' cis'' h' r b'( fis' e' d' cis') |
	}
	\alternative
	{
		{
			h4. h |
			h h |
			h r8 h fis' |
			
			\key a \major
			r <fis' cis' a>( a') r q( a') |
			\repeat percent 2 { r <fis' d'> h'[ a' gis' \priraz{a'16 gis'} fis'8] | }
			r8 <h' fis' d'>4 r4. |
			r8 <h' fis' d''>4 r4. |
			\repeat percent 2 { r8 <fis' d' a> q q( gis'4) | }
			r8 \new Voice << { \stemUp h' h' h' cis'' h' | \repeat unfold 3 { cis'' h' } | } { \repeat unfold 11 { <fis' d'> } | } >> 
		}
		{
			h4.~ h4 e'8 |
			h4.~ h4 gis'8 |
		}
	}

	\key as \major
	r8 es'4:16 es'16 des' f'8 es' |
	r des'4:16 des'16 c' es'8 des' |
	r c'4:16 c'16 b des'8 c' |
	r as'4:16 as'16 g' c''8 b' |
	<as' es' c' as> c'4:16 c'16 des' c'8 f' |

	r c'4:16 c'16 des' c'8 f' |
	r c'4:16 r16 des'16( c') f'( es') b'( |
	as') f'( es' c') es'( f') as'( f' es' f') as' b' |
	\key c \major
	\repeat percent 2 { c''2 r4 } 
	r8 a'16 e' c' e' r8 <a' e' c'> r |
	
	\repeat percent 2 { r8 e'16 c' fis c' r8 <e' c' fis> r | }
	\repeat percent 2 { r8 e'16 b g b r8 <e' b g> r | }
	\repeat percent 2 { r8 es'16 a fis a r8 <es' a fis> r | }
	r16 fis' d' a d' fis' a'8[ gis' fis' |
	\priraz{e'16 fis'} e'8 d' cis' h a gis] |
	
	cis'[ h a \priraz{gis16 a} gis8 fis f] |
	<e' cis' a>8 q q <d' h fis> <e' cis' a>4 |
	<gis' e' c'>8 q q <f' c' a> <gis' e' c'>4 |
	<b' f' d'>8 q q <as' es' c'> <b' f' d'>4 |
	<c'' as' es' c'>8 q q <b' fes' des'> <c'' as' es'>4 |
	\key a \major
	<h' gis' d'>8 q q q \priraz{cis''16 h'} <a' cis'>8 <gis' h> |

	\repeat percent 2 { <a' e' cis'>8 q q <fis' d' a> <gis' d' h>4 | }
	a'8 e' cis' h' fis' d' |
	r8 d''16[ cis'' h' a' gis' fis' e' d' cis' h] |
	\repeat percent 2 { r8 <e' cis' a> <e' cis'> <d' h fis> <e' cis' a>4 | }
	r8 <e' cis' a> <e' cis'> <d' h fis> <e' cis' a> <fis' d' a> |
	<a' e' a>4 q \priraz cis''16 <h' gis' d'>4 |
	<a' e' cis' a>2. \bar "|."
}

basses = {
	\global
	\voiceTwo

	\repeat volta 2
	{
		\repeat percent 2 { cis8 r4 r4. | }
		<e a,>8 r4 <h g a,>8 r4 |

		r4. h8\rest a a |
		\repeat percent 2 { <e e,>8 r4 es8 r4 | }

		<a fis e,>8 r4 r4. |
		s2. |
		\repeat percent 2 { <e a,>8 r4 r4. | }

		<e a,>8 r4 <g a,> r8 |
		r4. h8\rest a a |

		\repeat percent 2 { h,4.\rest d | }
		h, fis |

		e4 r8 <d e,>4 r8 |
		a,2 a,8 h, |
		\key a \minor
		c4( d8 e4 fis8)|

		g4 fis8 g4 fis8( |
		h4) a8 h4 a8 |
		s2. |

		h,4 c8 h,4 c8 |
		h,4 c8 h, \priraz d16 c8 h, |
		e,4. d |

		cis'4. h,\rest |
		fis, cis |
		g' fis |
	}
	\alternative
	{
		{
			r8 h, cis~ cis cis d~ |
			d d e~ e e fis |
			r g e' a,4. |
			\key a \major
			d4. dis |
			\repeat percent 2 { fis4.~ fis4 h,8 | }

			e4 fis8 gis a h |
			gis4 a8 h cis' d' |
			\repeat percent 2 { e,4.~ e,4 e8 | }
			<< { \stemDown e4. s } \\ { s8 \repeat unfold 5 a } >> |
			\repeat unfold 6 a |
		}
		{
			r8 <fis d> q <e cis> <fis d>4 | 
			r8 <gis e> q <fis d> <gis e>4 |
		}
	}
	\key as \major
	es4.( g8) r4 |
	<a es>4.( <as es>8) r4 |
	<g es>4. ges4. |
	f4 r8 f r4 |
	<es as,>8 r4 <g as,>4 r8 |

	<ges as,>4 r8 <f as,>4 r8 |
	<fes as,>4 r8 <es as,>8 r4 |
	s2.
	\key c \major
	\repeat percent 2 { r8 <g' e' c' g> q q <a' f' c' g> g, | }
	a,4. h,4 c8 |
	
	\repeat percent 2 { e4. d4 a,8 | }
	\repeat percent 2 { d4. c4 g,8 | }
	\repeat percent 2 { c4. h,4 fis,8 | }
	e,2. |
	s |

	s | 
	<e a,>4. r |
	c r |
	<f b,>8 r4 c8 <f b,>4 |
	c4. r |
	\key a \major
	e,2. |

	\repeat percent 2 { <e a,~>4. <d a,~>8 <e a,>4 | }
	a,4. h, |
	e, r |
	\repeat percent 2 { <e a,>8 r4 r4. | }
	<e a,>8 r2 d8 |
	a,4 a, e|
	<a e a,>2.-\tweak extra-offset #'(0 . -2) _\markup\tiny "10. X. 2015 D." |
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
			tempoWholesPerMinute = #(ly:make-moment 110 4)
		}
	}
}
