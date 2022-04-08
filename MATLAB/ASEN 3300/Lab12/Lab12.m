clear,clc

latDeg = 45;
latMin = 35;
blockedLat = [17.94408,17.94372,17.94084,17.99196,17.98368,17.98908,...
    18.0096,18.02472,18.06648,18.1284]';

longDeg = -122;
longMin = -20;
blockedLong = -1*[59.86644,59.8686,59.8704,59.85744,59.83476,59.82972,...
    59.83548,59.83908,59.83692,59.8326]';

openLat = [17.67912,17.6784,17.673,17.66472,17.66256,17.65176,17.65968...
    17.66616,17.68164,17.6874]';
openLong = -1*[58.54128,58.51572,58.53588,58.53516,58.54596,58.4214,58.47,...
    58.47252,58.50564,58.5402]';

latBlocked = latDeg + latMin/60 + blockedLat/3600;

longBlocked = longDeg + longMin/60 + blockedLong/3600;

latOpen = latDeg + latMin/60 + openLat/3600;

longOpen = longDeg + longMin/60 + openLong/3600;

aveBlockedLat = mean(latBlocked);
stdBlockedLat = std(latBlocked);

aveBlockedLong = mean(longBlocked);
stdBlockedLong = std(longBlocked);

aveOpenLat = mean(latOpen);
stdOpenLat = std(latOpen);

aveOpenLong = mean(longOpen);
stdOpenLong = std(longOpen);

45.588315-aveBlockedLat

-122.349928-aveBlockedLong

45.588255-aveOpenLat

-122.349597-aveOpenLong

norm( lla2ecef([aveBlockedLat,aveBlockedLong,42]) -lla2ecef([45.588315,-122.349928,42]) )