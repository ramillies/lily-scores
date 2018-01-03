\version "2.18.0"
\language "deutsch"

\header {
  title = "Una Limosna por el Amor de Dios"
  subtitle = "(„Dar lásce Boží“)"
  composer = "Agustin Barrios Mangoré (1885 - 1944)"
  arranger = "přepsal Darek Cidlinský"
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
  \time 3/4
  \set fingeringOrientations = #'(left)
  \set stringNumberOrientations = #'(down)
  \mergeDifferentlyHeadedOn
  \mergeDifferentlyDottedOn
}

lining = {
	\global
	\repeat unfold 35 { s2. \noBreak s2. \break }
	s2. \break s2. \noBreak s \noBreak
}
melody = {  
  \global
  \voiceOne
  \tupletUp
  \slurDown
  \set tupletSpannerDuration = #(ly:make-moment 1 4)
  \override TupletBracket.bracket-visibility = ##f
	
	\tempo "Andantino"
	e,8 h g' g' h h | e, c' g' g' c' c' |
\repeat volta 2
{
	e,32 e'' e'' e'' h e'' e'' e'' g' e'' e'' e'' g' e'' e'' e'' h e'' e'' e'' h e'' e'' e'' |
	\barre "III" {g,32 g' g' g' h32 g' g' g' e'32 g' g' g' e'32 g' g' g' h32 g' g' g' h32 g' g' g'} |
	a,32 g' g' g' c'32 g' g' g' e'32 g' g' g' e'32 g' g' g' c'32 g' g' g' c'32 g' g' g' |
	a,32 fis' fis' fis' c'32 fis' fis' fis' e'32 fis' fis' fis' e'32 fis' fis' fis' c'32 fis' fis' fis' c'32 fis' fis' fis' |
	c32 e' e' e' fis32 e' e' e' ais32 e' e' e' ais32 e' e' e' fis32 e' e' e' fis32 e' e' e' |
	h,32 dis' dis' dis' h32 dis' dis' dis' cis32 e' e' e' h32 e' e' e' dis32 fis' fis' fis' h32 fis' fis' fis' |
}
\alternative
{
	{
	e,32 a' a' a' fis32 a' a' a' c'32 a' a' a' c'32 a' a' a' fis32 a' a' a' fis32 a' a' a' |
	e,32 g' g' g' g32 g' g' g' h32 g' g' g' h32 g' g' g' g32 g' g' g' g32 g' g' g' |
	\barre "V" {e,32 c'' c'' c'' g32 c'' c'' c'' c'32 c'' c'' c'' c'32 c'' c'' c''} a32 a' a' a' a32 a' a' a' |
	b,32 g' g' g' g32 g' g' g' c'32 g' g' g' c'32 g' g' g' g32 g' g' g' g32 g' g' g' |
	\barre "I" { 
	a,32 g' g' g' f32 g' g' g' c'32 g' g' g' c'32 g' g' g' f32 g' g' g' f32 g' g' g' |
	a,32 f' f' f' f32 f' f' f' c'32 f' f' f' c'32 f' f' f' f32 f' f' f' f32 f' f' f' |
	}
	a,32 e' e' e' f32 e' e' e' c'32 e' e' e' c'32 e' e' e' f32 e' e' e' f32 e' e' e' |
	a,32 e' e' e' fis32 e' e' e' c'32 e' e' e' c'32 e' e' e' fis32 e' e' e' fis32 e' e' e' |
	h,32 e' e' e' fis32 e' e' e' c'32 e' e' e' c'32 e' e' e' fis32 e' e' e' fis32 e' e' e' |
	h32 dis' dis' dis' a32 dis' dis' dis' g32 dis' dis' dis' a32 dis' dis' dis' fis32 h' h' h' h32 h' h' h' |
	}
	{
	e,32 a' a' a' fis32 a' a' a' c'32 a' a' a' c'32 a' a' a' dis'32 a' a' a' dis'32 a' a' a' |
	e,32 g' g' g' h32 g' g' g' e'32 g' g' g' e'32 g' g' g' h32 g' g' g' h32 g' g' g'  |
	}
}

	\barre "IX" { e,32 f'' f'' f'' h32 f'' f'' f'' gis'32 f'' f'' f'' gis'32 f'' f'' f'' h32 f'' f'' f'' h32 f'' f'' f''  }
	e,32 e'' e'' e'' gis'32 e'' e'' e'' d''32 e'' e'' e'' d''32 e'' e'' e'' cis''32 e'' e'' e'' cis''32 e'' e'' e'' |
	a,32 e'' e'' e'' c'32 e'' e'' e'' h'32 e'' e'' e'' h'32 e'' e'' e'' a'32 e'' e'' e'' a'32 e'' e'' e'' |

	cis32 g' g' g' ais32 g' g' g' e'32 g' g' g' e'32 g' g' g' a,32 a' a' a' cis'32 a' a' a' |
	d32 h' h' h' g32 h' h' h' d'32 h' h' h' d'32 h' h' h' e'32 c'' c'' c'' e'32 c'' c'' c'' |
	d32 d'' d'' d'' fis'32 d'' d'' d'' h'32 d'' d'' d'' h'32 d'' d'' d'' a'32 c'' c'' c'' d'32 c'' c'' c'' |
	g32 c'' c'' c'' d'32 c'' c'' c'' a'32 c'' c'' c'' a'32 c'' c'' c'' g'32 h' h' h' g'32 h' h' h' |
	fis'32 a' a' a' fis'32 a' a' a' g'32 h' h' h' g'32 h' h' h' e'32 g' g' g' cis32 g' g' g' |
	d32 fis' fis' fis' h32 fis' fis' fis' d'32 fis' fis' fis' d'32 fis' fis' fis' e,32 g' g' g' cis'32 g' g' g' |
	\barre "II" { fis,32 fis' fis' fis' fis32 fis' fis' fis' d'32 fis' fis' fis' d'32 fis' fis' fis' } ais,32 e' e' e' cis'32 e' e' e' |
	h,32 e' e' e' fis32 e' e' e' cis'32 e' e' e' cis'32 e' e' e' fis32 e' e' e' fis32 e' e' e' |
	h,32 d' d' d' fis32 d' d' d' h32 d' d' d' h32 d' d' d' fis32 fis' fis' fis' fis32 fis' fis' fis' |
	\barre "VII" { h,32 d'' d'' d'' fis32 d'' d'' d'' fis'32 d'' d'' d'' fis'32 d'' d'' d'' e'32 cis'' cis'' cis'' fis32 cis'' cis'' cis'' |
	h,32 h' h' h' fis32 h' h' h' d'32 h' h' h' d'32 h' h' h' } \barre "VI" { cis'32 ais' ais' ais' fis32 ais' ais' ais' |
	h,32 ais' ais' ais' fis32 ais' ais' ais' } \barre "VII" { h32 h' h' h' h32 h' h' h' ais32 cis'' cis'' cis'' fis32 cis'' cis'' cis'' |
	h,32 d'' d'' d'' fis32 d'' d'' d'' h32 d'' d'' d'' h32 d'' d'' d'' fis32 d'' d'' d'' fis32 d'' d'' d'' |
	h,32 d'' d'' d'' fis32 d'' d'' d'' h32 d'' d'' d'' h32 d'' d'' d'' fis32 d'' d'' d'' fis32 d'' d'' d'' |
	h,32 dis'' dis'' dis'' fis32 dis'' dis'' dis'' h32 dis'' dis'' dis'' h32 dis'' dis'' dis'' } c'32 e'' e'' e'' fis32 e'' e'' e'' |
	\barre "VII" { h,32 dis'' dis'' dis'' fis32 dis'' dis'' dis'' h32 dis'' dis'' dis'' h32 dis'' dis'' dis'' } c'32 e'' e'' e'' fis32 e'' e'' e'' |
	dis'32 fis'' fis'' fis'' h32 fis'' fis'' fis'' e'32 g'' g'' g'' h32 g'' g'' g'' fis'32 a'' a'' a'' h32 a'' a'' a'' |
	e,32 g'' g'' g'' h32 g'' g'' g'' e'32 g'' g'' g'' \barre "XII" { g'32 g'' g'' g'' h'32 g'' g'' g'' h'32 g'' g'' g'' } |
	e,32 fis'' fis'' fis'' a32 fis'' fis'' fis'' dis'32 fis'' fis'' fis'' fis'32 fis'' fis'' fis'' g'32 fis'' fis'' fis'' g'32 fis'' fis'' fis'' |
	e,32 f'' f'' f'' gis32 f'' f'' f'' d'32 f'' f'' f'' f'32 f'' f'' f'' h'32 f'' f'' f'' h'32 f'' f'' f'' |
	\barre "X" { a,32 f'' f'' f'' c'32 f'' f'' f'' f'32 f'' f'' f'' a'32 f'' f'' f'' } c''32 f'' f'' f'' c''32 e'' e'' e'' |
	h'32 dis'' dis'' dis'' fis'32 dis'' dis'' dis'' \barre "IX" { gis'32 d'' d'' d'' e'32 d'' d'' d'' a'32 cis'' cis'' cis'' e'32 cis'' cis'' cis'' } |
	\barre "VII" { fis'32 c'' c'' c'' d'32 c'' c'' c'' g'32 h' h' h' d'32 h' h' h' h32 d'' d'' d'' a32 c'' c'' c'' |
	h,32 h' h' h' g32 h' h' h' e'32 h' h' h' e'32 h' h' h' } \barre "V" { ais,32 c'' c'' c'' e'32 c'' c'' c'' |
	h,32 h' h' h' g32 h' h' h' e'32 h' h' h' e'32 h' h' h' f'32 a' a' a' c'32 a' a' a' } |
	\barre "II" { h,32 g' g' g' h32 g' g' g' e'32 g' g' g' h32 g' g' g' a32 fis' fis' fis' h,32 fis' fis' fis' } |

	\bar "||" \key e \major

	e,32 e' e' e' h,32 e' e' e' h32 e' e' e' h,32 e' e' e' h32 gis' gis' gis' h,32 gis' gis' gis' |
	gis,32 h' h' h' e32 h' h' h' h32 h' h' h' e32 h' h' h' c'32 h' h' h' e32 h' h' h' |
	a,32 h' h' h' e32 h' h' h' cis'32 a' a' a' e32 a' a' a' cis'32 cis'' cis'' cis'' e32 cis'' cis'' cis'' |
	\barre "IX" { cis32 e'' e'' e'' gis32 e'' e'' e'' e'32 e'' e'' e'' e'32 e'' e'' e'' gis32 e'' e'' e'' gis32 e'' e'' e'' } |
	ais32 e' e' e' cis'32 e' e' e' gis'32 e' e' e' fis'32 e' e' e' e'32 cis'' cis'' cis'' fis32 cis'' cis'' cis'' |
	dis32 fis'' fis'' fis'' h32 fis'' fis'' fis'' a'32 fis'' fis'' fis'' a'32 fis'' fis'' fis'' \barre "IV" { fis32 a' a' a' h32 a' a' a' |
	gis32 gis' gis' gis' h32 gis' gis' gis' } a32 fis' fis' fis' cis'32 fis' fis' fis' c'32 a' a' a' e'32 a' a' a' |
	h,32 gis' gis' gis' h32 gis' gis' gis' e'32 gis' gis' gis' cis'32 gis' gis' gis' dis'32 fis' fis' fis' h32 fis' fis' fis' |

	e,32 e' e' e' h,32 e' e' e' h32 e' e' e' h,32 e' e' e' h32 gis' gis' gis' h,32 gis' gis' gis' |
	gis,32 h' h' h' e32 h' h' h' h32 h' h' h' e32 h' h' h' c'32 h' h' h' e32 h' h' h' |
	a,32 h' h' h' e32 h' h' h' cis'32 a' a' a' e32 a' a' a' cis'32 cis'' cis'' cis'' e32 cis'' cis'' cis'' |

	\barre "VI" { h,32 h' h' h' dis32 h' h' h' gis32 h' h' h' gis32 h' h' h' } fis32 a' a' a' fis32 a' a' a' |
	\barre "II" { h,32 gis' gis' gis' e32 gis' gis' gis' h32 gis' gis' gis' h32 gis' gis' gis' cis'32 a' a' a' cis'32 a' a' a' } |

	c32 e' e' e' fis32 e' e' e' ais32 e' e' e' ais32 e' e' e' \barre "II" { fis,32 fis' fis' fis' ais32 fis' fis' fis'   |
	h,32 gis' gis' gis' e32 gis' gis' gis' h32 gis' gis' gis' h32 gis' gis' gis' } a32 fis' fis' fis' h,32 fis' fis' fis' |
	e,32 e' e' e' h,32 e' e' e' gis32 e' e' e' gis32 e' e' e' h,32 e' e' e' h,32 e' e' e' |
	e,32 e' e' e' c32 e' e' e' g32 e' e' e' g32 e' e' e' c32 e' e' e' c32 e' e' e'|
	e,32 e' e' e' h,32 e' e' e' gis32 e' e' e' gis32 e' e' e' h,32 gis' gis' gis' h,32 gis' gis' gis' |
	\barre "IV" { gis,32 h' h' h' e32 h' h' h' h32 h' h' h' h32 h' h' h' gis32 h' h' h' gis32 h' h' h' } |

	e32 e'' e'' e'' h32 e'' e'' e'' gis'32 e'' e'' e'' gis'32 e'' e'' e'' h32 e'' e'' e'' h32 e'' e'' e'' |
	e,32 e'' e'' e'' c'32 e'' e'' e'' g'32 e'' e'' e'' g'32 e'' e'' e'' ais'32 e'' e'' e'' ais'32 e'' e'' e'' |
	e,32 e'' e'' e'' ais'32 e'' e'' e'' h'32 e'' e'' e'' e'32 e'' e'' e'' gis'32 e'' e'' e'' h32 e'' e'' e'' |
	e'32 e'' e'' e'' gis32 e'' e'' e'' h32 e'' e'' e'' e32 e'' e'' e'' gis32 e'' e'' e'' h,32 e'' e'' e''~ |

	e''4 r r | <e' gis>2. \bar "|."

}

basses = {
  \global
   \voiceTwo
   \stemDown
   \slurUp

	e,2. | e, |
   \repeat volta 2 {  e,8 h g' g' h h | g, h e' e' h h | a, c' e' e' c' c' | a, c' e' e' c' c' | c fis ais ais fis fis |  h,[ h] cis[ h] dis[ h] |}
\alternative
{
   {
	e, fis c' c' fis fis | e, g h h g g | e, g c' c' a a | b, g c' c' g g | a, f c' c' f f | a, f c' c' f f | a, f c' c' f f |
	a, fis c' c' fis fis | h, fis c' c' fis fis | h a g a fis h |
   }
   {
   	e, f c' c' dis' dis' | e, h e' e' h h |
   }
}
	e, h gis' gis' h h | e, gis' d'' d'' cis'' cis'' | a, c' h' h' a' a' | cis ais e' e' a,[ cis'] | d g d' d' e'[ e'] | 
	d fis' h' h' a'[ d'] | g d' a' a' g'[ g'] | fis'[ fis'] g'[ g'] e' cis | d h d' d' e,[ cis'] | fis, fis d' d' ais,[ cis'] | h, fis cis' cis' fis fis |
	h, fis h h fis[ fis] | h, fis fis' fis' e'[ fis] | h, fis d' d' cis'[ fis] | h, fis h h ais[ fis] |
	h, fis h h fis fis | h, fis h h fis fis | h, fis h h c'[ fis] | h, fis h h c'[ fis] | dis'[ h] e'[ h] fis'[ h] | e, h e' g' h' h' |
	e, a dis' fis' g' g' | e, gis d' f' h' h' | a, c' f' a' c'' c'' | h'[ fis'] gis'[ e'] a'[ e'] | fis'[ d'] g'[ d'] h[ a] |
	h, g e' e' ais,[ e'] | h, g e' e' f'[ c'] | h, h e' h a h, |
	\key e \major
	e, h, h h, h[ h,] | gis, e h e c' e | a,[ e] cis'[ e] cis'[ e] |
	cis gis e' e' gis gis | ais cis' gis' fis' e'[ fis] | dis h a' a' fis[ h] | gis[ h] a[ cis'] c'[ e'] | h, h e' cis' dis'[ h] |
	e, h, h h, h[ h,] | gis, e h e c' e | a,[ e] cis'[ e] cis'[ e] |
	h, dis gis gis fis[ fis] | h, e h h cis'[ cis'] |
	c fis ais ais fis,[ ais] | h, e h h a[ h,] | e, h, gis gis h, h, | e, c g g c c | e, h, gis gis h,[ h,] | gis, e h h gis gis |
	e h gis' gis' h h | e, c' g' g' ais' ais' | e, ais' h' e' gis' h | e' gis h e gis h, | <e e,>4\arpeggio r r | <h, e,>2.

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
	  \new Voice { \clef "treble_8" \lining }
      >>
  }
  \layout { }
  \midi {
    \context {
	\Score
	tempoWholesPerMinute = #(ly:make-moment 65 4)
	\override SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/1)
    }
  }
}
