
//

#import <UIKit/UIKit.h>
/**
 *  buttonType
 */
typedef NS_ENUM(NSUInteger, PXYCustomerButtonType){
    //标题的位置
    PXYCustomerButtonTypeTop, // 标题的位置在上;
    PXYCustomerButtonTypeBelow, // 标题的位置在下;
    PXYCustomerButtonTypeLeft, // 标题的位置在左;
    PXYCustomerButtonTypeRight, // 标题的位置在右;
   
};

typedef void (^ButtonBlock)(UIButton *sender);

@interface UIButton (PXYCustom)

@property(nonatomic,copy)ButtonBlock buttonblock;

/**
 *  ButtonBlock
 *
 *  @param block Button点击事件
 */
- (void)addTapBlock:(ButtonBlock)block;

/*
 *  @brief 标题在上 图片在下
 *
 *  @param space 它们之间的间距
 */


/**
 *设置标题;
 *
 */
- (void)titleTopButtonImageWithTitleStyle:(PXYCustomerButtonType)type Space:(CGFloat)space;





@end
