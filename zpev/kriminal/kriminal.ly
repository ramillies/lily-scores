\version "2.18.0"
\language "deutsch"

\header {
	title = "Funny Old World"
	composer = "Jim Boyes"
	copyright = ""
	tagline = ""
}

global = {
	\key d \major
	\time 4/4
	\override TupletBracket.bracket-visibility = ##t
}

lining = {
	\global


}

zaba = {
	\global

	\tempo\markup\sans\large\bold "Moderato, rubato"

	\transpose c c,
	{
		\repeat volta 2
		{
			a'8 \mf a'4. a'4. g'16 fis'16 | % 2
			g'8 g'4. g'4. r8 | % 3
			g'8 g'4. g'4 g'4 | % 4
			a'2. r4 | % 5
			a'4 a'8 a'4. fis'4 | % 6
			g'4 g'4 g'4. g'8 | % 7
			g'4. g'8 g'4 g'4 | % 8
			a'2 r4 a'4 \f | % 9
			\time 5/4  d''8 d''4. d''4 r4 a'4 | 
			\time 6/4  c''4 d''4 a'2 r4 a'4 | % 11
			\time 4/4  d''4. d''8 d''4 r4 | % 12
			a'8 \mp a'4. a'4. d''8 | % 13
			cis''2. r4 | % 14
			| % 14
			a'8 \mp a'4. a'4. g'16 fis'16 | % 15
			g'8 g'4. g'4. r8 | % 16
			\time 3/4  f'8 f'8 f'2 | % 17
		}
		\alternative
		{
			{
				\time 4/4  g'2 ~^\fermata g'8 r8 fis'16 \f fis'8. \bar
				"||"
				\time 5/4  d''4 d''8 d''4. r4 a'8 a'8 | % 19
				d''4 d''8 d''4. r4 d''4 | 
				d''4 d''8 d''4. r4 a'8 a'8 | % 21
				\time 6/4  h'4 d''4 cis''2 r4 a'16 a'8. | % 22
				\time 5/4  d''4 d''8 d''4. r4 a'8 a'8 | % 23
				\time 4/4  d''4 d''8 d''4. r4 | % 24
				\times 2/3 { d''4 d''8 } d''4 d''4. r8^\fermata | % 25
				\tempo\markup\sans\bold "Rit."
				a'8 \mp a'8 a'8 a'8 a'4 a'4 | % 26
				h'2. r4^\fermata
			}
			{
				\time 4/4  g'1 \bar "||"
			}
		}
		R1*8 | % 52
		g'4 \f a'4 a'4 e'8 ( fis'8 ) | % 53
		g'4 g'8 ( fis'8 ) g'4 a'8 a'8 | % 54
		g'4 -. a'8 a'8 a'4 e'8 fis'8 | % 55
		g'4 a'4 d'4 r8 d'8 | % 56
		g'4 a'4 a'4 e'8 fis'8 | % 57
		g'4 g'4 g'4 a'8 a'8 | % 58
		g'4 a'4 a'4 e'8 fis'8 | % 59
		g'4 a'4 d'4 r4 \bar "||"
		c''8 \f c''8 d''4 d''4 a'8 h'8 | % 61
		c''4 c''8 h'8 c''4 d''4 | % 62
		c''8 c''8 d''4 d''8 d''8 a'8 h'8 | % 63
		c''4 d''4 a'4 r8 a'8 | % 64
		c''4 d''8 d''8 d''4 a'8 h'8 | % 65
		c''8 c''8 c''8 h'8 c''4 d''4 | % 66
		c''4 d''4 d''4 c''8 h'8 | % 67
		c''4 d''4 a'4. r8 | % 68
		c''4 d''4 d''4 a'8 ( h'8 ) | % 69
		c''4 c''8 ( h'8 ) c''4 d''8 d''8 | 
		c''4 -. d''8 d''8 d''4 c''8 h'8 | % 71
		c''4 d''4 a'4 r8 a'8 | % 72
		c''4 d''4 d''4 a'8 h'8 | % 73
		c''4 c''4 c''4 d''8 d''8 | % 74
		c''4 d''4 d''4 c''8 h'8 | % 75
		c''4 d''4 a'4 r4 \bar "||"
		c''8 \p c''8 d''4 d''4 a'8 h'8 | % 77
		c''4 c''8 h'8 c''4 d''4 | % 78
		c''8 c''8 d''4 d''8 d''8 a'8 h'8 | % 79
		c''4 d''4 a'4 r8 a'8 | 
		c''4 d''8 d''8 d''4 a'8 h'8 | % 81
		\tempo\markup\sans\bold "Rit."
		c''8 c''8 c''8 h'8 c''4 d''4 | % 82
		c''4 d''4 d''4 c''8 h'8 | % 83
		c''4 d''4 a'4 a'4 \ff \bar "||"
		\tempo\markup{\override #'(word-space . 0) \sans\bold\line{"Tempo I" \raise #1 \underline "o"}}
		\time 5/4  d''8 d''4. d''4 r4 a'4 \f | % 85
		\time 6/4 c''4 d''4 a'2 r4 a'4 | % 86
		\time 4/4  d''4. d''8 d''4 r4 | % 87
		a'8 \mp a'4. a'4. d''8 | % 88
		cis''2. r4 | % 89
		a'8 a'4. a'4. g'16 fis'16 | 
		g'8 g'4. g'4. r8 | % 91
		\time 3/4  f'8 f'8 f'2 | % 92
		\time 5/4 g'2. r4 a'8. \f a'16 \bar "||"
		d''8 d''4. d''4. r8 a'4 | % 94
		d''8 d''4 d''4. r4 a'4 | % 95
		\time 4/4  d''8 d''4 d''4. r4 | % 96
		a'8 a'4 a'4. d''4 | % 97
		cis''2 ~ cis''8 r8 a'4 | % 98
		\time 5/4 d''8 d''4 d''4.
		r4 a'4 | % 99
		d''8 d''4 d''4. r4 a'4 | 
		\time 4/4  | 
		d''8 \ff d''4 -> d''4. -> r4 | % 101
		\time 5/4  | % 101
		a'8 \mp a'4 a'4 a'8 a'4 a'4 | % 102
		\time 4/4  h'2. r4 \bar "||"
		| % 103
		a'8 \p a'4. a'4. g'16 fis'16 | % 104
		g'8 g'4. g'4. r8 | % 105
		g'8 g'4. g'4 g'4 | % 106
		a'2. r4 | % 107
		a'4 a'8 a'4. fis'4 | % 108
		g'4 g'4 g'4. g'8 | % 109
		g'4. g'8 g'4 g'4 | 
		a'1 | % 111
		a'1( \pp | % 112
		g'2. ~ g'8) r8 | % 113
		\time 3/4  | % 113
		f'8 \pp f'8 f'2 | % 114
		\time 4/4  g'1 \bar "|."
	}
}

darek = {
	\global
	\transpose c c,
	{
		\repeat volta 2
		{
			fis'8 \mf fis'4. fis'4. e'16 d'16 | % 2
			e'8 d'4. d'4. r8 | % 3
			e'8 d'4. d'4 d'4 | % 4
			d'2. r4 | % 5
			fis'4 fis'8 fis'4. d'4 | % 6
			e'4 d'4 d'4. e'8 | % 7
			e'4. d'8 d'4 d'4 | % 8
			 d'2 r4 d'4 \f | % 9
			\time 5/4  h'8 a'4. a'4 r4 fis'4 | 
			\time 6/4  g'4 a'4 f'16 ( e'16 d'8 ~ d'4 ) r4 d'4 | % 11
			\time 4/4  h'4. a'8 a'4 r4 | % 12
			fis'8 \mp fis'4. e'8 ( d'4 ) fis'8 | % 13
			e'2. r4 | % 14
			 | % 14
			fis'8 \mp fis'4. fis'4. e'16 d'16 | % 15
			e'8 d'4. d'4. r8 | % 16
			\time 3/4  f'8 f'8 d'2 | % 17
		}
		\alternative
		{
			{
				\time 4/4  d'2 ~ \fermata d'8 r8 d'16 \f d'8. \bar "||"
				\time 5/4  h'4 a'8 a'4. r4 d'8 d'8 | % 19
				 h'4 a'8 a'4. r4 h'4 | 
				h'4 a'8 a'4. r4 fis'8 fis'8 | % 21
				\time 6/4  fis'4 e'4 e'2 r4 d'16 d'8. | % 22
				\time 5/4  h'4 a'8 a'4. r4 d'8 d'8 | % 23
				\time 4/4  h'4 a'8 a'4. r4 | % 24
				\times 2/3 { h'4 h'8 } a'4 a'4. r8^\fermata | % 25
				fis'8 \mp fis'8 fis'8 e'8 e'4 fis'4 | % 26
				e'8 ( d'8 ~ d'2 ) r4^\fermata
			}
			{
				\time 4/4  d'1 \bar "||" \break
			}
		}
		\tempo\markup\sans\bold "Allegro"
		g'8 g'8 a'4 a'4 e'8 fis'8 | % 45
		g'4 g'8 fis'8 g'4 a'4 | % 46
		g'8 g'8 a'4 a'8 a'8 e'8 fis'8 | % 47
		g'4 a'4 d'4 r8 d'8 | % 48
		g'4 a'8 a'8 a'4 e'8 fis'8 | % 49
		 g'8 g'8 g'8 fis'8 g'4 a'4 | 
		g'4 a'4 a'4 e'8 fis'8 | % 51
		g'4 a'4 d'4. r8 | % 52
		g'4 \f a'4 a'4 e'8 ( fis'8 ) | % 53
		g'4 g'8 ( fis'8 ) g'4 a'8 a'8 | % 54
		g'4 -. a'8 a'8 a'4 e'8 fis'8 | % 55
		 g'4 a'4 d'4 r8 d'8 | % 56
		g'4 a'4 a'4 e'8 fis'8 | % 57
		g'4 g'4 g'4 a'8 a'8 | % 58
		g'4 a'4 a'4 e'8 fis'8 | % 59
		g'4 a'4 d'4 r4 \bar "||"
		g'8 \f g'8 a'4 a'4 e'8 fis'8 | % 61
		 g'4 g'8 fis'8 g'4 a'4 | % 62
		g'8 g'8 a'4 a'8 a'8 e'8 fis'8 | % 63
		g'4 a'4 d'4 r8 d'8 | % 64
		g'4 a'8 a'8 a'4 e'8 fis'8 | % 65
		g'8 g'8 g'8 fis'8 g'4 a'4 | % 66
		g'4 a'4 a'4 e'8 fis'8 | % 67
		 g'4 a'4 d'4. r8 | % 68
		g'4 a'4 a'4 e'8 ( fis'8 ) | % 69
		g'4 g'8 ( fis'8 ) g'4 a'8 a'8 | 
		g'4 -. a'8 a'8 a'4 e'8 fis'8 | % 71
		g'4 a'4 d'4 r8 d'8 | % 72
		g'4 a'4 a'4 e'8 fis'8 | % 73
		 g'4 g'4 g'4 a'8 a'8 | % 74
		g'4 a'4 a'4 e'8 fis'8 | % 75
		g'4 a'4 d'4 r4 \bar "||"
		fis'8 \mp fis'4 fis'4. e'8 d'8 | % 77
		e'8 d'4. d'4. e'8 ~ | % 78
		e'4 d'4 d'4 d'4 ~ | % 79
		 d'4 d'2  ~ d'8 r8 | 
		fis'4 fis'8 fis'4. d'4 | % 81
		e'4 d'4 d'4 e'4 | % 82
		e'4. d'8 d'4 d'4 | % 83
		d'2. \< d'4 \! \ff \bar "||"
		\time 5/4  h'8 a'4. a'4 r4 fis'4 \f | % 85
		\time 6/4   \time 6/4 g'4 a'4 f'16 ( e'16 d'8 ~ d'4 ) r4 d'4
		| % 86
		\time 4/4  h'4. a'8 a'4 r4 | % 87
		fis'8 \mp fis'4. e'8 ( d'4 ) fis'8 | % 88
		e'2. r4 | % 89
		fis'8 fis'4. fis'4. e'16 d'16 | 
		e'8 d'4. d'4. r8 | % 91
		\time 3/4  f'8 f'8 d'2 | % 92
		\time 5/4   \time 5/4 d'2. r4 d'8. \f d'16 \bar "||"
		h'8 a'4. a'4. r8 d'4 | % 94
		h'8 a'4 a'4. r4 h'4 | % 95
		\time 4/4  h'8 a'4 a'4. r4 | % 96
		fis'8 fis'4 e'8 ( d'4 ) fis'4 | % 97
		e'2 ~ e'8 r8 d'4 | % 98
		\time 5/4   \time 5/4 h'8 h'4 a'4. r4 d'4
		| % 99
		h'8 a'4 a'4. r4 d'4 | 
		\time 4/4  h'8\ff d''4 a'4. r4 | % 101
		\time 5/4  | % 101
		fis'8 \mp fis'4 fis'4 d'8 e'4 fis'4 | % 102
		\time 4/4  e'8 ( d'8 ~ d'2 ) r4 \bar "||"
		 | % 103
		fis'8 \p fis'4. fis'4. e'16 d'16 | % 104
		e'8 d'4. d'4. r8 | % 105
		e'8 d'4. d'4 d'4 | % 106
		d'2. -. r4 | % 107
		fis'4 fis'8 fis'4. d'4 | % 108
		e'4 d'4 d'4. e'8 | % 109
		 e'4. d'8 d'4 d'4 | 
		d'2. r4 | % 111
		fis'8 \p fis'4. fis'4. e'16 d'16 | % 112
		e'8 d'4. d'4. r8 | % 113
		\time 3/4  | % 113
		f'8 \pp f'8 d'2 | % 114
		\time 4/4  d'1 \fermata \bar "|."
	}
}

jirik = {
	\global

	\repeat volta 2
	{
		d8\mf d4. c4. h,16 h,16 | % 2
		h,8 h,4. g,4. r8 | % 3
		c8 c4. b,4 c4 | % 4
		d2. r4 | % 5
		d4 d8 c4. c4 | % 6
		h,4 h,4 g,4. g,8 | % 7
		c4. c8 b,4 c4 | % 8
		 d2 r4 d4 \f | % 9
		\time 5/4  g8 g4. fis4 r4 d4 | 
		\time 6/4  e4 e4 d2 r4 d4 | % 11
		\time 4/4  g4. fis8 fis4 r4 | % 12
		d8 \mp d4. h,4. h,8 | % 13
		a,2. r4 | % 14
		 | % 14
		d8 \mp d4. c4. c16 c16 | % 15
		h,8 h,4. g,4. r8 | % 16
		\time 3/4  b,8 b,8 b,2 | % 17
	}
	\alternative
	{
		{
			\time 4/4  c2~^\fermata c8 r8 d16 \f d8. \bar "||"
			\time 5/4  g4 fis8 fis4. r4 d8 d8 | % 19
			 g4 fis8 fis4. r4 d4 | 
			g4 fis8 fis4. r4 h,8 h,8 | % 21
			\time 6/4  h,4 a,4 a,2 r4 h,16 h,8. | % 22
			\time 5/4  g4 fis8 fis4. r4 d8 d8 | % 23
			\time 4/4  g4 fis8 fis4. r4 | % 24
			\times 2/3 { g4 g8 } fis4 fis4. r8^\fermata | % 25
			d8 d8 h,8 a,8 a,4 a,4 | % 26
			g,2. r4^\fermata
		}
		{
			c1 \bar "||"
		}
	}
	R1*8 | % 52
	g4 a4 a4 e8 ( fis8 ) | % 53
	g4 g8 ( fis8 ) g4 a8 a8 | % 54
	g4 -. a8 a8 a4 e8 fis8 | % 55
	 g4 a4 d4 r8 d8 | % 56
	g4 a4 a4 e8 fis8 | % 57
	g4 g4 g4 a8 a8 | % 58
	g4 a4 a4 e8 fis8 | % 59
	g4 a4 d4 r4 \bar "||"
	c8 \f c8 d4 d4 d8 d8 | % 61
	 d4 d8 d8 d4 d4 | % 62
	c8 c8 d4 d8 d8 d8 d8 | % 63
	d4 d4 d4 r8 d8 | % 64
	c4 d8 d8 d4 d8 d8 | % 65
	d8 d8 d8 d8 d4 d4 | % 66
	c4 d4 d4 c8 h,8 | % 67
	 c4 d4 d4. r8 | % 68
	c4 d4 d4 d4 | % 69
	d4 e4 -> e4 -> d8 d8 | 
	c4 d8 d8 d4 c8 h,8 | % 71
	c4 d4 d4 r8 d8 | % 72
	c4 d4 d4 d8 d8 | % 73
	 d4 e4 -> e4 -> d8 d8 | % 74
	c4 d4 d4 c8 h,8 | % 75
	c4 d4 d4 r4 \bar "||"
	c8 \f c8 d4 d4 d8 d8 | % 77
	 d4 d8 d8 d4 d4 | % 78
	c8 c8 d4 d8 d8 d8 d8 | % 79
	d4 d4 d4 r8 d8 | % 80
	c4 d8 d8 d4 d8 d8 | % 81
	d8 d8 d8 d8 d4 d4 | % 82
	c4 d4 d4 c8 h,8 | % 83
	c4\< d4 d4 d\ff \bar "||" % 84
	\time 5/4  g8 g4. fis4 r4 d4 \f | % 85
	\time 6/4   \time 6/4 e4 e4 d2 r4 d4 | % 86
	\time 4/4  g4. fis8 fis4 r4 | % 87
	d8 d4. d4. fis8 | % 88
	a2. r4 | % 89
	d8 d4. c4. c16 c16 | 
	h,8 h,4. g,4. r8 | % 91
	\time 3/4  b,8 b,8 b,2 | % 92
	\time 5/4   \time 5/4 c2. r4 d8. \f d16 \bar "||"
	g8 fis4. fis4. r8 d4 | % 94
	g8 g4 fis4. r4 d4 | % 95
	\time 4/4  g8 g4 fis4. r4 | % 96
	d8 d4 h,4. h,4 | % 97
	a,2 ~ a,8 r8 h,4 | % 98
	\time 5/4   \time 5/4 g8 g4 fis4. r4 d4
	| % 99
	g8 fis4 fis4. r4 d4 | 
	\time 4/4  | 
	g8 \ff g4 -> fis4. -> r4 | % 101
	\time 5/4  d8 d4 h,4 a,8 a,4 a,4 | % 102
	\time 4/4  g,2. r4 \bar "||"
	 | % 103
	d8 \p d4. c4. h,16 h,16 | % 104
	h,8 h,4. g,4. r8 | % 105
	c8 c4. b,4 c4 | % 106
	d2. r4 | % 107
	d4 d8 c4. c4 | % 108
	h,4 h,4 g,4. g,8 | % 109
	 c4. c8 b,4 c4 | 
	d1 | % 111
	d2(\pp c | % 112
	h2 g4.) r8^\fermata | % 113
	\time 3/4  | % 113
	b,8 \pp b,8 b,2 | % 114
	\time 4/4  c1 \fermata \bar "|."
}

vdarek = \lyricmode {
	Here I sit in a pri -- son cell, I can hard -- ly sleep. Far a -- way no chime no bell can pierce the for -- tress keep. And God is dead, I saw him die, __ and hope was lost like my a -- li -- bi.
	Here I sit in a pri -- son cell, fun -- ny old world...
	And I miss the fields and the pour -- ing rain, I miss the corn and the gol -- den grain, and I miss the seas, and I miss the storms, chil -- dren are born, they don't e -- ven know my name.
	world...

	Did -- n't he go like a lamb to the slaugh -- ter, did -- n't he know it was a waste of time? The ju -- ry were out for an ho -- ur and a quar -- ter, all stitched up by a Thin Blue Line.
	Al -- tered notes and false con -- fes -- sions, a slip of the fin -- ger, a sleight of hand, a -- no -- ther try from the Quar -- ter Ses -- sions, a -- no -- ther lie from the wit -- ness stand.

	Did -- n't he go like a lamb to the slaugh -- ter, did -- n't he know it was a waste of time? The ju -- ry were out for an ho -- ur and a quar -- ter, all stitched up by a Thin Blue Line.
	Al -- tered notes and false con -- fes -- sions, a slip of the fin -- ger, a sleight of hand, a -- no -- ther try from the Quar -- ter Ses -- sions, a -- no -- ther lie from the wit -- ness stand.
	Here I sit in a pri -- son cell, I __ can hard -- ly __ sleep; __ far a -- way no chime no bell can pierce the fort -- ress keep. __
	And God is dead, I saw him die, __ and hope was lost like my a -- li -- bi.
	Here I sit in a pri -- son cell, fun -- ny old world...

	And the rich go free for big -- ger crimes, they've got it made, they don't pay no fines, they live and breathe in bet -- ter times and mo -- ney talks if you read bet -- ween the lines.
	Here I sit in a pri -- son cell, I can hard -- ly sleep. Far a -- way no chime no bell can pierce the for -- tress keep.
	Here I sit in a pri -- son cell, fun -- ny old world...
}

vzbytek = \lyricmode {
	Here I sit in a pri -- son cell, I can hard -- ly sleep. Far a -- way no chime no bell can pierce the for -- tress keep. And God is dead, I saw him die, and hope was lost like my a -- li -- bi.
	Here I sit in a pri -- son cell, fun -- ny old world...
	And I miss the fields and the pour -- ing rain, I miss the corn and the gol -- den grain, and I miss the seas, and I miss the storms, chil -- dren are born, they don't e -- ven know my name.
	world...

	Al -- tered notes and false con -- fes -- sions, a slip of the fin -- ger, a sleight of hand, a -- no -- ther try from the Quar -- ter Ses -- sions, a -- no -- ther lie from the wit -- ness stand.
	Did -- n't he go like a lamb to the slaugh -- ter, did -- n't he know it was a waste of time? The ju -- ry were out for an ho -- ur and a quar -- ter, all stitched up by a Thin Blue Line.

	Al -- tered notes and false con -- fes -- sions, a slip of the fin -- ger, a sleight of hand, a -- no -- ther try from the Quar -- ter Ses -- sions, a -- no -- ther lie from the wit -- ness stand.
	Did -- n't he go like a lamb to the slaugh -- ter, did -- n't he know it was a waste of time? The ju -- ry were out for an ho -- ur and a quar -- ter, all stitched up by a Thin Blue Line.
	And God is dead, I saw him die, and hope was lost like my a -- li -- bi.
	Here I sit in a pri -- son cell, fun -- ny old world...

	And the rich go free for big -- ger crimes, they've got it made, they don't pay no fines, they live and breathe in bet -- ter times and mo -- ney talks if you read bet -- ween the lines.
	Here I sit in a pri -- son cell, I can hard -- ly sleep. Far a -- way no chime no bell can pierce the for -- tress "kee(p) ... Hm" __ _ fun -- ny old world...
}


\score {
	\new ChoirStaff <<
		\new Staff \with {
			midiInstrument = "cello"
			instrumentName = "Darek"
			shortInstrumentName = "D"
		} \new Voice = "darek" \with { \consists "Ambitus_engraver" } { \magnifyStaff #0.8 \override Ambitus.X-offset = #2 \oneVoice \clef "treble_8" \darek }
		\new Lyrics \with {
			\override VerticalAxisGroup #'staff-affinity = #CENTER
			\override LyricText.font-size = #-1
		} \lyricsto "darek" \vdarek

		\new Staff \with {
			midiInstrument = "cello"
			instrumentName = "Žaba"
			shortInstrumentName = "Ž"
		} \new Voice = "zaba" \with { \consists "Ambitus_engraver" } { \magnifyStaff #0.6 \override Ambitus.X-offset = #2 \oneVoice \clef "treble_8" \zaba }

		\new Lyrics \with {
			\override VerticalAxisGroup #'staff-affinity = #CENTER
			\override LyricText.font-size = #-2
		} \lyricsto "zaba" \vzbytek

		\new Staff \with {
			midiInstrument = "contrabass"
			instrumentName = "Jiřík"
			shortInstrumentName = "J"
		} \new Voice = "jirik" \with { \consists "Ambitus_engraver" } { \magnifyStaff #0.6 \override Ambitus.X-offset = #2 \oneVoice \clef "bass" \jirik }


		\new Staff \new Voice \lining
	>>
	\layout { \context { \RemoveEmptyStaffContext \override VerticalAxisGroup #'remove-first = ##t }}
	\midi {
		\context {
			\Score
			tempoWholesPerMinute = #(ly:make-moment 100 4)
		}
	}
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
%		system-separator-markup = \slashSeparator
		indent = #12
		left-margin = #10
		right-margin = #5
		top-margin = #3
		bottom-margin = #6

		page-count = #2

}
