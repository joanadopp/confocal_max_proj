//change setting bioformats for your image type before running this
//so that you don't get the pop-up for every image you want to open
//Plugins>Bio-Formats>Bio-Formats Plugins Configuration>Formats
//select your image extension and tick windowless
//inputDir cannot have more files than the images you want to get processed
inputDir = getDirectory("Choose your input folder");
outputDir = getDirectory("Choose folder to place processed images in: ");
print("Source folder: "+inputDir);
print("Destination folder: "+outputDir);

fileList = getFileList(inputDir);
fileNumber = fileList.length;

for(i=0; i<fileNumber; i++)
{
	open(inputDir+fileList[i]);
	fileName = getTitle();
	run("Z Project...", "projection=[Max Intensity]");
	//run("Channels Tool...");
	Stack.setDisplayMode("composite");
	run("8-bit");
	Stack.setChannel(1);
	run("Green");
	Stack.setChannel(2);
	run("Red");
	Stack.setChannel(3);
	run("Grays");
	saveAs("Tiff", outputDir + fileName);
	run("RGB Color");
	saveAs("Tiff", outputDir + fileName + "RGB");
	 while (nImages>0) { 
          selectImage(nImages); 
          close(); 
      } 
}
