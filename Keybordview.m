//
//  Keybordview.m
//  FingerPiano1.0
//
//  Created by yeke on 10-3-2.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Keybordview.h"
#import "PianoKey.h"
@interface Keybordview() 
//private Method
- (id)TraversalKey:(CGPoint)touchPoint;
- (void)dispatchFirstTouchAtPoint:(CGPoint)touchPoint withEvent:(UIEvent *)event;
- (void)dispatchTouchEvent:(UITouch *)touch withEvent:(UIEvent *)event;
- (void)dispatchTouchEndEvent:(UITouch *)touch withEvent:(UIEvent *)event;
- (void)SetupWhiteKey:(PianoKey *)Key withName:(NSString *)name withPath:(NSString *)soundFilePath;
@end



@implementation Keybordview

@synthesize KeyC5;
@synthesize KeyD5;
@synthesize KeyE5;
@synthesize KeyF5;
@synthesize KeyG5;
@synthesize KeyA5;
@synthesize KeyB5;
@synthesize KeyCb5;
@synthesize KeyBb5;
@synthesize KeyDb5;
@synthesize KeyFb5;
@synthesize KeyGb5;




//对touch的坐标进行遍历 判断在什么键区 
- (id)TraversalKey:(CGPoint )touchPoint{
	if (CGRectContainsPoint([KeyCb5 frame],touchPoint)) {
		return KeyCb5;
	}
	if (CGRectContainsPoint([KeyBb5 frame], touchPoint)) {
		return KeyBb5;
	}
	if (CGRectContainsPoint([KeyDb5 frame], touchPoint)) {
		return KeyDb5;
	}
	if (CGRectContainsPoint([KeyFb5 frame], touchPoint)) {
		return KeyFb5;
	}
	if (CGRectContainsPoint([KeyGb5 frame], touchPoint)) {
		return KeyGb5;
	}
	if (CGRectContainsPoint([KeyC5 frame], touchPoint)) {
		return KeyC5;
	}
	if (CGRectContainsPoint([KeyB5 frame], touchPoint)) {
		return KeyB5;
	}
	if (CGRectContainsPoint([KeyA5 frame], touchPoint)) {
		return KeyA5;
	}
	if (CGRectContainsPoint([KeyD5 frame], touchPoint)) {
		return KeyD5;
	}
	if (CGRectContainsPoint([KeyE5 frame], touchPoint)) {
		return KeyE5;
	}
	if (CGRectContainsPoint([KeyF5 frame], touchPoint)) {
		return KeyF5;
	}
	if (CGRectContainsPoint([KeyG5 frame], touchPoint)) {
		return KeyG5;
	}

	return nil;
}

- (void)dispatchFirstTouchAtPoint:(CGPoint )touchPoint withEvent:(UIEvent *)event{
	PianoKey *touchobject = [self TraversalKey:touchPoint];
	if (touchobject!=nil) {
		[touchobject KeyPressDown];

	}
}
	
	


//获得一个touchdown事件 进行判断touch在哪个键上
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
	NSUInteger tapCount;
	for (UITouch *touch in touches) {
		tapCount ++;
		[self dispatchFirstTouchAtPoint:[touch locationInView:self] withEvent:nil];
	}
	
}

//判断移动事件是否移动出先前选中的位置
- (void)dispatchTouchEvent:(UITouch *)touch withEvent:(UIEvent *)event{
	PianoKey *key = [self TraversalKey:[touch locationInView:self]];
	PianoKey *prekey = [self TraversalKey:[touch previousLocationInView:self]];
	if (key!=prekey) {
		if (key!=nil) {
			if (!key.KeyStatu) {
				[key KeyPressDown];
			}
		}
		if (prekey!=nil) {
			if (prekey.KeyStatu) {
				[prekey KeyPressUp];
			}
		}
	}
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
	for (UITouch *touch in touches) {
		[self dispatchTouchEvent:touch withEvent:nil];
		NSLog(@"x=%f,y=%f",[touch locationInView:self].x,[touch locationInView:self].y);
	}


}

- (void)dispatchTouchEndEvent:(UITouch *)touch withEvent:(UIEvent *)event{
	PianoKey *akey = [self TraversalKey:[touch locationInView:self]];
	if (akey!=nil) {
		[akey KeyPressUp];

	}

}

//判断结束动作是否在键区上若在则 取消一个键 的按下状态。否则则不动作
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
	for (UITouch *touch in touches) {
		[self dispatchTouchEndEvent:touch withEvent:nil];
	}

}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event{
}


- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        // Initialization code


		//初始化白键
		
		float keywidth = 10;
		
		UIImage *whitekey = [UIImage imageNamed:@"KeyUpC5.png"];
		
		//初始化C5
		PianoKey *pianokeyC5 = [[PianoKey alloc]initWithFrame:CGRectMake(keywidth, 0.0, whitekey.size.width, whitekey.size.height)];
		NSString *soundFilePath = nil;
		[self SetupWhiteKey:pianokeyC5 withName:@"C5" withPath:soundFilePath];
		[self addSubview:pianokeyC5];
		pianokeyC5.backgroundColor = [UIColor blackColor];
		self.KeyC5 = pianokeyC5;
		[pianokeyC5 release];
		//C5初始化完毕
		
		PianoKey *pianokeyD5 = [[PianoKey alloc]initWithFrame:CGRectMake((keywidth+=whitekey.size.width), 0.0, whitekey.size.width, whitekey.size.height)];
		[self SetupWhiteKey:pianokeyD5 withName:@"D5" withPath:soundFilePath];
		[self addSubview:pianokeyD5];
		pianokeyD5.backgroundColor = [UIColor blackColor];
		self.KeyD5 = pianokeyD5;
		[pianokeyD5 release];
		//D5初始化完毕
		
		PianoKey *pianokeyE5 = [[PianoKey alloc]initWithFrame:CGRectMake((keywidth+=whitekey.size.width), 0.0, whitekey.size.width, whitekey.size.height)];
		[self SetupWhiteKey:pianokeyE5 withName:@"E5" withPath:soundFilePath];
		[self addSubview:pianokeyE5];
		pianokeyE5.backgroundColor = [UIColor blackColor];
		self.KeyE5 = pianokeyE5;
		[pianokeyE5 release];
		//E5初始化完毕
		
		PianoKey *pianokeyF5 = [[PianoKey alloc]initWithFrame:CGRectMake((keywidth+=whitekey.size.width), 0.0, whitekey.size.width, whitekey.size.height)];
		[self SetupWhiteKey:pianokeyF5 withName:@"F5" withPath:soundFilePath];
		[self addSubview:pianokeyF5];
		pianokeyF5.backgroundColor = [UIColor blackColor];
		self.KeyF5 = pianokeyF5;
		[pianokeyF5 release];
		//F5初始化完毕E5
		
		PianoKey *pianokeyG5 = [[PianoKey alloc]initWithFrame:CGRectMake((keywidth+=whitekey.size.width), 0.0, whitekey.size.width, whitekey.size.height)];
		[self SetupWhiteKey:pianokeyG5 withName:@"G5" withPath:soundFilePath];
		[self addSubview:pianokeyG5];
		pianokeyG5.backgroundColor = [UIColor blackColor];
		self.KeyG5 = pianokeyG5;
		[pianokeyG5 release];
		//G5初始化完毕
		
		PianoKey *pianokeyA5 = [[PianoKey alloc]initWithFrame:CGRectMake((keywidth+=whitekey.size.width), 0.0, whitekey.size.width, whitekey.size.height)];
		[self SetupWhiteKey:pianokeyA5 withName:@"A5" withPath:soundFilePath];
		[self addSubview:pianokeyA5];
		pianokeyA5.backgroundColor = [UIColor blackColor];
		self.KeyA5 = pianokeyA5;
		[pianokeyA5 release];
		//A5初始化完毕
		
		PianoKey *pianokeyB5 = [[PianoKey alloc]initWithFrame:CGRectMake((keywidth+=whitekey.size.width), 0.0, whitekey.size.width, whitekey.size.height)];
		[self SetupWhiteKey:pianokeyB5 withName:@"B5" withPath:soundFilePath];
		[self addSubview:pianokeyB5];
		pianokeyB5.backgroundColor = [UIColor blackColor];
		self.KeyB5 = pianokeyB5;
		[pianokeyB5 release];
		//B5初始化完毕
		
		[whitekey release];		//白键初始化完毕
		
		//初始化黑键
		UIImage *blackkey = [UIImage imageNamed:@"BlackKeyUp.png"];
		PianoKey *pianokeyCb5 = [[PianoKey alloc]initWithFrame:CGRectMake(50.0, 0.0, blackkey.size.width, blackkey.size.height)];
		soundFilePath = [[NSBundle mainBundle]pathForResource:@"Cb5" ofType:@"wav"];
		[pianokeyCb5 PianoKeySetup:[UIImage imageNamed:@"BlackKeyUp.png"] downimage:[UIImage imageNamed:@"BlackKeyDown.png"]soundurl:soundFilePath];
		[self addSubview:pianokeyCb5];
		self.KeyCb5 = pianokeyCb5;
		[pianokeyCb5 release];
		
		
		PianoKey *pianokeyDb5 = [[PianoKey alloc]initWithFrame:CGRectMake(130.0, 0.0, blackkey.size.width, blackkey.size.height)];
		soundFilePath = [[NSBundle mainBundle]pathForResource:@"Db5" ofType:@"wav"];
		[pianokeyDb5 PianoKeySetup:[UIImage imageNamed:@"BlackKeyUp.png"] downimage:[UIImage imageNamed:@"BlackKeyDown.png"]soundurl:soundFilePath];
		[self addSubview:pianokeyDb5];
		self.KeyDb5 = pianokeyDb5;
		[pianokeyDb5 release];
		
		PianoKey *pianokeyFb5 = [[PianoKey alloc]initWithFrame:CGRectMake(245.0, 0.0, blackkey.size.width, blackkey.size.height)];
		soundFilePath = [[NSBundle mainBundle]pathForResource:@"Fb5" ofType:@"wav"];
		[pianokeyFb5 PianoKeySetup:[UIImage imageNamed:@"BlackKeyUp.png"] downimage:[UIImage imageNamed:@"BlackKeyDown.png"]soundurl:soundFilePath];
		[self addSubview:pianokeyFb5];
		self.KeyFb5 = pianokeyFb5;
		[pianokeyFb5 release];
		
		PianoKey *pianokeyGb5 = [[PianoKey alloc]initWithFrame:CGRectMake(317.0, 0.0, blackkey.size.width, blackkey.size.height)];
		soundFilePath = [[NSBundle mainBundle]pathForResource:@"Gb5" ofType:@"wav"];
		[pianokeyGb5 PianoKeySetup:[UIImage imageNamed:@"BlackKeyUp.png"] downimage:[UIImage imageNamed:@"BlackKeyDown.png"]soundurl:soundFilePath];
		[self addSubview:pianokeyGb5];
		self.KeyGb5 = pianokeyGb5;
		[pianokeyGb5 release];
		
		PianoKey *pianokeyBb5 = [[PianoKey alloc]initWithFrame:CGRectMake(390.0, 0.0, blackkey.size.width, blackkey.size.height)];
		soundFilePath = [[NSBundle mainBundle]pathForResource:@"Bb5" ofType:@"wav"];
		[pianokeyBb5 PianoKeySetup:[UIImage imageNamed:@"BlackKeyUp.png"] downimage:[UIImage imageNamed:@"BlackKeyDown.png"]soundurl:soundFilePath];
		[self addSubview:pianokeyBb5];
		self.KeyBb5 = pianokeyBb5;
		[pianokeyBb5 release];
		
		[blackkey release];
		self.multipleTouchEnabled = YES;//打开多点触控

		
    }
    return self;
}
//初始化看上去太乱 为了缩减代码和增加复用率还有可阅读性 以及易维护性 特建以下私有方法
- (void)SetupWhiteKey:(PianoKey *)Key withName:(NSString *)name withPath:(NSString *)soundFilePath{
	soundFilePath = [[NSBundle mainBundle]pathForResource:name ofType:@"wav" ];
	[Key PianoKeySetup:[UIImage imageNamed:[NSString stringWithFormat:@"KeyUp%@.png",name]] downimage:[UIImage imageNamed:[NSString stringWithFormat:@"KeyDown%@.png",name]] soundurl:soundFilePath];
}


- (void)drawRect:(CGRect)rect {
    // Drawing code
}


- (void)dealloc {
	[KeyC5 release];
	[KeyD5 release];
	[KeyDb5 release];
	[KeyCb5 release];
	[KeyE5 release];
	[KeyFb5 release];
	[KeyF5	release];
	[KeyGb5 release];
	[KeyG5 release];
	[KeyA5 release];
	[KeyB5	release];
	[KeyBb5 release];
    [super dealloc];
}


@end
