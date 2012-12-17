#! /usr/bin/awk --exec
# Script to parse out unsavory words from command line output.

BEGIN { 
  stars = "*****************************************************";
  while (getline < "badwords.txt")
  {
    badwords[$0] = substr(stars,0,length($0)); 
  }
}
{ 
  for(word in badwords) {
    bleep = badwords[word];
    gsub(word, bleep);
  }
  print;
}
