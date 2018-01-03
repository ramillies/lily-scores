\version "2.18.0"
\language "deutsch"

\header {
	title = "Preludium č. 7 cis moll"
	subtitle = "(z „Dobře temperovaných kytar“)"
	composer = "M. Castelnuovo-Tedesco"
	poet = ""
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
	\key cis \minor
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
}

lining = {
	\global
	\repeat unfold 2 { s1 \noBreak | } s \break |
	\repeat unfold 2 { s1 \noBreak | } s \break |
	\repeat unfold 2 { s1 \noBreak | } s \break |
	\repeat unfold 4 { s1 \noBreak | } s \break |
	\repeat unfold 3 { s1 \noBreak | } s \break |
	\repeat unfold 4 { s1 \noBreak | } s \break |

	\repeat unfold 3 { s1 \noBreak | } s \break |
	\repeat unfold 2 { s1 \noBreak | } s \break |
	\repeat unfold 3 { s1 \noBreak | } s \break |
}

one = {	
	\global
	\voiceOne
	\tupletDown
	\slurDown
	\stemUp
	
	r8 gis16[ cis e8 fis] gis[ gis16 cis e8 fis] |
	gis[ <cis' gis> q <c' gis> q <h gis> q b] |
	a[ cis'16 fis a8 <h fis>] <cis' a>[ cis'16 fis a8 <h fis>] |

	<cis' a>[ <fis' cis' a> q <f' cis' a> q <e' cis' a> q <dis' a>] |
	<dis' his fis>[ fis16 his dis'8 gis'] e'16 d' his g f4 |
	<dis' his fis>8[ fis16 his dis'8 gis'] e'16 d' his g f4 |

	r8 d16[ g h8 dis16 gis his8 e16 a cis'8 f16 b |
	d' fis h dis' g c' e' as des' f' a d' fis' b es' g'] |

	<gis' e' cis'>16[ \repeat unfold 12 { e' } e'^\markup\italic "Simile" e' e'] |
	\repeat unfold 7 { \repeat tremolo 16 e'16 | }
	\override Beam.positions = #'(4 . 3)
	<d' fis>8[ fis'16 h d'8 e'] fis'4 <g' d' b> | 

	<d' fis>8[ fis'16 h d'8 e'] fis'4 <g' d' b> | 
	\revert Beam.positions
	<d' fis>8 \stemDown <h' fis'>[ q <a' e'> q <g' d'> q <fis' cis'> |
	<fis' cis'> <e' h> q <d' a> q <cis' gis> q <h fis>] |
	\stemUp <des' h eis>[ gis16 cis eis8 fis] gis4 <d' h eis cis> |

	<cis' ais>4 r r <d' ais> |
	\override Beam.positions = #'(4 . 3.2)
	h8[ fis'16 h d'8 e'] <fis' h>[ fis'16 h d'8 e'] |
	\revert Beam.positions
	<fis' h> <h' fis' d'> q <b' fis' d'> q <a' fis' d'> q <gis' d'> |

	<g' d'>8 d'16 g h8 cis' <d' g> d'16 g h8 cis' |
	<d' g>8 <g' d' h> q <fis' d' h> q <f' d' h> q <fis' d' h> |
	<ges' e' b>[ cis''16 fis' ais'8 h'] <cis'' ais' fis'>4 <d'' h' g'> |
	<cis'' ais' fis'>8[ cis'16 fis ais8 h] <cis' ais fis>4 <d' h g> |

	<e' cis' a>8[ e''16 a' cis''8 d''] <e'' cis'' a'>4 <f'' d'' b'> |
	<e'' cis'' a'>8[ e'16 a cis'8 d'] <e' cis' a>4 <f' d' b> |
	<g' e' c'>8 g''16 c'' e''4 r8 g16 c e8 r |

	<gis' fis' c'>8 gis''16 c'' dis''4 r8 gis16 c dis8 r |
	\repeat unfold 2 { <gis' e' cis'>8[ gis'16 cis' e'8 fis'] } |
	<gis' e' cis'>8 <cis'' gis' e'> q <c'' gis' e'> q <h' gis' e'> q <b' e'> |

	<a' e'>8[ cis''16 fis' a'8 h'] <cis'' a' fis'>8[ cis''16 fis' a'8 h'] |
	<cis'' a' fis'>8[ <fis'' cis'' a'> q <f'' cis'' a'> q <e'' cis'' a'> q <dis'' a'>] |
	<d'' a'>8[ fis'16 a' d''8 fis''] f''16 d'' h' g' f'4 |

	r8 fis'16 a' cis''8 fis'' f''16 d'' h' g' f'4 \bar "||"
	\time 2/4 r8 fis'16 a' cis''8 fis'' \bar "||"
	\time 4/4 f''16[ d'' h' g' d'' h' g' f' h' g' f' d' g' f' d' h] |

	g2 r |
	r <e' c' fis> |
	<cis' gis>4 r8 <cis' a> <cis' gis>4 r8 <cis' a> |
	<cis' gis fis>8[ gis16 cis e8 fis] gis[ gis16 cis e8 fis] |
	gis2 r |

	r8 h h( his) his( cis') cis'( dis') |
	cis'4 r <cis' g> r |
	<cis' gis e>1  \bar "|."
}

one_bass = {
	\global
	\voiceTwo

	s1 | r8 e e e e e e e | e4 r2. | \repeat unfold 13 { s1 | }
	h,4 r r e |

	h, r r e |
	h, r2. |
	s1 |
	s1 |

	<e fis,>8[ cis16 fis, ais,8 h,] cis4 <e fis,> |
	<d h,>4 r2. |
	\repeat unfold 15 { s1 | }
	\time 2/4 s2 |
	\time 4/4 s1 |

	s1 |
	r2 gis, |
	cis4 r e r |
	s1 |
	s |

	s |
	r2 a,4 r |
	cis1 |
}

two = {
	\global
	\voiceOne
	\stemUp
	\slurUp
	\tupletUp

	gis4 r gis r |
	gis r gis r | 
	fis r fis r |
	fis r fis r |

	gis r g r |
	gis r g r |
	g r g r |
	g r g r |

	<gis cis>8[ gis16 cis e8 fis] <gis cis>[ gis16 cis e8 fis] |
	gis <gis cis'> q <c' gis> q <h gis> q b |
	a4 r2. |

	r8 a[ a gis gis g g fis] |
	\override Beam.positions = #'(6 . 5)
	fis [cis''16 fis' ais'8 h'] cis''4 <d' g>4 |
	<fis cis'>8[ cis''16 fis' ais'8 h'] cis''4 <d' g>4 |
	\override Beam.positions = #'(8 . 4)
	<fis cis'>8[ <fis'' cis''> q <e'' h'> q <d'' a'> q <cis'' g'> |

	q <h' fis'> q <a' e'> q <g' d'> <fis' cis'> <e' h>] |
	\revert Beam.positions
	<fis' cis'>8[ h16 h h h h h h h h h d' d' d' d']^\markup\italic "Simile" |
	\repeat tremolo 12 h16 \repeat tremolo 4 d'16 |

	\repeat unfold 3 { \repeat tremolo 16 h16 | }

	\repeat tremolo 16 b16|
	<h fis h,>4 r8 fis16 h d8 e <fis h,> fis16 h, |
	r4 fis8[ <h fis> q q q q] |

	<h g>4 r2. |
	r4. g8[ g g g g] |
	fis4 r8 cis'16 fis ais8 h cis' d' |
	e'4 r2. |

	g4 r8 e'16 a cis'8 d' e' f' |
	g'4 r2 r8 f |
	<b g c>4 r8 g'16 c' e'8 r4 g,8 |
	gis4 r8 gis'16 c' dis'4 r |

	<gis cis>8 r4 gis16 cis e8 fis gis gis16 cis |
	e8 fis gis <cis' gis> q q q q |
	<cis' a cis>4 r8 cis'16 fis <a cis>8 h cis' cis'16 fis |
	<a cis>8 h cis' <fis' cis' a> q q q q |
	
	<d' a cis>4 r <h g cis>8 d16 g h8 d' |
	<cis' cis>16 a fis d cis4 <h g cis>8 d16 g h8 d' |
	\time 2/4 <cis' cis>16 a fis d cis4 |
	\time 4/4 <h g cis>4 r4. g16 d h,8 g, |

	h,16[ d f g d f g h f g h d' g h d' f'] |
	\repeat tremolo 16 e'16 |
	cis'8[ gis16 cis e8 fis] <gis cis>[ gis16 cis e8 fis] |

	gis4 r2. |
	r8 <cis' a>[ q <c' a> q <h fis> q a] |
	as2 <as fis> |
	gis1~ |
	\override TextScript.extra-offset = #'(0.4 . -2.5)
	gis_\markup\tiny{16. III. 2015 D.} |

}

two_bass = {
	\global
	\voiceTwo
	\stemDown
	\shiftOn

	\repeat unfold 4 { cis4 r8 <dis gis,>8 cis4 r8 q | }

	\repeat unfold 2 { cis4 r8 gis, d4 r8 gis, | }
	\repeat unfold 2 { d4 r8 gis, d4 r8 gis, | }

	s1 |
	cis8[ e e e e e e e] |
	\repeat unfold 2 { <e cis>8[ e16 a, cis8 dis] } |

	<e a,>8[ <e cis> q q q q q cis] |
	\repeat unfold 2 { <e ais,>4 r2 <e h,>4 | }
	<e b,>4 r2. |

	\repeat unfold 8 { s1 | }
	d8[ e h, d d d d d] |

	d4 r8 d16 g, h8 cis d d16 g, |
	h,8[ cis d <d h,> q q q q]
	<cis fis,>4 r2. |
	r4. cis16 fis, ais,8 h, cis d |

	<e a,>4 r2. |
	r4. e16 a, cis8 d e4 |
	s1 |
	<dis gis,>4 r2 r8 gis, |

	s1 |
	e4 r8 e e e e e |

	\repeat unfold 4 { s1 | }
	s2 |
	\repeat unfold 4 { s1 | }

	cis4 r8 <dis gis,> <e cis>4 r8 <dis gis,> |
	<e cis>8[ <e a,>8 q q q q q q] |
	<e h, e,>2 <dis gis,> |
	<e cis>1~ |
	q |

}
\paper
{
		#(define fonts (make-pango-font-tree "Georgia" "Arial" "Courier New" 1 ) )
		system-system-spacing #'basic-distance = #10
		indent = #13
		left-margin = #8
		right-margin = #5
		top-margin = #3
		bottom-margin = #6

		page-count = #2
}

\score {
	\new StaffGroup 
	<<
		\new Staff \with {
			instrumentName = \markup\center-column{"Kytara" "I"}
		} {
			<<
				\new Voice { \clef "treble_8" \one }
				\new Voice { \clef "treble_8" \one_bass }
				\new Voice { \clef "treble_8" \lining }
			>>
		}

		\new Staff \with {
			instrumentName = \markup\center-column{"Kytara" "II"}
		} {
			<<
				\new Voice { \clef "treble_8" \two }
				\new Voice { \clef "treble_8" \two_bass }
				\new Voice { \clef "treble_8" \lining }
			>>
		}
	>>

	\layout { }
}

\score {
	\new StaffGroup 
	<<
		\new Staff \with {
			midiInstrument = "acoustic guitar (steel)"
			instrumentName = "Kytara"
		} {
			<<
				\new Voice { \clef "treble_8" \unfoldRepeats \one }
				\new Voice { \clef "treble_8" \unfoldRepeats \one_bass }
			>>
		}

		\new Staff \with {
			midiInstrument = "acoustic guitar (steel)"
			instrumentName = "Kytara"
		} {
			<<
				\new Voice { \clef "treble_8" \unfoldRepeats \two }
				\new Voice { \clef "treble_8" \unfoldRepeats \two_bass }
			>>
		}
	>>

	\midi {
		\context {
			\Score
			tempoWholesPerMinute = #(ly:make-moment 110 4)
			\override SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/1)
		}
	}
}
