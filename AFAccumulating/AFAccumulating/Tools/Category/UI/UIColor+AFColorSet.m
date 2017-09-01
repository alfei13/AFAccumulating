//
//  UIColor+AFColorSet.m
//  YTEnergyManager
//
//  Created by 郑飞飞 on 2017/8/20.
//  Copyright © 2017年 FlyZKing. All rights reserved.
//

#import "UIColor+AFColorSet.h"

#define MAX3(a, b, c) (a > b ? (a > c ? a : c) : (b > c ? b : c))
#define MIN3(a, b, c) (a < b ? (a < c ? a : c) : (b < c ? b : c))

void RGBtoHSV(float r, float g, float b, float* h, float* s, float* v) {
    float min, max, delta;
    min = MIN3(r, g, b);
    max = MAX3(r, g, b);
    *v = max;				// v
    delta = max - min;
    if( max != 0 )
        *s = delta / max;		// s
    else {
        // r = g = b = 0		// s = 0, v is undefined
        *s = 0;
        *h = -1;
        return;
    }
    if( r == max )
        *h = ( g - b ) / delta;		// between yellow & magenta
    else if( g == max )
        *h = 2 + ( b - r ) / delta;	// between cyan & yellow
    else
        *h = 4 + ( r - g ) / delta;	// between magenta & cyan
    *h *= 60;				// degrees
    if( *h < 0 )
        *h += 360;
}

void HSVtoRGB( float *r, float *g, float *b, float h, float s, float v )
{
    int i;
    float f, p, q, t;
    if( s == 0 ) {
        // achromatic (grey)
        *r = *g = *b = v;
        return;
    }
    h /= 60;			// sector 0 to 5
    i = floor( h );
    f = h - i;			// factorial part of h
    p = v * ( 1 - s );
    q = v * ( 1 - s * f );
    t = v * ( 1 - s * ( 1 - f ) );
    switch( i ) {
        case 0:
            *r = v;
            *g = t;
            *b = p;
            break;
        case 1:
            *r = q;
            *g = v;
            *b = p;
            break;
        case 2:
            *r = p;
            *g = v;
            *b = t;
            break;
        case 3:
            *r = p;
            *g = q;
            *b = v;
            break;
        case 4:
            *r = t;
            *g = p;
            *b = v;
            break;
        default:		// case 5:
            *r = v;
            *g = p;
            *b = q;
            break;
    }
}


@implementation UIColor (AFColorSet)

//16进制颜色
+ (UIColor *)colorWithHexString:(NSString *)hexColor {
    
    return [self colorWithHexString:hexColor alpha:1.0f];
}

+ (UIColor *)colorWithHexString:(NSString *)hexColor alpha:(CGFloat)alpha {
    
    //删除字符串中的空格
    NSString *cString = [[hexColor stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    // String should be 6 or 8 characters 判断前缀
    if ([cString length] < 6)
    {
        return [UIColor clearColor];
    }
    // strip 0X if it appears
    //如果是0x开头的，那么截取字符串，字符串从索引为2的位置开始，一直到末尾
    if ([cString hasPrefix:@"0X"])
    {
        cString = [cString substringFromIndex:2];
    }
    //如果是#开头的，那么截取字符串，字符串从索引为1的位置开始，一直到末尾
    if ([cString hasPrefix:@"#"])
    {
        cString = [cString substringFromIndex:1];
    }
    if ([cString length] != 6)
    {
        return [UIColor clearColor];
    }
    
    // Separate into r, g, b substrings  从六位数值中找到RGB对应的位数并转换
    NSRange range;
    range.location = 0;
    range.length = 2;
    //r
    NSString *rString = [cString substringWithRange:range];
    //g
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    //b
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    return [UIColor colorWithRed:((float)r / 255.0f) green:((float)g / 255.0f) blue:((float)b / 255.0f) alpha:alpha];
}

+ (UIColor*)colorWithHue:(CGFloat)h saturation:(CGFloat)s value:(CGFloat)v alpha:(CGFloat)a {
    float r, g, b;
    HSVtoRGB(&r, &g, &b, h, s, v);
    return [UIColor colorWithRed:r green:g blue:b alpha:a];
}

- (UIColor*)multiplyHue:(CGFloat)hd saturation:(CGFloat)sd value:(CGFloat)vd {
    
    const CGFloat* rgba = CGColorGetComponents(self.CGColor);
    float r = rgba[0];
    float g = rgba[1];
    float b = rgba[2];
    float a = rgba[3];
    
    float h, s, v;
    RGBtoHSV(r, g, b, &h, &s, &v);
    
    h *= hd;
    v *= vd;
    s *= sd;
    
    HSVtoRGB(&r, &g, &b, h, s, v);
    
    return [UIColor colorWithRed:r green:g blue:b alpha:a];
}

- (UIColor*)copyWithAlpha:(CGFloat)newAlpha {
    const CGFloat* rgba = CGColorGetComponents(self.CGColor);
    CGFloat r = rgba[0];
    CGFloat g = rgba[1];
    CGFloat b = rgba[2];
    
    return [UIColor colorWithRed:r green:g blue:b alpha:newAlpha];
}

- (UIColor*)addHue:(CGFloat)hd saturation:(CGFloat)sd value:(CGFloat)vd {
    const CGFloat* rgba = CGColorGetComponents(self.CGColor);
    float r = rgba[0];
    float g = rgba[1];
    float b = rgba[2];
    float a = rgba[3];
    
    float h, s, v;
    RGBtoHSV(r, g, b, &h, &s, &v);
    
    h += hd;
    v += vd;
    s += sd;
    
    HSVtoRGB(&r, &g, &b, h, s, v);
    
    return [UIColor colorWithRed:r green:g blue:b alpha:a];
}

- (UIColor*)highlight {
    return [self multiplyHue:1 saturation:0.4 value:1.2];
}

- (UIColor*)shadow {
    return [self multiplyHue:1 saturation:0.6 value:0.6];
}

- (CGFloat)hue {
    const CGFloat* rgba = CGColorGetComponents(self.CGColor);
    float h, s, v;
    RGBtoHSV(rgba[0], rgba[1], rgba[2], &h, &s, &v);
    return h;
}

- (CGFloat)saturation {
    const CGFloat* rgba = CGColorGetComponents(self.CGColor);
    float h, s, v;
    RGBtoHSV(rgba[0], rgba[1], rgba[2], &h, &s, &v);
    return s;
}

- (CGFloat)value {
    const CGFloat* rgba = CGColorGetComponents(self.CGColor);
    float h, s, v;
    RGBtoHSV(rgba[0], rgba[1], rgba[2], &h, &s, &v);
    return v;
}

/// 获取UIImage对象的主色调
+ (UIColor *)mostColor:(UIImage*)image {
    
#if __IPHONE_OS_VERSION_MAX_ALLOWED > __IPHONE_6_1
    int bitmapInfo = kCGBitmapByteOrderDefault | kCGImageAlphaPremultipliedLast;
#else
    int bitmapInfo = kCGImageAlphaPremultipliedLast;
#endif
    
    //第一步 先把图片缩小 加快计算速度. 但越小结果误差可能越大
    CGSize thumbSize = CGSizeMake(40, 40);
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = CGBitmapContextCreate(NULL,
                                                 thumbSize.width,
                                                 thumbSize.height,
                                                 8,                 //bits per component
                                                 thumbSize.width*4,
                                                 colorSpace,
                                                 bitmapInfo);
    
    CGRect drawRect = CGRectMake(0, 0, thumbSize.width, thumbSize.height);
    CGContextDrawImage(context, drawRect, image.CGImage);
    CGColorSpaceRelease(colorSpace);
    
    //第二步 取每个点的像素值
    unsigned char* data = CGBitmapContextGetData (context);
    
    if (data == NULL) return nil;
    NSArray *MaxColor=nil;
    // NSCountedSet *cls=[NSCountedSet setWithCapacity:thumbSize.width*thumbSize.height];
    float maxScore=0;
    for (int x=0; x<thumbSize.width*thumbSize.height; x++) {
        
        int offset = 4*x;
        
        int red = data[offset];
        int green = data[offset+1];
        int blue = data[offset+2];
        int alpha =  data[offset+3];
        
        if (alpha<25)continue;
        
        float h,s,v;
        RGBtoHSV(red, green, blue, &h, &s, &v);
        
        float y = MIN(abs(red*2104 + green*4130 + blue*802 + 4096 + 131072)>>13, 235);
        y= (y-16)/(235-16);
        if (y>0.9) continue;
        
        float score = (s+0.1)*x;
        if (score>maxScore) {
            maxScore = score;
        }
        MaxColor=@[ @(red), @(green), @(blue), @(alpha) ];
        //        [cls addObject:clr];
    }
    CGContextRelease(context);
    
    return [UIColor colorWithRed:([MaxColor[0] intValue]/255.0f) green:([MaxColor[1] intValue]/255.0f) blue:([MaxColor[2] intValue]/255.0f) alpha:([MaxColor[3] intValue]/255.0f)];
}



@end
