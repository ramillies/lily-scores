\version "2.19.2"
\language "deutsch"

\header {
    subtitle = "(Vantage Master — CR001GM)"
    title = "The Pure Ones"
    tagline = "Created using Rosegarden 14.12 and LilyPond"
}

global = { 
    \time 1/4
    \skip 4*213 
}
globalTempo = {
    \override Score.MetronomeMark #'transparent = ##t
    \tempo 4 = 60  \skip 4 
    \tempo 4 = 115  \skip 4 \skip 2 \skip 1*41 \skip 4 \skip 4 \skip 2 \skip 1*10 \skip 4 
}
\score {
    << % common

    \context Staff = "track 1, Altový saxofon I" << 
        \set Staff.instrumentName = \markup { \center-column { "Altový saxofon I " } }
        \set Staff.shortInstrumentName = "Sax. A. I"
        \set Staff.midiInstrument = "Alto Sax"
        \set Score.skipBars = ##t
        \set Staff.printKeyCancellation = ##t
        \new Voice \global
        \new Voice \globalTempo

        \context Voice = "voice 1" {
            \override Voice.TextScript #'padding = #2.0
            \override MultiMeasureRest #'expand-limit = 1
            \once \override Staff.TimeSignature #'style = #'() 
            
            \clef "treble"
            \key c \major
            \time 4/4
            R1*20  |
            b' 2. g' 8 as' _~  |
            as' 8 b' 4.. r32 g' -\staccato as' 8 es'' 4 _~  |
            es'' 2. f'' 8 es'' _~  |
%% 25
            es'' 8 cis'' 4 -\tenuto c'' 4.. r16 c'' cis'' -\tenuto  |
            < c'' b' > 2 -\tenuto r4 g'' 8 f'' 16. r32  |
            f'' 8 -\tenuto r16 es'' 4.. -\tenuto cis'' 4 c'' 8 -\tenuto _~  |
            c'' 8 -\tenuto r16 cis'' 8. es'' 8 -\tenuto cis'' 8. r32 c'' 8. r8 r b' 16 
            % warning: overlong bar truncated here |
            b' 4. -\tenuto c'' 4 -\tenuto r8 < fis' g' > -\staccato as' _~  |
%% 30
            as' 2 _~ as' 8 < fis' g' > 64 -\tenuto r r32 r16 as' 16. r32 es'' 8 -\tenuto _~  |
            es'' 2.. -\tenuto r8  |
            f'' 4. g'' as'' 8 es'' _~  |
            es'' 4. g'' as'' 8 es'' _~  |
            es'' 2 _~ es'' 8 < d'' es'' > -\staccato es'' es'' _~  |
%% 35
            es'' 8 cis'' c'' 16. r32 cis'' 4 -\tenuto c'' 8 b' 4  |
            R1*8  |
            b' 4. -\tenuto c'' 4 -\tenuto r8 < fis' g' > -\staccato as' _~  |
%% 45
            as' 2 _~ as' 8 < fis' g' > 64 -\tenuto r r32 r16 as' 16. r32 es'' 8 -\tenuto _~  |
            es'' 2.. -\tenuto r8  |
            f'' 4. g'' as'' 8 es'' _~  |
            es'' 4. g'' as'' 8 es'' _~  |
            es'' 2 _~ es'' 8 < d'' es'' > -\staccato es'' es'' _~  |
%% 50
            es'' 8 cis'' c'' 16. r32 cis'' 4 -\tenuto c'' 8 b' 4  |
            b' 4. as' 2 -\tenuto _~ as' 8 -\tenuto _~  |
            as' 4. -\tenuto r8 r2  |
            R1*2  |
            \bar "|."
        } % Voice
    >> % Staff ends

    \context Staff = "track 2, Altový saxofon II" << 
        \set Staff.instrumentName = \markup { \center-column { "Altový saxofon II " } }
        \set Staff.shortInstrumentName = "Sax. A. II"
        \set Staff.midiInstrument = "Alto Sax"
        \set Score.skipBars = ##t
        \set Staff.printKeyCancellation = ##t
        \new Voice \global
        \new Voice \globalTempo

        \context Voice = "voice 2" {
            \override Voice.TextScript #'padding = #2.0
            \override MultiMeasureRest #'expand-limit = 1
            \once \override Staff.TimeSignature #'style = #'() 
            
            \clef "treble"
            \key c \major
            \time 4/4

            R1*20  |
            r8 b' 2. g' 8  |
            as' 4 b' 4.. r32 g' -\staccato as' 8 es'' _~  |
            es'' 2.. f'' 8  |
%% 25
            es'' 4 cis'' -\tenuto c'' 4.. r16  |
            c'' 16 cis'' -\tenuto c'' 8 b' 2 -\tenuto r8 g''  |
            f'' 16. r32 f'' 8 -\tenuto es'' 2 cis'' 4  |
            c'' 4 -\tenuto r16 cis'' 8. es'' 8 -\tenuto r32 cis'' 8. c'' 8 -\tenuto r32  |
            b' 8 -\staccato b' 4. -\tenuto c'' 4 -\tenuto r8 < fis' g' > -\staccato  |
%% 30
            as' 2. < fis' g' > 64 -\tenuto r r32 r16 as' 16. r32  |
            es'' 1 -\tenuto  |
            r8 f'' 4. g'' as'' 8  |
            es'' 2 g'' 4. as'' 8  |
            es'' 2. < d'' es'' > 8 -\staccato es''  |
%% 35
            es'' 4 cis'' 8 c'' 16. r32 cis'' 4 -\tenuto c'' 8 b' _~  |
            b' 8 r r4 r2  |
            R1*7  |
            r8 b' 4. -\tenuto c'' 4 -\tenuto r8 < fis' g' > -\staccato  |
%% 45
            as' 2. < fis' g' > 64 -\tenuto r r32 r16 as' 16. r32  |
            es'' 1 -\tenuto  |
            r8 f'' 4. g'' as'' 8  |
            es'' 2 g'' 4. as'' 8  |
            es'' 2. < d'' es'' > 8 -\staccato es''  |
%% 50
            es'' 4 cis'' 8 c'' 16. r32 cis'' 4 -\tenuto c'' 8 b' _~  |
            b' 16. r32 b' 4. as' 2 -\tenuto _~  |
            as' 2 -\tenuto r  |
            R1  |
            R1  |
            \bar "|."
        } % Voice
    >> % Staff ends

    \context Staff = "track 3, Syntetické žestě I" << 
        \set Staff.instrumentName = \markup { \center-column { "Syntetické žestě I " } }
        \set Staff.shortInstrumentName = "Tr. I"
        \set Staff.midiInstrument = "SynthBrass 2"
        \set Score.skipBars = ##t
        \set Staff.printKeyCancellation = ##t
        \new Voice \global
        \new Voice \globalTempo

        \context Voice = "voice 3" {
            \override Voice.TextScript #'padding = #2.0
            \override MultiMeasureRest #'expand-limit = 1
            \once \override Staff.TimeSignature #'style = #'() 
            
            \clef "alto"
            \key c \major
            \time 4/4

            R1*34  |
            r4 h cis' es'  |
            e' 4. es' 16 cis' es' 4. cis' 16 h  |
            cis' 2.. b' 8 _~  |
            b' 8 as' 4 fis' cis' -\tenuto r8  |
%% 40
            cis' 4. es' 2 -\tenuto _~ es' 8 -\tenuto _~  |
            es' 4. -\tenuto r8 es' 8. e' fis' 8  |
            fis' 2 h'  |
            cis'' 1  |
            R1  |
%% 45
            R1*10  |
            \bar "|."
        } % Voice
    >> % Staff ends

    \context Staff = "track 4, Syntetické žestě II" << 
        \set Staff.instrumentName = \markup { \center-column { "Syntetické žestě II " } }
        \set Staff.shortInstrumentName = "Tr. II"
        \set Staff.midiInstrument = "SynthBrass 2"
        \set Score.skipBars = ##t
        \set Staff.printKeyCancellation = ##t
        \new Voice \global
        \new Voice \globalTempo

        \context Voice = "voice 4" {
            \override Voice.TextScript #'padding = #2.0
            \override MultiMeasureRest #'expand-limit = 1
            \once \override Staff.TimeSignature #'style = #'() 
            
            \clef "treble"
            \key c \major

            \time 4/4
            R1*34  |
            es'' 2 -\tenuto r8 e'' es'' es'' _~  |
            es'' 8 h' 4. h' 8 cis'' es'' e''  |
            as'' 8 e'' 4 es'' 8 cis'' _~ 
            % warning: bar too short, padding with rests
            % 139200 + 2400 < 143040  &&  5/8 < 4/4
            r8 r4  |
            cis'' 8 es'' 4 e'' as'' -\tenuto r8  |
%% 40
            as'' 4. fis'' es'' 8 as'' _~  |
            as'' 8 fis'' 4 es'' h' es'' 8 _~  |
            es'' 4. cis'' h' 8 h' _~  |
            h' 8 cis'' 2..  |
            R1*11  |
            \bar "|."
        } % Voice
    >> % Staff ends

    \context Staff = "track 8, Sbor" << 
        \set Staff.instrumentName = \markup { \center-column { "Sbor " } }
        \set Staff.shortInstrumentName = "S."
        \set Staff.midiInstrument = "Choir Aahs"
        \set Score.skipBars = ##t
        \set Staff.printKeyCancellation = ##t
        \new Voice \global
        \new Voice \globalTempo

        \context Voice = "voice 8" {
            \override Voice.TextScript #'padding = #2.0
            \override MultiMeasureRest #'expand-limit = 1
            \clef "treble"
            \key c \major
            \time 4/4

            < es' h fis > 1  |
            < fis h es' > 2 < cis' h fis >  |
            < es' h as > 1  |
%% 5
            < h es' fis > 2 < cis' h fis >  |
            < es' fis h > 1  |
            < fis h es' > 2 < cis' h fis >  |
            < es' h as > 1  |
            < h es' fis > 2 < cis' h fis >  |
%% 10
            < es' fis h > 1  |
            < fis h es' > 2 < cis' h fis >  |
            < es' h as > 1  |
            < h es' fis > 2 < cis' h fis >  |
            < a d' fis' > 1 _~  |
%% 15
            < a d' fis' > 1  |
            < h d' fis' > 1  |
            < a fis' d' > 2 < e' d' a >  |
            < a d' fis' > 1 _~  |
            < a d' fis' > 1  |
%% 20
            < h d' fis' > 1  |
            < a fis' d' > 2 < e' d' a >  |
            < es' c' as > 1 _~  |
            < es' c' as > 1  |
            < es' g b > 1  |
%% 25
            < c' f' as > 1  |
            < g es' b > 1  |
            < as es' b > 2 < cis' as f >  |
            < es' as c' > 2 < as es' b >  |
            < es' c' as > 1 _~  |
%% 30
            < es' c' as > 1  |
            < es' g b > 1  |
            < c' f' as > 1  |
            < as es' b > 1  |
            < es' c' as > 1  |
%% 35
            < es' b as > 1  |
            < fis h es' > 1 _~  |
            < fis h es' > 1  |
            < as h es' > 1  |
            < fis es' h > 2 < cis' h fis >  |
%% 40
            < fis h es' > 1 _~  |
            < fis h es' > 1  |
            < as h es' > 1  |
            < fis es' h > 2 < cis' h fis >  |
            < es' c' as > 1 _~  |
%% 45
            < es' c' as > 1  |
            < es' g b > 1  |
            < c' f' as > 1  |
            < as es' b > 1  |
            < es' c' as > 1  |
%% 50
            < es' b as > 1  |
            < es' b as > 1 -\tenuto _~  |
            < es' b as > 1 -\tenuto _~  |
            < es' b as > 1 -\tenuto _~  |
            < es' b as > 2 -\tenuto r  |
            \bar "|."
        } % Voice
    >> % Staff ends

    \context Staff = "track 9, Klavír" << 
        \set Staff.instrumentName = \markup { \center-column { "Klavír " } }
        \set Staff.shortInstrumentName = "Kl."
        \set Staff.midiInstrument = "Acoustic Grand Piano"
        \set Score.skipBars = ##t
        \set Staff.printKeyCancellation = ##t
        \new Voice \global
        \new Voice \globalTempo

        \context Voice = "voice 9" {
            \override Voice.TextScript #'padding = #2.0
            \override MultiMeasureRest #'expand-limit = 1
            \once \override Staff.TimeSignature #'style = #'() 
            \clef "treble"
            \key c \major
            \time 4/4

            R1*4 |
%% 5
            r4 r < a' b' > 64 -\tenuto r r32 r16 r h' 8. fis'' 8  |
            < h es'' > 2 -\tenuto r8 < fis' fis'' > 4 -\tenuto < fis' cis'' > 8 _~  |
            < fis' cis'' > 4. r8 < h' fis' > -\tenuto cis'' es'' e'' 16 -\tenuto as' -\tenuto  |
            < h' e' fis'' > 4. -\tenuto as'' 8 e'' 4 es'' 8 < h' cis'' fis fis' > -\tenuto _~  |
            < h' cis'' fis fis' > 8 -\tenuto es'' 4 e'' as'' -\tenuto r16 h' -\tenuto  |
%% 10
            < es'' h as'' > 4. -\tenuto < fis'' h' es'' h > -\tenuto es'' 8 < fis' es'' h' fis'' > -\tenuto _~  |
            < fis' es'' h' fis'' > 4. -\tenuto r8 r < fis' e'' > -\tenuto es'' < e'' as' > -\tenuto  |
            < es'' e > 8 _( h e' as' ) cis'' 4 h' 8 < fis fis' es' h' > _~  |
            < fis fis' es' h' > 8 < cis'' h' fis' fis > 4. es'' 4 e''  |
            < d fis'' > 8 _( a e' a' ) d'' < a' g'' d'' > -\tenuto fis'' < d'' a' fis'' > -\tenuto  |
%% 15
            h, 8 _( < fis d'' > h d' 16 a' ) d'' 8 ^( e'' fis'' g'' 16 h' )  |
            < d'' g a'' > 8 -\tenuto d' 16 -\tenuto g' 8 -\tenuto h' 16 -\tenuto h'' 8 g'' 4 d'' 8 -\tenuto fis'' _( < a e'' a' > 16 d' )  |
            fis' 16 _( a' fis'' e' ) a' ^( d'' g'' g' ) h' ^( d'' h'' a' ) d'' -\tenuto e'' 8.  |
            < d'' fis'' d' h'' > 8 -\tenuto a' -\tenuto d'' < fis'' d'' a'' > -\tenuto a' -\tenuto d'' -\tenuto fis'' < fis'' h h'' d'' > -\tenuto _~  |
            < fis'' h h'' d'' > 8 -\tenuto < fis'' d'' a'' > 4 < h' d'' fis'' > < d'' fis' h' > 8 -\tenuto < h' d'' > -\tenuto < g fis'' > -\tenuto _~  |
%% 20
            < g fis'' > 8 -\tenuto d' -\tenuto g' < d'' a' e'' > 4. < g' h' d'' > 8 < d'' h' g' > _~  |
            < d'' h' g' > 8 < e'' d'' a' a > 4 -\tenuto e' 16 _( a' d'' e'' ) a'' -\tenuto d''' -\tenuto < e''' a''' > 4 -\tenuto  |
            < es'' as' b'' > 4. -\tenuto < as'' es'' > 8 ^( b' c'' es'' ) as''  |
            < as'' es'' f' > 4. -\tenuto es'' 8 -\tenuto b'' as'' g'' as''  |
            < b'' es'' c' > 2 -\tenuto < b'' es''' >  |
%% 25
            < c''' f'' cis' > 2 -\tenuto < c''' f''' >  |
            r8 _( cis' b' es'' ) b'' 4 < b'' f''' >  |
            < c' as'' es''' > 2 < cis''' b' as'' > 8 ^( cis'' as'' cis'' )  |
            < es''' as'' es' > 8 ^( as' es'' as' ) < es' es''' b'' > ^( b' es'' b' )  |
            < es''' as' > 8 ^( es'' as'' es'' ) es''' ^( es'' as'' es'' )  |
%% 30
            < es''' f' > 8 ^( es'' as'' es'' ) es''' ^( es'' as'' es'' )  |
            < g'' c' b'' es''' > 8 ^( g'' b'' es''' ) < es''' c'' b'' g''' > ^( b'' es''' g''' 16 as'' )  |
            < f''' cis'' > 8 ^( f'' as'' cis''' ) f''' ^( as'' cis''' f''' )  |
            < c'' es''' b'' as'' > 8 ^( as'' b'' es''' ) b'' ^( as'' b'' es''' )  |
            < c''' as'' es' es''' > 8 ^( c'' as'' c''' ) es''' ^( as'' c''' es''' )  |
%% 35
            < b'' es'' as'' es''' > 8 -\tenuto as'' -\tenuto b'' -\tenuto es''' 16. es''' 2 -\tenuto r32 < as''' b''' > 2 -\tenuto  |
            R1*8  |
            < es''' as' > 8 ^( es'' as'' es'' ) es''' ^( es'' as'' es'' )  |
%% 45
            < es''' f' > 8 ^( es'' as'' es'' ) es''' ^( es'' as'' es'' )  |
            < g'' c' b'' es''' > 8 ^( g'' b'' es''' ) < es''' c'' b'' g''' > ^( b'' es''' g''' 16 as'' )  |
            < f''' cis'' > 8 ^( f'' as'' cis''' ) f''' ^( as'' cis''' f''' )  |
            < c'' es''' b'' as'' > 8 ^( as'' b'' es''' ) b'' ^( as'' b'' es''' )  |
            < c''' as'' es' es''' > 8 ^( c'' as'' c''' ) es''' ^( as'' c''' es''' )  |
%% 50
            < b'' es'' as'' es''' > 8 -\tenuto as'' -\tenuto b'' -\tenuto es''' 16. es''' 4 -\tenuto r32 < as''' b''' > 4 -\tenuto b''' 16 as''' es''' b''  |
            < es''' as' > 8 ^( es'' as'' es'' ) es''' ^( es'' as'' es'' )  |
            es''' 8 ^( es'' as'' es'' ) es''' ^( es'' as'' es'' )  |
            < as'' es'' as,, as, es''' > 1 _~  |
            < as'' es'' as,, as, es''' > 1  |
            \bar "|."
        } % Voice
    >> % Staff ends

    \context Staff = "track 10, Smyčcový kvartet" << 
        \set Staff.instrumentName = \markup { \center-column { "Smyčcový kvartet " } }
        \set Staff.shortInstrumentName = "Smyčce"
        \set Staff.midiInstrument = "String Ensemble 2"
        \set Score.skipBars = ##t
        \set Staff.printKeyCancellation = ##t
        \new Voice \global
        \new Voice \globalTempo

        \context Voice = "voice 10" {
            \override Voice.TextScript #'padding = #2.0
            \override MultiMeasureRest #'expand-limit = 1
            \once \override Staff.TimeSignature #'style = #'() 
            \clef "treble"
            \key c \major
            \time 4/4

            R1*11  |
            r2 es'' 4 e''  |
            fis'' 2 -\tenuto r8 g'' fis'' fis'' _~  |
%% 15
            fis'' 8 d'' 4. < d'' e'' > 8 r fis'' -\tenuto g'' -\tenuto r16 
            % warning: overlong bar truncated here |
            a'' 4. h'' 8 g'' 4 fis'' 8 e'' _~  |
            e'' 8 fis'' 4 g'' h'' 4.  |
            h'' 4. a'' fis'' 8 h'' _~  |
            h'' 8 a'' 4 fis'' d'' fis'' 8 _~  |
%% 20
            fis'' 4. e'' d'' 8 d'' _~  |
            d'' 8 e'' 2..  |
            R1*33  |
            \bar "|."
        } % Voice
    >> % Staff ends

    \context Staff = "track 11, Syntetický kontrabas" << 
        \set Staff.instrumentName = \markup { \center-column { "Syntetický kontrabas " } }
        \set Staff.shortInstrumentName = "Ctb."
        \set Staff.midiInstrument = "Synth Bass 1"
        \set Score.skipBars = ##t
        \set Staff.printKeyCancellation = ##t
        \new Voice \global
        \new Voice \globalTempo

        \context Voice = "voice 11" {
            \override Voice.TextScript #'padding = #2.0
            \override MultiMeasureRest #'expand-limit = 1
            \once \override Staff.TimeSignature #'style = #'() 
            \clef "bass_15"
            \key c \major
            \time 4/4

            h,, 8 -\staccato h,, -\staccato h,, -\staccato h,, -\staccato h,, -\staccato h,, -\staccato h,, -\staccato h,, -\staccato  |
            fis,, 8 -\staccato fis,, -\staccato fis,, -\staccato fis,, -\staccato fis,, -\staccato fis,, -\staccato fis,, -\staccato fis,, -\staccato  |
            e, 8 -\staccato e, -\staccato e, -\staccato e, -\staccato e, -\staccato e, -\staccato e, -\staccato h,,  |
%% 5
            fis,, 8 -\staccato fis,, -\staccato fis,, -\staccato fis,, -\staccato fis,, -\staccato fis,, -\staccato fis,, -\staccato fis,, 16 -\staccato fis,, -\staccato  |
            h,, 8 -\staccato h,, -\staccato h,, -\staccato h,, -\staccato h,, -\staccato h,, -\staccato h,, -\staccato h,, -\staccato  |
            fis,, 8 -\staccato fis,, -\staccato fis,, -\staccato fis,, -\staccato fis,, -\staccato fis,, -\staccato fis,, -\staccato fis,, -\staccato  |
            e, 8 -\staccato e, -\staccato e, -\staccato e, -\staccato e, -\staccato e, -\staccato e, -\staccato h,,  |
            fis, 8 -\staccato fis, -\staccato fis, -\staccato fis, -\staccato fis, -\staccato fis, -\staccato fis, -\staccato fis, 16 -\staccato fis, -\staccato  |
%% 10
            h,, 8 -\staccato h,, -\staccato h,, -\staccato h,, -\staccato h,, -\staccato h,, -\staccato h,, -\staccato h,, -\staccato  |
            fis,, 8 -\staccato fis,, -\staccato fis,, -\staccato fis,, -\staccato fis,, -\staccato fis,, -\staccato fis,, -\staccato fis,, -\staccato  |
            e, 8 -\staccato e, -\staccato e, -\staccato e, -\staccato e, -\staccato e, -\staccato e, -\staccato h,,  |
            fis, 8 -\staccato fis, -\staccato fis, -\staccato fis, -\staccato fis, -\staccato fis, -\staccato fis, -\staccato fis, 16 -\staccato fis, -\staccato  |
            d, 8 -\staccato d, -\staccato d, -\staccato d, -\staccato d, -\staccato d, -\staccato d, -\staccato d, -\staccato  |
%% 15
            h,, 8 -\staccato h,, -\staccato h,, -\staccato h,, -\staccato h,, -\staccato h,, -\staccato h,, -\staccato h,, -\staccato  |
            g,, 8 -\staccato g,, -\staccato g,, -\staccato g,, -\staccato g,, -\staccato g,, -\staccato g,, -\staccato g,, -\staccato  |
            a,, 8 -\staccato a,, -\staccato a,, -\staccato a,, -\staccato a,, -\staccato a,, -\staccato a,, -\staccato a,,  |
            d, 8 -\staccato d, -\staccato d, -\staccato d, -\staccato d, -\staccato d, -\staccato d, -\staccato d, -\staccato  |
            h,, 8 -\staccato h,, -\staccato h,, -\staccato h,, -\staccato h,, -\staccato h,, -\staccato h,, -\staccato h,,  |
%% 20
            g, 8 -\staccato g, -\staccato g, -\staccato g, -\staccato g, -\staccato g, -\staccato g, -\staccato g,  |
            a,, 8 -\staccato a,, -\staccato a,, -\staccato a,, -\staccato a,, -\staccato a,, -\staccato a,, -\staccato a,, -\staccato  |
            as,, 8 -\staccato as,, -\staccato as,, -\staccato as,, -\staccato as,, -\staccato as,, -\staccato as,, -\staccato as,,  |
            f, 8 -\staccato f, -\staccato f, -\staccato f, -\staccato f, -\staccato f, -\staccato f, -\staccato f,  |
            c, 8 -\staccato c, -\staccato c, -\staccato c, -\staccato c, -\staccato c, -\staccato c, -\staccato c, -\staccato  |
%% 25
            cis, 8 -\staccato cis, -\staccato cis, -\staccato cis, -\staccato cis, -\staccato cis, -\staccato cis, -\staccato cis, -\staccato  |
            cis, 8 -\staccato cis, -\staccato cis, -\staccato cis, -\staccato cis, -\staccato cis, -\staccato cis, -\staccato cis, -\staccato  |
            c, 8 -\staccato c, -\staccato c, -\staccato c, -\staccato b,, -\staccato b,, -\staccato b,, -\staccato b,,  |
            es, 8 -\staccato es, -\staccato es, -\staccato es, es,, 16 -\staccato es, -\staccato b,, 8 -\staccato as,, -\staccato g,, -\staccato  |
            as,, 8 -\staccato as,, -\staccato as,, -\staccato as,, -\staccato as,, -\staccato as,, -\staccato as,, -\staccato as,,  |
%% 30
            f, 8 -\staccato f, -\staccato f, -\staccato f, -\staccato f, -\staccato f, -\staccato f, -\staccato f,  |
            c, 8 -\staccato c, -\staccato c, -\staccato c, -\staccato c, -\staccato c, -\staccato c, -\staccato c, -\staccato  |
            cis, 8 -\staccato cis, -\staccato cis, -\staccato cis, -\staccato cis, -\staccato cis, -\staccato cis, -\staccato cis, -\staccato  |
            c, 8 -\staccato c, -\staccato c, -\staccato c, -\staccato c, -\staccato c, -\staccato c, -\staccato c, 16 -\staccato c, -\staccato  |
            es, 8 -\staccato es, -\staccato es, -\staccato es, -\staccato es, -\staccato es, -\staccato es, -\staccato es, -\tenuto _~  |
%% 35
            es, 16 -\tenuto r es, 8 -\staccato es, -\staccato es, -\staccato es, cis, -\staccato c, -\staccato b,, -\staccato  |
            h,, 8 -\staccato h,, -\staccato h,, -\staccato h,, -\staccato h,, -\staccato h,, -\staccato h,, -\staccato h,, -\staccato  |
            as,, 8 -\staccato as,, -\staccato as,, -\staccato as,, -\staccato as,, -\staccato as,, -\staccato as,, -\staccato as,,  |
            e, 8 -\staccato e, -\staccato e, -\staccato e, -\staccato e, -\staccato e, -\staccato e, -\staccato e,  |
            fis,, 8 -\staccato fis,, -\staccato fis,, -\staccato fis,, -\staccato fis,, -\staccato fis,, -\staccato fis,, -\staccato fis,, 16 -\staccato fis,, -\staccato  |
%% 40
            h,, 8 -\staccato h,, -\staccato h,, -\staccato h,, -\staccato h,, -\staccato h,, -\staccato h,, -\staccato h,, -\staccato  |
            as,, 8 -\staccato as,, -\staccato as,, -\staccato as,, -\staccato as,, -\staccato as,, -\staccato as,, -\staccato as,,  |
            e, 8 -\staccato e, -\staccato e, -\staccato e, -\staccato e, -\staccato e, -\staccato e, -\staccato e,  |
            fis,, 8 -\staccato fis,, -\staccato fis,, -\staccato fis,, -\staccato fis,, cis, -\staccato fis, -\staccato cis, -\staccato  |
            as,, 8 -\staccato as,, -\staccato as,, -\staccato as,, -\staccato as,, -\staccato as,, -\staccato as,, -\staccato as,,  |
%% 45
            f, 8 -\staccato f, -\staccato f, -\staccato f, -\staccato f, -\staccato f, -\staccato f, -\staccato f,  |
            c, 8 -\staccato c, -\staccato c, -\staccato c, -\staccato c, -\staccato c, -\staccato c, -\staccato c, -\staccato  |
            cis, 8 -\staccato cis, -\staccato cis, -\staccato cis, -\staccato cis, -\staccato cis, -\staccato cis, -\staccato cis, -\staccato  |
            c, 8 -\staccato c, -\staccato c, -\staccato c, -\staccato c, -\staccato c, -\staccato c, -\staccato c, 16 -\staccato c, -\staccato  |
            es, 8 -\staccato es, -\staccato es, -\staccato es, -\staccato es, -\staccato es, -\staccato es, -\staccato es, -\tenuto _~  |
%% 50
            es, 16 -\tenuto r es, 8 -\staccato es, -\staccato es, -\staccato es, cis, -\staccato c, -\staccato b,, -\staccato  |
            as,, 8 -\staccato as,, -\staccato as,, -\staccato as,, -\staccato as,, -\staccato as,, -\staccato as,, -\staccato as,, -\staccato  |
            as,, 8 -\staccato as,, -\staccato as,, -\staccato as,, -\staccato as,, -\staccato as,, -\staccato as,, -\staccato as,, -\staccato  |
            R1*2  |
            \bar "|."
        } % Voice
    >> % Staff (final) ends

>> % notes

\layout {
    \context { \RemoveEmptyStaffContext }
}
% uncomment to enable generating midi file from the lilypond source
%     \midi {
%     } 
} % score

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

		system-system-spacing #'basic-distance = #10
		system-separator-markup = \slashSeparator
		indent = #22
		left-margin = #20
		right-margin = #5
		top-margin = #3
		bottom-margin = #6

		page-count = #4
}
