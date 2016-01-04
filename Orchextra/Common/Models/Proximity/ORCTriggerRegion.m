//
//  ORCTriggerRegion.m
//  Orchestra
//
//  Created by Judith Medina on 7/5/15.
//  Copyright (c) 2015 Gigigo. All rights reserved.
//

#import "ORCTriggerRegion.h"
#import "ORCGIGJSON.h"

NSString *const ORCRegionIdentifier = @"regionIdentifier";
NSString *const ORCRegionNotifyOnEntry = @"regionNotifyOnEntry";
NSString *const ORCRegionNotifyOnExit = @"regionNotifyOnExit";
NSString *const ORCRegionTimer = @"stayTime";
NSString *const ORCRegionName = @"name";

@implementation ORCTriggerRegion

#pragma mark - INIT

- (instancetype)initWithJSON:(NSDictionary *)json
{
    return [self initWithIdentifier:[json stringForKey:@"code"]
                      notifyOnEntry:[json boolForKey:@"notifyOnEntry"]
                       notifyOnExit:[json boolForKey:@"notifyOnExit"]
                        stayTime:[json intForKey:@"stayTime"]
                            name:[json stringForKey:@"name"]
            ];
}

- (instancetype)initWithIdentifier:(NSString *)identifier notifyOnEntry:(BOOL)notifyOnEntry
                      notifyOnExit:(BOOL)notifyOnExit stayTime:(NSInteger)stayTime name:(NSString *)name
{
    self = [super init];
    
    if (self)
    {
        _identifier = identifier;
        _notifyOnEntry = notifyOnEntry;
        _notifyOnExit = notifyOnExit;
        _timer = stayTime;
        _name = name;
    }
    
    return self;
}

#pragma mark - PUBLIC

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    
    if (self)
    {
        _identifier = [aDecoder decodeObjectForKey:ORCRegionIdentifier];
        _notifyOnEntry = [aDecoder decodeBoolForKey:ORCRegionNotifyOnEntry];
        _notifyOnExit = [aDecoder decodeBoolForKey:ORCRegionNotifyOnExit];
        _timer = [aDecoder decodeDoubleForKey:ORCRegionTimer];
        _name = [aDecoder decodeObjectForKey:ORCRegionName];
    }
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:_identifier forKey:ORCRegionIdentifier];
    [aCoder encodeBool:_notifyOnEntry forKey:ORCRegionNotifyOnEntry];
    [aCoder encodeBool:_notifyOnExit forKey:ORCRegionNotifyOnExit];
    [aCoder encodeDouble:_timer forKey:ORCRegionTimer];
    [aCoder encodeObject:_name forKey:ORCRegionName];
}

- (void)registerRegionWithLocationManager:(CLLocationManager *)locationManager
{
    [self registerRegionWithLocationManager:locationManager];
}

- (CLRegion *)convertToCLRegion
{
    return [self convertToCLRegion];
}

- (void)stopMonitoringRegionWithLocationManager:(CLLocationManager *)locationManager
{
    for (CLRegion *region in locationManager.monitoredRegions)
    {
        if([region.identifier isEqualToString:self.identifier])
        {
            [locationManager stopMonitoringForRegion:region];
            return;
        }
    }
}

- (void)canPerformRequestWithCompletion:(ORCCompletionStayTime)completion
{
    [self canPerformRequestWithCompletion:completion];
}


@end
