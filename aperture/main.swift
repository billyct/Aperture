// Exit codes:
// 1: some argument is missing ¯\_(ツ)_/¯
// 2: bad crop rect coordinates
// ?: ¯\_(ツ)_/¯
//
// Note: `highlight-clicks` will only work if `show-cursor` is true
// TODO: document this ^

import Foundation
import AVFoundation

let numberOfArgs = Process.arguments.count;
if (numberOfArgs != 6) {
  print("usage: main <destinationPath> <fps> <crop-rect-coordinates> <show-cursor> <highlight-clicks>")
  print("examples: main ./file.mp4 30 0:0:100:100 true false");
  print("examples: main ./file.mp4 30 none true false");
  exit(1);
}

let destinationPath = Process.arguments[1];
let fps = Process.arguments[2];
let cropArea = Process.arguments[3];
let showCursor = Process.arguments[4] == "true" ? true : false;
let highlightClicks = Process.arguments[5] == "true" ? true : false;

var coordinates = [];
if (cropArea != "none") {
  coordinates = Process.arguments[3].componentsSeparatedByString(":");
  if (coordinates.count - 1 != 3) { // number of ':' in the string
    print("The coordinates for the crop rect must be in the format 'originX:originY:width:height'");
    exit(2);
  }
}

let recorder = Recorder(destinationPath: destinationPath, fps: fps, coordinates: coordinates as! [String], showCursor: showCursor, highlightClicks: highlightClicks);

recorder.start();

setbuf(__stdoutp, nil);

readLine();

recorder.stop();