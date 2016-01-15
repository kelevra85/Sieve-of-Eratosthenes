//
//  CommonMethods.h
//
//  Created by Utsav Parikh on 18/5/15.
//  Copyright (c) 2015 Utsav Parikh. All rights reserved.
//

#import "FilesToImport.h"

@interface CommonMethods : NSObject <UIAlertViewDelegate> {
}

NSString *DocumentsDirectoryPath();

+ (void)UnzipFile;
+ (void)printJson:(id)json;
+ (void)disableMultipleTouch:(UIView *)selfView;
+ (void)showAlertWithMessage:(NSString *)message;
+ (void)rotateLayerInfinite:(CALayer *)layer;
+ (void)removeOverlay:(UIView *)view;
+ (void)displayOverlay:(UIView *)viewOverlay;
+ (void)displayOverlay:(UIView *)viewOverlay aboveView:(UIView *)superView;
+ (void)displayAlertwithTitle:(NSString *)title withMessage:(NSString *)msg withViewController:(UIViewController *)viewController;
+ (void)popToLast:(Class)aClass fromNavigationController:(UINavigationController *)navController animated:(BOOL)animated;
+ (void)loadFromSenderURL:(NSURL *)urlSender withReceiverURL:(NSURL *)urlReceiver callback:(void (^)(UIImage *imgSender, UIImage *imgReceiver))callback;

+ (BOOL)isDevice24HrFormat;
+ (BOOL)addSkipBackupAttributeToItemAtPath;  /*--- Do not back up on iCloud ---*/
+ (BOOL)isPDF:(NSString *)strLastComponent;
+ (BOOL)isImage:(NSString *)strLastComponent;
+ (BOOL)isVideo:(NSString *)strLastComponent;
+ (BOOL)isObjectEmpty:(id)object;
+ (BOOL)isValidEmail:(NSString *)checkString;
+ (BOOL)isArrayContainingAnyEmptyObject:(NSArray *)array;
+ (BOOL)renameDir:(NSString *)dirPath asDir:(NSString *)newDirPath cleanExisting:(BOOL)clean;
+ (BOOL)isViewOrCorrespondingSubViewsScrolling:(UIView *)view;

+ (CGFloat)findWidthForText:(NSString *)text havingMaximumHeight:(CGFloat)heightValue andFont:(UIFont *)font;
+ (CGFloat)findHeightForText:(NSString *)text havingWidth:(CGFloat)widthValue andFont:(UIFont *)font;
+ (CGFloat)findAttributedHeightForText:(NSAttributedString *)text havingWidth:(CGFloat)widthValue andFont:(UIFont *)font;

+ (NSDate *)dateFromStringDateFormate:(NSString *)time format:(NSString *)format Type:(int)type;
+ (NSDate *)nsDateFromString:(NSString *)string usingDateFormat:(NSString *)dateFormat;

+ (NSArray *)arrayAfterRemovingEmptyObjects:(NSArray *)array;
+ (NSArray *)arrayAfterRemovingBlankObjects:(NSArray *)array;
+ (NSArray *)getPhoneNumbersFromList:(NSString *)phoneNumbers;
+ (NSArray *)getCountryList;

+ (NSString *)totalDiskSpace;
+ (NSString *)freeDiskSpace;
+ (NSString *)usedDiskSpace;

+ (NSString *)getAppVersionNum;
+ (NSString *)getSystemVersion;
+ (NSString *)getDeviceType;

+ (NSString *)suffixNumber:(NSNumber *)number;
+ (NSString *)convertStringToPhoneNumber:(NSString *)phoneStr;
+ (NSString *)getTrimmedString:(NSString *)string;
+ (NSString *)removeCommaFromString:(NSString *)str;
+ (NSString *)getPriceFromNumber:(NSString *)price;
+ (NSString *)getPriceFromNumberWithFraction:(NSNumber *)price;
+ (NSString *)encodeToBase64String:(UIImage *)image;
+ (NSString *)jsonStringFromID:(id)object isPretty:(BOOL)prettyPrint;
+ (NSString *)nsStringFromDate:(NSDate *)date andToFormatString:(NSString *)formatString;
+ (NSString *)getLocaleDate:(NSDate *)date forDateFormat:(NSString *)dateFormat calendar:(NSString *)calendarIdentifier;
+ (NSString *)getTotalAudioDuration:(NSString *)strURLAudio;

+ (NSMutableAttributedString *)getHTMLText:(NSString *)text withAlignment:(NSTextAlignment)alignment;
+ (NSMutableAttributedString *)setBaseLineForString:(NSString *)string andFont:(UIFont *)font;
+ (NSMutableAttributedString *)createAttributedString:(NSString *)string andFont:(UIFont *)font andColor:(UIColor *)color;
+ (NSMutableAttributedString *)createAttributedString:(NSString *)baseString withSubString:(NSString *)subString withBaseFont:(UIFont *)baseFont withSubFont:(UIFont *)subFont withBaseColor:(UIColor *)baseColor andSubColor:(UIColor *)subColor;

+ (NSDictionary *)stripNulls:(NSDictionary *)dictionary;
+ (NSDictionary *)dictionaryAfterRemovingEmptyObjects:(NSDictionary *)dictionary;
+ (NSDictionary *)nestedDictionaryByReplacingNullsWithNil:(NSDictionary *)sourceDictionary;

+ (NSMutableDictionary *)cleanUpXMLDictionary:(NSMutableDictionary *)XMLDictionary;

+ (UIColor *)colorWithHexString:(NSString *)stringToConvert;

+ (UIImage *)imageWithColor:(UIColor *)color;
+ (UIImage *)decodeBase64ToImage:(NSString *)strEncodeData;
+ (UIImage *)scaleAndRotateImage:(UIImage *)image;
+ (UIImage *)imageRotatedByDegrees:(UIImage *)oldImage deg:(CGFloat)degrees;
+ (UIImage *)circularScaleAndCropImage:(UIImage *)image frame:(CGRect)frame;

+ (void)setThumbnailTo:(UIImageView *)imgV;
+ (void)setVideoThumbnail:(UIImageView *)imgV withURL:(NSString *)strURL;
+ (UIImage *)generatePDFThumbnail:(NSString *)strPath withSize:(CGSize)size;

+ (NSInteger)findNumOfLinesForText:(NSString *)string havingSize:(CGSize)size havingFont:(UIFont *)font;
+ (UIViewController *)getTopViewController:(UINavigationController *)navController;

+(BOOL)checkForInteger:(NSString *)strValue;

@end
