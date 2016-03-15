#import "appdel.h"

@interface vcontactwrite:UICollectionViewCell<UITextFieldDelegate>

@property(weak, nonatomic)UITextField *fieldname;
@property(weak, nonatomic)UITextField *fieldemail;
@property(weak, nonatomic)UITextView *messageview;

@end