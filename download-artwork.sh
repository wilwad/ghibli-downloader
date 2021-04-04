#!/bin/bash

# Studio Ghibli has made available 50 artworks per movie of most of their movies
# https://www.ghibli.jp/works/
# 
# e.g. Spirited Away is named Chihiro and is in the directory gallery/chihiro as chihiro001.jpg to chihiro050.jpg
# we create an indexed array of all the movies made available and run a for loop using a sequence from 1 to 5 padded with zeroes
#
# Created by William Sengdara from other people online who provided bash how-tos
#

directories=("baron" "chihiro" "ged" "ghiblies" "hotarunohaka" "howl" 
             "kaguyahime" "karigurashi" "kazetachinu" "kokurikozaka" "laputa" 
             "majo" "marnie" "mimi" "mononoke" "nausicaa" "omoide" "onyourmark" 
             "ponyo" "porco" "redturtle" "tanuki" "totoro" "umi" "yamada")
start=1
end=50

for dir in "${directories[@]}"
do

	mkdir -p "$dir"                                    # make directory if not exist
	echo "Downloading into $dir..."
	
	url="https://www.ghibli.jp/images/$dir.jpg" 	   # get the movie cover art
	wget "$url" -P "$dir"                              # download into the specific dir
	
	# now download the 50 artworks into the dir
	for idx in $(seq -f "%03g" $start $end)            # sequence padded, notice g instead of d
	do
	  url="https://www.ghibli.jp/gallery/$dir$idx.jpg" # chihiro001.jpg ... chihiro050.jpg
	  echo "Fetching $url";
	  wget "$url" -P "$dir"                            # download into a specific folder
	  sleep 5                                          # breathe boi
	done
	
done

echo "Script Completed."
