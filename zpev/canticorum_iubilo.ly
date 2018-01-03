\version "2.18.2"

\header {
    title = "Canticorum iubilo"
    composer = "G. F. Händel (1685–1759)"
    tagline = ##f
}

global = {
    \key g \major
    \time 4/4
}

notySopran = \relative c'' {
    d2 b4.( c8) |
    d2 g, |
    a8( b c d c4) b |
    a1 |
    d8( c d e d4) d |
    g2 d |
    c4( b) a2 |
    g1 |
    b8( a b c b4) b |
    a2 g |
    c4( b a) g |
    fis1 |
    g8( fis g a g4) g |
    e'2 cis |
    d4( e8 d cis4.) d8 |
    d1 \bar "|."
}

notyAlt = \relative c'' {
    g2 g4.( fis8) |
    g2 d |
    fis8( g a b a4) g |
    fis1 |
    g2. g4 |
    g2 g |
    fis4( g2) fis4 |
    g1 |
    g8( fis g a g4) g |
    fis2 e |
    a4( g fis) e |
    dis1 |
    e8( dis e fis e4) e4 |
    g2. g4 |
    fis( g8 fis e4) a |
    a1 |
}

notyTenor = \relative c' {
    b2 d4.( c8) |
    b2 d |
    c4( a d) d |
    d1 |
    d2. d4 |
    d2 b |
    c4( d2) c4 |
    b1 |
    d2. d4 |
    c2 b |
    dis4( e c) b |
    b1 |
    b2. d4 |
    cis2 e |
    d4( b e) e |
    fis1 |
}

notyBas = \relative c' {
    g2 b4.( a8) |
    g2 b |
    a4.( g8 fis4) g |
    d1 |
    b'8( a b c b4) b |
    b2 g |
    a4( b8 c d4) d, |
    g1 |
    g2. g4 |
    d2 e |
    fis4( g a) e |
    b1 |
    e2. b'4 |
    cis2 a |
    b4( g a) a |
    d,1 |
}

skipFourteen = \repeat unfold 14 {\skip 8}

refren = \lyricmode {
    Can -- ti -- |
    co -- rum |
    iu -- bi -- |
    lo, |
    Re -- gi |
    ma -- gno |
    psal -- li -- |
    te. |
}

prvniSlokaZeny = \lyricmode {
    \set stanza = "1. "
    Iam __ re -- |
    sul -- tent |
    mu -- si -- |
    ca, |
    un -- da |
    tel -- lus, |
    si -- de -- |
    ra. |
}

%kvůli vynechání extenderu za Iam
prvniSlokaMuzi = \lyricmode {
    \set stanza = "1. "
    Iam re -- |
    sul -- tent |
    mu -- si -- |
    ca, |
    un -- da |
    tel -- lus, |
    si -- de -- |
    ra. |
}

druhaSloka = \lyricmode {
    \set stanza = "2. "
    Per -- so -- |
    nan -- tes |
    or -- ga -- |
    nis, |
    iu -- bi -- |
    la -- te |
    plau -- di -- |
    te. |
}

\score {
    \new ChoirStaff <<
      \new Staff = "sopran" \with { midiInstrument = "violin" } {
            \set Staff.instrumentName = #"S"
            \new Voice = "sopran" {
                \global \notySopran
            }
        }
        \new Lyrics \with {
                \override VerticalAxisGroup.nonstaff-relatedstaff-spacing.minimum-distance = #7
                \override VerticalAxisGroup.nonstaff-unrelatedstaff-spacing.minimum-distance = #5
            }
        {
            \lyricsto "sopran" { \refren \prvniSlokaZeny }
        }
        \new Lyrics \lyricsto "sopran" { \skipFourteen \druhaSloka }
	\new Staff = "alt" \with {midiInstrument = "violin"} {
            \set Staff.instrumentName = #"A"
            \new Voice = "alt" {
                \global \notyAlt
            }
        }
	\new Staff = "tenor" \with { midiInstrument = "cello" } {
            \set Staff.instrumentName = #"T"
            \clef bass
            \new Voice = "tenor" {
                \global \notyTenor
            }
        }
        \new Lyrics \with { \override VerticalAxisGroup.nonstaff-relatedstaff-spacing.minimum-distance = #5 } {
            \lyricsto "tenor" { \refren \prvniSlokaMuzi }
        }
        \new Lyrics \lyricsto "tenor" { \skipFourteen \druhaSloka }
	\new Staff = "bas" \with { midiInstrument = "contrabass" } {
            \set Staff.instrumentName = #"B"
            \clef bass
            \new Voice = "bas" {
                \global \notyBas
            }
        }
    >>
    \midi { }
}
