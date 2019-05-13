#line 1 "Tweak.xm"

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

@class UILabel; 
static id (*_logos_orig$_ungrouped$UILabel$font)(_LOGOS_SELF_TYPE_NORMAL UILabel* _LOGOS_SELF_CONST, SEL); static id _logos_method$_ungrouped$UILabel$font(_LOGOS_SELF_TYPE_NORMAL UILabel* _LOGOS_SELF_CONST, SEL); static UILabel* (*_logos_orig$_ungrouped$UILabel$initWithCoder$)(_LOGOS_SELF_TYPE_INIT UILabel*, SEL, id) _LOGOS_RETURN_RETAINED; static UILabel* _logos_method$_ungrouped$UILabel$initWithCoder$(_LOGOS_SELF_TYPE_INIT UILabel*, SEL, id) _LOGOS_RETURN_RETAINED; static UILabel* (*_logos_orig$_ungrouped$UILabel$initWithFrame$)(_LOGOS_SELF_TYPE_INIT UILabel*, SEL, CGRect) _LOGOS_RETURN_RETAINED; static UILabel* _logos_method$_ungrouped$UILabel$initWithFrame$(_LOGOS_SELF_TYPE_INIT UILabel*, SEL, CGRect) _LOGOS_RETURN_RETAINED; static void (*_logos_orig$_ungrouped$UILabel$setFont$)(_LOGOS_SELF_TYPE_NORMAL UILabel* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$_ungrouped$UILabel$setFont$(_LOGOS_SELF_TYPE_NORMAL UILabel* _LOGOS_SELF_CONST, SEL, id); static void (*_logos_orig$_ungrouped$UILabel$setWantsFastBaselineMeasurement$)(_LOGOS_SELF_TYPE_NORMAL UILabel* _LOGOS_SELF_CONST, SEL, BOOL); static void _logos_method$_ungrouped$UILabel$setWantsFastBaselineMeasurement$(_LOGOS_SELF_TYPE_NORMAL UILabel* _LOGOS_SELF_CONST, SEL, BOOL); static void (*_logos_orig$_ungrouped$UILabel$traitCollectionDidChange$)(_LOGOS_SELF_TYPE_NORMAL UILabel* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$_ungrouped$UILabel$traitCollectionDidChange$(_LOGOS_SELF_TYPE_NORMAL UILabel* _LOGOS_SELF_CONST, SEL, id); static BOOL (*_logos_orig$_ungrouped$UILabel$wantsFastBaselineMeasurement)(_LOGOS_SELF_TYPE_NORMAL UILabel* _LOGOS_SELF_CONST, SEL); static BOOL _logos_method$_ungrouped$UILabel$wantsFastBaselineMeasurement(_LOGOS_SELF_TYPE_NORMAL UILabel* _LOGOS_SELF_CONST, SEL); 

#line 1 "Tweak.xm"


static id _logos_method$_ungrouped$UILabel$font(_LOGOS_SELF_TYPE_NORMAL UILabel* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd){
	return _logos_orig$_ungrouped$UILabel$font(self, _cmd);
	if ([[self text] isEqualToString:@"OPEN"]){
		self.backgroundColor = [UIColor colorWithRed:0.0 green:1.0 blue:0.0 alpha:0.25];
	}
	
}

static UILabel* _logos_method$_ungrouped$UILabel$initWithCoder$(_LOGOS_SELF_TYPE_INIT UILabel* __unused self, SEL __unused _cmd, id arg1) _LOGOS_RETURN_RETAINED{
	return _logos_orig$_ungrouped$UILabel$initWithCoder$(self, _cmd, arg1);
	if ([[self text] isEqualToString:@"OPEN"]){
		self.backgroundColor = [UIColor colorWithRed:0.0 green:1.0 blue:0.0 alpha:0.25];
	}
}

static UILabel* _logos_method$_ungrouped$UILabel$initWithFrame$(_LOGOS_SELF_TYPE_INIT UILabel* __unused self, SEL __unused _cmd, CGRect arg1) _LOGOS_RETURN_RETAINED{
	return _logos_orig$_ungrouped$UILabel$initWithFrame$(self, _cmd, arg1);
	if ([[self text] isEqualToString:@"OPEN"]){
		self.backgroundColor = [UIColor colorWithRed:0.0 green:1.0 blue:0.0 alpha:0.25];
	}
}

static void _logos_method$_ungrouped$UILabel$setFont$(_LOGOS_SELF_TYPE_NORMAL UILabel* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1){
	_logos_orig$_ungrouped$UILabel$setFont$(self, _cmd, arg1);
	if ([[self text] isEqualToString:@"OPEN"]){
		self.backgroundColor = [UIColor colorWithRed:0.0 green:1.0 blue:0.0 alpha:0.25];
	}
}

static void _logos_method$_ungrouped$UILabel$setWantsFastBaselineMeasurement$(_LOGOS_SELF_TYPE_NORMAL UILabel* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, BOOL arg1){
	_logos_orig$_ungrouped$UILabel$setWantsFastBaselineMeasurement$(self, _cmd, arg1);
	if ([[self text] isEqualToString:@"OPEN"]){
		self.backgroundColor = [UIColor colorWithRed:0.0 green:1.0 blue:0.0 alpha:0.25];
	}
}

static void _logos_method$_ungrouped$UILabel$traitCollectionDidChange$(_LOGOS_SELF_TYPE_NORMAL UILabel* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1){
	_logos_orig$_ungrouped$UILabel$traitCollectionDidChange$(self, _cmd, arg1);
	if ([[self text] isEqualToString:@"OPEN"]){
		self.backgroundColor = [UIColor colorWithRed:0.0 green:1.0 blue:0.0 alpha:0.25];
	}
}

static BOOL _logos_method$_ungrouped$UILabel$wantsFastBaselineMeasurement(_LOGOS_SELF_TYPE_NORMAL UILabel* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd){
	return _logos_orig$_ungrouped$UILabel$wantsFastBaselineMeasurement(self, _cmd);
	if ([[self text] isEqualToString:@"OPEN"]){
		self.backgroundColor = [UIColor colorWithRed:0.0 green:1.0 blue:0.0 alpha:0.25];
	}
}


static __attribute__((constructor)) void _logosLocalInit() {
{Class _logos_class$_ungrouped$UILabel = objc_getClass("UILabel"); MSHookMessageEx(_logos_class$_ungrouped$UILabel, @selector(font), (IMP)&_logos_method$_ungrouped$UILabel$font, (IMP*)&_logos_orig$_ungrouped$UILabel$font);MSHookMessageEx(_logos_class$_ungrouped$UILabel, @selector(initWithCoder:), (IMP)&_logos_method$_ungrouped$UILabel$initWithCoder$, (IMP*)&_logos_orig$_ungrouped$UILabel$initWithCoder$);MSHookMessageEx(_logos_class$_ungrouped$UILabel, @selector(initWithFrame:), (IMP)&_logos_method$_ungrouped$UILabel$initWithFrame$, (IMP*)&_logos_orig$_ungrouped$UILabel$initWithFrame$);MSHookMessageEx(_logos_class$_ungrouped$UILabel, @selector(setFont:), (IMP)&_logos_method$_ungrouped$UILabel$setFont$, (IMP*)&_logos_orig$_ungrouped$UILabel$setFont$);MSHookMessageEx(_logos_class$_ungrouped$UILabel, @selector(setWantsFastBaselineMeasurement:), (IMP)&_logos_method$_ungrouped$UILabel$setWantsFastBaselineMeasurement$, (IMP*)&_logos_orig$_ungrouped$UILabel$setWantsFastBaselineMeasurement$);MSHookMessageEx(_logos_class$_ungrouped$UILabel, @selector(traitCollectionDidChange:), (IMP)&_logos_method$_ungrouped$UILabel$traitCollectionDidChange$, (IMP*)&_logos_orig$_ungrouped$UILabel$traitCollectionDidChange$);MSHookMessageEx(_logos_class$_ungrouped$UILabel, @selector(wantsFastBaselineMeasurement), (IMP)&_logos_method$_ungrouped$UILabel$wantsFastBaselineMeasurement, (IMP*)&_logos_orig$_ungrouped$UILabel$wantsFastBaselineMeasurement);} }
#line 54 "Tweak.xm"
