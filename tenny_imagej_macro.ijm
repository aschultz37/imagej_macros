//choose the upper directory (e.g. 10x-cre/)
file_dir = getDirectory("Choose Raw Directory");
//get list of subdirectories (samples)
subdir_list = getFileList(file_dir);

//for each subdirectory, go through each file
for(i = 0; i < subdir_list.length; i++){
	if(endsWith(subdir_list[i], "/")){ //confirm it is a directory
		subdir_file_list = getFileList(file_dir + subdir_list[i]);
		output_dir = file_dir + "edit-" + subdir_list[i];
		for(j = 0; j < subdir_file_list.length; j++){
			if(startsWith(subdir_file_list[j], "rfp") == true){ //CHANGE MARKER HERE
				//old code we wrote (with different variable names)
				open(file_dir + subdir_list[i] + subdir_file_list[j]);
				run("Color Balance..."); wait(500);
				selectWindow(subdir_file_list[j]); wait(500);
				resetMinAndMax(); wait(500);
				setMinAndMax(45, 255); wait(500); //CHANGE MIN/MAX HERE
				//for saving the image, changed it to the below code so it's automatic
				if(!File.isDirectory(output_dir)){
					File.makeDirectory(output_dir);
				}
				save(output_dir + "edit-" + subdir_file_list[j]);
				close(subdir_file_list[j]);
			}
			else if(startsWith(subdir_file_list[j], "gfp") == true){ //CHANGE MARKER HERE
				
			}
			//etc. for the other markers
		}
	}
}
