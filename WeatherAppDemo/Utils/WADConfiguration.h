@import Foundation;

@protocol WADConfiguration <NSObject>
@required
- (id)settingForKey:(NSString *)key;
@end

extern NSString *const ConfigurationPlistKey;

@interface WADConfiguration : NSObject <WADConfiguration>

+ (instancetype)defaultConfiguration;
- (id)settingForKey:(NSString *)key;

@end
