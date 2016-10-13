
//

#import"UIButton+PXYCustom.h"

#import <objc/runtime.h>
//关键字-- 关键字是一个void类型的指针。每一个关联的关键字必须是唯一的。通常都是会采用静态变量来作为关键字。
static const void *IndieBandNameKey = &IndieBandNameKey;
@implementation UIButton (PXYCustom)

- (ButtonBlock ) buttonblock {
    return objc_getAssociatedObject(self, IndieBandNameKey);
}

- (void)setButtonblock:(ButtonBlock)buttonblock{
    /**
     *  objc_setAssociatedObject来把一个对象与另外一个对象进行关联。该函数需要四个参数：源对象，关键字，关联的对象和一个关联策略
     关联策略表明了相关的对象是通过赋值，保留引用还是复制的方式进行关联的；还有这种关联是原子的还是非原子的。这里的关联策略和声明属性时的很类似。这种关联策略是通过使用预先定义好的常量来表示的
     */
    
    /*
     typedef OBJC_ENUM(uintptr_t, objc_AssociationPolicy) {
     OBJC_ASSOCIATION_ASSIGN = 0,
     OBJC_ASSOCIATION_RETAIN_NONATOMIC = 1,
     OBJC_ASSOCIATION_COPY_NONATOMIC = 3,
     
     OBJC_ASSOCIATION_RETAIN = 01401,
     
     OBJC_ASSOCIATION_COPY = 01403
     
     */
    objc_setAssociatedObject(self, IndieBandNameKey, buttonblock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (void)addTapBlock:(ButtonBlock)block
{
    self.buttonblock = block;
    [self addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    
}
- (void)buttonAction:(UIButton *)button
{
    if(self.buttonblock) {
        self.buttonblock(button);
    }
    
}

/**  标题在上  */
- (void)titleOverTheImageTopWithSpace:(CGFloat)space
{
    [self judgeTheTitleInImageTop:YES space:space];
}

/**  标题在下  */
-(void)titleBelowTheImageWithSpace:(CGFloat)space
{
    [self judgeTheTitleInImageTop:NO space:space];
}

/**  判断标题是不是在上   */
- (void)judgeTheTitleInImageTop:(BOOL)isTop space:(float)space ;
{
    [self resetEdgeInsets];
    [self setNeedsLayout];
    [self layoutIfNeeded];
    
    CGRect contentRect = [self contentRectForBounds:self.bounds];
    CGSize titleSize = [self titleRectForContentRect:contentRect].size;
    CGSize imageSize = [self imageRectForContentRect:contentRect].size;
    
    float halfWidth = (titleSize.width + imageSize.width)/2;
    float halfHeight = (titleSize.height + imageSize.height)/2;
    
    float topInset = MIN(halfHeight, titleSize.height);
    float leftInset = (titleSize.width - imageSize.width)>0?(titleSize.width - imageSize.width)/2:0;
    float bottomInset = (titleSize.height - imageSize.height)>0?(titleSize.height - imageSize.height)/2:0;
    float rightInset = MIN(halfWidth, titleSize.width);
    
    if (isTop) {
        [self setTitleEdgeInsets:UIEdgeInsetsMake(-titleSize.height-space, - halfWidth, imageSize.height+space, halfWidth)];
        [self setContentEdgeInsets:UIEdgeInsetsMake(topInset+space, leftInset, -bottomInset, -rightInset)];
    } else {
        [self setTitleEdgeInsets:UIEdgeInsetsMake(imageSize.height+space, - halfWidth, -titleSize.height-space, halfWidth)];
        [self setContentEdgeInsets:UIEdgeInsetsMake(-bottomInset, leftInset, topInset+space, -rightInset)];
    }
}

/**  图片在左  系统默认的样式  只需提供修改内边距的接口*/
-(void)imageOnTheTitleLeftWithSpace:(CGFloat)space{
    [self resetEdgeInsets];
    [self setTitleEdgeInsets:UIEdgeInsetsMake(0, space, 0, -space)];
    [self setContentEdgeInsets:UIEdgeInsetsMake(0, 0, 0, space)];
}

/**  图片再右  */
- (void)imageOnTheTitleRightWithSpace:(CGFloat)space
{
    [self resetEdgeInsets];
    [self setNeedsLayout];
    [self layoutIfNeeded];
    
    CGRect contentRect = [self contentRectForBounds:self.bounds];
    CGSize titleSize = [self titleRectForContentRect:contentRect].size;
    CGSize imageSize = [self imageRectForContentRect:contentRect].size;
    
    [self setContentEdgeInsets:UIEdgeInsetsMake(0, 0, 0, space)];
    [self setTitleEdgeInsets:UIEdgeInsetsMake(0, -imageSize.width, 0, imageSize.width)];
    [self setImageEdgeInsets:UIEdgeInsetsMake(0, titleSize.width+space, 0, -titleSize.width - space)];
}

//重置内边距
- (void)resetEdgeInsets
{
    [self setContentEdgeInsets:UIEdgeInsetsZero];
    [self setImageEdgeInsets:UIEdgeInsetsZero];
    [self setTitleEdgeInsets:UIEdgeInsetsZero];
}

- (void)titleTopButtonImageWithTitleStyle:(PXYCustomerButtonType)type Space:(CGFloat)space {
    switch (type) {
        case PXYCustomerButtonTypeTop:
        {
            //标题在上
            [self titleOverTheImageTopWithSpace:space];
            
            
        }
            break;
            
        case PXYCustomerButtonTypeBelow:
        {
            //标题在下
            [self titleBelowTheImageWithSpace:space];
            
            
        }
            break;
            
            
        case PXYCustomerButtonTypeRight:
        {
            //标题在右
            [self imageOnTheTitleLeftWithSpace:space];
            
            
        }
            break;
            
        case PXYCustomerButtonTypeLeft:
        {
            //标题在左
            [self imageOnTheTitleRightWithSpace:space];
            
            
        }
            break;
            default:
            break;
    }
    
    
    
    
}

@end
