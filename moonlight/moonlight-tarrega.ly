\version "2.18.0"
\language "deutsch"

\header {
  title = "Měsíční svit"
  subtitle = "Adagio sostenuto ze sonáty op. 27 č. 2"
  composer = "L. van Beethoven (1770 - 1827)"
  arranger = "upr F. Tárrega (1857 - 1909)"
  poet = "Adagio sostenuto"
  meter = "6tá = D"
  tagline = "Lilypondem v2.18.0 vysázel Darek dne 22. V. 2014"
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
               \override TextSpanner.style = #'line
               #music
       #} )
   
tinystems = #(define-music-function (parser location how) (list?) #{ \override Stem.details.beamed-lengths = #how #} )
normstems = \revert Stem.details


global = {
  \key d \minor
  \time 4/4
  \set fingeringOrientations = #'(left)
  \set stringNumberOrientations = #'(down)
}

melody = {  
  \global
  \voiceOne
  \tupletUp
  \slurDown
  \set tupletSpannerDuration = #(ly:make-moment 1 4)
  \override TupletBracket.bracket-visibility = ##f
  \times 2/3 {
	<a-2>8_\markup{ \null \lower #4 \line { \italic sempre \dynamic pp } }  <d'-1> f' a d' f' a d' f' a d' f' | a d' f' a d' f' a d' f' a d' f' |
	\barre "I" {b d' f' b d' f'} \barre "III" {b es' g' b es' g'} | <a-2> <cis'-3> <g'-4> <a-2> <d'-4> f' a d' e' g cis' e' | f a d' f a d' f a d' a'\rest d' f' |
	a'\rest e' g' a e' g' a e' g' a e' g' | a'\rest d' f' a d' f' a'\rest d' g' b d' g' |
	\barre "I" {a'\rest c' f' a c' f'} \barre "III" {a'\rest b <e'-3> a'\rest <e'-3> <b'-4> | a'\rest f' a' c' f' a'} \barre "I" {a c' f' a c' f' | as c' f' as c' f' as c' f' a'\rest c' f' |
	a'\rest c' ges' a'\rest c' ges' a'\rest c' ges' a'\rest c' ges' | a'\rest des' f' a'\rest c' f' a'\rest d' f'} a'\rest d' f' |
	\barre "III" { g'\rest c' es' g'\rest c' es' g'\rest c' d' g'\rest c' d'} | \barre "IV" { g'\rest c' es' g c' es'} \barre "III" { g'\rest h d' g h d' | g'\rest c' es' c' es' g' c' e' g' c' e' g' |
	<des'-3> <f'-4> <as'-2> des' <f'-4> <as'-2>} des' f' as' \barre "III" { h f' as' | c' e' g' c' e' g' c' e' g' c' e' g' |
	
	des'( f' as' des') f' as'} des' f' as' \barre "III" { h f' as' | c' e' g' c' e' g'} \barre "II" { c' es' fis' c' es' fis'} |
	\barre "III" { c' d' a' c' d' a' b d' g' b d' g' | as c' es' as c' es' g b e' g b e' | d g b d g b} \barre "II" { d g a d fis a} |
	\barre "III" { g b d' b d' g'} \barre "V" {d' g' b' d' g' b'} | \barre "VII" {d' a' c'' d' a' c'' d' a' c'' d' a' c''} |
	\barre "V" { d' g' b' d' g' b'} \barre "VI" {cis' g' b'} \barre "V" {d' g' b'} | \barre "III" { e' g' a' e' g' a' e' g' a' e' g' a'} | \barre "X" {f' a' d'' f' a' d''} \barre "III" {e' g' b'} \barre "VI" {d' f' h'} |
	\barre "V" {cis'' c' e' a' c' e' b' c' e'} \barre "III" {g' c' e'} | g'\rest cis' e' g cis' e' b cis' e' g cis' e' |
	\barre "X" {a'\rest f' a' d'' f' a' f'' f' a' d'' f' a'} | b\rest f a d' f a f' f a d' f a | e <b-2>( g) <cis'-1> b e' \barre "V" {<cis'-1> <g'-3>( e')} \barre "VI" {b' g' cis''} |
	\barre "VII" {f d' a f'( d') <a'-4>} \barre "X" {<f'-1> d'' a' f''( d'') a' | d' gis'( f') h' gis' d''} h' <f''-1> <d''-3> <gis''-1> f'' <h''-4> |

	g cis'( b) e' cis' g' \barre "IX" {e' b' g' cis'' b' e''} | <cis''-1> <g'-3> <b'-1> <e'-3> <g'-1> <cis'-1> e' <b-2> <cis'-1> <g-4> b e |
	g cis e <b,-1>( <cis-1>) g, e g <b-4> d g <b-4> | cis g( a) <b-4>( <a-4>) g e g b d g b | cis g( a) b( a) g es g b d g b |
	cis g( a) b( a) g e d d' d f d' | \barre "V" {e b d' e b d'} \barre "VII" {e a( cis') e a( cis') |
	f a d'} a b f' a d' f' a d' f' | a e' g' a e' g' a e' g' a e' g' | a d' f' a d' f' b d' g' b d' g' |
	a c' f' a c' f' \barre "III" {g b e' c' e' b' | f f' a' c' f' a' c' f' a'} \barre "V" {c' f' a' |
	c' g' b' c' g' b' c' g' b' c' g' b' | c' f' a' c' f' a' cis' g' a' d' f' a'} | e' g' a' e' g' a' \barre "X" { f' a' d'' f' a' d''} |
	\barre "III" {es' g' b' es' g' b'} \barre "V" {cis' g' a' cis' g' a' | d' f' a' d' f' a' d' fis' a' d' fis' a' |


	es' g' b' es' g' b'} es' g' b' \barre "V" {cis' g' b' d fis' a' d' fis' a' d' fis' a' d' fis' a' | es' g' b' es' g' b' es' g' b' cis' g' b' |
	d' fis' a' d' fis' a' d' g' b' d' g' b' | c' g' b' c' g' b' c' g' b'} \barre "III" {c' f' a' |
	b f' a' b e' g'} \barre "II" {a e' g'} a d' f' | g d' e' g d' e' a d' e' b d' e' | a d' f' a d' f' a cis' e' a cis' e' |
	d a f' a d' f' a d' f' a d' f' | a'\rest e' <g'-4> <a-3> e' <g'-4> a e' g' a e' g' |
	\barre "X" {d f' d' a' f' d'' a' <f''-4> <d''-1>} <a''-4> <f''-1> <d''-2> | cis''( e'') <b'-3> <cis''-1> g' b' e' <g'-3> b \barre "V" {b( a) g} |
	\barre "X" {d f' d' a' f' d'' a' <f''-4> <d''-1>} <a''-4> <f''-1> <d''-2> | cis''( e'') <b'-3> <cis''-1> g' b' e' <g'-3> b \barre "V" {b( a) g} |
	\barre "VII" {<f d'> a d' f' d' a} d'\rest f a d' a f | a,( d) f a f d a, d a, f, a, f, | 
 }
 	r2 <d' a f> | q\fermata r |
}

basses = {
  \global
   \voiceTwo
   \stemDown
	d1 | c |
	b,2 g, | a, a, | d,2. << { \stemDown \tinystems #'(1) a8. a16 \normstems } \\ {d,4} >> |
	<cis-1 a-3>2. cis8.[ a16] | <d, a>2 <g, b> |
	<c a>2 <d-1 g-2>4 <c-1 c'-2> | <f f,>2 f, | f,2. <f as>8.[ as16] |
	<< { \stemDown as4 as as } \\ { es2. } >> <as es>8.[ as16] | << { \stemDown as4 as as g } \\ { des c h, h, } >> |
	<c g>4~ q <f, as> <f a,> | <g g,>2 q | c2. c4 |
	c f as f | c2. c4 |

	c f as f | c2 a, |
	fis, g, | c cis | d, d, |
	g,2. g8.[ d'16] | fis2. fis8.[ d'16] |
	g2 e4 d | cis2. cis4 | d2 g,4_\markup{\italic decresc.} gis, |
	<< a,1 { s2\< s2\> } >> | a,1\! |
	<< a,1 { s2\< s2\> } >> | << a,1\! { s2\< s2\> } >> | a,2\! a,2 |
	a, a, | a, a, |

	a, a, | r1 |
	r1 | <cis-1 a,-3>2 e4 d | q2 es4 d |
	q2\decresc b, | g, a, |
	d,2.\! << {\stemDown \tinystems #'(1) a8.[ a16] \normstems} \\ d,4 >> | cis2. << {\stemDown \tinystems #'(0.25) a8.[ a16] \normstems} \\ cis4 >> | d,2 g, |
	c c4 c | f,2. f8.[ c'16] |
	e2. << { \stemDown \tinystems #'(1) c'8.[ c'16]} \\ e4 >> | f2_\markup{\italic cresc.} e4 d | cis2\p d |
	g, d, | d2. d4 |
	
	d\< g b\> g | d2.\! d4 | e\< g b\> g |
	<d d'>2\! <g, d'> | <e c'>2. <f c'>4 |
	d e cis d | b,2_\markup{\italic cresc.} a,4 b, | <a, a>2\p << { s4 \stemDown a8.[ a16] } \\ <a, a>2 >> |
	<d, d>2.\pp a,8.[ <a, a>16] | cis2. a,8.[ <a, a>16] |
	d,2.\< d8.[ d16] | a,2.\> << {\stemDown a,8.[ a,16]} \\ { \stemDown des'4 } >> |
	d,2.\< d8.[ d16] | a,2.\> << {\stemDown a,8.[ a,16]} \\ { \stemDown des'4 } >> |
	d,2\decresc d | r1 | d,2\pp d, | d,\fermata r


}

\paper
{
    #(define fonts (make-pango-font-tree "Georgia" "Arial" "Courier New" 1 ) )
    system-system-spacing #'basic-distance = #20
}

\score {
  \new Staff \with {
    midiInstrument = "acoustic guitar (steel)"
  } {
      <<
          \new Voice { \clef "treble_8" \melody }
          \new Voice { \clef "treble_8" \basses }
      >>
  }
  \layout { }
  \midi {
    \context {
      \Score
      tempoWholesPerMinute = #(ly:make-moment 70 4)
    }
    \context { \Voice \remove "Dynamic_performer" }
  }
}
