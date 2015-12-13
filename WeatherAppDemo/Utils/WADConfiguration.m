#import "WADConfiguration.h"

NSString *const ConfigurationPlistKey = @"ConfigurationPlist";

@interface WADConfiguration ()
@property (nonatomic, readwrite, strong) NSMutableDictionary *store;
@end

@implementation WADConfiguration

+ (instancetype)defaultConfiguration;
{
    return [[self alloc] init];
}

- (id)init;
{
    if (self = [super init]) {
        [self registerDefaultConfiguration];
    }

    return self;
}

- (void)registerDefaultConfiguration;
{
    self.store = [[self loadDefaults] mutableCopy];
}

- (NSString *)getPListPath
{
    NSBundle *bundle = [NSBundle bundleForClass:[self class]];
    NSString *plistName = [bundle objectForInfoDictionaryKey:ConfigurationPlistKey];
    return [bundle pathForResource:plistName ofType:@"plist"];
}

- (NSDictionary *)loadDefaults;
{
    NSString *plistPath = [self getPListPath];
    return [NSDictionary dictionaryWithContentsOfFile:plistPath];
}

- (id)settingForKey:(NSString *)key;
{
    return self.store[key];
}

@end
