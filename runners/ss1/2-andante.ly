\version "2.18.0"
\language "deutsch"

\header {
	title = ""
	subtitle = ""
	composer = ""
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
movetext = #(define-music-function (parser location how) (pair?) #{ \override TextScript.extra-offset = #how #} )
freezetext = \movetext #'(0 . 0)
sp = #(define-music-function (parser location how) (pair?) #{ \override Arpeggio.positions = #how #} )
priraz = #(define-music-function (parser location music) (ly:music?) #{ \acciaccatura #music #} )
normstems = \revert Stem.details
extStrum = \override Arpeggio.positions = #'(-4 . 4)
normStrum = \revert Arpeggio.positions
empty = { \once \hide NoteHead \once \override NoteHead.no-ledgers = ##t }
vacuum = { \hide NoteHead \override NoteHead.no-ledgers = ##t }
visible = { \undo \hide NoteHead \revert NoteHead.no-ledgers }
tamb = \markup { T }
coda = \mark\markup\fontsize #4 \musicglyph #"scripts.coda"
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

osm = \set Staff.ottavation = \markup{\override #'(word-space . 0) \line{\large\sans\bold "8" \small\raise #1 \underline"a"}}
patnact = \set Staff.ottavation = \markup{\override #'(word-space . 0) \line{\large\sans\bold "15" \small\raise #1 \underline"a"}}

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
	\time 4/4
	\key g \minor
	\set fingeringOrientations = #'(left)
	\set stringNumberOrientations = #'(down)
	\mergeDifferentlyHeadedOn
	\mergeDifferentlyDottedOn
	\override Score.BarNumber.self-alignment-X = #LEFT
	\override Glissando.breakable = ##t
	\override Glissando.after-line-breaking = ##t
	\override Glissando.minimum-length = #6
	\override Glissando.springs-and-rods = #ly:spanner::set-spacing-rods
	\set Score.tempoHideNote = ##t
	\override TupletBracket.bracket-visibility = ##t
	\override Staff.TimeSignature.break-visibility = ##(#f #t #t)
%	\set fontSize = #1
	\set Score.voltaSpannerDuration = #(ly:make-moment 6/8)

	\override Rest.staff-position = #0
	\override MultiMeasureRest.staff-position = #2
}

lining = {
	\global

}

rhmelody = {	
	\global
	\voiceOne
	\tupletUp
	\slurDown

	\tempo\markup\sans\large\bold "Andante sostenuto quasi adagio."

	\transpose c c'
	{
		R1 |
		r4_\markup\caps "Solo." r16 fis g16.\strum a32 g4 r8 d' |
		d'4~ d'16 b a g fis\strum a d8 r4 |

		r4 r16 g a16.\strum b32 f4 r8 d |
		es4~ es16 d es f es\strum c d8 r4 |
		<es d b,>\strum\< g8.\strum fis16 g4\strum b8.\strum\! a16 |
		\grace{a,16 d g a} << { <d' a>2 s } \\ { <d a,> s } \\ { g4 fis g-> a-> } >> |

		b4-> es'-> d'-> <c' c>-> |
		<b b,>-> <g g,>-> <fis fis,>-> <g g,>-> |
		<d' d>1---> |

		r8 <b' d' b>8~_\markup{\dynamic "mf" \italic "rubato."} \tupletSpan 8 \times 2/3 { \repeat unfold 6 q16-. } \repeat unfold 2 { q-. <f' d' b>-. \times 2/3 { <a' es' b>-. <g' es' b>-. <f' es' b>-. } } |
		<b' d' b>-.\> <f' d' b>-. \times 2/3 { <a' es' b>-. <g' es' b>-. <f' es' b>-. }  <b' d' b>-. <f' d' b>-. \times 2/3 { <a' es' b>-. <g' es' b>-. <f' es' b>-. } <b' d' b>-._\markup\italic "rit."  <f' d' b>-. <b' d' b>-. <f' d' b>-. \priraz{a16 c' f'} a'4\trill^\fermata\! |
		\tempo 4 = 84
		\cadenzaOn \set fontSize = #-4
			\transpose c c' { gis32[_\markup\column\italic{"rapido e" "delicato"} a c' f' a' f' c' a] s s \bar ""
			c'[ f a c' f' c' a f] s s \bar ""
			a[ c f a c' a f c] s s \bar ""
			f[ a, c f a f c a,] s s \bar ""}
			c'[ f a c' f' c' a f] s s \bar ""
			a[ c f a c' a f c] s s \bar ""
			f[ a, c f a f c a,] s s \bar ""
			\clef "bass" \transpose c c, { c[ f a c f' c a f] s s \bar ""
			a[ c f a c' a f c] s s \bar ""
			f[ a, c f a f c a,] s s \bar ""
			c[ a, c f] a[ e b e] \bar "" }
			\clef "treble" a,[ a, c f] a[ e b e] a[ a c f] a'[ e b' e] a'[ a' c'' f''] \bar ""
			\ottava #1 \osm \transpose c c'' { a[ e b e] a[ c f a c' e b e] a[ c f a c' e b e] a[ c f a c' f' a' f' c' a f c } \ottava #0 a' f' c' a f c] \bar ""
			\change Staff = "LH" a,[ f, c, f, a, \slurUp \change Staff = "RH" c f a c'16-.( f'-. a'-. c''-. f''-.)] \bar ""
		\cadenzaOff |

		
	}
}

rhbass = {
	\global
	\voiceTwo
	\slurUp
	
	\transpose c c'
	{
		s1 |
		s4 s8_\markup{\dynamic p \italic "espressivo"} <d a,>\strum d4 s |
		d4~ d16 d c b, <d a,>8\strum s4. |

		s4. <d b,>8\strum c4 s |
		<a g,>4 a, s2 |
		s4 <es c>\strum d\strum <g es>\strum |
		s2 d8\rest <d b,> d\rest <d c a,> |

		e\rest <d b, g,> e\rest <g es c g,> g\rest <fis c fis,> s4 |
		s1 |
		s |

		%\cadenzaOn \repeat unfold 184 { s32 } \cadenzaOff |
	}
}

lh = {
	\global

	R1 |
	r4. <c c,>8 <b b,>4 r |
	<a fis>4( <b g>8) r <d d,>4 r |

	r4. <g, g,,>8 <a, a,,>4 r8. h,16 |
	c8 c, <f, f,,>4 <b f b, b,,>\strum r |
	<g, g,,> <a, a,,> <b, b,,> <c c,> |
	\priraz <d d,>8 q2-> << { g4-> a-> } \\ { b,8\rest_\markup{\dynamic "p" \italic "sempre."} <d g,> b,\rest <d fis,> } >> |

	<< { b4-> es'-> d'-> } \\ { b,8\rest <d g,> b,\rest <c c,> b,\rest <a a,> } >> r16 <fis, fis,,>16_\markup\italic "marcato" <g, g,,>16. <a, a,,>32 |
	<g, g,,>4 r8 <es es,> <d d,>4~ q16 <b, b,,> <a, a,,> <g, g,,> |
	<fis, fis,,> <a, a,,> <d, d,,>8 r2. |

	<b, b,,>8 \clef "treble"
	\transpose c c'
	{
		<f d b,>8~ \tupletSpan 8 \times 2/3 { \repeat unfold 6 q16 } q q \times 2/3 { \repeat unfold 3 <f c b,> } <f d b,> q \times 2/3 { <f c b,> q q } |
		\repeat unfold 2 { <f d b,> q \times 2/3 { <f c b,> q q } } <f d b,> q q q <f c f,>4\strum^\fermata |
		\cadenzaOn \set fontSize = #-4 
			s4 des''32[ f'] s4 b'32[ des'] s4 ges'32[ b] s4 des'32[ ges] s4 b32[ des] s4 ges32[ b,]
	}
			\clef "bass" s4 des'32[ ges] s4 b32[ des] s4 ges32[ b] s4 des32[ f,] s8 r32 ges[ c ges]
			f16([ f,)] r32 ges'[ c' ges'] f'16([ f)] r32 \clef "treble" \transpose c c'' { ges[ c ges] f16([ f,)]
			\ottava #1 \osm \repeat unfold 2 { r32 ges'[ c' ges'] f'16([ f]) } r32 ges'[ c' ges']
			f'[ f a c' f' a' c'' a' f' c' a f \ottava #0 } c'' a' f' c' a f]
			\clef "bass" \stemDown c[ a, f, a, c f a \change Staff = "RH" c' f'16 a' c'' f'' a'']
		\cadenzaOff |

}

redrh = {
	\global

	\transpose c c'
	{
		r8\pp <d b,>-. r <d c>-. r <g d>-. r <g c>-. |
		r <fis a,>-. r <fis d>-. r <g d>-. r <d b,>-. |
		r <d a,>-. r <d b,>-. r <fis a,>-. r <fis d>-. |

		r <g d>-. r <d b,>-. r <f c>-. r <f d g,>-. |
		r <es c g,>-. r <c a,>-. r <d b,>-. r <d c>-. |
		r <es b,>-. r <es c>-. r <g d>-. r <g es>-. |
		r <g d a,>-. r <fis d a,>-. r2 |

		r2.. <d a,>8-. |
		r <d b,>-. r <c g,>-. r d-. r <d g,>-. |
		r16\pp << { b'( a' g' fis' a' d'8) s2 } \\ { s8. g16\rest b( a g fis a d8) s4 } >> |
	}
}

redlh = {
	\global

	<g, g,,>4-> <a, a,,>-> <b, b,,>-> <es es,>-> |
	<d d,>-> <c c,>-> <b, b,,>-> <g, g,,>-> |
	<fis, fis,,>-> <g, g,,>-> <d d,>-> <c c,>-> |

	<b, b,,>-> <g, g,,>-> <a, a,,>-> <h, h,,>-> |
	<c c,>-> <f, f,,>-> <b, b,,>-> <a, a,,>-> |
	<g, g,,>-> <a, a,,>-> <b, b,,>-> <c c,>-> |
	<d d,>-> <d, d,,>-> r2 |

	r2.. <fis, fis,,>8-. |
	r <g, g,,>-. r <es es,>-. r <d d,>-. r <b, b,,>-. |
	r2 << { b16\rest b( a g fis a d8) } \\ { s4 g,16\rest <es es,>( <d d,> <c c,>) } >> |
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
		indent = #24
		left-margin = #5
		right-margin = #5
		top-margin = #3
		bottom-margin = #6

		page-breaking = #ly:one-line-breaking

}

\score {
	\new StaffGroup
	<<
		\new PianoStaff \with {
			instrumentName = \markup\small\center-column{"PIANO" "PRINCIPAL"}
		} {
			\set PianoStaff.connectArpeggios = ##t
			<<
				\new Staff = "RH" { <<
					\new Voice { \clef "treble" \rhmelody }
					\new Voice { \clef "treble" \rhbass }
					\new Voice { \clef "treble" \lining }
				>> }
				\new Staff = "LH" {
					\new Voice { \clef "bass" \lh }
				}
			>>
		}

		\new PianoStaff \with {
			instrumentName = \markup\small\center-column{"Réduction" "de l'orchestre"}
		} {
			\set PianoStaff.connectArpeggios = ##t
			<<
				\new Staff = "RH" {
					\magnifyStaff #0.8
					\new Voice { \clef "treble" \redrh }
				}
				\new Staff = "LH" {
					\magnifyStaff #0.8
					\new Voice { \clef "bass" \redlh }
				}
			>>
		}
	>>
	\layout {  }
	\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 84 8) } } 
}
