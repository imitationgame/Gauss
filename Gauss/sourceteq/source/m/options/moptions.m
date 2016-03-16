#import "moptions.h"

@implementation moptions

-(instancetype)init
{
    self = [super init];
    self.items = @[
                   [[moptionsitemstore alloc] init],
                   [[moptionsitemcontact alloc] init],
                   [[moptionsitemrate alloc] init],
                   ];
    
    return self;
}

@end