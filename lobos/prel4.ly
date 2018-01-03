\version "2.18.0"
\language "deutsch"

\header {
  title = "Preludium č. IV"
  subtitle = "(„Pocta Indiánům“)"
  composer = "Heitor Villa-Lobos"
  arranger = "přepsal Darek Cidlinský (15. X. 2014)"
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
normstems = \revert Stem.details
extStrum = \override Arpeggio.positions = #'(-4 . 4)
normStrum = \revert Arpeggio.positions
empty = { \once \hide NoteHead \once \override NoteHead.no-ledgers = ##t }
vacuum = { \hide NoteHead \override NoteHead.no-ledgers = ##t }
visible = { \undo \hide NoteHead \revert NoteHead.no-ledgers }
tamb = \markup { T }
flag = \once \override NoteHead.style = #'harmonic
flagsOn = \override NoteHead.style = #'harmonic
flagsOff = \revert NoteHead.style
ffXII = \markup{\tiny XII}
ffVII = \markup{\tiny VII}
ffV = \markup{\tiny V}
ffIV = \markup{\tiny IX}

fO = \markup { \italic o }
fA = \markup { \italic a }
fM = \markup { \italic m }
fI = \markup { \italic i }
fP = \markup { \italic p }

sup = \arpeggioArrowUp
sdown = \arpeggioArrowDown
strum = \arpeggio
noN = \hideNotes
okN = \unHideNotes

fleft = \set fingeringOrientations = #'(left)
fright = \set fingeringOrientations = #'(right)
fdown = \set fingeringOrientations = #'(down)

global = {
  \key e \minor
  \time 7/4
  \set fingeringOrientations = #'(left)
  \set stringNumberOrientations = #'(down)
  \mergeDifferentlyHeadedOn
  \mergeDifferentlyDottedOn
  \tempo "Lento"
}

melody = {  
  \global
  \voiceOne
  \tupletUp
  \slurDown
  \set tupletSpannerDuration = #(ly:make-moment 1 4)
  \override TupletBracket.bracket-visibility = ##t
  \set Score.tempoHideNote = ##t

  \tempo 4 = 45

  e'4^\3 h8^\4 g^\5 fis8. d16 r4 <h g d> q q | e'8^\3 h16^\4 h g8^\5 fis~ fis d16 d r4 <h g d> q q | fis4 \times 2/3 {  e8 d c } h,8. g,16 r4 <e' c' h f> q q | c4 h,8 a, g,8. e,16 
  r4 <e' h gis> q q |\time 4/4 r <fis' h g> q q | r \flagsOn <h' g' d'>^\ffXII q^\ffXII q^\ffXII \bar "||" \flagsOff \mark \markup { \musicglyph #"scripts.coda" } |

  \tempo "Agitato" \tempo 4 = 140  e16 g h e' fis a dis' e' a c' fis' e' g h e' e' | 
  h d' gis' e' a c' fis' e' c' e' a' e' h d' g' e' | d' f' h' e' c' e' a' e' e' g' \flag h'^\ffXII e' d' f' h' e' | h d' gis' e' c' e' a' e' a c' fis' e' h d' g' e' |
  g h e' e' a c' fis' e' fis a dis' e' g h e' e' | fis a dis' e' e g h e' dis g h fis' d g h g' | c g c' e' h, f gis d' a, e g c' g, d g h |
  fis, dis a h e, d g h eis, d gis h fis, dis a h | a, dis a h g, e ais h h, gis d' h a, fis c' h | c a dis' h h, gis d' h cis ais e' h dis c' fis' h |
  e cis' g' h cis gis e' h d h f' h h, gis d' h | c a dis' h a, fis c' h h, gis d' h g, e ais h | a, fis d' h fis, dis a h g, e ais h a, fis c' h |
  h, gis d' h a, fis c' h g, e ais h fis, dis a h | r4 c'16 e' fis' g' \tempo 4 = 55 c''4~ \times 2/3 { c''4 g'8 } | h'1 \bar "||" |

  \tempo "Moderato" \time 7/4  \flagsOn
  \ottava #1 e'''4_\ffV h''8_\ffV g''_\ffV fis''8._\ffVII d''16_\ffVII \ottava #0 r4 <h' g' d'>^\ffXII q^\ffXII q^\ffXII |
  \ottava #1 h''4_\ffVII fis''8_\ffVII d''_\ffVII cis''8._\ffIV a'16_\ffVII r4 <fis'' d'' a'>^\ffVII q^\ffVII q^\ffVII  |
  e'''4_\ffV h''8_\ffV g''_\ffV fis''8._\ffVII d''16_\ffVII r4 <h'' g'' d''>^\ffV q^\ffV_\markup{\small{\italic{Da Capo al \musicglyph #"scripts.coda"}}} q^\ffV \ottava #0 \flagsOff \mark \markup { \musicglyph #"scripts.coda" } \bar "||" |

  \tempo "Lento" 

   s1 s2. \bar "|."
}

basses = {
  \global
   \voiceTwo
   \stemDown
   \slurUp

   s2. r8. e,16~ e,8. e,16~ e,8. e,16~ e,4 | s2. r8. e,16~ e,8. e,16~ e,8. e,16~ e,4 | s2. r8. a,16~ a,8. a,16~ a,8. a,16~ a,4 | s2. r8. d16~ d8. d16~ d8. d16~ d8. a,16 |
   \time 4/4 r8. dis16~ dis8. dis16~ dis8. dis16~ dis8. h,16 | r8. \flagsOn e16~_\ffXII e8._\ffXII e16~_\ffXII e8._\ffXII e16~_\ffXII e4_\ffXII \bar "||" \flagsOff |

   e4 fis a g | h a c' h | d' c' e' d' | h c' a h | g a fis g | fis e dis d | c h, a, g, | fis, e, eis, fis, | a, g, h, a, | c h, cis dis | e cis d h, | c a, h, g, | a, fis, g, a, | h, a, g, fis, | r16 h,( d g c'8) c'8 s2 | h1 \bar "||" |
   \time 7/4 \flagsOn
   s2. r8. e16~_\ffXII e8._\ffXII e16~_\ffXII e8._\ffXII e16~_\ffXII e4_\ffXII |
   \ottava #1 s2. r8. h16~_\ffVII h8._\ffVII h16~_\ffVII h8._\ffVII h16~_\ffVII h4_\ffVII |
   s2. r8. e'16~_\ffV e'8._\ffV e'16~_\ffV e'8._\ffV e'16~_\ffV e'4_\ffV | \flagsOff \ottava #0
   \bar "||"
  <h g e d e,>1~ q2. \bar "|."

}

ohsolong = {
	\global
	\voiceTwo
	\stemDown
	\slurDown

	s2 s8. \noN d16( \okN e1) | s2 s8. \noN d16( \okN e1) | s2 s8. \noN g,16( \okN a,1) | s2. f,1 | \time 4/4 fis, | e, \bar "||" |

	\repeat unfold 14 { s1 | } e, | s \bar "||" | 
	\time 7/4
	s2. \flagsOn e''1^\ffXII | s2. h'1^\ffXII | s2. e''1_\ffXII |
	\flagsOff \bar "||" |
	s1 s2. \bar "|."
}

\paper
{
    #(define fonts (make-pango-font-tree "Georgia" "Arial" "Courier New" 1 ) )
    system-system-spacing #'basic-distance = #15
}

\score {
  \new Staff \with {
    midiInstrument = "acoustic guitar (nylon)"
  } {
      <<
          \new Voice { \clef "treble_8" \melody }
          \new Voice { \clef "treble_8" \basses }
	  \new Voice { \clef "treble_8" \ohsolong }
      >>
  }
  \layout { }
  \midi {
  }
}
