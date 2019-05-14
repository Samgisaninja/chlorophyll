#import <UIKit/UIKit.h>

static BOOL backgroundColor = YES;
static BOOL outlineColor = YES;
static BOOL textColor = YES;

static UIColor *customBackgroundColor = [UIColor colorWithRed:0.0 green:1.0 blue:0.0 alpha:0.25];
static UIColor *customOutlineColor = [UIColor colorWithRed:0.0 green:0.80 blue:0.35 alpha:1.00];
static UIColor *customTextColor = [UIColor colorWithRed:0.0 green:0.80 blue:0.35 alpha:1.00];


#define kIdentifier @"com.samgisaninja.chlorophyll"
#define kSettingsChangedNotification (CFStringRef)@"com.samgisaninja.chlorophyll/settingschanged"
#define kSettingsPath @"/var/mobile/Library/Preferences/com.samgisaninja.chlorophyll.plist"



NSDictionary *prefs = nil;

static void reloadPrefs() {
	if ([NSHomeDirectory() isEqualToString:@"/var/mobile"]) {
		CFArrayRef keyList = CFPreferencesCopyKeyList((CFStringRef)kIdentifier, kCFPreferencesCurrentUser, kCFPreferencesAnyHost);
		if (keyList) {
			prefs = (NSDictionary *)CFPreferencesCopyMultiple(keyList, (CFStringRef)kIdentifier, kCFPreferencesCurrentUser, kCFPreferencesAnyHost);
			if (!prefs) {
				prefs = [NSDictionary new];
			}
			CFRelease(keyList);
		}
	} else {
		prefs = [NSDictionary dictionaryWithContentsOfFile:kSettingsPath];
	}
}

static BOOL boolValueForKey(NSString *key, BOOL defaultValue) {
	return (prefs && [prefs objectForKey:key]) ? [[prefs objectForKey:key] boolValue] : defaultValue;
}


static void preferencesChanged() {
	CFPreferencesAppSynchronize((CFStringRef)kIdentifier);
	reloadPrefs();

	 	backgroundColor = boolValueForKey(@"backgroundColor", YES);
		outlineColor = boolValueForKey(@"outline", YES);
	 	textColor = boolValueForKey(@"textColor", YES);
}

@interface AppStoreButtonLabel : UILabel
-(void)setVariablesForCurrentLabel;
@end

%hook AppStoreButtonLabel

%new
-(void)setVariablesForCurrentLabel{
	/*
	~cat:
	Best way I've found to actually do this is to cast self to a UILabel and then
	set self to the cast variable once I'm done.
	*/
	UILabel *label = (UILabel *)self;
	if ([label.text isEqualToString:@"OPEN"]){
		UIColor *customBackgroundColor = [UIColor colorWithRed:0.0 green:1.0 blue:0.0 alpha:0.25];
		UIColor *customOutlineColor = [UIColor colorWithRed:0.0 green:0.80 blue:0.35 alpha:1.00];
		if (backgroundColor || outlineColor) {
			label.layer.cornerRadius = 15.0;
		}
		if (backgroundColor){
			label.layer.backgroundColor = [customBackgroundColor CGColor];
		}
		if (outlineColor) {
			label.layer.borderColor = [customOutlineColor CGColor];
			label.layer.borderWidth = 0.5;
		}

	}
	self = label;
	return;
}

-(id)font{
	return %orig;
	[self setVariablesForCurrentLabel];

}

-(id)initWithCoder:(id)arg1{
	return %orig;
	[self setVariablesForCurrentLabel];
}

-(id)initWithFrame:(CGRect)arg1{
	return %orig;
	[self setVariablesForCurrentLabel];
}

-(void)setFont:(id)arg1{
	%orig;
	[self setVariablesForCurrentLabel];
}

-(void)_setTextColor:(id)arg1{
  UILabel *_ = (UILabel *)self;
	UIColor *customTextColor = [UIColor colorWithRed:0.0 green:0.80 blue:0.35 alpha:1.00];
  if (textColor && [_.text isEqual:@"OPEN"]) {
      %orig(customTextColor);
  } else {
    %orig(arg1);
  }
}

-(void)setWantsFastBaselineMeasurement:(BOOL)arg1{
	%orig;
	[self setVariablesForCurrentLabel];
}

-(void)traitCollectionDidChange:(id)arg1{
	%orig;
	[self setVariablesForCurrentLabel];
}

-(BOOL)wantsFastBaselineMeasurement{
	return %orig;
	[self setVariablesForCurrentLabel];
}

%end


%ctor {
	preferencesChanged();
  %init(AppStoreButtonLabel = NSClassFromString(@"AppStore.DynamicTypeLabel"));
	CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, (CFNotificationCallback)preferencesChanged, kSettingsChangedNotification, NULL, CFNotificationSuspensionBehaviorDeliverImmediately);

}
