\include "custom.ly"

\header {
	title = ""
	subtitle = ""
	composer = ""
	%arranger = \markup\tiny "revise a prstoklady: Darek (II/2015)"
	poet = ""
	meter = ""
	tagline = ""
}
 


global = {
	\time 4/4
	\key e \major

	\set Score.voltaSpannerDuration = #(ly:make-moment 6/8)
	\override Rest.staff-position = #0

	\globalstyle
}

lining = {
	\global

}

RH = {
	\global	

	\tempo\markup\main-tempo "Andante tranquillo" 4 = 72
	\partial 2 s2 |
	s1*2 |

	\repeat unfold 3 { \repeat tremolo 16 { gis''32 e'' } | }
	\repeat tremolo 4 { fis'' a' } \repeat tremolo 4 { a'' a' } \repeat tremolo 8 { gis'' e'' } |

	\ottava #1 \osm \repeat tremolo 4 { gis'' e'' } \repeat tremolo 4 { <fis'' ais''> e'' } \repeat tremolo 4 { <fis'' h''> dis'' } << { h''8 s } \\ { \repeat tremolo 4 { fis''32 dis'' } } >> |
	\repeat tremolo 16 { fis'' dis'' } \ottava #0 |
	\repeat tremolo 8 { fis' dis'~ } <fis' dis'>8 r4. |
	\repeat unfold 2 { \times 2/3 { <h dis' fis'>8-. <ais dis'>-. <h dis' fis'>-. } <ais cis'>4-> } |

	\repeat tremolo 12 { fis''32 dis'' } fis''8 r |
	\ottava #1 \osm
	\repeat unfold 3 { \repeat tremolo 16 { gis''32 e'' } } |

	\repeat tremolo 8 { gis'' e'' } \repeat tremolo 8 { a'' cis'' } |
	\repeat tremolo 8 { gis'' e'' } \repeat tremolo 4 { fis'' a' } \repeat tremolo 4 { fis''  d'' } |
	\ottava #0
	\transpose c c'
	{
		\repeat tremolo 12 { cis' a } \repeat tremolo 4 { dis' h } |
		\repeat tremolo 4 { e' gis } \repeat tremolo 4 { h fis } \repeat tremolo 4 { <ais cis'> fis } \repeat tremolo 4 { cis' ais } |
		\repeat tremolo 16 { cis' ais } |
		\repeat tremolo 8 { cis ais,~ } <ais, cis>8 r4. |
		\repeat unfold 2 { \times 2/3 { <cis fis ais cis'>8-. <cis eis ais>-. <cis fis ais cis'>-. } <cis eis gis>4-> } |
		<eis gis cis'>2~ q8 r4. |
		<e g cis'>2~ q8 r4. \bar "||"

		\key d \major
		\repeat unfold 2 { d16( e fis g a h cis' d') } |
		\ottava #1 \osm \transpose c c' { d( e fis gis ais h cis' d') } \ottava #0 d( e fis gis ais h cis' d') |
		\ottava #1 \osm \transpose c c' { d( e fis g a h cis' d') } \ottava #0 d( e fis g ais h cis' d')  |
		\ottava #1 \osm \transpose c c' { e( fis g a h cis' d' e') } \ottava #0 d( e fis g ais h cis' d') |
		gis(\< a h \transpose c c' { cis d e fis gis a\> gis fis e d cis } h a)\! |

		\repeat unfold 2 { \ottava #1 \osm \transpose c c' { d( e fis g a h cis' d') } \ottava #0 d( e fis g ais h cis' d') | }
		\ottava #1 \osm \transpose c c' { h,( cis d e fis g a h) } \ottava #0 h,( cis d e fis gis a h) |
		h,(\< cis d e fis gis a h cis'\> h a gis fis e d cis) |
		a(\! gis fis_\markup\italic "cresc." e dis cis h, a, gis, a, h, cis d e fis gis) |
		cis\mf( dis eis fis gis a h cis') 
	}
	cis\f( dis eis fis gis a h cis') | \clef "bass"

	\tempo\markup\main-tempo "Più mosso" 4 = 100
	\repeat unfold 2 { \times 16/24 { \repeat tremolo 24 { cis,16 } } } | \clef "treble"

}

LH = {
	\global

	\partial 2 e2\pp~ |
	e16\( gis cis' h gis h \transpose c c' { e gis \srh cis' h gis e \slh \clef "treble" dis e gis h | \srh
	e' gis' cis'' h' gis' e' \slh cis' h gis h cis' e' \srh gis' h' cis'' e''\) } | \slh
	R1 |
	\transpose c c''
	{
		e2\(\p gis4 h8 gis |
		cis'2 h4 gis\) |
		a8\( gis fis cis e4 dis |
		e8 dis <cis ais, fis,>4 <h, fis, dis, h,,>4.\)\strum r16 a32\f a |
		a4->~ \tupletSpan 4 \times 2/3 { a16-. gis-. a-. fis-. a-. e-. a-. dis-. cis'-. } h4-> r16 a,32\f a, |
	}
	\transpose c c'
	{
		\times 2/3 { a8-. gis-. fis-. } a8. h,16 \override TupletBracket.bracket-visibility = ##f \times 8/12 { \repeat tremolo 12 { fis16->\fp } } |
		\times 16/24 { \repeat tremolo 24 { fis } } |
		\override TupletBracket.bracket-visibility = ##t
		h,2~ h,16( dis gis fis \tupletSpan 8 \times 2/3 { h dis' gis' fis' dis' h } |
		e'8) r4. 
	}
	\clef "bass" e2->~ |
	e16\( gis cis' h gis h \clef "treble" e' gis' cis'' h' gis' e' dis' e' gis' h' |
	e''8\) r2.. |

	\transpose c c''
	{
		gis4( e8 cis fis a gis \priraz{a16 gis} fis8) |
		e4( cis8) r fis( e16 d cis8 h,) |
	}
	\transpose c c'
	{
		cis'( h a gis fis a gis fis) |
	}
	\clef "bass"

	<< { e'4( dis'8\strum e'16 dis' cis'4.) } \\ { r4 <h, fis>\strum <fis ais>4.-> } >> \clef "treble" r16 e''32 e'' |
	\transpose c c'
	{
		e'4->~ \tupletSpan 4 \times 2/3 { e'16-. dis'-. e'-. cis'-. e'-. h-. e'-. ais-. gis'-. } fis'4-> r16 e'32 e' |
		\clef "bass"
		\times 2/3 { e8-. dis-. cis-. } e8.
	}
	fis16 \override TupletBracket.bracket-visibility = ##f \times 8/12 { \repeat tremolo 12 { cis' } } |
	\times 16/24 { \repeat tremolo 24 { cis' } } \clef "treble" |

	\transpose c c' { cis16 dis eis fis gis ais h his cis' dis' eis' \srh fis' gis' ais' h' his' } \slh \clef "bass" |
	<< { cis d e fis } \\ { \grace a,,8 a,,4 } >> g16 gis a h cis' d' e' \srh fis' g' a' h' cis'' \slh \clef "treble" \bar "||"

	\key d \major
	<<
		{
			\transpose c c'
			{
				d2( fis4 a8 fis |
				h4 d' cis'8 d'16 cis' h4) |
				a2( fis) |
				g8\strum( fis e h, \clef "bass" d\strum cis d cis) |
				h,4( cis8 h,) a,4( e8) r \clef "treble" |
				fis4( a8 fis h d' cis' \priraz{d'16 cis'} h8 |
				a2\strum fis) |
				h8\strum a16 g fis8 e fis\strum e d cis | \clef "bass"
			}
			h d' cis' h a4 g |
			a8\strum gis fis4 e d8\strum e16 d |
		}
		\\
		{
			<d fis a>2 <cis' d'> |
			<h d' fis'>2. q4 |
			<fis d'>2 <h d'> |
			<e h>4\strum g \clef "bass" <h, fis>\strum r |
			<e gis>2 <a, cis e> | \clef "treble"
			
			<d a>2\strum <h fis'>\strum |
			<fis d'>\strum <h d'> |
			<g d'>\strum <h, h>4\strum r | \clef "bass"

			<e gis>4.( <d gis>8) <a, cis e>4 <cis e> |
			<fis, cis>4\strum <h, dis> <e, gis, h,> <h,, fis,>\strum |
		}
	>>
	\repeat tremolo 8 { <cis, eis, gis,>32 cis } q8 r4. \clef "treble"
}

\paper
{
		%page-breaking = #ly:one-line-breaking
}

\score {
	\new PianoStaff \with {
		\consists #Span_stem_engraver
	} {
		\set PianoStaff.connectArpeggios = ##t
		<<
			\new Staff = "RH" { <<
				\new Voice { \clef "treble" \transpose c c' \RH }
				\new Voice { \clef "treble" \lining }
			>> }
			\new Staff = "LH" {
				\new Voice { \clef "bass" \LH }
			}
		>>
	}

	\layout
	{
		\displayControlPoints
	}
}

\score {
	\new PianoStaff \with {
		instrumentName = \markup\small\center-column{"PIANO" "PRINCIPAL"}
		midiMinimumVolume = 1
		midiMaximumVolume = 1
		midiInstrument = "acoustic grand"
	} {
		\set PianoStaff.connectArpeggios = ##t
		<<
			\new Staff = "RH" { <<
				\new Voice { \clef "treble" \transpose c c' \unfoldRepeats \RH }
				\new Voice { \clef "treble" \lining }
			>> }
			\new Staff = "LH" {
				\new Voice { \clef "bass" \unfoldRepeats \LH }
			}
		>>
	}

	\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 80 8) } } 
}
