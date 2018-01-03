\include "custom.ly"

\header {
	title = \markup \fontsize #3 \sans \bold "V"
	subtitle = \markup\tiny \raise #1 "(Preludium a fuga v h moll)"
	composer = "Mario Castelnuovo-Tedesco"
	%arranger = \markup\tiny "revise a prstoklady: Darek (II/2015)"
	poet = ""
	meter = ""
	tagline = ""
}

global = {
	\globalstyle
}

tkp = {
	\key h \minor
	\time 2/2
	\magnifyStaff #.85
}

tkf = {
}

liningp = {
	\global
	s1*4 | \break
	s1*4 | \break
	s1*5 | \break
	s1*4 | \break
	s1*4 | \break
	s1*3 | \break \pageBreak
	s1*4 | \break
	s1*5 | \break
	s1*4 | \break
	s1*3 | \break
	s1*3 | \break
	s1*4 | \break \pageBreak
}

melodyIp = {	
	\global
	\tkp
	\voiceOne
	\slurDown

	\tempo\markup\main-tempo "Piuttosto mosso e agitato."
	r2 \times 4/6 { h8( fis' d' g' fis' d''} |
	h') r r4 \times 4/6 { h8( fis' d' g' fis' d'' } |
	cis'') r r4 \times 4/6 { h8( fis' d' g' fis' d'' } |

	cis'') r r4 \times 4/6 { h8( g' e' a' g' e'' } |
	dis'') r \times 2/3 { h( a' fis' } d'') r \times 2/3 { h( a' fis' } |
	cis'') r \times 2/3 { h( as' eis' } c'') r \times 2/3 { h( g' e' } |

	h') r r4 \times 4/6 { h8( fis' d' g' fis' d''} |
	h') r r4 \times 4/6 { a8( fis' d' g' fis' d'' } |
	h') r r4 \times 4/6 { g8( eis' d' a' g' d'' } |

	h') r r4 
	 <<
		{ \voiceOne\stemUp\slurDown
			\override TupletBracket.bracket-visibility = ##t
			\times 4/6 { g8( e' c' a' g' c'' } |
			h'4~) \times 2/3 { h'4 cis''8 } d''4~ \times 2/3 { d''4 cis''8 } |
			h'4~ \times 2/3 { h'4 a'8 } g'4~ \times 2/3 { g'4 fis'8 } |
		} \\
		{ \voiceTwo\stemDown
			\override TupletBracket.bracket-visibility = ##t
			s2 | s4 \times 2/3 {h8 fis' d'} s4 \times 2/3 { cis'8 g' e' } |
			s4 \times 2/3 {h8 fis' d'} s4 \times 2/3 { b8 e' cis' } |
		}
	>>

	\times 8/12 { h8( fis' d' g' fis' d'') h8( g' e' h' g' d'') } |
	\times 8/12 { h8( fis' d' g' fis' d'') b8( e' cis' g' fis' cis'') } |
	\times 4/6 { h8( f' d' a' f' h' } a') r4. |

	\times 4/6 { fis8( cis' b e' cis' g' } e') r4. |
	\times 4/6 { h8( f' d' a' f' h' } a') r4. |
	\times 8/12 { fis8( cis' ais e' cis' g' e' cis' ais g e cis) } \bar "||"

	\time 4/4 \tempo\markup\main-tempo "Molto lento e grave." \tempo 4 = 50
	h,8 r4. r8. <h fis d>16[ <cis' g e>8. <d' a fis>16] |
	q4 <cis' g e> r8. <cis' g e>16[ <dis' a fis>8. <e' h g>16] |
	q4 <dis' a fis> r8. q16[ <e' h g>8. <fis' c' a>16] |

	<a' e' c'>8.[ <g' d' h>16 <fis' c' a>8. <e' h g>16 <d' a fis>8. <cis' g e>16 <h fis d>8. <b e cis>16] |
	<h g d>2 r8. <h f d>16[ <c' g e>8. <d' a f>16] |
	q4 <c' g e> r8. <c' g e>16[ <d' a f>8. <e' h g>16] |

	<e' c' fis>4 <d' h g> r8. q16[ <e' c' a>8. <eis' cis' ais>16] |
	<fis' d' h>8.[ <e' cis' a>16 <d' h g>8. <cis' a fis>16 <h g e>8. <a fis d>16 <g e c>8. <fis e b,>16] | \bar "||"

	\time 2/2 \tempo-primo \tempo 4 = 90
	<h fis d>8 r \times 4/6{ h([ fis' d' g' fis' d''] } h') r |
	r4 \times 4/6 { h8([ g' e' a' g' e''] } cis'') r |
	r4 \times 4/6 { h8([ a' fis' c'' h' fis''] } dis'') r |

	r4 \times 6/9 { c8( a' g' d'' c'' g'' e' c'' a' } |
	g'4~) \times 2/3 { g'4 fis'8 } e'4~ \times 2/3 { e'4 d'8 } |
	e'8 r \times 4/6 { e([ h g c' h g'] } e') r |

	\times 8/12 { e8( h g c' h g' e' h' g' e' h g) } |
	\times 8/12 { fis8( h a d' c' g' fis' c'' a' fis' c' a) } |
	\times 8/12 { gis( c' h e' d' a' gis' d'' h' gis' d' h) } |

	\times 8/12 { a( d' c' f' e' h' a' e'' c'' a' e' c') } |
	\times 8/12 { h( e' d' a' gis' c'' h') f''( d'' h' gis' f' } |
	\times 8/12 { d') d''( h' gis' f' d' h) h'( gis' f' d' h) } \bar "||"

	\time 4/4 \tempo\markup\main-tempo "Molto lento e grave." \tempo 4 = 50
	<c f a>2 r8. q16[ <h g d>8. <c' g e>16] |
	<c' g dis>4 <h a dis> r8. <a f c>16[ <h g d>8. <c' a e>16] |

	<c' a dis>4 <h a dis> r8. <a f c>16[ <h g dis>8. <c' g e>16] |
	<g' e' h>8.[ <f' d' a>16 <e' c' g>8. <d' h f>16 q8. <cis' ais e>16 <h g d>8. <ais fis cis>16] |

	<h fis d>2 r8. <d' h fis>16[ <des' b f>8. <c' a e>16] |
	<h gis dis>2 r8. <h g d>16[ <b fis cis>8. <a f c>16] |

	<gis e h,>2 r8. q16[ <g es b,>8. <fis d a,>16] |
	<f cis gis,>2 <e c g,>2 |
	<dis h, fis,>1 \bar "|."
}

bassesIp = { \global\tkp\voiceTwo }

melodyIIp = {
	\global
	\tkp
	\voiceOne
	\slurDown
	
	\repeat unfold 2 { \times 4/6 { h,8( fis d g fis d' } h) r r4 | }
	\repeat unfold 2 { \times 4/6 { h,8( g e a g d' } cis') r r4 | }

	\times 2/3 { h,8( a fis } dis') r \times 2/3 { h,( a fis } d') r |
	\times 2/3 { h,( as f } cis') r \times 2/3 { h,( g e } c') r |

	\times 4/6 { h,( fis d g fis d' } h) r r4 |
	\times 4/6 { a,8( fis d g fis d' } h) r r4 |
	\times 4/6 { g,8( eis d a g d'} h) r r4 |
	
	\times 4/6 { g,8( e c a g c' } a) r r4 |
	\times 2/3 { fis,8( fis d } h) r \times 2/3 { fis,( g e } h) r |
	\times 2/3 { fis,8( fis d } h) r \times 2/3 { fis,( e c } g) r |

	<h~ d fis,>4 \times 2/3 { h4 cis'8 } <d'~ g h, e,>4 \times 2/3 { d'4 cis'8 } |
	<d h~>4 \times 2/3 { h4 a8 } <g~ cis>4 \times 2/3 { g4 fis8 } |
	<f~ h,>4 \times 2/3 { f4 d8 } cis4~ \times 2/3 { cis4 h,8 } |

	<fis, ais,>4~ \times 2/3 { ais,4 h,8 } cis4~ \times 2/3 { cis4 fis8 } |
	<f~ h,>4 \times 2/3 { f4 d8 }  cis4~ \times 2/3 { cis4 h,8 } |
	b,4~ \times 2/3 { b,4 g,8 } fis,4. r8 \bar "||"

	h,8_\markup\line{\dynamic "p" \italic\tiny "funebre quasi Timpani :)"} r16 \times 2/3{h,32 h, h,} h,8 r16 \times 2/3{h,32 h, h,} h,8 r4. |
	\repeat unfold 2 { \repeat unfold 2 { h,8 r16 \times 2/3{h,32 h, h,} } h,8 r4. | }
	e,8 r16 \times 2/3 {e,32 e, e,} e,8 r fis,8 r16 \times 2/3 {fis,32 fis, fis,} fis,8 r |

	\repeat unfold 3 { \repeat unfold 2 { g,8 r16 \times 2/3{g,32 g, g,} } g,8 r4. | }
	\repeat unfold 2 { fis,8 r16 \times 2/3{fis,32 fis, fis,} } fis,8 r4. |

	\times 4/6 { h,8( fis d g fis d' } h) r4.  |
	\times 4/6 { h,8( g e a g e' } c') r4. |
	\times 4/6 { h,8( a fis c' h fis' } dis') r4. |

	\times 8/12 { c8( a g d' c' g') fis,( a e h a e') } |
	\times 8/12 { h,( g e c' h g') h,( a fis c' h fis') } |
	\times 4/6 { e,( h, g, c h, g } e) r4. |
	
	\repeat unfold 6 { e,1 | }

	r8. \times 2/3{f,32 f, f,} f,8 r16  \times 2/3{f,32 f, f,} f,8 r4.|
	\repeat unfold 2 { r8. \times 2/3{h,32 h, h,} h,8 r16  \times 2/3{h,32 h, h,} f,8 r4. | }
	r8. \times 2/3{f,32 f, f,} f,8 r8 r8. \times 2/3{fis,32 fis, fis,} fis,8 r8 |

	\repeat unfold 3 { r8. \times 2/3{h,32 h, h,} h,8 r16  \times 2/3{h,32 h, h,} h,8 r4. | }
	r8. \times 2/3{h,32 h, h,} h,8 r8 r8.  \times 2/3{h,32 h, h,} h,8 r |
	r8. \times 2/3{h,32 h, h,} h,8 r8 r8.  \times 2/3{h,32 h, h,} h,8 r |

}

bassesIIp = {\global\tkp\voiceTwo}

liningf = {
	\tkf
}

melodyIf = {	
	\global
	\tkf
	\oneVoice
}

bassesIf = {\global\tkf\voiceTwo}

melodyIIf = {	
	\global
	\tkf
	\oneVoice
}


bassesIIf = {\global\tkf\voiceTwo}

\paper
{
}

\include "skelet.ly"
