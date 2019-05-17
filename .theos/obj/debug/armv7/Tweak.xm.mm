#line 1 "Tweak.xm"
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


#include <substrate.h>
#if defined(__clang__)
#if __has_feature(objc_arc)
#define _LOGOS_SELF_TYPE_NORMAL __unsafe_unretained
#define _LOGOS_SELF_TYPE_INIT __attribute__((ns_consumed))
#define _LOGOS_SELF_CONST const
#define _LOGOS_RETURN_RETAINED __attribute__((ns_returns_retained))
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif

@class AppStoreButtonLabel; 
static void _logos_method$_ungrouped$AppStoreButtonLabel$setVariablesForCurrentLabel(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST, SEL); static id (*_logos_orig$_ungrouped$AppStoreButtonLabel$font)(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST, SEL); static id _logos_method$_ungrouped$AppStoreButtonLabel$font(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST, SEL); static id (*_logos_orig$_ungrouped$AppStoreButtonLabel$initWithCoder$)(_LOGOS_SELF_TYPE_INIT id, SEL, id) _LOGOS_RETURN_RETAINED; static id _logos_method$_ungrouped$AppStoreButtonLabel$initWithCoder$(_LOGOS_SELF_TYPE_INIT id, SEL, id) _LOGOS_RETURN_RETAINED; static id (*_logos_orig$_ungrouped$AppStoreButtonLabel$initWithFrame$)(_LOGOS_SELF_TYPE_INIT id, SEL, CGRect) _LOGOS_RETURN_RETAINED; static id _logos_method$_ungrouped$AppStoreButtonLabel$initWithFrame$(_LOGOS_SELF_TYPE_INIT id, SEL, CGRect) _LOGOS_RETURN_RETAINED; static void (*_logos_orig$_ungrouped$AppStoreButtonLabel$setFont$)(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST, SEL, id); static void _logos_method$_ungrouped$AppStoreButtonLabel$setFont$(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST, SEL, id); static void (*_logos_orig$_ungrouped$AppStoreButtonLabel$_setTextColor$)(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST, SEL, id); static void _logos_method$_ungrouped$AppStoreButtonLabel$_setTextColor$(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST, SEL, id); static void (*_logos_orig$_ungrouped$AppStoreButtonLabel$setWantsFastBaselineMeasurement$)(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST, SEL, BOOL); static void _logos_method$_ungrouped$AppStoreButtonLabel$setWantsFastBaselineMeasurement$(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST, SEL, BOOL); static void (*_logos_orig$_ungrouped$AppStoreButtonLabel$traitCollectionDidChange$)(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST, SEL, id); static void _logos_method$_ungrouped$AppStoreButtonLabel$traitCollectionDidChange$(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST, SEL, id); static BOOL (*_logos_orig$_ungrouped$AppStoreButtonLabel$wantsFastBaselineMeasurement)(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST, SEL); static BOOL _logos_method$_ungrouped$AppStoreButtonLabel$wantsFastBaselineMeasurement(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST, SEL); 

#line 53 "Tweak.xm"



static void _logos_method$_ungrouped$AppStoreButtonLabel$setVariablesForCurrentLabel(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST __unused self, SEL __unused _cmd){
	




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

static id _logos_method$_ungrouped$AppStoreButtonLabel$font(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST __unused self, SEL __unused _cmd){
	return _logos_orig$_ungrouped$AppStoreButtonLabel$font(self, _cmd);
	[self setVariablesForCurrentLabel];

}

static id _logos_method$_ungrouped$AppStoreButtonLabel$initWithCoder$(_LOGOS_SELF_TYPE_INIT id __unused self, SEL __unused _cmd, id arg1) _LOGOS_RETURN_RETAINED{
	return _logos_orig$_ungrouped$AppStoreButtonLabel$initWithCoder$(self, _cmd, arg1);
	[self setVariablesForCurrentLabel];
}

static id _logos_method$_ungrouped$AppStoreButtonLabel$initWithFrame$(_LOGOS_SELF_TYPE_INIT id __unused self, SEL __unused _cmd, CGRect arg1) _LOGOS_RETURN_RETAINED{
	return _logos_orig$_ungrouped$AppStoreButtonLabel$initWithFrame$(self, _cmd, arg1);
	[self setVariablesForCurrentLabel];
}

static void _logos_method$_ungrouped$AppStoreButtonLabel$setFont$(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1){
	_logos_orig$_ungrouped$AppStoreButtonLabel$setFont$(self, _cmd, arg1);
	[self setVariablesForCurrentLabel];
}

static void _logos_method$_ungrouped$AppStoreButtonLabel$_setTextColor$(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1){
  UILabel *_ = (UILabel *)self;
	UIColor *customTextColor = [UIColor colorWithRed:0.0 green:0.80 blue:0.35 alpha:1.00];
  if (textColor && [_.text isEqual:@"OPEN"]) {
      _logos_orig$_ungrouped$AppStoreButtonLabel$_setTextColor$(self, _cmd, customTextColor);
  } else {
    _logos_orig$_ungrouped$AppStoreButtonLabel$_setTextColor$(self, _cmd, arg1);
  }
}

static void _logos_method$_ungrouped$AppStoreButtonLabel$setWantsFastBaselineMeasurement$(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, BOOL arg1){
	_logos_orig$_ungrouped$AppStoreButtonLabel$setWantsFastBaselineMeasurement$(self, _cmd, arg1);
	[self setVariablesForCurrentLabel];
}

static void _logos_method$_ungrouped$AppStoreButtonLabel$traitCollectionDidChange$(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1){
	_logos_orig$_ungrouped$AppStoreButtonLabel$traitCollectionDidChange$(self, _cmd, arg1);
	[self setVariablesForCurrentLabel];
}

static BOOL _logos_method$_ungrouped$AppStoreButtonLabel$wantsFastBaselineMeasurement(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST __unused self, SEL __unused _cmd){
	return _logos_orig$_ungrouped$AppStoreButtonLabel$wantsFastBaselineMeasurement(self, _cmd);
	[self setVariablesForCurrentLabel];
}




static __attribute__((constructor)) void _logosLocalCtor_e6244da5(int __unused argc, char __unused **argv, char __unused **envp) {
	preferencesChanged();
  {Class _logos_class$_ungrouped$AppStoreButtonLabel = NSClassFromString(@"AppStore.DynamicTypeLabel"); { char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; _typeEncoding[i] = '\0'; class_addMethod(_logos_class$_ungrouped$AppStoreButtonLabel, @selector(setVariablesForCurrentLabel), (IMP)&_logos_method$_ungrouped$AppStoreButtonLabel$setVariablesForCurrentLabel, _typeEncoding); }MSHookMessageEx(_logos_class$_ungrouped$AppStoreButtonLabel, @selector(font), (IMP)&_logos_method$_ungrouped$AppStoreButtonLabel$font, (IMP*)&_logos_orig$_ungrouped$AppStoreButtonLabel$font);MSHookMessageEx(_logos_class$_ungrouped$AppStoreButtonLabel, @selector(initWithCoder:), (IMP)&_logos_method$_ungrouped$AppStoreButtonLabel$initWithCoder$, (IMP*)&_logos_orig$_ungrouped$AppStoreButtonLabel$initWithCoder$);MSHookMessageEx(_logos_class$_ungrouped$AppStoreButtonLabel, @selector(initWithFrame:), (IMP)&_logos_method$_ungrouped$AppStoreButtonLabel$initWithFrame$, (IMP*)&_logos_orig$_ungrouped$AppStoreButtonLabel$initWithFrame$);MSHookMessageEx(_logos_class$_ungrouped$AppStoreButtonLabel, @selector(setFont:), (IMP)&_logos_method$_ungrouped$AppStoreButtonLabel$setFont$, (IMP*)&_logos_orig$_ungrouped$AppStoreButtonLabel$setFont$);MSHookMessageEx(_logos_class$_ungrouped$AppStoreButtonLabel, @selector(_setTextColor:), (IMP)&_logos_method$_ungrouped$AppStoreButtonLabel$_setTextColor$, (IMP*)&_logos_orig$_ungrouped$AppStoreButtonLabel$_setTextColor$);MSHookMessageEx(_logos_class$_ungrouped$AppStoreButtonLabel, @selector(setWantsFastBaselineMeasurement:), (IMP)&_logos_method$_ungrouped$AppStoreButtonLabel$setWantsFastBaselineMeasurement$, (IMP*)&_logos_orig$_ungrouped$AppStoreButtonLabel$setWantsFastBaselineMeasurement$);MSHookMessageEx(_logos_class$_ungrouped$AppStoreButtonLabel, @selector(traitCollectionDidChange:), (IMP)&_logos_method$_ungrouped$AppStoreButtonLabel$traitCollectionDidChange$, (IMP*)&_logos_orig$_ungrouped$AppStoreButtonLabel$traitCollectionDidChange$);MSHookMessageEx(_logos_class$_ungrouped$AppStoreButtonLabel, @selector(wantsFastBaselineMeasurement), (IMP)&_logos_method$_ungrouped$AppStoreButtonLabel$wantsFastBaselineMeasurement, (IMP*)&_logos_orig$_ungrouped$AppStoreButtonLabel$wantsFastBaselineMeasurement);}
	CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, (CFNotificationCallback)preferencesChanged, kSettingsChangedNotification, NULL, CFNotificationSuspensionBehaviorDeliverImmediately);

}
