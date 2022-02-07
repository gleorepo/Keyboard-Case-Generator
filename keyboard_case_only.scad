include <keyboard_case_module.scad>;

// How much space from plate to the bezel?
bezelGap = 0.5;

// How wide is the Bezel?
bezelWidth = 5;

// How thick is the base?
baseThickness = 3;

// How thick is the plate?
plateThickness = 5;

//Define the Layout
keyPositionsX = [0,1,2,3,4,5,6,7,8,9,0,1.25,2.25,3.25,4.25,5.25,6.25,7.25,8.25,9.25,0,1.75,2.75,3.75,4.75,5.75,6.75,7.75,8.75,1,2,3,5.25,7.25,8.25];
keyPositionsY = [3,3,3,3,3,3,3,3,3,3,2,2,2,2,2,2,2,2,2,2,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0];
keySizes = [1,1,1,1,1,1,1,1,1,1.25,1.25,1,1,1,1,1,1,1,1,1,1.75,1,1,1,1,1,1,1,1.5,1,1,2.25,2,1,1];
index = [0 : 34];

//On what switch index does the usb live?
usbIndex= 9;

//What is the size of the usb cutout? 1mm will be added to this by the fillet. 
usbWidth = 10;
usbHeight = 6;

//Mx Switch Spacing and Switch Cutouts
xSpacing = 19.05;
ySpacing = 19.05;
xCut = 14;
yCut = 14;

//Number of Facets
$fn=50;

//Override this if you want. 
interiorHeight = 10-(plateThickness-1.5)+plateThickness+7.5;

//Where are the holes (placed to the north east of the switch)?
holeIndices = [1,9,21,28];

//What size are the holes?
holeSize = 2.3;



keyboard_case(keyPositionsX,keyPositionsY,index,keySizes,plateThickness,xSpacing,ySpacing,xCut,yCut,index,interiorHeight,baseThickness,bezelWidth,usbIndex,holeIndices,holeSize);





