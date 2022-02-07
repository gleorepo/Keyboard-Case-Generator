
module usb_cutout(keyPositionsX,keyPositionsY,index,keySizes,plateThickness,xSpacing,ySpacing,xCut,yCut,index,interiorHeight,baseThickness,bezelWidth,usbIndex,holeIndices,holeSize){
    
    translate([keyPositionsX[usbIndex]*xSpacing+((xSpacing*keySizes[usbIndex])/2)-(usbWidth/2),keyPositionsY[usbIndex]*ySpacing+ySpacing+bezelGap,baseThickness+1])
    minkowski(){   
    cube([usbWidth,usbHeight,bezelWidth]);
    sphere(1);
    }
}



module hole_cutters(keyPositionsX,keyPositionsY,index,keySizes,plateThickness,xSpacing,ySpacing,xCut,yCut,index,interiorHeight,baseThickness,bezelWidth,usbIndex,holeIndices,holeSize){
union(){
for(i = holeIndices){
translate([keyPositionsX[i]*xSpacing,keyPositionsY[i]*ySpacing,-20])cylinder(100,holeSize/2,holeSize/2);

} 
};   
    
}








module keyboard_body(keyPositionsX,keyPositionsY,index,keySizes,plateThickness,xSpacing,ySpacing,xCut,yCut,index,interiorHeight,baseThickness,bezelWidth,usbIndex,holeIndices,holeSize){
    difference(){
    hull(){
    minkowski(){    
    union(){
    for(i=index){
    translate([keyPositionsX[i]*xSpacing,keyPositionsY[i]*ySpacing,0])cube([xSpacing*keySizes[i],ySpacing,interiorHeight+baseThickness]);
    }
    };
    cylinder(0.01,bezelWidth,bezelWidth);
}
};
hole_cutters(keyPositionsX,keyPositionsY,index,keySizes,plateThickness,xSpacing,ySpacing,xCut,yCut,index,interiorHeight,baseThickness,bezelWidth,usbIndex,holeIndices,holeSize);
};
};


module keyboard_plate(keyPositionsX,keyPositionsY,index,keySizes,plateThickness,xSpacing,ySpacing,xCut,yCut,index,interiorHeight,baseThickness,bezelWidth,usbIndex,holeIndices,holeSize){
    xToCut = (xSpacing - xCut)/2;
    yToCut = (ySpacing - yCut)/2;
    difference(){
    union(){
    for(i = index){            
    difference(){
    translate([keyPositionsX[i]*xSpacing,keyPositionsY[i]*ySpacing,0])cube([xSpacing*keySizes[i],ySpacing,plateThickness]);
    union(){    
    translate([(keyPositionsX[i]*xSpacing)+((keySizes[i]*xSpacing)/2)-((xCut)/2),(keyPositionsY[i]*ySpacing)+yToCut,0])cube([xCut,yCut,plateThickness]);
    if(plateThickness>1.5){
    translate([(keyPositionsX[i]*xSpacing)+((keySizes[i]*xSpacing)/2)-((5.2)/2),(keyPositionsY[i]*ySpacing+(yToCut)-1.27)])cube([5.2,yCut+(2*1.27),plateThickness-1.5]);
    }
    };
    }
}
};
hole_cutters(keyPositionsX,keyPositionsY,index,keySizes,plateThickness,xSpacing,ySpacing,xCut,yCut,index,interiorHeight,baseThickness,bezelWidth,usbIndex,holeIndices,holeSize);
};
}

module keyboard_void(keyPositionsX,keyPositionsY,index,keySizes,plateThickness,xSpacing,ySpacing,xCut,yCut,index,interiorHeight,baseThickness,bezelWidth,usbIndex,holeIndices,holeSize){
    xToCut = (xSpacing - xCut)/2;
    yToCut = (ySpacing - yCut)/2;
    translate([0,0,baseThickness])minkowski(){
    for(i = index){
    translate([keyPositionsX[i]*xSpacing,keyPositionsY[i]*ySpacing,0])cube([xSpacing*keySizes[i],ySpacing,interiorHeight]);
}
cylinder(0.1,bezelGap,bezelGap);
}
}

module keyboard_case(keyPositionsX,keyPositionsY,index,keySizes,plateThickness,xSpacing,ySpacing,xCut,yCut,index,interiorHeight,baseThickness,bezelWidth,usbIndex,holeIndices,holeSize){
difference(){
difference(){
keyboard_body(keyPositionsX,keyPositionsY,index,keySizes,plateThickness,xSpacing,ySpacing,xCut,yCut,index,interiorHeight,baseThickness,bezelWidth,usbIndex,holeIndices,holeSize);
usb_cutout(keyPositionsX,keyPositionsY,index,keySizes,plateThickness,xSpacing,ySpacing,xCut,yCut,index,interiorHeight,baseThickness,bezelWidth,usbIndex,holeIndices,holeSize);    
}

keyboard_void(keyPositionsX,keyPositionsY,index,keySizes,plateThickness,xSpacing,ySpacing,xCut,yCut,index,interiorHeight,baseThickness,bezelWidth,usbIndex,holeIndices,holeSize);
};

};

