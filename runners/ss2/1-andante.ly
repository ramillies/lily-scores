\version "2.18.0"
\language "deutsch"

\include "/home/glorfindel/Music/lilypond/openlilylib/debugging-layout/display-control-points/display-curve-control-points.ly"

\header {
	title = ""
	subtitle = ""
	composer = ""
	%arranger = \markup\tiny "revise a prstoklady: Darek (II/2015)"
	poet = ""
	meter = ""
	tagline = ""
}
#(define (octave-up m t)
 (let* ((octave (1- t))
      (new-note (ly:music-deep-copy m))
      (new-pitch (ly:make-pitch
	(+ t (ly:pitch-octave (ly:music-property m 'pitch)))
        (ly:pitch-notename (ly:music-property m 'pitch))
        (ly:pitch-alteration (ly:music-property m 'pitch)))))
  (set! (ly:music-property new-note 'pitch) new-pitch)
  new-note))

#(define (octavize-chord elements t)
 (cond ((null? elements) elements)
     ((eq? (ly:music-property (car elements) 'name) 'NoteEvent)
       (cons (car elements)
             (cons (octave-up (car elements) t)
                   (octavize-chord (cdr elements) t))))
     (else (cons (car elements) (octavize-chord (cdr elements ) t)))))

#(define (octavize music t)
 (if (eq? (ly:music-property music 'name) 'EventChord)
       (ly:music-set-property! music 'elements (octavize-chord
(ly:music-property music 'elements) t)))
 music)

makeOctaves = #(define-music-function (parser location arg mus) (integer? ly:music?)
	(music-map (lambda (x) (octavize x arg)) (event-chord-wrap! mus)))
 
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
coda = \mark\markup\fontsize #4 \musicglyph #"scripts.coda"
segno = \mark\markup\musicglyph #"scripts.segno"

osm = \set Staff.ottavation = \markup{\override #'(word-space . 0) \concat{ { \override #'(font-name . "Monky Business")\large\sans\bold "8" } \small\raise #1 \underline"a"}}
osmvb = \set Staff.ottavation = \markup{\override #'(word-space . 0) \concat{ {\override #'(font-name . "Monky Business") \large\sans\bold "8" } \small\raise #1 \underline"a" \italic " bassa"}}
patnact = \set Staff.ottavation = \markup{\override #'(word-space . 0) \concat{ { \override #'(font-name . "Monky Business")\large\sans\bold "15" } \small\raise #1 \underline"ma"}}

strum = \arpeggio

lh = \change Staff = "LH"
rh = \change Staff = "RH"
slh = { \change Staff = "LH" \stemUp }
srh = { \change Staff = "RH" \stemDown }
mininotes = \set fontSize = #-4

global = {
	\time 4/4
	\key g \minor
	\set fingeringOrientations = #'(left)
	\set stringNumberOrientations = #'(down)
	\mergeDifferentlyHeadedOn
	\mergeDifferentlyDottedOn
	\override Score.BarNumber.self-alignment-X = #LEFT
	\override Beam.breakable = ##t
	\override Glissando.breakable = ##t
	\override Glissando.after-line-breaking = ##t
	\override Glissando.minimum-length = #6
	\override Glissando.springs-and-rods = #ly:spanner::set-spacing-rods
	\set Score.tempoHideNote = ##t
	\override TupletBracket.bracket-visibility = ##t
	\override Staff.TimeSignature.break-visibility = ##(#f #t #t)
	\set Score.voltaSpannerDuration = #(ly:make-moment 6/8)

	\override Rest.staff-position = #0
	\override MultiMeasureRest.staff-position = #2
}

lining = {
	\global

}

#(define-markup-command (main-tempo layout props text) (markup?)
  "Print a nicey tempo indication."
  (interpret-markup layout props
    #{\markup { \override #'(font-name . "Lovers Quarrel") \fontsize #7 #text }#}))

soloRHmelody = {	
	\global
	\voiceOne
	\tupletUp
	\slurDown

	%\tempo\markup\sans\large\bold "Andante sostenuto."
	\tempo\markup\main-tempo "Andante sostenuto."

	\cadenzaOn \accidentalStyle forget
	r16 \lh d,[ g, b,] \rh d[ b, a, b,] g,[ b, d fis] g[ d c d] b,[ d g b]
	<<
		{
			d'4~ d'16[ g h d'] c'4~ c'16[ g a c'] b4 r16 h[ d' b'] as'4~ \bar "" as'16[ c' es' as'] g'4 
			r16 d'[ es' c'] fis'4~ fis'16[ d' es' c'] g'4~ g'16[ d' es' c'] a'4~ a'16[ g' a' fis']
			\transpose c c''
			{
				\alterBroken padding #'(0.5 4) Staff.OttavaBracket
				c4~ c16[ b, c a,] es4~ es16[ c \ottava #1 \osm fis8~ fis16 es a8~] \bar "" a16[ fis c'8~ c'16 a es'8]~ 
			}
			\set fontSize = #-5.4
				\transpose c c'' { es'32[ d' c' b a g fis es \ottava #0 d c }
				\transpose c c' { b a g fis a es fis c es }
				a c' fis a es fis c es a, c \lh
				\transpose c c, { fis a es fis c es a, c a, fis, es,] fis,[ a, c es fis a c' } \rh
				es fis a c' es' fis' \alterBroken padding #'(4 0) Staff.OttavaBracket \ottava #1 \osm a' c'' es'' fis'' a'' c''']
			\normalsize \bar ""
			es'''16 \ottava #0 r <es'' fis' es'>8-^ <d'' fis' es'>-^ <c'' fis' es'>-^ 
			\revert Staff.OttavaBracket.padding

		}
		\\
		{
			r16 b[ g d] es4~ es16[ d es c] d4~ d16[ g d es] f4~ f16[ es f d] \bar "" es4~ es16[ d es c]
			a4~ a16[ d es c] b4~ b16[ d es c] \tempo\markup\sans\bold "Accelerando." c'4~ c'16[ g a fis] es'4~ es'16[ b c' a] fis'4~ fis'16[ d' es' c']
			\transpose c c' { a8.[ fis16 c'8. a16] \bar "" es'8.[ c'16 fis'8. es'16]  }
			\set fontSize = #-5.4
				\transpose c c' { a'32[ fis' es' d' c' b a g fis es d c }
				b a c' fis a es fis c es a, c \lh
				\transpose c c, { fis a es fis c es a, c }
				\transpose c c,, { fis a es fis c es c a,] g,[ a, c es fis a }
				\transpose c c, { c es fis a } \rh
				c es fis a c' es' fis' a' c'' es'']
			\normalsize \bar ""
			fis''16 s <a es c g,>8 q q 

		}
	>>

	<b' g' d' b>16-^ \mininotes g32[ b d' g' d' b g] \normalsize
	fis16-^-- \mininotes g32[ b d' g' d' b g] \normalsize
	d16-^-- \mininotes g32[ b d' g' d' b g] \normalsize
	\ottava #1 \osm <d''' d''>16-^ \ottava #0 \mininotes g32[ b d' g' d' b g] \normalsize

	s16 \mininotes g32[ b d' g' d' b g] \normalsize
	fis16-^-- \mininotes g32[ b d' g' d' b g] \normalsize
	d16-^-- \mininotes g32[ b d' g' d' b g] \normalsize
	\ottava #1 \osm <d''' d''>16-^ \ottava #0 \mininotes g32[ b d' g' d' b g] \normalsize \bar ""

	s16 \mininotes g32[ b d' g' d' b g] \normalsize
	fis16-^-- \mininotes g32[ b d' g' d' b g] \normalsize
	d16-^-- \mininotes g32[ b d' g' d' b g] \normalsize
	\ottava #1 \osm <d''' d''>16-^ \ottava #0 \mininotes g32[ b d' g' d' b g] \normalsize

	s16 \mininotes g32[ b d' g' d' b g] \normalsize
	fis16-^-- \mininotes g32[ b d' g' d' b g] \normalsize
	a16-^-- \mininotes b32[ d' g' b' g' d' b] \normalsize
	\transpose c c'
	{
		fis16-^-- \mininotes g32[ b d' g' d' b g] \normalsize
		a16-^-- \mininotes b32[ d' g' b' g' d' b] \normalsize
	}
	
	
	\once\alterBroken padding #'(1.7 5.1) Staff.OttavaBracket \ottava #1 \osm fis''16-^-- \bar ""
	\mininotes \transpose c c'' { g32[ b d' g' d' b g d \ottava #0 } \transpose c c' { b g d } b g d b, \lh g, d, b,,] \rh \normalsize
	r4 <b' g' d' b g d b,> r <a' g' cis' a g cis a,> r <c'' a' es' c' a es c a,> r <b' d' b d b,>
	\tempo\markup\sans\bold "Accelerando." r8 <d'' h' f' d' h f d>[ r <c'' ges' es' c' ges es> r <es'' c'' f' es' c' f> r <d'' as' f' d' as f d as,>
	r <f'' d'' g' f' g f d g,> r <e'' b' g' e' b g e b,> \tempo\markup\sans\bold "Rit." r <g'' cis'' b' g' cis' b g cis> r <b'' e'' cis'' b' e' cis' b e>]

	\cadenzaOff \bar "||"
	\accidentalStyle default
	\time 4/4
	r4 \clef "bass" \transpose c c, { d2\fff <c d>4~ | q <d h,> <d b,> <d a,> } \clef "treble" \bar "||"

	R1*4 |

	r4\mf <d' h gis d>8\strum r8 r2 |
	r4\p <g' es' c' g>8\strum r8 r2 |
	R1*2 |

	g'4->\(_\markup\italic "espressivo" d'~ d'16\) b a b fis8. fis16 |
	\priraz{g,16 c} <g es>4~ q8~ \times 2/3{q16 <f d> <es c>} <d b,>8 r d->~\< d32 g b d' |

	<f' es' c' f>4->\! <f'~ d' f>8\strum f'32 d' b g <fis d c>4 <g~ e cis>8 \times 2/3 { g16 a b } |
	<a fis d>4 r2. |

	<g'' b' g'>4->\(\f <d'' d'>~ q16\) <b' b> <a' a> <b' b> <fis' fis>8. q16 |
	<g' es' g>8 <g'' es''>~ \mininotes \once\override Beam.positions = #'(10 . 5) \times 8/12 { q32 <fis'' d''> <g'' es''> <es'' c''> <c'' g'> <g' es'> <es' c'> <c' g> <g es> q( <f d> <es c>) } \normalsize <d b,>8 r \tieDown d8_>~ d32\< g64 b d' g' b' d''\! |

	<f'' f'>16_\markup\italic "cresc." r8. f8->~ f32 b64\< d' f' b' d'' f'' <a'' a'>8\! r a8->~ a32\< d'64 f' a' d'' f'' a'' |
	\ottava #1 \osm <cis''' g'' cis''>16\f \ottava #0 r16 r4 r16 <b' b>16 q8->( <a' a>4) r8 |

	r <e b, e,>16\<( <f cis f,>32 <g e g,>)\! q16\>( <f cis f,>32 <e b, e,>) q16\! <cis'' cis'> q8->( <d'' d'>4) r8 |
	r16 <es b, es,>16_\markup\italic "cresc."( <fis d fis,>32 <g es g,>) q16 <es'' es'>->( fis'8.) r16 <g d g,>( <a f a,>32 <b g b,>) q16 <d' d>16( <c'' c'>8.) |

	r4 <h' h>16->\f( \ottava #1 \osm <as'' as'>8.) \ottava #0 r4 <g' g>16->( <f'' f'>8.) |
	<f'' f'>16->(_\markup\italic "appassionato" <es'' es'> q <d'' d'>) q( <c'' c'> q <h' h>) <d'' d'>->( <c'' c'> q <b' b>) q( <a' a> q <fis' fis>) |

	<a' a>16->( <g' g> q <f' f>) q( <es' es> q <d' d>) <f' f>->( <es' es> q <d' d>) q( <c' c> q <g g,>) |
	\tieNeutral <fis fis,>(\< <g g,> <a a,> <b b,>) q8->\! \lh <c b, g, c,>~ q \rh <c' b g c>-> <c'' b' g' c'>-> \ottava #1 \osm <c''' b'' g'' c''>-> |
	<des''' b'' g'' des''> \ottava #0 r <des b,>4.-^ <des' b g des>8-> <des'' b' g' des'>8->_\markup\italic "dim." \ottava #1 \osm <des''' b'' g'' des''> |

	<c''' g'' c''>8\strum \ottava #0 r4 <b' g' c' b>8\strum <a' f' c' a>\strum r4 <g' es' b g>8\strum |
	<f' es' c' f>8\strum\p r h,16\(\< c d es \tempo\markup\sans\bold "Rit." e f fis g a g-.\! f-. es-.\) |
	\tempo\markup\sans\bold "A tempo" <d b, f,>16\strum r d'4 a8 c'( b) r16 f8->( fis16 |

	g) r es'4( d'8) d'( c') r16 \tieUp g8->( gis16 |
	a8) g'4( f'8) f'->( es') \tieNeutral s4 |

	s1 |
	a16( b8 a b h16) h(\< c'8 h c' cis'16) |

	cis'16( d'8 cis' d' d'16) d'( es'8 es'16)\! es'(\> e' a' g')\! |
	\afterGrace f'2\startTrillSpan\< { e'16\stopTrillSpan f' } \afterGrace fis'2\startTrillSpan { eis'16\stopTrillSpan fis' } |
	\afterGrace g'2\startTrillSpan\! { fis'16\stopTrillSpan g' } \once\override PianoStaff.Arpeggio.extra-offset = #'(1.2 . 1) <c''~ g' c'>4\mf\strum c''32\> b' g' e' c' b a g\! |

	<< {s16( g a b a b <c' b> <d' b>)} { \repeat unfold 8 f-. } >> << { f'8([\strum es')] } \\ { <b g>4\strum } >> r8 <c' f es a,>\pp\strum |

	\set subdivideBeams = ##t
	\set baseMoment = #(ly:make-moment 1/8)
	\tempo 8 = 100
	r32_\markup\italic "tranquillo" \ottava #1 \osm \phrasingSlurDown \transpose c c'' { f\( f' es' d' c' b a g f es d \ottava #0 c b, a, b, c b, d b, } fis' d' b fis d' b fis d \lh b, fis, d d, |

	es, b,, g,, es,, g,, b,, es, g, b, \rh es g b es' g' es' b \tupletSpan 8 \times 2/3 { g16-. b-. c'-. g'-. b'-. c''-. } \ottava #1 \osm g''\) \ottava #0 r8. |
	R1 |

	\tempo\markup\main-tempo "Un poco animato" r16_\markup\italic "dolcissimo" \transpose c c''' { \ottava #2 \patnact f,32\( <f d> q <e cis> f, <es c> q <d b,> f, <c es,> q } \transpose c c'' { <b d> \ottava #1 \osm d <g es> q <f d>\) f,\( <f d> q <e cis> f, <es c> q <d b,> f, <c es,> q \ottava #0 } <b' d'> d' <g' es'> |

	\transpose c c'
	{
		q <f d>\) <b, d,>\( <c f,> <b, d,> <c f,> <d b,> <es c> <f d> <es c> <d b,> <es c> <f d> <g es> <f d> <a es> <b d> <c' f> <d' b> <es' c'> <f' d'> <es' c'> <d' b> <c' g> <b d> <c' f> <d' b> <es' c'> \ottava #1 \osm <f' d'> <g' es'> <a' f'> <b' g'> |
		<c'' a'>16\) c'32\( \transpose c c' { <c' a> q <h gis> c <b g> q <a f> c <g b,> q <f a,> a, <d b,> q <c a,>\) \ottava #0 } c\( <c' a> q <h gis> c <b g> q <a f> c <g b,> q <f a,> a, <d b,> | 
		<d b,> <c a,>\) <f a,>\( <a c> <f a,>\< <a c> <c' f> <f' a> <g' b> <f' a> <b es> <g b,> <f a,> <a c> <c' f> <f' a> <es' g> <b es> <g b,> <es g,>\! <d fis,>\> <fis a,> <a d> <d' fis> <d' f> <a d> <f a,> <d f,> <c f,> <f a,> <a c> <c' f>\! |
		<b d>16\) \transpose c c'' { \ottava #2 \patnact f,32\( <f d> q_\markup\italic "cresc. ed animato poco a poco" <e cis> f, <es c> q <d b,> f, <c es,> q } \transpose c c' { <b d> \ottava #1 \osm d <g es> q <f d>\) f,\( <f d> q <e cis> f, <es c> q <d b,> f, <c es,> q \ottava #0 } <b d> d <g es> |

		q <f d>\) <b, d,>\( <c f,> <b, d,> <c f,> <d b,> <es c> <f d> <es c> <d b,> <es c> <f d> <g es> <f d> <a es> <b d> <c' f> <d' b> <es' c'> <f' d'> <es' c'> <d' b> <c' g> <b d> <c' f> <d' b> <es' c'> \ottava #1 \osm <f' d'> <g' es'> <a' f'> <b' g'> |
		<g'' h'>16\) \transpose c c' { d32\( <d' h> q <cis' ais> d <c' a> q <h g> d <a c> q <g h,> h, <es c> q <d h,>\) } \ottava #0 d\( <d' h> q <cis' ais> d <c' a> q <h g> d <a c> q <g h,> h, <es c> |
		<es c> <d h,>\) <g, h,,>\( <a, d,> <g, h,,> <a, d,> <h, g,> <c a,> <d h,> <c a,> <h, g,> <c a,> <d h,> <es c> <d h,> <fis c> <g h,> <a d> <h g> <c' a> <d' h> <c' a> <h g> <c' a> \ottava #1 \osm \transpose c c' { <d h,> <es c> <f d> <g es> <a f> <h g> <c' a> <d' h> } |
	}

	\ottava #2 \patnact <g'' c''' g'''>16\) \ottava #0 \tempo\markup\main-tempo "Sempre più animato" g,32[ g] g fis g, f f e g, es es d g, d d c g, g g fis g, f f e g, es es d g, d |

	d-> c g, f f es c a a g es d' d' c' g f' f' es' c' a' a' g' es' d'' d'' c'' g' f'' f'' es'' c'' g'' |
	\ottava #1 \osm <g'' des'' g'>16 \ottava #0 b,32[ b] b a b, as as g b, g g ges b, f <f des g,>-> es b, b b a b, as as g b, g g ges b, f |
	<f des g,>-> es b, as as g des c' c' b g f' f' es' b as' as' g' des' c'' c'' b' g' f'' \ottava #1 \osm f'' es'' b' as'' as'' g'' des'' b'' |

	<b'' g'' d'' b'>16\f \ottava #0 \makeOctaves #-1 { \slh d32[ \srh d'] d' cis' \slh d \srh c' c' h \slh d \srh b b a \slh d \srh a } <a d a,>-> <g g,> \makeOctaves #-1 { \slh d[ \srh d'] d' cis' \slh d \srh c' c' h \slh d \srh b b a \slh d \srh a } |
	\stemUp <a d a,>-> << { \makeOctaves #-1 { g \slh d,[ \srh c'] c' b \slh \clef "treble" g\< \srh es' es' d' \slh b \srh a' a' g' \slh d' \srh c'' c'' b' \slh g' \srh es'' es'' d'' \slh b' \srh \ottava #1 \osm a'' a'' g'' \slh d'' \srh c''' c''' b'' \slh g''\! \clef "bass" \srh g''' } } { s8 s32 \slh b, s16. d32 s16. g32 s16. b32 s16. d'32 s16. g'32 s16. b'32 s \srh } >> |
	\ottava #2 \patnact <g''' cis''' b'' g''>16 \ottava #0 << { \makeOctaves #1 { \slh \clef "treble" g,32[ \srh g] g fis \slh g, \srh f f e \slh g, \srh es es d \slh g, \clef "bass" \srh d } } { \slh b, s16. b,32 s16. b,32 s16. b,32 s } >> <d' g d>-> <cis' cis> << { \makeOctaves #1 { \slh \clef "treble" g,32[ \srh g] g fis \slh g, \srh f f e \slh g, \srh es es d \slh g, \clef "bass" \srh d } } { \slh b, s16. b,32 s16. b,32 s16. b,32 s } >> |

	<d' g d>-> <cis' cis> << { \makeOctaves #1 { \slh \clef "treble" g,[ \srh f] f e \slh b, \srh a a g \slh cis \srh cis' cis' b \slh e \srh d' d' cis' \slh g \srh f' f' e' \slh b \srh a' \ottava #1 \osm a' g' \slh cis' \srh c'' c'' b' \slh e' \clef "bass" \srh g'' } } { \slh b,32 s16. cis32 s16. e32 s16. g32 s16. b32 s16. cis'32 s16. e'32 s16. g'32 \srh cis''' } >> \ottava #0 |

	\makeOctaves #1 { \transpose c c, { \slh d,,32-^\ff \srh \slurUp d32-^( \slh es,, \srh es \slh fis,, \srh f \slh a,, \srh a \slh b,, \srh b \slh h,, \srh h } \slh c,, \srh c \slh cis,, \srh cis \slh d,, \srh d \slh es,, \srh es \slh fis,, \srh fis\< \slh a,, \srh a \slh b,, \srh b \slh c, \srh c' \slh d, \srh d' \slh es, \srh es'\!) } |
	\makeOctaves #1 { \transpose c c, { \slh d,,32-^\ff \srh \slurUp d32-^( \slh es,, \srh es \slh fis,, \srh f \slh a,, \srh a } \slh c,, \srh c \slh cis,, \srh cis \slh d,, \srh d \slh es,, \srh es \slh fis,, \srh fis \slh a,, \srh a \slh c, \srh c'\< \slh d, \srh d' \slh es, \srh es' \slh fis, \srh fis' \slh g, \srh g' \slh a, \srh a'\!) } |


}

initialCadenzaLH = {
	<g, g,,>1~_\markup\italic "ad libitum" q q1~ \bar "" q2
	q1 s1 s1 \bar "" s2
	s1. s4 s16 s32 \bar ""  % Hrůzný běh
	s16 r s4. 
	<g, g,,>16-^ s1 s16 f16-^\sf s1 s16 \bar ""
	e16-^\sf s1 s16 es16-^\sf s1 s4 s16 s16. \bar "" s2
	s16 <es, es,,>2-^ <e, e,,>-^
	<f, f,,>-^ <fis, fis,,>-^ <g, g,,>4-^ <gis, gis,,>4-^ <a, a,,>-^ <b, b,,>-^ <h, h,,>-^ <c c,>-^ <e e,>-^ <g g,>-^

}

soloRHbass = {
	\global
	\voiceTwo
	\slurUp
	\shiftOn
	
	#(skip-of-length initialCadenzaLH)
	\time 4/4 s1 | s |

	s1*24 |
	s2 s4 s16 <es a,> <d b,> c |
	s1 |
	s2 s8. s8  e8. |
	f8  g8. <c' f>8 q16 r <b g>8 q16 r b8->-.( c'16-. |
	d'16-.) r es'4->(_\markup\italic "dim." d'8) d'( c') r16 g8( a16) |

	s1*16 |
	\lh \transpose c c,,
	{
		\repeat unfold 2
		{
			<es es,>16 s4.. es16 s4..  |
			es16 s2... |
		}
	} 


}

soloLH = {
	\global
	\voiceOne

	\cadenzaOn \accidentalStyle forget

	\initialCadenzaLH

	\cadenzaOff \bar "||"
	\time 4/4 \accidentalStyle default
	r4 \ottava #-1 \osmvb <d, d,,>2 <c, d,, c,,>4~ | q <h,, d,, h,,,> <b,, d,, b,,,> <a,, d,, a,,,> \ottava #0 \bar "||"

	R1*4 |
	<d' h gis d f, f,,>8\strum r \once\override PianoStaff.Arpeggio.extra-offset = #'(.5 . 0) <h gis f>8\strum r8 r2 |
	<d' h as d f, f,,>8\strum r <es' c' g es>8\strum r8 r2 |
	R1 |
	\stemDown \once\override TextScript.extra-offset = #'(.5 . -2) <g, g,,>16_\markup\line{\italic "con" \musicglyph #"pedal.Ped"} d'32( b, \rh g'16 d') \lh r \rh g'32( d' b'16 d') \lh <g, g,,>16 d'32( b, \rh g'16 d') \lh r \rh g'32( d' b'16 d') \lh |

	<g, g,,>16 d'32( b g'16 d') r \rh g'32( d' b'16 g') \lh <g, g,,> b32( g d'16 b) r c'32( a d'16 c') |
	<g, g,,>16 c'32( g es'16 c') r g32( es c'16 g) <g, g,,> g32( d b16 g) <b, b,,> b32( g d'16 b) |

	<a, a,,>16 c'32( f es'16 c') <b, b,,> b32( f d'16 d) <a, a,,> a32( d c'16 a) <g, g,,> g32( d b16 g) |
	<d, d,,>16 a32( fis d'16 a) r \rh es'32( c' a'16 es') \lh r \rh d'32( b g'16 d') \lh r c'32( a d'16 d) |

	<g, g,,>16 b32( g d'16 d) r d32( b g'16 g) <b, b,,> b32( g d'16 d) <d d,> c'32( g d'16 d) |
	<g, g,,>16 g32( es c'16 g) r c'32( g es'16 c') <g, g,,> b32( g d'16 b) <b, b,,> g32( d b16 g) |

	<a, a,,>16\< f32( c c'16 f) <d d,> b32( f d'16 b) <cis cis,> a32( e e'16 a) <f f,> d'32( a f'16 d') |
	<e e,>\! r << { <cis' g cis>(\< <d' a d>32 <e' b e>)\! q16(\>[ <d' a d>32 <cis' g cis>)\!] q16 } \\ { \transpose c c, { <e e,>16( <f f,>32 <g g,>) q16([ <f f,>32 <e e,>)] q16 } } >> b16 b8->( a4) r8 |

	r8 <g, g,,>16( <a, a,,>32 <b, b,,>) q16( <a, a,,>32 <g, g,,>) q16 cis' cis'8->( d'4) r8 |
	r16 <g, g,,>16( <a, a,,>32 <b, b,,>) q16 es'16->( <fis' fis>8.) r16 <b, b,,> <d d,>32 <g g,> q16 d'16->( c'8.) |

	r16 << { <d' b d>( \rh <fis' c' fis>32 <g' d' g>) q16 \lh } \\ { <g, g,,>( <a, a,,>32 <b, b,,>) q16 } >> h16->( as'8.) r16 << { <c' g c>16( <d' h d>32 <es' c' es>) q16 } \\ { <es, es,,>16( <g, g,,>32 <c c,>) q16 } >> g16->( f'8.) |
	f'16->( es' es' d') d'( c' c' h) d'->( c' c' b) b( a a fis) |

	a16( g g f) f( es es d) f->( es es d) d( c c g,) |
	fis,( g, a, b,) b,8 <es, es,,>_~ q <es c g, es,> <es' c' g es> \clef "treble" <es'' c'' g' es'> |
	q r8 \clef "bass" \crossStaff { \stemUp <g des>4. } \stemNeutral <es b, g, es,>8 <es' b g es> \clef "treble" <es'' c'' g' es'> |

	<e'' c'' g' e'>8\strum r4 \clef "bass" <g' c' e>8\strum <f' c' f>\strum r4 <es' b g>8\strum |
	<es' c' a>\strum r4. r4 r16 <f f,> <f g,> <f a,> |
	<b, b,,> <d' b f>8 q16 b, <d' b fis>8 q16 b, <d' b g>8 q16 <b, b,,> <d' b gis>8 q16 |

	<es es,> <es' b g>8 q16 <g g,> <f' h g>8 q16 <c c,> <es' c' g>8 q16 c-> <c ais>8 q16 |
	<f f,>16 <f' c a>8 q16 a, <c' a>8 q16 g, <es' b g>8 q16 a, <g' es' a>8 q16 |

	<d d,>16 <fis' d' a>8 q16 g, <f' h g>8 q16 c <e' b g>8 q16 f, <es'~ a f~> <es' b f> <es' c' f> |
	<d' b g>8\( <es' c' fis> <d' b g> <f' d' gis> <f' es' a> <f' d' gis> <f' es' a> q \clef "treble" |

	\transpose c c' { <f d b,> <f es a,> <f d b,> <as f h,> <a f c> q <b f cis> q\) |
	<b f d>8 r2.. } |
	r2 \clef "bass" <g' c' b e>8\strum r4. |

	\repeat unfold 4 { <d' b f>16 } \repeat unfold 4 { <d' f> } <es' c' f>4\strum r8 <f f,>\strum |
	R1*2 |
	r2. <f f,>8 r |

	\repeat unfold 2 { <b, b,,>8 f b d' \clef "treble" f' b' d'' r \clef "bass" | }
	<f, f,,> c f a c' \clef "treble" f' a' r \clef "bass" |

	<f, f,,> <f' c' a>_\( <g' es' b> <f' c' a> <es' b g> <d' a fis> <d' a f> <c' a g>\) |
	<b f d b,>8 f b d' \clef "treble" f' b' d'' r \clef "bass" |

	<as, as,,>8 f b d' \clef "treble" f' b' d'' r \clef "bass" |
	<g, g,,>8 d g h \clef "treble" d' g' h' r \clef "bass" |
	<f, f,,> d g h \clef "treble" d' g' d'' r \clef "bass" |

	\set subdivideBeams = ##t
	\set baseMoment = #(ly:make-moment 1/8)
	s16 g,32[ g] g fis g, f f e g, es es d g, d d c g, g g fis g, f f e g, es es d g, d |

	\stemDown d32\< c g, f f es c a a g es d' d' c' g \rh \transpose c c' { f f es c a a g es d' d' c' g f' f' es' c' g'\! } \lh |

	\stemUp s16 b,32[ b] g a b, as as g b, g g ges g, f f es b, b b a b, as as g b, g g ges b, f \stemNeutral |

	f\< es b, as as g des c' c' b g \rh \transpose c c' { f f es b, as \stemDown as g des c' c' b g f' f' es' b as' as' g' des' b'\! } \lh \stemNeutral |

	<d, d,,>16 s4.. <d b, d,>16 s4.. |
	<d b, d,>16 s2... |
	<d, d,,>16 s4.. <d b, d,>16 s4.. |
}

reductionRH = {
	\global
	#(skip-of-length initialCadenzaLH)
	\time 4/4 s1 | s |

	\tempo\markup\main-tempo "Andante sostenuto."

	\ottava #1 \osm <g'' d'' b' g'>16\ff-> \ottava #0 \repeat tremolo 14 { <g' d' b>64 g } <g' d' b>16 r4.. |
	<d'' a' d'>16-> \repeat tremolo 14 { <a' d'>64 a } <a' d'>16 r4.. |
	<b' d' b>8..-. <fis' d' c' fis>32 <g' d' g>8..-. <d' g f d>32 <es' g d>8..-. <h g d h,>32 <c' g c>8..-. <es' c' g es>32 |
	<d' a d>8 r <d'' a' d'>16->\sff r8. r2 |

	r4 d'2.~\(\mf |
	d'4\> c'2.\) |
	<b g d b,>8\strum\p-! r4. <fis d c a,>8\strum\pp-! r4. |
	R1*4 |

	r4\p << { <a es>( <g d> <fis c>) } \\ { s d2 } >> |
	
	<g d b, g,>2\fp << { d2 } \\ { g,4( <c a,>) } >> |
	<c g,~>2 <d b, g,>8 r4. |

	R1 |
	<g cis g,>8\sf-! r4. r4.. <d'' d'>16 |

	<d'' d'>8->( <cis'' cis'>4) r8 r4.. <d'' d'>16 |
	<d'' d'>16->(_\markup\italic "cresc." <es'' es'>8.) r16 <c fis>16^( <d g>32 <a es>) q16 <es'' es'>16->( <d'' d'>8.) r16 <d a,>16^( <e b,>32 <fis c>) q16 |

	<c'' c'>16->( <b' b>8.) r4 \ottava #1 \osm <as'' as'>16->( <g'' g'>8.) \ottava #0 r16 <d' g d>( <c' g es>32 <h as f>) q16 |
	r4 <es c g,>\f\> r <es'' c'' es' c'>\! |

	r4 <g c g,>\> <c' c> <g'' c'' g' c'>\! |
	R1 |
	<fis'' fis'>16( <g'' g'> <a'' a'> <b'' b'>) q8->( <cis'' cis'>) r2 |

	fis'16(\mf g' a' b') b'8->( c') r2 |
	h16( c' d' es') r2. |
	r2. << { f'8.( fis'16 | g'8) r4. r4 g'8.( gis'16 | a'8) } \\ { d'4( es'8) s4. s4 e'4(\p | f'8) } >> r4. r4 <b' g' es' b>8.->( <c'' c'>16 |

	<d'' a' fis' d'>8) r4. r2 |
	<d b, g,>8\strum r4. r <f e a,>8\pp( |
	
	<f d b,>) r4. r2 |
	<b f d>8-.\pp( q-. q-. q-.) <b gis d>-.( q-. q-. q-.) |
	<b g es>-.( q-. q-. q-.) <b g c>-.( q-. q-. q-.) |

	<b f d>8 r2.. |
	<< { f'2\( fis' | g' c''4~ c''32 b' g' e' c' b a g\) } \\ { <b f>8\pp <b f d>8-.( q-. q-.) <b gis d>-.( q-. q-. q-.) | <b g es>-.( q-. q-. q-.) <c' b g e>-. \lh <c b, g, e,>-.( q-. q-.) \rh } >> |
	f16(\p\<^\markup\italic "espressivo" g a b a b c' d')\! << { f'8( es') r c' } \\ { <b g>4 <a f> } >> |

	<b f d b,>1\pp~ |

	q |
	<a f c a,> |
	r8\pp <f c> <g es> <f c> <es b,> <d a,>4 <c a,>8 |
	s1 |

	<b f d b,>\p |
	<h g d h,> |
	q |
	<c' g c>8 r4. <g g,>16-> r4.. |

	<g es c g,>2\p\< \repeat tremolo 16 { <c'' g' es'>64 c' } |
	<des'' g' es' des'>16->\! r4.. <g g,>16\p-> r4.. |
	<g es des b, g,>2\p\< \once\override Beam.gap-count = #4 \once\override Beam.positions = #'(-3 . -5) \repeat tremolo 16 { <des'' g' es'>64 des' } |

	<d'' b' g' d'>16->\! r4.. <g d b, g,>16->\p r4.. |
	\once\override Beam.positions = #'(0 . -2) \repeat tremolo 32 { <g'' d'' b'>64_\markup\italic "cresc." g' } |
	\ottava #1 \osm <g'' e'' cis'' b' g'>16-> \ottava #0 r4.. <g es b, g,>16\p-> r4.. |

	\once\override Beam.positions = #'(0 . -2) \repeat tremolo 32 { <g'' e'' cis'' b'>64_\markup{\dynamic p \italic "cresc."} g' } |
}

reductionLH = {
	\global

	#(skip-of-length initialCadenzaLH)
	\time 4/4 s1 | s |

	<g, d, b,, g,,>16-> \repeat tremolo 14 { <d b, g,>64 g } <d b, g,>16 r4.. |
	<fis, d, a,, fis,,>16-> \repeat tremolo 14 { <d f,>64 fis } <d f,>16 r4.. |
	<g, g,,>8..-. <a, a,,>32 <b, b,,>8..-. <h, h,,>32 <c c,>8..-. <d d,>32 <es es,>8..-. <c c,>32 |
	<fis fis,>8 r \priraz{<fis, fis,,>32} <d' a d>16 r8. r2 |

	R1*2 | <d d,>8\strum-! r4. q8\strum-! r4. |
	R1*4 |

	<< { r4 c'( b a) } \\ { d1 } >> |
	<g, g,,>2 <b, b,,>4( <d d,>) |
	<g, g,,>2~ q8 r <<
		{
			<b g d>4\( |

			<c' f c> <d' b f> <e' a e> <f' d' a f> |
			<e e,>8\) r4. r8 <d' b d>16(\mf\< <e' cis' e>32 <f' d' f>) q16\!\>( <e' cis' e>32 <d' b d>)\! q16 d' |
		}
		\\
		{
			<b, b,,>8\! r |

			<a, a,,> r <d d,> r <cis cis,> r <f f,> r |
			s2 s8 <f, f,,>16( <g, g,,>32 <a, a,,>) q16( <g, g,,>32 <f, f,,>) q16 s |
		}
	>>

	d'8->( cis'4) r8 r << { <d' a d>16(\< <e' cis' e>32 <f' d' f>)\! q16\>([ <e' cis' e>32 <d' a d>)]\! q16 } \\ { <f, f,,>16( <g, g,,>32 <a, a,,>) q16([ <g, g,,>32 <f, f,,>)] q16 } >> d' |
	d'16->( es'8.) r16 << { \autoBeamOff \crossStaff { fis16 g32 a a16 } } \\ { <a, a,,>( <b, b,,>32 <c c,>) q16 } >> es'16->( d'8.) r16 << { \autoBeamOff \crossStaff { d16 e32 f f16 } } \\ { <fis, fis,,>( <g, g,,>32 <a, a,,>) q16 } >> |

	c'16->( b8.) r16 << { <h f>( <c' g>32 <d' h as>) q16 } \\ { <d d,>( <es es,>32 <f f,>) q16 } >> as'16->( g8.) r16 <h, h,,>16( <c c,>32 <d d,>) q16 |
	r4 <c c,> <g' g> r |

	r4 <es es,> r2 |
	R1 |
	<fis' fis>16( <g' g> <a' a> <b' b>) q8->( <cis' cis>) r2 |
	r h16( c' d' es') es'8->( g) |
	R1*2 |

	r2. <c c,>4->( |
	<f f,>8) r4. r4 <a a,>->( |
	<d d,>8) r2.. |
	g,8 r2.. |

	R1*2 |
	r2 e8-.( e-. e-. e-.) |

	f8 r4. r4 <f f,>8\strum r |
	<d d,>\strum r2..|

	s1 |
	<d' b f>2 << { g4 a } \\ { <es' c' f>2 } >> |
	<b, b,,>1~ |

	q |
	<f, f,,> |
	<< { r8 a b a g fis f es } \\ { <f f,>2 r4 f, } >> |
	<b f d b, b,,>1 |

	<as, as,,> |
	<g, g,,> |
	<f, f,,> |
	<es, es,,>8 r2.. |

	<es, es,,>1 |
	q16-> r2... |
	\once\override Beam.positions = #'(0 . 2) \repeat tremolo 32 { es,,64_\markup\caps "Timp." es, } |

	<es, es,,>16-> r4.. <d d,>16-> r4.. |
	\once\override Beam.positions = #'(0 . 2) \repeat tremolo 32 { <g,, es,,>64_\markup\caps "Timp." d, } |
	\ottava #-1 \osmvb <d, g,, d,,>16-> \ottava #0 r4.. <d d,>16-> r4.. |

	\once\override Beam.positions = #'(0 . 2) \repeat tremolo 32 { <g,, es,,>64_\markup\caps "Timp." d, } |
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

		%page-breaking = #ly:one-line-breaking

}

\score {
	\new StaffGroup
	<<
		\new PianoStaff \with {
			instrumentName = \markup\small\center-column{"PIANO" "PRINCIPAL"}
			shortInstrumentName = "I"
			\consists #Span_stem_engraver
		} {
			\set PianoStaff.connectArpeggios = ##t
			<<
				\new Staff = "RH" { <<
					\new Voice { \clef "treble" \transpose c c' \soloRHmelody }
					\new Voice { \clef "treble" \transpose c c' \soloRHbass }
					\new Voice { \clef "treble" \lining }
				>> }
				\new Staff = "LH" {
					\new Voice { \clef "bass" \soloLH }
				}
			>>
		}

		\new PianoStaff \with {
			instrumentName = \markup\small\center-column{"Réduction" "de l'orchestre"}
			shortInstrumentName = "II"
			\consists #Span_stem_engraver
		} {
			\set PianoStaff.connectArpeggios = ##t
			\override PianoStaff.BarLine.kern = #3.7
			\override PianoStaff.BarLine.hair-thickness = #2.95
			<<
				\new Staff = "RH" {
					\magnifyStaff #0.7
					\new Voice { \clef "treble" \transpose c c' \reductionRH }
				}
				\new Staff = "LH" {
					\magnifyStaff #0.7
					\new Voice { \clef "bass" \reductionLH }
				}
			>>
		}
	>>
	\layout
	{
		\context
		{
			\Staff \RemoveEmptyStaves
			\override VerticalAxisGroup.remove-first = ##t
		}

		\override Hairpin.thickness = #1.5
		\override Slur.thickness = #1.2
		\override Tie.thickness = #1.2
		\override PhrasingSlur.thickness = #1.2
		\override Score.StaffSymbol.thickness = #1.4
		\override PianoPedalBracket.thickness = #1.5

		\displayControlPoints
	}
}

\score {
	\new StaffGroup
	<<
		\new PianoStaff \with {
			instrumentName = \markup\small\center-column{"PIANO" "PRINCIPAL"}
			midiMinimumVolume = 1
			midiMaximumVolume = 1
			midiInstrument = "acoustic grand"
		} {
			\set PianoStaff.connectArpeggios = ##t
			<<
				\new Staff = "RH" { <<
					\new Voice { \clef "treble" \transpose c c' \unfoldRepeats \soloRHmelody }
					\new Voice { \clef "treble" \transpose c c' \unfoldRepeats \soloRHbass }
					\new Voice { \clef "treble" \lining }
				>> }
				\new Staff = "LH" {
					\new Voice { \clef "bass" \unfoldRepeats \soloLH }
				}
			>>
		}

		\new PianoStaff \with {
			instrumentName = \markup\small\center-column{"Réduction" "de l'orchestre"}
			midiMinimumVolume = 1
			midiMaximumVolume = 1
			midiInstrument = "string ensemble 2"
		} {
			\set PianoStaff.connectArpeggios = ##t
			\override PianoStaff.BarLine.kern = #3.7
			\override PianoStaff.BarLine.hair-thickness = #2.95
			<<
				\new Staff = "RH" {
					\magnifyStaff #0.7
					\new Voice { \clef "treble" \transpose c c' \unfoldRepeats \reductionRH }
				}
				\new Staff = "LH" {
					\magnifyStaff #0.7
					\new Voice { \clef "bass" \unfoldRepeats \reductionLH }
				}
			>>
		}
	>>
	\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 80 8) } } 
}
