%hook UILabel

-(id)font{
	return %orig;
	if ([[self text] isEqualToString:@"OPEN"]){
		self.backgroundColor = [UIColor colorWithRed:0.0 green:1.0 blue:0.0 alpha:0.25];
	}
	
}

-(id)initWithCoder:(id)arg1{
	return %orig;
	if ([[self text] isEqualToString:@"OPEN"]){
		self.backgroundColor = [UIColor colorWithRed:0.0 green:1.0 blue:0.0 alpha:0.25];
	}
}

-(id)initWithFrame:(CGRect)arg1{
	return %orig;
	if ([[self text] isEqualToString:@"OPEN"]){
		self.backgroundColor = [UIColor colorWithRed:0.0 green:1.0 blue:0.0 alpha:0.25];
	}
}

-(void)setFont:(id)arg1{
	%orig;
	if ([[self text] isEqualToString:@"OPEN"]){
		self.backgroundColor = [UIColor colorWithRed:0.0 green:1.0 blue:0.0 alpha:0.25];
	}
}

-(void)setWantsFastBaselineMeasurement:(BOOL)arg1{
	%orig;
	if ([[self text] isEqualToString:@"OPEN"]){
		self.backgroundColor = [UIColor colorWithRed:0.0 green:1.0 blue:0.0 alpha:0.25];
	}
}

-(void)traitCollectionDidChange:(id)arg1{
	%orig;
	if ([[self text] isEqualToString:@"OPEN"]){
		self.backgroundColor = [UIColor colorWithRed:0.0 green:1.0 blue:0.0 alpha:0.25];
	}
}

-(BOOL)wantsFastBaselineMeasurement{
	return %orig;
	if ([[self text] isEqualToString:@"OPEN"]){
		self.backgroundColor = [UIColor colorWithRed:0.0 green:1.0 blue:0.0 alpha:0.25];
	}
}

%end
