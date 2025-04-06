#macro BS		12	// Block size
#macro CHUNKW	16	// Chunk Width
#macro CHUNKH	16	// Chunk Height

#macro c_dirt		#80493A
#macro c_emerald	#8AB060
#macro c_emerald2	#C2D368
#macro c_diamond	#4B80CA
#macro c_diamond2	#68C2D3
#macro c_dyellow  #C2D368
#macro c_lyellow  #EDE19E
#macro c_dblue		#352B42
#macro c_lblue		#43436A
#macro c_wcblue	#4B4158
#macro c_lred		#B45252
#macro c_mwhite	#F2F0E5

enum Ore{ // ID in tilemap
	Emerald			= 11,
	Emerald2			= 12,
	Emerald3			= 13,
	EmeraldFake		= 21,
	EmeraldFake2	= 22,
	EmeraldFake3	= 23,
	
	Diamond			= 51,
	Diamond2			= 52,
	Diamond3			= 53,
	DiamondFake		= 61,
	DiamondFake2	= 62,
	DiamondFake3	= 63,
	
	Gold				= 81,
	Gold2				= 82,
	Gold3				= 83,
	GoldFake			= 91,
	GoldFake2		= 92,
	GoldFake3		= 93,
	
	DirtWithGrass	= 31,
	DirtWithGrass2	= 32,
	DirtWithGrass3	= 33,
	
	ShopBlock		= 41,
	ShopBlock2		= 42,
	ShopBlock3		= 43,
	
	ShopHeart		= 71,
	ShopScan			= 72,
	ShopScanPlus	= 73,
	ShopMedkit		= 74,
	ShopDiffuser	= 75
}